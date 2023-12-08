import conv2dWGSL from '../../shaders/examples/UpscaleCNN/conv2d.wgsl';
import conv2d1WGSL from '../../shaders/examples/UpscaleCNN/conv2d1.wgsl';
import conv2d2WGSL from '../../shaders/examples/UpscaleCNN/conv2d2.wgsl';
import conv2d3WGSL from '../../shaders/examples/UpscaleCNN/conv2d3.wgsl';
import conv2d4WGSL from '../../shaders/examples/UpscaleCNN/conv2d4.wgsl';
import conv2d5WGSL from '../../shaders/examples/UpscaleCNN/conv2d5.wgsl';
import conv2d6WGSL from '../../shaders/examples/UpscaleCNN/conv2d6.wgsl';
import conv2d71WGSL from '../../shaders/examples/UpscaleCNN/conv2d71.wgsl';
import conv2d72WGSL from '../../shaders/examples/UpscaleCNN/conv2d72.wgsl';
import conv2d73WGSL from '../../shaders/examples/UpscaleCNN/conv2d73.wgsl';
import overlay2WGSL from '../../shaders/helpers/overlay2.wgsl';

import Anime4KPipeline from '../Anime4KPipeline';
import { Conv2d, DepthToSpace, Overlay } from '../helpers';

export default class UpscaleCNN implements Anime4KPipeline {
  textures: GPUTexture[] = [];

  pipelines: Anime4KPipeline[] = [];

  constructor(device: GPUDevice, inputTexture: GPUTexture) {
    const shaders: string[] = [conv2dWGSL, conv2d1WGSL, conv2d2WGSL,
      conv2d3WGSL, conv2d4WGSL, conv2d5WGSL,
      conv2d6WGSL, conv2d71WGSL, conv2d72WGSL,
      conv2d73WGSL];

    this.pipelines.push(new Conv2d(device, [inputTexture], shaders[0], 'conv2d0'));

    for (let i = 1; i < 7; i += 1) {
      this.pipelines.push(new Conv2d(device, [this.pipelines[i - 1].getOutputTexture()], shaders[i], `conv2d_${i}`));
    }

    const outputTextures: GPUTexture[] = [];
    for (let i = 0; i < this.pipelines.length; i += 1) {
      outputTextures.push(this.pipelines[i].getOutputTexture());
    }

    for (let i = 1; i <= 3; i += 1) {
      this.pipelines.push(new Conv2d(device, outputTextures, shaders[i + 6], `conv2d7_${i}`));
    }

    this.pipelines.push(new DepthToSpace(device, [this.pipelines[7].getOutputTexture(), this.pipelines[8].getOutputTexture(), this.pipelines[9].getOutputTexture()], 'DepthToSpace'));
    this.pipelines.push(new Overlay(device, [inputTexture, this.pipelines[10].getOutputTexture()], [2 * inputTexture.width, 2 * inputTexture.height], overlay2WGSL, 'Overlay'));
  }

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  updateParam(param: string, value: any): void {
    throw new Error(`${this.constructor.name} has no param`);
  }

  getOutputTexture() : GPUTexture {
    return this.pipelines[this.pipelines.length - 1].getOutputTexture();
  }

  pass(encoder: GPUCommandEncoder) {
    for (let i = 0; i < this.pipelines.length; i += 1) {
      this.pipelines[i].pass(encoder);
    }
  }
}
