import depthToSpaceWGSL from './shaders/depthToSpace.wgsl';
import { Anime4KPipeline, DepthToSpacePipelineDescriptor } from '../../interfaces';

export class DepthToSpace implements Anime4KPipeline {
  outputTexture: GPUTexture;

  pipeline: GPUComputePipeline;

  bindGroup: GPUBindGroup;

  name: string;

  /**
   * Creates an instance of DepthToSpace.
   *
   * @param {Object} options - The options for the DepthToSpace pipeline.
   * @param {GPUDevice} options.device - The GPU device to use for
   *  creating textures and shader modules.
   * @param {Array<GPUTexture>} options.inputTextures - The input textures for the pipeline.
   *  All input textures must have the same dimensions.
   * @param {string} [options.name='depth to space'] - The name of the pipeline.
   *  Defaults to 'depth to space'.
   *
   * @throws {Error} Will throw an error if the number of input textures is not 3.
   */
  constructor({
    device,
    inputTextures,
    name = 'depth to space',
  }: DepthToSpacePipelineDescriptor) {
    // sanity check
    if (inputTextures.length !== 3) {
      throw Error(`expect 3 textures for depth2Space, got ${inputTextures.length}`);
    }
    this.name = name;

    // texture
    this.outputTexture = device.createTexture({
      label: `${name}: depth_to_space_texture`,
      size: [2 * inputTextures[0].width, 2 * inputTextures[0].height, 1],
      format: 'rgba16float',
      usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.STORAGE_BINDING,
    });

    // module
    const shaderModule = device.createShaderModule({
      label: `${name}: depthToSpace Module`,
      code: depthToSpaceWGSL,
    });

    // bindGroupLayout
    const bindGroupLayout = device.createBindGroupLayout({
      label: `${name}depth to space bind group layout`,
      entries: [
        {
          binding: 0,
          visibility: GPUShaderStage.COMPUTE,
          texture: {},
        },
        {
          binding: 1,
          visibility: GPUShaderStage.COMPUTE,
          texture: {},
        },
        {
          binding: 2,
          visibility: GPUShaderStage.COMPUTE,
          texture: {},
        },
        {
          binding: 3,
          visibility: GPUShaderStage.COMPUTE,
          storageTexture: {
            access: 'write-only',
            format: 'rgba16float',
          },
        },
      ],
    });

    // pipelinelayout
    const pipelinelayout = device.createPipelineLayout({
      label: 'depth to space pipeline layout',
      bindGroupLayouts: [bindGroupLayout],
    });

    // pipeline
    this.pipeline = device.createComputePipeline({
      label: 'depth to space pipeline',
      layout: pipelinelayout,
      compute: {
        module: shaderModule,
        entryPoint: 'computeMain',
      },
    });

    // bindGroup
    this.bindGroup = device.createBindGroup({
      layout: bindGroupLayout,
      entries: [
        {
          binding: 0,
          resource: inputTextures[0].createView(),
        },
        {
          binding: 1,
          resource: inputTextures[1].createView(),
        },
        {
          binding: 2,
          resource: inputTextures[2].createView(),
        },
        {
          binding: 3,
          resource: this.outputTexture.createView(),
        },
      ],
    });
  }

  updateParam(param: string, value: any): void {
    throw new Error('Method not implemented.');
  }

  pass(encoder: GPUCommandEncoder): void {
    const depthToSpacePass = encoder.beginComputePass();
    depthToSpacePass.setPipeline(this.pipeline);
    depthToSpacePass.setBindGroup(0, this.bindGroup);
    depthToSpacePass.dispatchWorkgroups(
      Math.ceil(this.outputTexture.width / 4),
      Math.ceil(this.outputTexture.height / 4),
    );
    depthToSpacePass.end();
  }

  getOutputTexture(): GPUTexture {
    return this.outputTexture;
  }
}
