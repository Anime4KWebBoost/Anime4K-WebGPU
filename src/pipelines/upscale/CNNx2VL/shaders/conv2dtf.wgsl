// Layer: Anime4K-v3.2-Upscale-CNN-x2-(VL)-Conv-4x3x3x3
// Name: conv2dtf
// Inputs: ['MAIN']
// Output: conv2d_tf
@group(0) @binding(0) var MAIN_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_tf_tex: texture_storage_2d<rgba16float, write>;

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return textureLoad(MAIN_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0);
}

@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(0.3053028, -0.037464816, 0.113983095, 0.12537485, -0.18630321, 0.084269725, -0.01351514, -0.20190673, -0.12298384, -0.037622184, -0.070214555, -0.19367279, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.41849324, 0.099702746, -0.04276645, -0.047299717, 0.20074473, 0.14217933, 0.15571699, 0.19553481, 0.21868695, -0.053848714, 0.016413521, 0.14117444, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.030540446, -0.052293833, 0.0715466, -0.31160545, 0.07808315, -0.16860045, 0.032828577, -0.2955024, -0.110374965, 0.04043687, -0.014024628, 0.058699366, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.10727635, 0.054200135, 0.20853694, 0.21086875, 0.122690216, -0.091823794, 0.310609, -0.01738923, -0.0013488946, 0.10835534, -0.077265196, 0.086751856, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.77150255, 0.40530515, -0.41257596, -0.14367618, 0.46888494, 0.2650122, -0.934199, 0.40476102, 0.32293493, 0.20251967, 0.19891106, -0.29698747, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.12505147, -0.41904053, -0.065798186, 0.34075752, 0.026240354, -0.2977496, 0.032647505, -0.003566783, 0.10290523, -0.23417123, -0.06014203, 0.094735645, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.11207838, -0.04062474, 0.023897955, 0.08605987, -0.020888371, 0.045541205, -0.07231824, -0.25884083, -0.11796847, -0.002691391, 0.0050435597, 0.02756291, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.4615728, 0.041790638, 0.08971143, 0.20213957, -0.38537467, 0.19938901, 0.08594364, -0.08621994, -0.08163473, -0.133266, -0.09561729, -0.014209637, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.0787417, -0.0483673, 0.07621572, -0.060169693, -0.013465177, -0.17152289, 0.02515561, 0.17675288, -0.05173998, 0.10768042, -0.029858522, -0.013957215, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 1);
  result += vec4f(0.0072128535, -0.05658625, 0.052939568, -0.1760861);
  textureStore(conv2d_tf_tex, pixel.xy, result);
}
