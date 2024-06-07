// Layer: Anime4K-v3.2-Upscale-Denoise-CNN-x2-(VL)-Conv-4x3x3x3
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
  result += mat4x4<f32>(-0.012326053, 0.050769784, 0.1278702, -0.100782245, 0.14329414, -0.054558773, 0.023473471, 0.056829426, 0.048292916, 0.0046510273, -0.11478287, 0.0011030561, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.29542983, -0.55061895, -0.068554066, 0.1433222, -0.072878316, 0.30201668, -0.2223378, -0.06704077, 0.16955832, 0.3279914, 0.17619601, -0.1276919, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.09623417, 0.30559412, 0.094622105, -0.076706685, 0.07943858, -0.084815115, 0.12472551, 0.079850115, -0.13044213, -0.21300878, -0.095747225, 0.13412355, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.21291664, 0.17195296, -0.20080926, 0.1064855, 0.10228669, -0.09580175, -0.11217631, -0.09740562, -0.0033135475, -0.053094357, 0.2983595, 0.035281878, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.08955812, -0.45707774, -0.4606922, -0.5754473, -0.11395895, 0.33530128, 0.29705846, -0.18877256, -0.43502945, 0.114171304, -0.3750776, -0.081597246, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.26109028, 0.02662961, -0.10441071, 0.11199392, -0.12038989, -0.09642296, -0.061320662, -0.33058178, 0.20212512, 0.00840794, 0.14357455, -0.038080238, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.09533881, -0.13644339, 0.068756215, 0.079305276, -0.053370547, 0.19572955, 0.0682981, 0.14469264, 0.15582883, -0.057183057, -0.13919263, -0.016394936, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.041189935, 0.39878023, 0.028704925, 0.30194348, -0.04486593, -0.33899093, -0.103968106, 0.21802065, -0.077099144, -0.07389541, 0.18069103, 0.18894517, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.12399862, 0.19246885, 0.034825478, -0.0044787163, 0.13121822, -0.13573012, -0.030162754, 0.1899518, 0.102326415, -0.061512686, -0.005647928, -0.0937634, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 1);
  result += vec4f(0.019286277, -0.033644073, 0.08196311, 0.0054393094);
  textureStore(conv2d_tf1_tex, pixel.xy, result);
}
