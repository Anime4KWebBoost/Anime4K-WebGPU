import { Anime4KPipeline } from '../../interfaces';

export class DenoiseCNNx2VL implements Anime4KPipeline {
  updateParam(param: string, value: any): void {
    throw new Error('Method not implemented.');
  }

  pass(encoder: GPUCommandEncoder): void {
    throw new Error('Method not implemented.');
  }

  getOutputTexture(): GPUTexture {
    throw new Error('Method not implemented.');
  }
}