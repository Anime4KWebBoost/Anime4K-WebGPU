interface Anime4KPipeline {
  /**
   * Update the controllable parameter managed by the pipeline
   *
   * @param param  - name of the parameter
   * @param value  - value of the parameter
   */
  updateParam(param: string, value: any): void;

  /**
   * write compute commands into the encoder
   *
   * @param encoder - encoder to record commands into
   */
  pass(encoder: GPUCommandEncoder): void;

  /**
   * get the output texture of this pipeline
   */
  getOutputTexture(): GPUTexture;
}

export default Anime4KPipeline;
