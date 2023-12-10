import Anime4KPipeline from '../Anime4KPipeline';

/**
 * Original pipeline
 *    Output the input texture without any change.
*/
export default class Original implements Anime4KPipeline {
  outputTexture: GPUTexture;

  constructor(inputTexture: GPUTexture) {
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
