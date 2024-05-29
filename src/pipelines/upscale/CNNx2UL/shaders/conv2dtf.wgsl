// Layer: Anime4K-v3.2-Upscale-CNN-x2-(UL)-Conv-4x3x3x3
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
  result += mat4x4<f32>(-0.27576035, -0.07072761, -0.1630093, -0.11306897, 0.14765891, -0.039999995, 0.04671886, -0.06138944, 0.11445724, 0.10989976, 0.12772457, 0.19654717, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.076798744, -0.026944768, -0.24994318, 0.2515569, -0.16839856, 0.17563075, 0.30983326, -0.26057217, -0.07267306, -0.16690817, -0.028771983, -0.32779765, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.22670166, -0.08031973, 0.1576897, -0.09411961, 0.10889907, 0.09876773, -0.12708376, 0.20890583, 0.13792023, 0.046159253, 0.008415701, 0.028718324, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.123937644, -0.0040695923, 0.1577942, -0.25086892, -0.11906424, 0.024612824, 0.04019426, -0.20309904, -0.001790695, -0.022292957, -0.24705121, -0.020513516, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.12275696, 0.087533146, 0.22975677, 0.3249744, -0.46705425, 0.049937986, -0.3746097, 0.6908184, -0.02694045, 0.10467642, 0.24765752, 0.29053956, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.085650265, 0.06399875, 0.16803174, -0.000924935, -0.012419805, 0.3505107, -0.013437306, -0.37681264, -0.06174721, 0.3525594, -0.7133205, 0.16013019, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.2400495, 0.08462758, 0.025238732, -0.019882765, -0.09665332, -0.030001955, -0.10374011, -0.2661804, -0.1017717, -0.04910443, 0.102630705, -0.01290848, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.13510828, -0.09396734, -0.30896646, 0.13402982, 0.7047196, -0.09083812, 0.29420912, -0.30652946, 0.089854665, -0.04834406, 0.017005004, -0.22518355, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.28510967, 0.04660653, 0.24457681, -0.21047631, -0.12409636, -0.5526988, -0.1340479, 0.2336875, -0.048938934, -0.31569406, -0.021553513, -0.084858574, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 1);
  result += vec4f(0.0357343, 0.024812812, 0.040654864, -0.002103711);
  textureStore(conv2d_tf_tex, pixel.xy, result);
}