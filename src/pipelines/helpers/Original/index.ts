import { Anime4KPipeline, OriginalPipelineDescriptor } from '../../interfaces';

/**
 * Original pipeline
 *    Output the input texture without any change.
*/
export class Original implements Anime4KPipeline {
  outputTexture: GPUTexture;

  constructor({
    inputTexture,
  }: OriginalPipelineDescriptor) {
    this.outputTexture = inputTexture;
  }

  updateParam(param: string, value: any): void {
    throw new Error('Method not implemented.');
  }

  pass(encoder: GPUCommandEncoder): void {
  }

  getOutputTexture(): GPUTexture {
    return this.outputTexture;
  }
}
