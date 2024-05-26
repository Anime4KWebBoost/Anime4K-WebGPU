import conv2d0tf0WGSL from '../../shaders/upscale/GANx3L/conv2d0tf0.wgsl';
import conv2d0tf1WGSL from '../../shaders/upscale/GANx3L/conv2d0tf1.wgsl';
import conv2d0tf2WGSL from '../../shaders/upscale/GANx3L/conv2d0tf2.wgsl';
import conv2d1tfWGSL from '../../shaders/upscale/GANx3L/conv2d1tf.wgsl';
import conv2d2tfWGSL from '../../shaders/upscale/GANx3L/conv2d2tf.wgsl';
import conv2d3tf0WGSL from '../../shaders/upscale/GANx3L/conv2d3tf0.wgsl';
import conv2d3tf1WGSL from '../../shaders/upscale/GANx3L/conv2d3tf1.wgsl';
import conv2d3tf2WGSL from '../../shaders/upscale/GANx3L/conv2d3tf2.wgsl';
import conv2d4tfWGSL from '../../shaders/upscale/GANx3L/conv2d4tf.wgsl';
import conv2d5tfWGSL from '../../shaders/upscale/GANx3L/conv2d5tf.wgsl';
import conv2d6tf0WGSL from '../../shaders/upscale/GANx3L/conv2d6tf0.wgsl';
import conv2d6tf1WGSL from '../../shaders/upscale/GANx3L/conv2d6tf1.wgsl';
import conv2d6tf2WGSL from '../../shaders/upscale/GANx3L/conv2d6tf2.wgsl';
import conv2d7tfWGSL from '../../shaders/upscale/GANx3L/conv2d7tf.wgsl';
import conv2d8tfWGSL from '../../shaders/upscale/GANx3L/conv2d8tf.wgsl';
import conv2d9tf0WGSL from '../../shaders/upscale/GANx3L/conv2d9tf0.wgsl';
import conv2d9tf1WGSL from '../../shaders/upscale/GANx3L/conv2d9tf1.wgsl';
import conv2d9tf2WGSL from '../../shaders/upscale/GANx3L/conv2d9tf2.wgsl';
import conv2d10tfWGSL from '../../shaders/upscale/GANx3L/conv2d10tf.wgsl';
import conv2d11tfWGSL from '../../shaders/upscale/GANx3L/conv2d11tf.wgsl';
import conv2d12tf0WGSL from '../../shaders/upscale/GANx3L/conv2d12tf0.wgsl';
import conv2d12tf1WGSL from '../../shaders/upscale/GANx3L/conv2d12tf1.wgsl';
import conv2d12tf2WGSL from '../../shaders/upscale/GANx3L/conv2d12tf2.wgsl';
import conv2d13tfWGSL from '../../shaders/upscale/GANx3L/conv2d13tf.wgsl';
import conv0ups0WGSL from '../../shaders/upscale/GANx3L/conv0ups0.wgsl';
import conv0ups1WGSL from '../../shaders/upscale/GANx3L/conv0ups1.wgsl';
import conv0ups2WGSL from '../../shaders/upscale/GANx3L/conv0ups2.wgsl';
import overlayConv1ups0WGSL from '../../shaders/upscale/GANx3L/overlayConv1ups0.wgsl';
import overlayConv1ups1WGSL from '../../shaders/upscale/GANx3L/overlayConv1ups1.wgsl';
import overlayOutputWGSL from '../../shaders/upscale/GANx3L/overlayOutput.wgsl';

import Anime4KPipeline from '../Anime4KPipeline';
import { Conv2d, Overlay } from '../helpers';

export class GANx3L implements Anime4KPipeline {
  /**
   * pipelines:
   *  [0] conv2d_tf
   *  [1] conv2d_tf1
   *  [2] conv2d_tf2
   *  [3] conv2d_2_tf
   *  [4] conv2d_1_tf
   *  [5] conv2d_3_tf
   *  [6] conv2d_3_tf1
   *  [7] conv2d_3_tf2
   *  [8] conv2d_5_tf
   *  [9] conv2d_4_tf
   *  [10] conv2d_6_tf
   *  [11] conv2d_6_tf1
   *  [12] conv2d_6_tf2
   *  [13] conv2d_8_tf
   *  [14] conv2d_7_tf
   *  [15] conv2d_9_tf
   *  [16] conv2d_9_tf1
   *  [17] conv2d_9_tf2
   *  [18] conv2d_11_tf
   *  [19] conv2d_10_tf
   *  [20] conv2d_12_tf
   *  [21] conv2d_12_tf1
   *  [22] conv2d_12_tf2
   *  [23] conv2d_13_tf
   *  [24] conv0ups
   *  [25] conv0ups1
   *  [26] conv0ups2
   *  [27] conv1ups
   *  [28] conv1ups1
   *  [29] output
   */
  pipelines: Anime4KPipeline[] = [];

  constructor(device: GPUDevice, inputTexture: GPUTexture) {
    this.pipelines.push(new Conv2d(device, [inputTexture], conv2d0tf0WGSL, 'conv2d_tf'));
    this.pipelines.push(new Conv2d(device, [inputTexture], conv2d0tf1WGSL, 'conv2d_tf1'));
    this.pipelines.push(new Conv2d(device, [inputTexture], conv2d0tf2WGSL, 'conv2d_tf2'));

    const outputTextures: GPUTexture[] = [];
    this.fillOutputTextures(outputTextures, 0, 3);
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d2tfWGSL, 'conv2d_2_tf'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d1tfWGSL, 'conv2d_1_tf'));

    outputTextures.push(this.pipelines[3].getOutputTexture());
    outputTextures.push(this.pipelines[4].getOutputTexture());
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d3tf0WGSL, 'conv2d_3_tf'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d3tf1WGSL, 'conv2d_3_tf1'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d3tf2WGSL, 'conv2d_3_tf2'));

    outputTextures.length = 0;
    this.fillOutputTextures(outputTextures, 5, 3);
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d5tfWGSL, 'conv2d_5_tf'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d4tfWGSL, 'conv2d_4_tf'));

    outputTextures.push(this.pipelines[8].getOutputTexture());
    outputTextures.push(this.pipelines[4].getOutputTexture());
    outputTextures.push(this.pipelines[9].getOutputTexture());
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d6tf0WGSL, 'conv2d_6_tf'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d6tf1WGSL, 'conv2d_6_tf1'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d6tf2WGSL, 'conv2d_6_tf2'));

    outputTextures.length = 0;
    this.fillOutputTextures(outputTextures, 10, 3);
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d8tfWGSL, 'conv2d_8_tf'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d7tfWGSL, 'conv2d_7_tf'));

    outputTextures.push(this.pipelines[13].getOutputTexture());
    outputTextures.push(this.pipelines[4].getOutputTexture());
    outputTextures.push(this.pipelines[9].getOutputTexture());
    outputTextures.push(this.pipelines[14].getOutputTexture());
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d9tf0WGSL, 'conv2d_9_tf'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d9tf1WGSL, 'conv2d_9_tf1'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d9tf2WGSL, 'conv2d_9_tf2'));

    outputTextures.length = 0;
    this.fillOutputTextures(outputTextures, 15, 3);
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d11tfWGSL, 'conv2d_11_tf'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d10tfWGSL, 'conv2d_10_tf'));

    outputTextures.push(this.pipelines[18].getOutputTexture());
    outputTextures.push(this.pipelines[4].getOutputTexture());
    outputTextures.push(this.pipelines[9].getOutputTexture());
    outputTextures.push(this.pipelines[14].getOutputTexture());
    outputTextures.push(this.pipelines[19].getOutputTexture());
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d12tf0WGSL, 'conv2d_12_tf'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d12tf1WGSL, 'conv2d_12_tf1'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d12tf2WGSL, 'conv2d_12_tf2'));

    outputTextures.length = 0;
    this.fillOutputTextures(outputTextures, 20, 3);
    this.pipelines.push(new Conv2d(device, outputTextures, conv2d13tfWGSL, 'conv2d_13_tf'));

    outputTextures.push(this.pipelines[18].getOutputTexture());
    outputTextures.push(this.pipelines[4].getOutputTexture());
    outputTextures.push(this.pipelines[9].getOutputTexture());
    outputTextures.push(this.pipelines[14].getOutputTexture());
    outputTextures.push(this.pipelines[19].getOutputTexture());
    outputTextures.push(this.pipelines[23].getOutputTexture());
    this.pipelines.push(new Conv2d(device, outputTextures, conv0ups0WGSL, 'conv0ups'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv0ups1WGSL, 'conv0ups1'));
    this.pipelines.push(new Conv2d(device, outputTextures, conv0ups2WGSL, 'conv0ups2'));

    outputTextures.length = 0;
    this.fillOutputTextures(outputTextures, 24, 3);
    this.pipelines.push(new Overlay(device, outputTextures, [3 * inputTexture.width, 3 * inputTexture.height], overlayConv1ups0WGSL, 'conv1ups'));
    this.pipelines.push(new Overlay(device, outputTextures, [3 * inputTexture.width, 3 * inputTexture.height], overlayConv1ups1WGSL, 'conv1ups1'));

    this.pipelines.push(new Overlay(device, [this.pipelines[27].getOutputTexture(), this.pipelines[28].getOutputTexture(), inputTexture], [3 * inputTexture.width, 3 * inputTexture.height], overlayOutputWGSL, 'output'));
  }

  fillOutputTextures(outputTextures: GPUTexture[], from: number, count: number) {
    for (let i = from; i < from + count; i += 1) {
      outputTextures.push(this.pipelines[i].getOutputTexture());
    }
  }

  updateParam(param: string, value: any): void {
    throw new Error('Method not implemented.');
  }

  pass(encoder: GPUCommandEncoder): void {
    for (let i = 0; i < this.pipelines.length; i += 1) {
      this.pipelines[i].pass(encoder);
    }
  }

  getOutputTexture(): GPUTexture {
    return this.pipelines[this.pipelines.length - 1].getOutputTexture();
  }
}
