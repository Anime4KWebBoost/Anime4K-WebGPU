// Layer: Anime4K-v3.2-Upscale-CNN-x2-(VL)-Conv-4x3x3x3
// Name: conv2dtf1
// Inputs: ['MAIN']
// Output: conv2d_tf1
@group(0) @binding(0) var MAIN_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_tf1_tex: texture_storage_2d<rgba16float, write>;

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return textureLoad(MAIN_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0);
}

@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_tf1_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.112743355, 0.0422517, 0.21350034, -0.0967133, 0.16265953, 0.0022497, 0.015078242, 0.08204187, 0.035236806, -0.0468228, -0.09464228, -0.001864949, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.25631642, -0.41485596, -0.16662048, 0.13201024, 0.057921384, 0.2240005, -0.30038536, -0.08305622, 0.2228756, 0.32263795, 0.10608189, -0.18616734, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.08997524, 0.11516871, 0.19212262, -0.035154644, 0.11612274, -0.04056247, 0.14974374, 0.029173585, -0.07629641, -0.14353512, 0.041081246, 0.20230265, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.2262286, 0.055954933, -0.14499907, 0.17314723, 0.16590612, -0.06688698, -0.11118816, -0.012938116, -0.043101817, 0.026133137, 0.2958395, 0.06543993, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.07311521, -0.3041244, -0.47978505, -0.6350967, -0.17432262, 0.34965977, 0.25399777, -0.16590433, -0.49957857, 0.0549526, -0.40869385, -0.08780993, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.3014447, -0.00021343959, -0.14953177, 0.028001398, -0.14931908, -0.14910097, -0.13287953, -0.45026535, 0.17378895, 0.024704922, -0.027308129, -0.10292025, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.06732655, -0.13119644, 0.066014715, 0.081011154, -0.15154321, 0.2407805, 0.07733481, 0.12312706, 0.1741804, 0.008495716, -0.14125362, -0.043644864, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.11465958, 0.42001364, 0.011069392, 0.3203028, -0.058801666, -0.37830314, -0.030540617, 0.2245139, -0.11310525, -0.14845212, 0.19957744, 0.25789997, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.16037206, 0.21326372, 0.020099448, 0.018666709, 0.122083254, -0.16033986, -0.10725163, 0.2556128, 0.1650688, -0.10475823, 0.048623525, -0.103755645, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 1);
  result += vec4f(0.007717166, -0.027800834, 0.0795002, 0.0053199283);
  textureStore(conv2d_tf1_tex, pixel.xy, result);
}
