// Layer: Anime4K-v4.1-Upscale-GAN-x4-(UUL)-Conv-4x1x1x72
// Name: conv2d6tf2
// Inputs: ['conv2d_3_tf', 'conv2d_3_tf1', 'conv2d_3_tf2', 'conv2d_3_tf3', 'conv2d_3_tf4', 'conv2d_3_tf5', 'conv2d_5_tf', 'conv2d_1_tf', 'conv2d_4_tf']
// Output: conv2d_6_tf2
@group(0) @binding(0) var conv2d_3_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_3_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_3_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_3_tf3_tex: texture_2d<f32>;
@group(0) @binding(4) var conv2d_3_tf4_tex: texture_2d<f32>;
@group(0) @binding(5) var conv2d_3_tf5_tex: texture_2d<f32>;
@group(0) @binding(6) var conv2d_5_tf_tex: texture_2d<f32>;
@group(0) @binding(7) var conv2d_1_tf_tex: texture_2d<f32>;
@group(0) @binding(8) var conv2d_4_tf_tex: texture_2d<f32>;
@group(0) @binding(9) var conv2d_6_tf2_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn g_0(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_3_tf_tex, pos, 0), 0.0);
}

fn g_1(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_3_tf1_tex, pos, 0), 0.0);
}

fn g_2(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_3_tf2_tex, pos, 0), 0.0);
}

fn g_3(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_3_tf3_tex, pos, 0), 0.0);
}

fn g_4(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_3_tf4_tex, pos, 0), 0.0);
}

fn g_5(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_3_tf5_tex, pos, 0), 0.0);
}

fn g_6(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf_tex, pos, 0), 0.0);
}

fn g_7(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf1_tex, pos, 0), 0.0);
}

fn g_8(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf2_tex, pos, 0), 0.0);
}

fn g_9(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf3_tex, pos, 0), 0.0);
}

fn g_10(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf4_tex, pos, 0), 0.0);
}

fn g_11(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf5_tex, pos, 0), 0.0);
}

fn g_12(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_5_tf_tex, pos, 0), 0.0);
}

fn g_13(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_5_tf_tex, pos, 0), 0.0);
}

fn g_14(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_1_tf_tex, pos, 0), 0.0);
}

fn g_15(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_1_tf_tex, pos, 0), 0.0);
}

fn g_16(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_4_tf_tex, pos, 0), 0.0);
}

fn g_17(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_4_tf_tex, pos, 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_6_tf2_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(0.2198397, 0.07474122, 0.25085604, -0.16841322, -0.018095493, -0.100231275, 0.12683615, -0.12938105, 0.16326998, -0.34271434, -0.0143025955, -0.10391288, -0.09107246, 0.13806722, -0.011419862, 0.19981647) * g_0(pixel.xy);
  result += mat4x4<f32>(-0.0316539, -0.25519773, -0.1209305, -0.06143041, 0.05174701, -0.19147594, 0.11087807, -0.06532573, -0.2013948, -0.14687414, 0.0901586, 0.27443606, -0.14269981, 0.22332881, -0.23509043, 0.2060809) * g_1(pixel.xy);
  result += mat4x4<f32>(0.109063365, 0.052561738, 0.08149706, 0.019311855, 0.089754134, -0.044553958, -0.1007105, 0.0009892394, -0.09903347, -0.28857565, 0.30435443, 0.0015787942, -0.41297057, -0.22761044, -0.01780215, -0.062698446) * g_2(pixel.xy);
  result += mat4x4<f32>(-0.01552362, 0.2901384, 0.1680081, -0.17513134, -0.06897878, 0.17592743, -0.43503913, -0.04596621, 0.012619745, -0.21403605, -0.16948934, -0.06996391, -0.29766196, 0.12116802, -0.048980057, 0.22243607) * g_3(pixel.xy);
  result += mat4x4<f32>(0.24363546, 0.3689805, -0.21884279, 0.3818604, -0.16839428, -0.0556417, -0.12723716, 0.1746213, -0.19730906, 0.1479734, 0.11733126, 0.018830176, 0.049721003, -0.0035500277, -0.17519367, -0.2499017) * g_4(pixel.xy);
  result += mat4x4<f32>(0.041031633, -0.24796546, 0.09606645, 0.0395995, 0.42594504, 0.067137666, -0.14129956, -0.05022722, 0.25581697, 0.08863704, 0.16423233, -0.33918852, -0.19086458, 0.15642363, -0.0023126223, -0.2951177) * g_5(pixel.xy);
  result += mat4x4<f32>(-0.23185489, -0.08386336, -0.07150133, 0.13777092, -0.14072278, 0.02838937, -0.042908818, 0.025783628, -0.11648161, 0.19068946, -0.07160502, 0.09172534, 0.24410047, -0.060724117, -0.17257373, -0.1972248) * g_6(pixel.xy);
  result += mat4x4<f32>(-0.0072582318, -0.011030204, 0.048395652, 0.10914101, -0.15400207, 0.20606099, -0.11960791, 0.24877293, 0.17356429, -0.082197405, -0.010170127, -0.031832773, -0.033288233, -0.20086886, 0.27148035, -0.012432371) * g_7(pixel.xy);
  result += mat4x4<f32>(-0.29836038, 0.0151038375, 0.21195093, 0.13568489, -0.14903903, -0.086146735, 0.021210156, 0.18356802, 0.19766386, 0.32297, -0.14609253, 0.04741111, 0.15015276, -0.24872275, 0.10544547, 0.079276256) * g_8(pixel.xy);
  result += mat4x4<f32>(-0.4609224, 0.00049777416, -0.1300821, 0.10355109, 0.1587039, -0.007964796, -0.053031847, -0.08619027, 0.071805984, 0.29670206, -0.03566753, -0.2677423, 0.0313238, 0.09650806, 0.12557615, -0.41598156) * g_9(pixel.xy);
  result += mat4x4<f32>(-0.28125992, -0.21541679, 0.25341314, -0.08868869, 0.16403335, 0.31890368, 0.1563854, -0.2924655, 0.31608266, 0.11475146, -0.14041825, 0.08089581, 0.22312473, 0.09776039, 0.21496448, 0.09443975) * g_10(pixel.xy);
  result += mat4x4<f32>(0.39393064, 0.29192236, -0.3070681, -0.25582662, -0.34292933, 0.3159496, -0.27226242, 0.08320266, -0.06314073, 0.10564044, -0.13292909, 0.18393274, 0.18127939, 0.22060028, 0.1666197, -0.043861568) * g_11(pixel.xy);
  result += mat4x4<f32>(0.25017107, -0.026370317, 0.13043208, -0.18787016, -0.2924086, -0.38265043, 0.07511309, -0.035600156, 0.05386576, -0.10529828, -0.1958516, -0.0059428713, -0.117195666, 0.050320167, 0.127351, 0.028612586) * g_12(pixel.xy);
  result += mat4x4<f32>(-0.45573857, -0.20206647, -0.30226526, -0.21770813, 0.063414164, 0.25145012, 0.012881708, -0.2445157, 0.022737922, -0.1239582, 0.009450774, -0.17895594, -0.064821586, 0.0061988737, -0.13174036, 0.045387045) * g_13(pixel.xy);
  result += mat4x4<f32>(0.16634953, 0.30238214, -0.14754951, -0.007021737, -0.26485208, 0.19425714, -0.01118022, -0.1616703, -0.011515406, 0.123444855, -0.15848742, -0.124876305, 0.067033015, 0.031733245, -0.24944969, -0.19156238) * g_14(pixel.xy);
  result += mat4x4<f32>(-0.25266653, -0.019663328, 0.2661182, -0.015626933, -0.012707616, -0.118515946, 0.14260185, 0.0751291, 0.23328146, 0.15651625, 0.34605113, 0.07489629, -0.16263823, 0.017182954, 0.5533502, 0.13305502) * g_15(pixel.xy);
  result += mat4x4<f32>(-0.097454436, 0.030718658, 0.14785567, -0.097030275, -0.013122067, -0.083220206, -0.050912652, -0.023857877, 0.080882534, 0.37543672, -0.01784633, -0.16073057, -0.26875043, -0.22118908, 0.1596688, 0.09931549) * g_16(pixel.xy);
  result += mat4x4<f32>(-0.0035172352, -0.094074495, -0.18603468, 0.051569406, 0.113153726, -0.24173748, 0.00024355631, -0.13451214, 0.09677065, -0.24573214, 0.117040165, 0.20340551, -0.49295896, 0.32970372, -0.07180111, 0.13000454) * g_17(pixel.xy);
  result += vec4f(0.05127727, -0.027001878, 0.0080799395, 0.050219692);
  textureStore(conv2d_6_tf2_tex, pixel.xy, result);
}
