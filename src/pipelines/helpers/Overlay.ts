import vertexWGSL from '../../shaders/helpers/vertex.wgsl';
import Anime4KPipeline from '../Anime4KPipeline';

/**
 * Render Pipeline:
 *      Takes in n input textures output texture.
 */
export default class Overlay implements Anime4KPipeline {
  outputTexture: GPUTexture;
  pipeline: GPURenderPipeline;
  bindGroup: GPUBindGroup;
  name: string;

  /**
   * Constructor
   * @param device - GPUDevice used to create things.
   * @param inputTextures - input textures for render pipeline.
   * @param outputTextureSize - output texture of render pipeline.
   * @param fragmentWGSL - fragment shader code as string
   * @param name - name to identify each instance.
   */
  constructor(device: GPUDevice, inputTextures: GPUTexture[], outputTextureSize: number[], fragmentWGSL: string, name='defaultOverlay') {
    const inputLength = inputTextures.length;
    this.name = name;

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
    })

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
