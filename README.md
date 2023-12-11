# Anime4K-WebGPU

University of Pennsylvania, CIS 565: GPU Programming and Architecture, Final Project

Authors (alphabetical order with equal contribution):
* Ruijun(Daniel) Zhong [LinkedIn](https://www.linkedin.com/in/daniel-z-73158b152/) | [Personal Website](https://www.danielzhongportfolio.com/)
* Tong Hu  [LinkedIn](https://www.linkedin.com/in/tong-hu-5819a122a/) 
* Yuanqi Wang [LinkedIn](https://www.linkedin.com/in/yuanqi-wang-414b26106/) | [GitHub](https://github.com/plasmas)

## Introduction
![image](https://drive.google.com/uc?export=view&id=1XpdozjclGKwBu45OJn3IVRkVP_aMSwMx)

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
### Performance Comparisons
Following comparisons are done with 720P video as input. 
1. Compare with Denoise & Deblur effect
<div align="center">
<img src='https://drive.google.com/uc?export=view&id=1i5m99O5aroZYqGBKVtrGgwTYZfUKiiBu')/>
<p>Figure 1. Compare with Denoise & Deblur effect</p>
</div>

<div align="center">
<img src='https://drive.google.com/uc?export=view&id=1TuFOhfIgvn1gBzPPoorhZOwuk0ZqzCK2')/>
<p>Figure 2. Compare with restore CNN and restore GAN</p>
</div>

<div align="center">
<img src='https://drive.google.com/uc?export=view&id=1KSRnPYrlcZyjW2UuYM5kLAKOuUENmcV6')/>
<p>Figure 3. Compare with upscale CNN(x2) and upscale GAN (x3 & x4) </p>
</div>

### GPU Time Comparisons
Following comparisons are done with 720P video as input. 
<!-- ![image](https://drive.google.com/uc?export=view&id=1vjPsHItDaexbXRbnOsa2Wop259mlGX54) -->
<div align="center">
<img src='https://drive.google.com/uc?export=view&id=1vjPsHItDaexbXRbnOsa2Wop259mlGX54')/>
<p>Figure 4. GPU time for different effects (720P)</p>
</div>


Following comparisons are done with RTX 3070Ti graphic card. 
<!-- ![image](https://drive.google.com/uc?export=view&id=1fXaNjpD3M4H48xkoekhj__t6M_kYwhEd) -->
<div align="center">
<img src='https://drive.google.com/uc?export=view&id=1fXaNjpD3M4H48xkoekhj__t6M_kYwhEd')/>
<p>Figure 5. GPU time for different effects with different resolution videos</p>
</div>

## Future Improvements

* Use `read-write` storage texture instead of `write-only` storage texture (Not yet supported in Chrome stable) for lower VRAM usage.

## Reference
This project references a variety of resources:
- **Multimedia Demonstrations**
  - Demo Video (Miss Kobayashi's Dragon Maid): [YouTube Video](https://www.youtube.com/watch?v=NQF3a6A7kcQ)

## Credits

* [Anime4K](https://github.com/bloc97/Anime4K)
* [UnityAnime4K](https://github.com/keijiro/UnityAnime4K)
* [WebGPU-Samples](https://github.com/webgpu/webgpu-samples)
