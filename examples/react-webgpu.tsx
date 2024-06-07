import React, { useRef, useEffect } from 'react';
import { CNNUL, CNNx2UL } from 'anime4k-webgpu';

const fullscreenTexturedQuadWGSL = `
struct VertexOutput {
  @builtin(position) Position : vec4<f32>,
  @location(0) fragUV : vec2<f32>,
}

@vertex
fn vert_main(@builtin(vertex_index) VertexIndex : u32) -> VertexOutput {
  const pos = array(
    vec2( 1.0,  1.0),
    vec2( 1.0, -1.0),
    vec2(-1.0, -1.0),
    vec2( 1.0,  1.0),
    vec2(-1.0, -1.0),
    vec2(-1.0,  1.0),
  );

  const uv = array(
    vec2(1.0, 0.0),
    vec2(1.0, 1.0),
    vec2(0.0, 1.0),
    vec2(1.0, 0.0),
    vec2(0.0, 1.0),
    vec2(0.0, 0.0),
  );

  var output : VertexOutput;
  output.Position = vec4(pos[VertexIndex], 0.0, 1.0);
  output.fragUV = uv[VertexIndex];
  return output;
}
`;
const sampleExternalTextureWGSL = `
@group(0) @binding(1) var mySampler: sampler;
@group(0) @binding(2) var myTexture: texture_2d<f32>;

@fragment
fn main(@location(0) fragUV : vec2f) -> @location(0) vec4f {
  return textureSampleBaseClampToEdge(myTexture, mySampler, fragUV);
}
`;

export const ReactWebGPU: React.FC = () => {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const videoRef = useRef<HTMLVideoElement>(null);

  useEffect(() => {
    async function init() {
      // create video element
      const video = videoRef.current!;
      video.loop = true;
      video.autoplay = true;
      video.muted = true;
      video.src = '/OnePunchMan.mp4';
      await new Promise((resolve) => {
        video.onloadeddata = resolve;
      });
      await video.play();
      const WIDTH = video.videoWidth;
      const HEIGHT = video.videoHeight;

      // configure WebGPU
      const canvas = canvasRef.current!;
      const adapter = await navigator.gpu.requestAdapter();
      const device = await adapter!.requestDevice();
      const context = canvas.getContext('webgpu') as GPUCanvasContext;
      const presentationFormat = navigator.gpu.getPreferredCanvasFormat();
      context.configure({
        device,
        format: presentationFormat,
        alphaMode: 'premultiplied',
      });

      // create texture of video
      const videoFrameTexture = device.createTexture({
        size: [WIDTH, HEIGHT, 1],
        format: 'rgba16float',
        usage: GPUTextureUsage.TEXTURE_BINDING
        | GPUTextureUsage.COPY_DST
        | GPUTextureUsage.RENDER_ATTACHMENT,
      });

      // ++++ Anime4K ++++
      const upscalePipeline = new CNNx2UL({
        device,
        inputTexture: videoFrameTexture,
      });
      const restorePipeline = new CNNUL({
        device,
        inputTexture: upscalePipeline.getOutputTexture(),
      });
      // optional: resize canvas to match the output texture size
      canvas.width = restorePipeline.getOutputTexture().width;
      canvas.height = restorePipeline.getOutputTexture().height;
      // ++++ Anime4K ++++

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
          }
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
            // +++ Anime4K +++
            resource: restorePipeline.getOutputTexture().createView(),
            // +++ Anime4K +++
          }
        ],
      });


      // render loop
      function frame() {
        if (!video.paused) {
          updateVideoFrameTexture();
        }
        const commandEncoder = device.createCommandEncoder();
        // +++ Anime4K +++
        upscalePipeline.pass(commandEncoder);
        restorePipeline.pass(commandEncoder);
        // +++ Anime4K +++
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

    init();
  }, [])

  return (
    <div>
      <video ref={videoRef} controls />
      <canvas
        ref={canvasRef}
        width="640"
        height="360"
        style={{ border: '1px solid black' }}
      />
    </div>
  );
};
