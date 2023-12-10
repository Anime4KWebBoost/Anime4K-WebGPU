// Layer: Anime4K-v4.0-Restore-CNN-(UL)-Conv-4x3x3x3
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
  result += mat4x4<f32>(-0.44157687, 0.1715858, -0.11000502, 0.062367063, 0.21790773, 0.15507151, 0.14760862, -0.2598815, 0.14098467, 0.14019097, -0.26298222, 0.10975315, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.15774319, -0.16769339, -0.49734345, -0.3935963, 0.115124024, -0.08045373, 0.55867237, 0.48593813, 0.058544844, -0.2705686, 0.3303555, 0.4181385, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.16588609, -0.013389144, 0.06600297, -0.09309111, -0.36321074, -0.13877828, 0.4099233, 0.20805255, 0.31892648, 0.16856939, -0.23898357, 0.11751563, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.39999864, 0.46407622, -0.12249342, -0.09798957, 0.122675434, 0.18265116, 0.030651823, 0.14682484, -0.42969155, 0.2486042, 0.13566706, -0.13458017, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.12757893, -0.19025628, -0.16728874, -0.10162156, -0.1577721, -0.174548, 0.29329458, 0.17963637, -0.43279588, 0.088979766, 0.06334896, -0.047701746, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.14359929, -0.12800618, -0.15429202, 0.034745168, 0.15794043, -0.086441815, -0.06520017, 0.26176664, -0.022253495, -0.34480432, -0.009120493, 0.08706416, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.1994137, 0.070990525, 0.3388379, 0.37502727, -0.116911314, 0.2160554, -0.1831974, -0.04184975, 0.2545874, -0.083908126, -0.19057468, -0.13382773, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.46475947, -0.23414738, -0.036689937, 0.018558737, -0.32609373, 0.15265512, -0.055894423, -0.3676328, 0.24501368, 0.12390915, 0.13458043, -0.30162823, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.12621075, 0.046852987, 0.17333286, 0.18997045, 0.3245911, -0.28809196, -0.3660882, -0.5916272, -0.11456223, -0.030912774, 0.17037971, -0.12640971, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 1);
  result += vec4f(0.42778614, 0.054881692, -0.23388587, -0.031204376);
  textureStore(conv2d_tf1_tex, pixel.xy, result);
}
