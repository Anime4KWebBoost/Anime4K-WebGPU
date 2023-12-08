@group(0) @binding(0) var tex_in: texture_2d<f32>;
@group(0) @binding(1) var tex_out: texture_storage_2d<rgba16float, write>;

fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(tex_in, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_1(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(tex_in, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(tex_out);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }

  var result = mat4x4<f32>(-0.11283044, -0.013649477, -0.019421967, 0.006565143, 0.10823824, 0.19030023, 0.07156823, 0.024473488, -0.047083624, 0.06672259, 0.007229437, 0.011572557, 0.060731366, -0.041707586, -0.054455467, -0.06050326) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.39128456, 0.28495076, 0.16994765, -0.08431057, 0.32349753, 0.16350484, 0.32249597, -0.15476833, -0.0372553, -0.20726503, -0.07509582, -0.055866964, -0.26835552, -0.2888027, -0.25840938, 0.20359063) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.009564484, -0.12518948, -0.07402255, -0.0155140525, -0.055037342, 0.09893796, 0.17675622, 0.1404991, 0.04840018, 0.10003178, -0.122268006, 0.0066550495, -0.041109264, -0.083343655, -0.047279987, -0.057214934) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.087393224, -0.24262205, -0.14546157, 0.012720769, -0.26185998, -0.3492204, 0.087170415, 0.055508275, 0.112916835, -0.021071512, -0.08717399, 0.038901046, 0.07165449, -0.12182682, 0.034713216, -0.027062943) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.1938159, 0.02296587, -0.40469512, -0.08972523, -0.5214429, -0.24444413, -0.24784324, 0.024871845, 0.23072693, 0.07799527, 0.2761894, -0.05362061, 0.5237775, -0.34370264, 0.42938495, -0.0615884) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.25135922, 0.34398514, -0.13097152, 0.50502264, 0.06675731, -0.17853314, 0.015865749, -0.14499716, 0.01271855, -0.031905618, 0.090150066, 0.31696916, 0.0974942, 0.0604816, 0.0981407, -0.10030817) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.2942046, 0.3371821, 0.055784162, 0.28460097, 0.08670208, 0.30872712, 0.042119164, -0.19730645, -0.029366834, -0.079392135, -0.04880518, 0.045242663, 0.15900402, 0.09247392, 0.1781036, -0.082805544) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.23928781, 0.12516917, -0.06923645, 0.42036477, 0.041864343, -0.028095292, 0.05267187, 0.49764788, 0.0058747637, -0.092510335, -0.13487665, -0.02442822, 0.10546383, 0.012073766, 0.14021946, 0.1738348) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.22908622, -0.030520018, -0.037626877, -0.028545355, -0.04057567, -0.05031531, -0.07575728, -0.26082054, 0.005577125, 0.07140469, -0.035891753, -0.027718421, -0.055172723, -0.040569693, 0.036204822, -0.005853962) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.034226943, 0.16486132, 0.09011371, 0.022761948, 0.15949166, -0.08287511, 0.07277687, -0.17158747, 0.14110333, -0.20516108, -0.011551723, 0.051031575, -0.019465653, 0.17198224, 0.022128996, 0.07668109) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.17403072, 0.0877173, 0.076412074, -0.03931085, 0.18396425, 0.12625359, 0.044374563, -0.04681122, -0.4707356, -0.24832478, -0.37675288, 0.09399827, -0.059699435, -0.07279629, 0.10709204, -0.01452613) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.012287054, 0.043240163, 0.13432027, 0.016848277, -0.016251257, -0.04498773, -0.064520776, 0.032628447, 0.021948995, 0.08237686, 0.21542545, -0.025794316, -0.020522699, 0.060088117, 0.020946914, 0.010411652) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.071696386, -0.07662451, -0.007301545, 0.016705653, -0.09712441, -0.5909676, 0.025369452, -0.23310408, -0.09923453, 0.16598324, -0.15862101, 0.08138516, -0.04394261, -0.036927376, -0.14534806, 0.24659514) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.27326187, -0.44396913, 0.45290014, 0.11851251, 0.37091386, -0.40212852, -0.38454592, -0.27537692, -0.21460232, 0.63972193, -0.07988595, 0.07176707, -0.36231333, 0.041881774, 0.1238989, -0.04679531) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.013311633, -0.11264601, -0.000334869, -0.040406898, 0.16872448, -0.062339205, 0.033721007, -0.2167214, 0.090755336, 0.25688443, 0.049314357, 0.41296968, 0.028205669, -0.05258211, 0.06585726, 0.16326734) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.10017808, -0.048400078, 0.051791072, -0.010662406, 0.2781319, 0.00027611817, 0.046901092, -0.21505776, 0.03867316, 0.047448587, 0.09677218, 0.08187778, -0.25470436, 0.091234475, 0.03072702, 0.08450537) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.31911144, -0.19473487, -0.08755452, -0.22224784, 0.24446562, 0.24320345, 0.35516587, 0.30172288, -0.16882494, -0.29129937, -0.27510744, 0.03922657, -0.2550607, 0.32496977, 0.020911083, 0.34660512) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.106634595, -0.06650022, -0.03557048, -0.20013554, 0.059642687, -0.18237995, 0.045294486, -0.13069394, -0.17135487, -0.34176064, -0.2608333, -0.35861385, 0.0810206, 0.042578034, -0.038163207, 0.05271628) * go_1(pixel.xy, 1, 1);
  result += vec4f(0.03929918, 0.04986752, -0.032747284, -0.05262931);
  
  // Store the result
  textureStore(tex_out, vec2u(pixel.x, pixel.y), result);
}