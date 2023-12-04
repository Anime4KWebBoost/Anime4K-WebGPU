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

  var result = mat4x4<f32>(-0.084394485, 0.016493073, 0.016797146, -0.0053561246, 0.053920858, 0.01573839, 0.052421916, -0.027108151, 0.14107837, -0.06431044, -0.06964066, -0.067688584, -0.104633816, 0.02696463, 0.13619483, -0.0029869801) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.0046778396, -0.011591918, 0.06420322, -0.023565795, 0.049672235, -0.009634769, -0.22492595, 0.09164804, -0.2790692, 0.117682606, 0.18726623, 0.07687261, -0.12465192, 0.03142656, 0.18775102, 0.091342464) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.113580845, -0.017467966, 0.016541954, -0.024166046, 0.18918575, -0.034905262, -0.11024242, -0.13085513, -0.17789307, 0.041150704, 0.268339, 0.25922203, 0.09019094, -0.062000286, 0.11462383, -0.07963925) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.3258164, -0.12108431, -0.31655976, -0.070432335, -0.11392292, 0.058203746, 0.1333354, -0.06024274, 0.022118362, 0.0817773, -0.15476245, 0.27508014, -0.06412502, -0.036618974, 0.032069776, -0.03686787) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.6528506, -0.030277515, -0.5588472, -0.04408157, 0.093097635, 0.38286957, 0.51352715, -0.23801436, -0.24588928, -0.72285944, -0.14402243, 0.44834173, -0.0668237, -0.20662913, 0.60910714, -0.016656926) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.18700771, -0.06432143, -0.1335317, 0.07824519, 0.07244991, 0.13448672, -0.07946187, 0.086320214, 0.63916326, 0.30472332, -0.028304817, 0.16940933, -0.1510297, -0.20419174, 0.08564124, -0.11302102) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.04591939, 0.11538493, 0.1522626, 0.08873703, 0.00091377087, -0.12730649, -0.011363399, 0.03729583, 0.024664454, 0.10566429, 0.09240334, 0.077509366, 0.09602506, -0.017290076, -0.122802496, 0.026897771) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.012308567, 0.17486034, 0.095571116, -0.004873663, -0.26773053, -0.12069487, 0.00240376, 0.21224426, 0.09590006, -0.07113762, 0.49553472, -0.70697355, 0.1082898, -0.40515184, -0.19816537, 0.033929355) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.012107104, 0.05848574, 0.038235698, -0.054012705, 0.0047617727, -8.0178164e-05, 0.14021727, 0.09106305, -0.018121002, 0.06846601, -0.0602399, -0.15124476, -0.12827854, -0.12092974, 0.03620283, 0.22423702) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.047554135, 0.013713998, -0.19877706, 0.20493634, 0.11640787, -0.07232803, -0.14646003, -0.006013356, -0.011176427, 0.032947335, 0.077004775, -0.03560033, 0.024175053, -0.03007514, -0.12503828, 0.0176204) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.35598892, -0.129132, -0.16694455, -0.20155169, -0.2970762, 0.005555552, 0.3451364, -0.017626438, 0.11259827, 0.011302529, -0.07223299, 0.0041388487, 0.1399206, -0.03988847, -0.116156444, -0.07081249) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.047312055, -0.07309245, 0.037772585, 0.020345727, -0.11299656, 0.036599513, 0.049321774, 0.11437634, -0.056323104, -0.061282735, -0.020636894, -0.0721359, -0.016392289, 0.040534876, -0.07898183, 0.07670411) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.01614528, -0.010428739, 0.07363855, 0.31304735, 0.020175518, 0.025360018, -0.15698072, 0.18748625, -0.19403012, 0.00050825306, 0.23111546, -0.027805353, 0.032027993, 0.08388896, 0.011589746, -0.03743963) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.6464231, -0.4745039, 0.16213289, 0.10013217, -0.15123008, -0.8054472, -0.36683777, 0.31472555, -0.096195586, 0.48154506, 0.62508005, -0.21204728, 0.31178978, 0.18453065, -0.5653493, -0.007459248) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.37288693, 0.09701015, 0.11216748, 0.016230293, -0.027019959, 0.05083335, -0.027923055, 0.020143913, 0.39570096, -0.18937685, -0.014264976, -0.031576872, -0.28692764, 0.14014132, 0.027101377, 0.079557866) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.04016008, -0.02177852, -0.039032266, 0.012764097, 0.026319377, 0.100706704, 0.031527523, -0.026600633, -0.017820677, -0.1284909, -0.14268431, 0.03965332, -0.088624984, 0.058060996, 0.06361163, 0.055537306) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.22145456, -0.3484864, -0.085450985, 0.07435331, 0.2935538, 0.14172246, -0.039141074, -0.20678422, -0.10138657, -0.263434, -0.13958192, 0.23467793, 0.15134631, 0.11852304, 0.19699298, -0.13204712) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.1563562, -0.0050778976, -0.2500995, -0.048066173, 0.1618367, -0.0677695, -0.05582334, -0.100746006, -0.320929, -0.0010358171, -0.018679567, 0.28365892, 0.20668015, 0.17990084, 0.081409745, -0.15907615) * go_1(pixel.xy, 1, 1);
  result += vec4f(-0.088332005, -0.030688623, 0.0075079403, 0.00037059895);
    
  // Store the result
  textureStore(tex_out, vec2u(pixel.x, pixel.y), result);
}
