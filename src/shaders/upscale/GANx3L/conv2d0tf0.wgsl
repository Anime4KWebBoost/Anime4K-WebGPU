// Layer: Anime4K-v4.1-Upscale-GAN-x3-(L)-Conv-4x3x3x3
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
  result += mat4x4<f32>(-0.26345107, 0.18636681, 0.068192646, 0.06335259, -0.5026903, -0.39884016, -0.14562744, -0.24653248, -0.44533378, 0.52169526, -0.35453957, 0.25303423, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.22396083, 0.1324318, 0.47152156, -0.3061965, -0.06026671, -0.26795772, 0.0081171375, -0.32897332, -0.16401465, -0.1018444, 0.48241594, -0.09054633, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.25090155, -0.15917313, 0.028407926, -0.24014995, 0.4114972, -0.45535553, 0.08742311, 0.16796699, 0.0995656, -0.4009339, 0.21471445, 0.2708967, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.16269766, 0.16389379, -0.12857921, -0.1602467, -0.16460834, 0.15754342, 0.46217716, 0.20442651, 0.0548621, -0.018400457, 0.38643107, -0.29171357, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.24035631, -0.33344224, -0.3904698, -0.4168555, -0.42237657, 0.36649242, 0.41396108, -0.38945103, -0.5806718, 0.035621256, 0.09171773, -0.54301006, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.15957133, -0.035278857, 0.1318051, 0.6896821, 0.18556473, 0.16378926, 0.32670698, 0.2675555, 0.08802092, 0.41140598, 0.05322177, 0.5030955, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.082798496, 0.24381381, -0.30908522, 0.04553323, 0.25664318, 0.4123797, -0.29377607, 0.15920162, 0.13717672, 0.027625162, 0.25476956, 0.21843456, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.14534818, -0.239681, 0.22961527, 0.3814783, 0.1233398, 0.2449555, 0.015051085, 0.1661234, -0.27740797, -0.29109767, -0.19438179, -0.027439274, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.0011904882, -0.01287622, -0.1573707, -0.13167281, -0.12803882, -0.079415865, -0.04034391, -0.09625339, 0.23190106, -0.26743674, -0.48981485, -0.2063946, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 1);
  result += vec4f(0.034235504, 0.039522275, -0.032817896, -0.0031068379);
  textureStore(conv2d_tf_tex, pixel.xy, result);
}