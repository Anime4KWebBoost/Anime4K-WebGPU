import vertexWGSL from './shaders/vertex.wgsl';
import { Anime4KPipeline, OverlayPipelineDescriptor } from '../../interfaces';
import overlay2WGSL from './shaders/overlay2.wgsl';

/**
 * Render Pipeline:
 *      Takes in n input textures output texture.
 */
export class Overlay implements Anime4KPipeline {
  outputTexture: GPUTexture;

  pipeline: GPURenderPipeline;

  bindGroup: GPUBindGroup;

  name: string;

  /**
   * Creates an instance of Overlay.
   *
   * @param {Object} options - The options for the Overlay pipeline.
   * @param {GPUDevice} options.device - The GPU device to use for creating
   *  textures and shader modules.
   * @param {Array<GPUTexture>} options.inputTextures - The input textures for the pipeline.
   * All input textures must have the same dimensions.
   * @param {Array<number>} options.outputTextureSize - The size of the output texture.
   * @param {string} [options.fragmentWGSL=overlay2WGSL] - The fragment shader code in WGSL format.
   * Defaults to 'overlay2WGSL' (overlay 2 textures).
   * @param {string} [options.name='overlay'] - The name of the pipeline. Defaults to 'overlay'.
   *
   * @throws {Error} Will throw an error if the shader is not defined.
   */
  constructor({
    device,
    inputTextures,
    outputTextureSize,
    fragmentWGSL = overlay2WGSL,
    name = 'overlay',
  }: OverlayPipelineDescriptor) {
    const inputLength = inputTextures.length;
    this.name = name;

    if (fragmentWGSL === undefined) {
      throw Error(`${name}: shader not defined.`);
    }

    // texture
    this.outputTexture = device.createTexture({
      label: `${name}: output texture`,
      size: [outputTextureSize[0], outputTextureSize[1], 1],
      format: 'rgba16float',
      usage: GPUTextureUsage.TEXTURE_BINDING
      | GPUTextureUsage.RENDER_ATTACHMENT
      | GPUTextureUsage.STORAGE_BINDING,
    });

    // modules
    const vertexModule = device.createShaderModule({
      label: `${name}: vertex module`,
      code: vertexWGSL,
    });
    const fragmentModule = device.createShaderModule({
      label: `${name}: fragment module`,
      code: fragmentWGSL,
    });

    // BindGroupLayout
    const bindGroupLayoutEntries: GPUBindGroupLayoutEntry[] = [];
    bindGroupLayoutEntries.push({
      binding: 0,
      visibility: GPUShaderStage.FRAGMENT,
      sampler: {},
    });
    for (let i = 1; i <= inputLength; i += 1) {
      bindGroupLayoutEntries.push({
        binding: i,
        visibility: GPUShaderStage.FRAGMENT,
        texture: {},
      });
    }
    const bindGroupLayout = device.createBindGroupLayout({
      label: `${name}: bind group layout`,
      entries: bindGroupLayoutEntries,
    });

    // PipelineLayout
    const pipelineLayout = device.createPipelineLayout({
      label: `${name}: pipeline layout`,
      bindGroupLayouts: [bindGroupLayout],
    });

    // Pipeline
    this.pipeline = device.createRenderPipeline({
      layout: pipelineLayout,
      vertex: {
        module: vertexModule,
        entryPoint: 'vert_main',
      },
      fragment: {
        module: fragmentModule,
        entryPoint: 'main',
        targets: [
          {
            format: 'rgba16float',
          },
        ],
      },
      primitive: {
        topology: 'triangle-list',
      },
    });

    // Sampler
    const sampler = device.createSampler({
      magFilter: 'linear',
      minFilter: 'linear',
    });

    // BindGroup
    const bindGroupEntries: GPUBindGroupEntry[] = [];
    bindGroupEntries.push({
      binding: 0,
      resource: sampler,
    });
    for (let i = 1; i <= inputLength; i += 1) {
      bindGroupEntries.push({
        binding: i,
        resource: inputTextures[i - 1].createView(),
      });
    }
    this.bindGroup = device.createBindGroup({
      label: `${name}: bind group`,
      layout: bindGroupLayout,
      entries: bindGroupEntries,
    });
  }

  updateParam(param: string, value: any): void {
    throw new Error(`${this.constructor.name} has no param`);
  }

  pass(encoder: GPUCommandEncoder): void {
    const bilinearPass = encoder.beginRenderPass({
      colorAttachments: [
        {
          view: this.outputTexture.createView(),
          clearValue: {
            r: 0.0, g: 0.0, b: 0.0, a: 1.0,
          },
          loadOp: 'clear',
          storeOp: 'store',
        },
      ],
    });
    bilinearPass.setPipeline(this.pipeline);
    bilinearPass.setBindGroup(0, this.bindGroup);
    bilinearPass.draw(6);
    bilinearPass.end();
  }

  getOutputTexture(): GPUTexture {
    return this.outputTexture;
  }
}
