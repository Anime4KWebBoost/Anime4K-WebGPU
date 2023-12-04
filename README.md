# Anime4K-WebGPU

University of Pennsylvania, CIS 565: GPU Programming and Architecture, Final Project

Authors (alphabetical order with equal contribution):
* Ruijun(Daniel) Zhong [LinkedIn](https://www.linkedin.com/in/daniel-z-73158b152/) | [Personal Website](https://www.danielzhongportfolio.com/)
* Tong Hu  [LinkedIn](https://www.linkedin.com/in/tong-hu-5819a122a/) 
* Yuanqi Wang [LinkedIn](https://www.linkedin.com/in/yuanqi-wang-414b26106/) | [GitHub](https://github.com/plasmas)

## Introduction

An [Anime4K](https://github.com/bloc97/Anime4K) implementation for WebGPU, featuring video enhancements including upscaling, denoising, and deblurring. Computing is done entirely on the client side using WebGPU compute shaders. Functionality of this implementation is published as an [NPM package](https://www.npmjs.com/package/anime4k-webgpu), and can be easily incorporated into your WebGPU pipeline.

Take a look at our web demo at https://anime4k-webgpu-demo.fly.dev/ ([Source](https://github.com/Anime4KWebBoost/Anime4K-Web-Demo))

Note: your browser must support WebGPU. See this [list](https://caniuse.com/webgpu) for compatibility.

## Usage

This package contains classes that implements interface `Anime4KPipeline`. To use these classes, first install `anime4k-webgpu` package, then insert proveded pipelines in 3 lines:

```typescript
import { Anime4KPipeline, UpscaleCNNPipeline } from 'anime4k-webgpu';

// texture to be processed
const inputTexture: GPUTexture;

// +++ instantiate pipeline +++
const pipeline: Anime4KPipeline = new UpscaleCNNPipeline(device, inputTexture);

// bind output texture wherever you want e.g. render pipeline
const renderBindGroup = device.createBindGroup({
  ...
  entries: [{
    binding: 0,
    // +++ use pipeline.getOutputTexture() instead of inputTexture +++
    resource: pipeline.getOutputTexture().createView(),
  }]
});

function frame() {
  const commandEncoder: GPUCommandEncoder;

  // +++ inject commands into the encoder +++
  pipeline.pass(commandEncoder);

  // begin other render pass...
}
```

To change an adjustable parameter (e.g. deblur strength) call `Anime4KPipeline::updateParam(param: string, value: any)` and the value will be applied for the next render cycle:
```typescript
pipeline.updateParam('strength', 3.0);
```

The input texture must have usage `TEXTURE_BINDING`, and the output texture has `TEXTURE_BINDING | RENDER_ATTACHMENT | STORAGE_BINDING` to be used in render pipelines. You can also have multiple pipelines in tandem to achieve sophisticated effects.

## Performance Analysis

## Future Improvements

* Use `read-write` storage texture instead of `write-only` storage texture (Not yet supported in Chrome stable) for lower VRAM usage.

## Credits

* [Anime4K](https://github.com/bloc97/Anime4K)
* [UnityAnime4K](https://github.com/keijiro/UnityAnime4K)
* [WebGPU-Samples](https://github.com/webgpu/webgpu-samples)
