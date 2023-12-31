// Layer: Anime4K-v4.1-Upscale-GAN-x4-(UUL)-Conv-4x1x1x64
// Name: conv2d3tf3
// Inputs: ['conv2d_tf', 'conv2d_tf1', 'conv2d_tf2', 'conv2d_tf3', 'conv2d_tf4', 'conv2d_tf5', 'conv2d_2_tf', 'conv2d_1_tf']
// Output: conv2d_3_tf3
@group(0) @binding(0) var conv2d_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_tf3_tex: texture_2d<f32>;
@group(0) @binding(4) var conv2d_tf4_tex: texture_2d<f32>;
@group(0) @binding(5) var conv2d_tf5_tex: texture_2d<f32>;
@group(0) @binding(6) var conv2d_2_tf_tex: texture_2d<f32>;
@group(0) @binding(7) var conv2d_1_tf_tex: texture_2d<f32>;
@group(0) @binding(8) var conv2d_3_tf3_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn g_0(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_tf_tex, pos, 0), 0.0);
}

fn g_1(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_tf1_tex, pos, 0), 0.0);
}

fn g_2(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_tf2_tex, pos, 0), 0.0);
}

fn g_3(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_tf3_tex, pos, 0), 0.0);
}

fn g_4(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_tf4_tex, pos, 0), 0.0);
}

fn g_5(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_tf5_tex, pos, 0), 0.0);
}

fn g_6(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_tf_tex, pos, 0), 0.0);
}

fn g_7(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_tf1_tex, pos, 0), 0.0);
}

fn g_8(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_tf2_tex, pos, 0), 0.0);
}

fn g_9(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_tf3_tex, pos, 0), 0.0);
}

fn g_10(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_tf4_tex, pos, 0), 0.0);
}

fn g_11(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_tf5_tex, pos, 0), 0.0);
}

fn g_12(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_2_tf_tex, pos, 0), 0.0);
}

fn g_13(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_2_tf_tex, pos, 0), 0.0);
}

fn g_14(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_1_tf_tex, pos, 0), 0.0);
}

fn g_15(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_1_tf_tex, pos, 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_3_tf3_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.15813187, 0.15032968, -0.358124, 0.054663192, -0.25664124, -0.047136743, 0.024661854, 0.29019728, -0.1586862, -0.12748682, 0.40721273, 0.02187444, 0.011839724, -0.41867453, -0.2442098, -0.24595131) * g_0(pixel.xy);
  result += mat4x4<f32>(-0.15485683, 0.31738782, -0.3137046, 0.082112595, 0.0737305, 0.11812223, 0.19734107, -0.18905711, 0.088300474, -0.16933976, 0.15907732, -0.11422951, -0.056749936, -0.373262, -0.06974283, -0.2820898) * g_1(pixel.xy);
  result += mat4x4<f32>(-0.26680642, 0.19024834, 0.002037017, -0.064218, -0.15495898, 0.2750016, 0.23787461, -0.17998067, -0.012667507, 0.27450457, 0.24563935, 0.21562263, -0.0075859334, -0.08958551, -0.093937464, -0.078713246) * g_2(pixel.xy);
  result += mat4x4<f32>(-0.17318735, -0.008759622, 0.15150657, 0.2992114, 0.022198962, -0.07318335, -0.14881803, 0.13562077, -0.0022031132, -0.19316684, 0.2535826, -0.05084298, -0.32218117, 0.1267631, -0.042296994, 0.036732808) * g_3(pixel.xy);
  result += mat4x4<f32>(0.25161934, -0.09492602, 0.13423127, 0.032517985, -0.06686973, -0.061583497, -0.1828305, 0.122823365, -0.21438296, -0.30841893, 0.1731841, -0.29667705, -0.29025105, 0.13186353, -0.043046407, -0.34681532) * g_4(pixel.xy);
  result += mat4x4<f32>(-0.14662783, -0.11100817, 0.073842436, -0.14357355, 0.24532394, 0.061293274, 0.037153088, -0.08022293, 0.11296792, 0.25762567, 0.1803339, 0.24524696, -0.06480696, 0.06504735, 0.04941994, -0.20177524) * g_5(pixel.xy);
  result += mat4x4<f32>(-0.06278919, -0.25327423, 0.08713618, -0.11191733, 0.33828825, 0.058243927, 0.05450901, -0.37079945, 0.08136556, 0.24741262, -0.27361023, -0.068275, 0.050629843, 0.21304448, 0.2734626, -0.16750076) * g_6(pixel.xy);
  result += mat4x4<f32>(0.11121274, -0.115385205, 0.22477418, -0.06725809, -0.15530252, -0.031487826, -0.17961866, 0.025540952, 0.08094816, 0.22538602, -0.1449456, 0.033616643, 0.11810663, 0.1127742, 0.17407128, 0.059245285) * g_7(pixel.xy);
  result += mat4x4<f32>(0.43453342, -0.12170353, 0.09817627, 0.14755897, 0.17435667, -0.22251855, -0.32671428, 0.107192695, 0.26639727, -0.2892611, -0.1413853, -0.082134426, 0.016464738, 0.08648902, 0.06256596, -0.023842275) * g_8(pixel.xy);
  result += mat4x4<f32>(0.3739318, 0.118386924, -0.10602344, 0.051698774, 0.116221406, -0.34542432, -0.13280031, -0.53044075, -0.19284041, 0.14490364, -0.2050812, 0.12533414, 0.22506653, -0.07526672, 0.035203286, 0.026242174) * g_9(pixel.xy);
  result += mat4x4<f32>(-0.5327144, 0.1649795, -0.11507187, -0.234499, 0.061057597, 0.06764596, 0.20559542, -0.07742593, 0.2165637, -0.1549744, 0.026953368, 0.3037089, 0.110090226, -0.1258564, 0.13759027, 0.16844687) * g_10(pixel.xy);
  result += mat4x4<f32>(0.24411613, -0.004854083, -0.009286953, -0.00086425553, -0.22064768, 0.0014907656, -0.08684952, 0.029716417, -0.241052, -0.13597979, -0.10451872, -0.26793602, -0.08911106, 0.024757262, 0.17348441, 0.29419208) * g_11(pixel.xy);
  result += mat4x4<f32>(-0.07577307, 0.030659143, 0.97284687, -0.09018963, 0.059575, 0.09799077, 0.065673314, 0.22537662, -0.0015259798, 0.24301144, -0.09336371, -0.14226802, -0.33286256, 0.027389184, -0.5026264, -0.15279126) * g_12(pixel.xy);
  result += mat4x4<f32>(0.14727022, -0.10878168, -0.1100343, 0.12144918, -0.03657926, -0.029442519, -0.0017414992, -0.2532462, 0.18112376, -0.058077507, 0.35388008, 0.32712713, 0.17805058, 0.13992003, 0.17930086, 0.39848652) * g_13(pixel.xy);
  result += mat4x4<f32>(-0.25576255, 0.18205768, 0.08984218, 0.10292959, -0.15820667, -0.090718776, 0.1579229, 0.43783715, 0.078025974, 0.21724561, -0.25238967, -0.23599494, -0.08510723, 0.17738545, 0.13962658, 0.16159406) * g_14(pixel.xy);
  result += mat4x4<f32>(-0.11219203, 0.075433955, -0.11129301, -0.09385265, 0.22908452, 0.051752828, -0.0993372, -0.2636262, 0.04221882, -0.37118244, -0.1460174, 0.11764387, 0.22468969, -0.197521, -0.13387764, 0.30982286) * g_15(pixel.xy);
  result += vec4f(0.0379655, 0.052258957, -0.017226165, -0.0132343555);
  textureStore(conv2d_3_tf3_tex, pixel.xy, result);
}
