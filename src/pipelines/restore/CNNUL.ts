import conv2dtfWGSL from '../../shaders/restore/CNNUL/conv2dtf.wgsl';
import conv2dtf1WGSL from '../../shaders/restore/CNNUL/conv2dtf1.wgsl';
import conv2dtf2WGSL from '../../shaders/restore/CNNUL/conv2dtf2.wgsl';
import conv2d1tfWGSL from '../../shaders/restore/CNNUL/conv2d1tf.wgsl';
import conv2d1tf1WGSL from '../../shaders/restore/CNNUL/conv2d1tf1.wgsl';
import conv2d1tf2WGSL from '../../shaders/restore/CNNUL/conv2d1tf2.wgsl';
import conv2d2tfWGSL from '../../shaders/restore/CNNUL/conv2d2tf.wgsl';
import conv2d2tf1WGSL from '../../shaders/restore/CNNUL/conv2d2tf1.wgsl';
import conv2d2tf2WGSL from '../../shaders/restore/CNNUL/conv2d2tf2.wgsl';
import conv2d3tfWGSL from '../../shaders/restore/CNNUL/conv2d3tf.wgsl';
import conv2d3tf1WGSL from '../../shaders/restore/CNNUL/conv2d3tf1.wgsl';
import conv2d3tf2WGSL from '../../shaders/restore/CNNUL/conv2d3tf2.wgsl';
import conv2d4tfWGSL from '../../shaders/restore/CNNUL/conv2d4tf.wgsl';
import conv2d4tf1WGSL from '../../shaders/restore/CNNUL/conv2d4tf1.wgsl';
import conv2d4tf2WGSL from '../../shaders/restore/CNNUL/conv2d4tf2.wgsl';
import conv2d5tfWGSL from '../../shaders/restore/CNNUL/conv2d5tf.wgsl';
import conv2d5tf1WGSL from '../../shaders/restore/CNNUL/conv2d5tf1.wgsl';
import conv2d5tf2WGSL from '../../shaders/restore/CNNUL/conv2d5tf2.wgsl';
import conv2d6tfWGSL from '../../shaders/restore/CNNUL/conv2d6tf.wgsl';
import conv2d6tf1WGSL from '../../shaders/restore/CNNUL/conv2d6tf1.wgsl';
import conv2d6tf2WGSL from '../../shaders/restore/CNNUL/conv2d6tf2.wgsl';
import conv2d7tfWGSL from '../../shaders/restore/CNNUL/conv2d7tf.wgsl';
import conv2d7tf1WGSL from '../../shaders/restore/CNNUL/conv2d7tf1.wgsl';
import conv2d7tf2WGSL from '../../shaders/restore/CNNUL/conv2d7tf2.wgsl';
import output from '../../shaders/restore/CNNUL/output.wgsl';
import overlay2WGSL from '../../shaders/helpers/overlay2.wgsl';

import Anime4KPipeline from '../Anime4KPipeline';
import { Conv2d, DepthToSpace, Overlay } from '../helpers';

export default class CNNUL implements Anime4KPipeline {
  /**
   *  [0 - 2] conv2d_tf - conv2d_tf2
   *  [3 - 5] conv2d_1_tf - conv2d_1_tf2
   *  [6 - 8] conv2d_2_tf - conv2d_2_tf2
   *  [9 - 11] conv2d_3_tf - conv2d_3_tf2
   *  [12 - 14] conv2d_4_tf - conv2d_4_tf2
   *  [15 - 17] conv2d_5_tf - conv2d_5_tf2
   *  [18 - 20] conv2d_6_tf - conv2d_6_tf2
   *  [21 - 23] conv2d_7_tf - conv2d_7_tf2
   *  [24] output
   */
  pipelines: Anime4KPipeline[] = [];

  constructor(device: GPUDevice, inputTexture: GPUTexture) {
    const shaders: string[] = [
      conv2dtfWGSL, conv2dtf1WGSL, conv2dtf2WGSL,
      conv2d1tfWGSL, conv2d1tf1WGSL, conv2d1tf2WGSL,
      conv2d2tfWGSL, conv2d2tf1WGSL, conv2d2tf2WGSL,
      conv2d3tfWGSL, conv2d3tf1WGSL, conv2d3tf2WGSL,
      conv2d4tfWGSL, conv2d4tf1WGSL, conv2d4tf2WGSL,
      conv2d5tfWGSL, conv2d5tf1WGSL, conv2d5tf2WGSL,
      conv2d6tfWGSL, conv2d6tf1WGSL, conv2d6tf2WGSL,
      conv2d7tfWGSL, conv2d7tf1WGSL, conv2d7tf2WGSL];

    for (let i = 0; i < 3; i += 1) {
      this.pipelines.push(new Conv2d(device, [inputTexture], shaders[i], `conv2d_tf_${i}`));
    }

    const outputTextures: GPUTexture[] = [];
    for (let i = 1; i <= 7; i += 1) {
      outputTextures.length = 0;
      this.fillOutputTextures(outputTextures, (i - 1) * 3, 3);
      for (let j = 0; j < 3; j += 1) {
        this.pipelines.push(new Conv2d(device, outputTextures, shaders[3 * i + j], `conv2d_${i}_tf_${j}`));
      }
    }

    outputTextures.length = 0;
    this.fillOutputTextures(outputTextures, 9, 15);
    this.pipelines.push(new Conv2d(device, outputTextures, output, 'output'));

    this.pipelines.push(new Overlay(device, [inputTexture, this.pipelines[this.pipelines.length - 1].getOutputTexture()], [inputTexture.width, inputTexture.height], overlay2WGSL, 'Overlay'));
  }

  fillOutputTextures(outputTextures: GPUTexture[], from: number, count: number) {
    for (let i = from; i < from + count; i += 1) {
      outputTextures.push(this.pipelines[i].getOutputTexture());
    }
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
