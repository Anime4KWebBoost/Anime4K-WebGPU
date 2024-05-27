import Anime4KPipeline from '../../Anime4KPipeline';

/**
 * Conv2d pipeline
 *    Takes in n input textures output texture. All input textures and output texture
 * have the same dimensions.
*/
export class Conv2d implements Anime4KPipeline {
  outputTexture: GPUTexture;

  pipeline: GPUComputePipeline;

  bindGroup: GPUBindGroup;

  name: string;

  /**
   * Constructor
   * @param device - GPUDevice used to create things.
   * @param inputTextures - input textures of the shader.
   * All textures should have the same dimensions.
   * @param shaderWGSL - shader file as a string.
   * @param name - optional name of the instance, identify this conv2d pipeline and easy to debug.
   */
  constructor(device: GPUDevice, inputTextures: GPUTexture[], shaderWGSL: string, name = 'defaultCon2d') {
    this.name = name;
    const inputLength = inputTextures.length;
    if (inputLength === 0) {
      throw Error(`${name}: 0 input textures for conv2d.`);
    }

    if (shaderWGSL === undefined) {
      throw Error(`${name}: shader not defined.`);
    }

    // input textures and output texture must have the same dimensions,
    // so the output size are assigned the same dimension as the first input
    // texture.
    this.outputTexture = device.createTexture({
      label: `${name}: conv2d_texture`,
      size: [inputTextures[0].width, inputTextures[0].height, 1],
      format: 'rgba16float',
      usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.STORAGE_BINDING,
    });
    const shaderModule = device.createShaderModule({
      label: `${name}: conv2dModule`,
      code: shaderWGSL,
    });

    // BindGroupLayout
    const bindGroupLayoutEntries: GPUBindGroupLayoutEntry[] = [];
    for (let i = 0; i < inputLength; i += 1) {
      bindGroupLayoutEntries.push({
        binding: i,
        visibility: GPUShaderStage.COMPUTE,
        texture: {},
      });
    }
    bindGroupLayoutEntries.push({
      binding: inputLength,
      visibility: GPUShaderStage.COMPUTE,
      storageTexture: {
        access: 'write-only',
        format: 'rgba16float',
      },
    });
    const bindGroupLayout = device.createBindGroupLayout({
      label: `${name}: ${inputLength} to 1 convolution bind group layout`,
      entries: bindGroupLayoutEntries,
    });

    // BindGroup
    const bindGroupEntries: GPUBindGroupEntry[] = [];
    for (let i = 0; i < inputLength; i += 1) {
      bindGroupEntries.push({
        binding: i,
        resource: inputTextures[i].createView(),
      });
    }
    bindGroupEntries.push({
      binding: inputLength,
      resource: this.outputTexture.createView(),
    });
    this.bindGroup = device.createBindGroup({
      label: `${name}: bind group`,
      layout: bindGroupLayout,
      entries: bindGroupEntries,
    });

    // Pipeline Layout
    const pipelineLayout = device.createPipelineLayout({
      label: `${name}: pipeline layout`,
      bindGroupLayouts: [bindGroupLayout],
    });

    // Pipeline
    this.pipeline = device.createComputePipeline({
      label: `${name}: pipeline`,
      layout: pipelineLayout,
      compute: {
        module: shaderModule,
        entryPoint: 'computeMain',
      },
    });
  }

  updateParam(param: string, value: any): void {
    throw new Error('Method not implemented.');
  }

  pass(encoder: GPUCommandEncoder): void {
    const pass = encoder.beginComputePass();
    pass.setPipeline(this.pipeline);
    pass.setBindGroup(0, this.bindGroup);
    pass.dispatchWorkgroups(
      Math.ceil(this.outputTexture.width / 8),
      Math.ceil(this.outputTexture.height / 8),
    );
    pass.end();
  }

  getOutputTexture(): GPUTexture {
    return this.outputTexture;
  }
}
