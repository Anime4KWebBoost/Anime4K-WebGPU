import { Anime4KPipeline } from '../pipelines';
import fullscreenTexturedQuadWGSL from './shaders/fullscreenTexturedQuad.wgsl';
import sampleExternalTextureWGSL from './shaders/sampleExternalTexture.wgsl';

export interface RendererOptions {
  video: HTMLVideoElement;
  canvas: HTMLCanvasElement;
  // function to build custom pipeline
  pipelineBuilder: (device: GPUDevice, inputTexture: GPUTexture) =>
  [...Anime4KPipeline[], Anime4KPipeline];
}

/**
 * Renders a video using a custom pipeline.
 *
 * @param {RendererOptions} options - The options for rendering.
 * @param {HTMLVideoElement} options.video - The video element to render.
 * @param {HTMLCanvasElement} options.canvas - The canvas element to render to.
 * @param {Function} options.pipelineBuilder - A function that builds the custom pipeline.
 * It takes a GPUDevice and a GPUTexture as parameters
 * and returns an array of Anime4KPipeline instances.
 * The pipelines returned will be executed in order in the render loop.
 * The output texture of the last pipeline will be rendered to the canvas.
 *
 * @returns {Promise<void>} A promise that resolves when redering is binded.
 *
 * @throws {Error} Will throw an error if WebGPU is not supported.
 */
export async function render(options: RendererOptions): Promise<void> {
  const { video, canvas, pipelineBuilder } = options;
  if (video.readyState < video.HAVE_FUTURE_DATA) {
    await new Promise((resolve) => {
      video.onloadeddata = resolve;
    });
  }
  const WIDTH = video.videoWidth;
  const HEIGHT = video.videoHeight;

  // configure WebGPU
  const adapter = await navigator.gpu.requestAdapter();
  if (!adapter) {
    throw new Error('WebGPU not supported');
  }
  const device = await adapter.requestDevice();
  const context = canvas.getContext('webgpu') as GPUCanvasContext;
  const presentationFormat = navigator.gpu.getPreferredCanvasFormat();
  context.configure({
    device,
    format: presentationFormat,
    alphaMode: 'premultiplied',
  });

  // create frame texture buffer of the video
  const videoFrameTexture = device.createTexture({
    size: [WIDTH, HEIGHT, 1],
    format: 'rgba16float',
    usage: GPUTextureUsage.TEXTURE_BINDING
          | GPUTextureUsage.COPY_DST
          | GPUTextureUsage.RENDER_ATTACHMENT,
  });

  const pipelines = pipelineBuilder(device, videoFrameTexture);

  // function to get copy new video frame into texture
  function updateVideoFrameTexture() {
    device.queue.copyExternalImageToTexture(
      { source: video },
      { texture: videoFrameTexture },
      [WIDTH, HEIGHT],
    );
  }

  // render pipeline setups
  const renderBindGroupLayout = device.createBindGroupLayout({
    label: 'Render Bind Group Layout',
    entries: [
      {
        binding: 1,
        visibility: GPUShaderStage.FRAGMENT,
        sampler: {},
      },
      {
        binding: 2,
        visibility: GPUShaderStage.FRAGMENT,
        texture: {},
      },
    ],
  });

  const renderPipelineLayout = device.createPipelineLayout({
    label: 'Render Pipeline Layout',
    bindGroupLayouts: [renderBindGroupLayout],
  });

  const renderPipeline = device.createRenderPipeline({
    layout: renderPipelineLayout,
    vertex: {
      module: device.createShaderModule({
        code: fullscreenTexturedQuadWGSL,
      }),
      entryPoint: 'vert_main',
    },
    fragment: {
      module: device.createShaderModule({
        code: sampleExternalTextureWGSL,
      }),
      entryPoint: 'main',
      targets: [
        {
          format: presentationFormat,
        },
      ],
    },
    primitive: {
      topology: 'triangle-list',
    },
  });

  const sampler = device.createSampler({
    magFilter: 'linear',
    minFilter: 'linear',
  });

  const renderBindGroup = device.createBindGroup({
    layout: renderBindGroupLayout,
    entries: [
      {
        binding: 1,
        resource: sampler,
      },
      {
        binding: 2,
        resource: pipelines.at(-1)!.getOutputTexture().createView(),
      },
    ],
  });

  // render loop
  function frame() {
    if (!video.paused) {
      updateVideoFrameTexture();
    }
    const commandEncoder = device.createCommandEncoder();
    pipelines.forEach((pipeline) => {
      pipeline.pass(commandEncoder);
    });
    const passEncoder = commandEncoder.beginRenderPass({
      colorAttachments: [
        {
          view: context.getCurrentTexture().createView(),
          clearValue: {
            r: 0.0, g: 0.0, b: 0.0, a: 1.0,
          },
          loadOp: 'clear' as GPULoadOp,
          storeOp: 'store' as GPUStoreOp,
        },
      ],
    });
    passEncoder.setPipeline(renderPipeline);
    passEncoder.setBindGroup(0, renderBindGroup);
    passEncoder.draw(6);
    passEncoder.end();
    device.queue.submit([commandEncoder.finish()]);
    video.requestVideoFrameCallback(frame);
  }
  // start render loop
  video.requestVideoFrameCallback(frame);
}
