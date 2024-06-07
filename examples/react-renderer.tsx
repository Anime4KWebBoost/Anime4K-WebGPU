import React, { useRef, useEffect } from 'react';
import { CNNx2UL, GANUUL, render } from 'anime4k-webgpu';

export const ReactRenderer: React.FC = () => {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const videoRef = useRef<HTMLVideoElement>(null);

  useEffect(() => {
    const video = videoRef.current!;
    const canvas = canvasRef.current!;
    video.muted = true;
    video.src = '/OnePunchMan.mp4';
    async function init() {
      await render({
        video,
        canvas,
        // function to build custom pipeline
        // return all pipelines in render pass order
        pipelineBuilder: (device, inputTexture) => {
          const upscale = new CNNx2UL({
            device,
            inputTexture,
          });
          const restore = new GANUUL({
            device,
            inputTexture: upscale.getOutputTexture(),
          });
          return [upscale, restore];
        },
      });
      // play video
      await video.play();
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
