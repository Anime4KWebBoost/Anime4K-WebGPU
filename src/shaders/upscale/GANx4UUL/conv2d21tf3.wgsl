// Layer: Anime4K-v4.1-Upscale-GAN-x4-(UUL)-Conv-4x1x1x112
// Name: conv2d21tf3
// Inputs: ['conv2d_18_tf', 'conv2d_18_tf1', 'conv2d_18_tf2', 'conv2d_18_tf3', 'conv2d_18_tf4', 'conv2d_18_tf5', 'conv2d_20_tf', 'conv2d_1_tf', 'conv2d_4_tf', 'conv2d_7_tf', 'conv2d_10_tf', 'conv2d_13_tf', 'conv2d_16_tf', 'conv2d_19_tf']
// Output: conv2d_21_tf3
@group(0) @binding(0) var conv2d_18_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_18_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_18_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_18_tf3_tex: texture_2d<f32>;
@group(0) @binding(4) var conv2d_18_tf4_tex: texture_2d<f32>;
@group(0) @binding(5) var conv2d_18_tf5_tex: texture_2d<f32>;
@group(0) @binding(6) var conv2d_20_tf_tex: texture_2d<f32>;
@group(0) @binding(7) var conv2d_1_tf_tex: texture_2d<f32>;
@group(0) @binding(8) var conv2d_4_tf_tex: texture_2d<f32>;
@group(0) @binding(9) var conv2d_7_tf_tex: texture_2d<f32>;
@group(0) @binding(10) var conv2d_10_tf_tex: texture_2d<f32>;
@group(0) @binding(11) var conv2d_13_tf_tex: texture_2d<f32>;
@group(0) @binding(12) var conv2d_16_tf_tex: texture_2d<f32>;
@group(0) @binding(13) var conv2d_19_tf_tex: texture_2d<f32>;
@group(0) @binding(14) var conv2d_21_tf3_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn g_0(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_18_tf_tex, pos, 0), 0.0);
}

fn g_1(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_18_tf1_tex, pos, 0), 0.0);
}

fn g_2(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_18_tf2_tex, pos, 0), 0.0);
}

fn g_3(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_18_tf3_tex, pos, 0), 0.0);
}

fn g_4(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_18_tf4_tex, pos, 0), 0.0);
}

fn g_5(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_18_tf5_tex, pos, 0), 0.0);
}

fn g_6(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_18_tf_tex, pos, 0), 0.0);
}

fn g_7(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_18_tf1_tex, pos, 0), 0.0);
}

fn g_8(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_18_tf2_tex, pos, 0), 0.0);
}

fn g_9(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_18_tf3_tex, pos, 0), 0.0);
}

fn g_10(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_18_tf4_tex, pos, 0), 0.0);
}

fn g_11(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_18_tf5_tex, pos, 0), 0.0);
}

fn g_12(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_20_tf_tex, pos, 0), 0.0);
}

fn g_13(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_20_tf_tex, pos, 0), 0.0);
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

fn g_18(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_7_tf_tex, pos, 0), 0.0);
}

fn g_19(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_7_tf_tex, pos, 0), 0.0);
}

fn g_20(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_10_tf_tex, pos, 0), 0.0);
}

fn g_21(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_10_tf_tex, pos, 0), 0.0);
}

fn g_22(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_13_tf_tex, pos, 0), 0.0);
}

fn g_23(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_13_tf_tex, pos, 0), 0.0);
}

fn g_24(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_16_tf_tex, pos, 0), 0.0);
}

fn g_25(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_16_tf_tex, pos, 0), 0.0);
}

fn g_26(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_19_tf_tex, pos, 0), 0.0);
}

fn g_27(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_19_tf_tex, pos, 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_21_tf3_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.27637494, -0.09202861, -0.013164199, 0.08635429, 0.17066719, -0.25856876, 0.21184374, 0.25718108, -0.010693248, 0.032534968, -0.11440128, 0.067054555, 0.11179264, 0.08019385, 0.23691481, -0.053950187) * g_0(pixel.xy);
  result += mat4x4<f32>(0.012882109, 0.009293086, -0.0044346075, -0.0714009, 0.029489582, -0.11504061, 0.03372462, -0.20672967, 0.15053481, -0.018392192, -0.06602698, 0.3127282, -0.24036115, -0.121481776, 0.12850977, 0.058103368) * g_1(pixel.xy);
  result += mat4x4<f32>(-0.050445788, -0.13086995, 0.20903488, 0.123742394, 0.09780855, -0.01923089, -0.045269296, -0.14616507, 0.07690958, -0.26648474, -0.15403363, -0.14023678, -0.13179739, -0.11994684, 0.04328696, -0.16206603) * g_2(pixel.xy);
  result += mat4x4<f32>(0.0070284703, -0.11008815, -0.033269413, 0.19520764, -0.05634523, 0.11478342, 0.11389925, 0.16536203, 0.11200762, 0.07183994, 0.082404666, -0.045550685, 0.090172336, 0.15882301, -0.15579398, -0.010974849) * g_3(pixel.xy);
  result += mat4x4<f32>(0.29888794, -0.04338136, -0.054024898, -0.065943204, 0.016578928, 0.13387626, 0.19995537, -0.06902794, -0.1228455, 0.09062401, -0.16335657, 0.124492906, 0.13940965, -0.0930729, -0.019122176, -0.047092684) * g_4(pixel.xy);
  result += mat4x4<f32>(-0.17353038, -0.08980729, 0.05186378, 0.2782951, 0.04332866, -0.11484402, -0.13268284, 0.027477333, -0.09025209, -0.068026, 0.10645471, 0.010281115, 0.09622472, 0.060582876, -0.119002, -0.03843858) * g_5(pixel.xy);
  result += mat4x4<f32>(0.081018515, 0.160742, -0.108766116, -0.116166, -0.16662684, 0.045554698, 0.08607165, -0.108419865, -0.09143582, 0.19082823, 0.17698412, 0.07523821, -0.23612066, 0.02125469, -0.20589912, -0.04471549) * g_6(pixel.xy);
  result += mat4x4<f32>(0.007816593, 0.020379778, 0.06805535, 0.12345075, -0.1312113, 0.12551896, 0.10769008, 0.17810847, -0.20936163, -0.07681444, 0.10576635, -0.018500412, -0.12731677, -0.05931048, -0.008639975, -0.012557444) * g_7(pixel.xy);
  result += mat4x4<f32>(0.13184534, 0.2300916, -0.035759542, -0.11864276, -0.016759377, 0.0085068075, 0.020116294, 0.31680855, -0.07957325, 0.02108995, 0.04680425, -0.118219934, 0.12604867, -0.14069289, -0.1492076, -0.039757684) * g_8(pixel.xy);
  result += mat4x4<f32>(0.08435497, 0.08196142, -0.12370443, 0.17140263, 0.041375875, 0.0528549, -0.12367111, 0.22431542, -0.15647502, 0.23635507, -0.2558316, -0.035816293, -0.16943988, -0.03469032, 0.22173174, 0.35301638) * g_9(pixel.xy);
  result += mat4x4<f32>(0.10042114, 0.020310592, 0.12793465, 0.0505798, -0.030926188, -0.014382752, -0.1866182, 0.092339404, -0.34906712, -0.17414862, 0.11467679, -0.060113996, -0.18255027, 0.15265243, -0.058513764, 0.044470858) * g_10(pixel.xy);
  result += mat4x4<f32>(-0.109998055, -0.18857343, -0.06519679, -0.21169643, 0.17275392, 0.043956056, 0.19097583, -0.3453861, -0.20140389, -0.028911674, 0.051200256, -0.16441494, 0.09052695, -0.025728669, 0.12978639, -0.030866198) * g_11(pixel.xy);
  result += mat4x4<f32>(0.3553382, 0.2713839, -0.063492395, 0.17018923, -0.20084976, -0.20268555, 0.028258773, 0.25153455, -0.060663003, 0.030043183, -0.017477257, -0.2802546, -0.19472873, 0.030090192, -0.13361697, -0.096709855) * g_12(pixel.xy);
  result += mat4x4<f32>(-0.08196468, -0.059696443, -0.10413434, 0.15610062, 0.04612939, 0.033440653, 0.009418265, -0.11447027, 0.15325724, 0.05303549, 0.18088095, -0.18435246, 0.096069425, 0.1487366, 0.028163021, 0.033102416) * g_13(pixel.xy);
  result += mat4x4<f32>(0.12193662, 0.0070974063, 0.022380063, 0.01845218, 0.097900495, -0.10072656, -0.07087849, 0.1097737, 0.088353686, 0.117824815, 0.07981943, -0.058600288, -0.14337316, 0.23042083, 0.09003819, 0.15992849) * g_14(pixel.xy);
  result += mat4x4<f32>(-0.25127304, -0.13614081, -0.09878849, -0.019283785, -0.01723998, 0.19221759, 0.08611807, -0.057227675, -0.2849749, -0.106312715, 0.0721729, 0.09183881, -0.23607177, -0.14219683, 0.05553008, 0.08371223) * g_15(pixel.xy);
  result += mat4x4<f32>(0.18445374, 0.2633628, 0.023699492, -0.055874832, -0.21317463, 0.15699029, 0.06470851, 0.3203727, 0.012689787, 0.04068801, -0.0362694, -0.08463872, 0.022032904, 0.36295962, 0.40498146, 0.27317238) * g_16(pixel.xy);
  result += mat4x4<f32>(0.124197744, -0.21850279, 0.15408973, -0.26874685, -0.059596032, -0.078130245, 0.05881263, 0.21196629, -0.068842866, 0.009358261, -0.11701211, -0.1040061, -0.14287138, -0.37897316, -0.14483643, -0.21824312) * g_17(pixel.xy);
  result += mat4x4<f32>(-0.08589939, -0.075192496, 0.030483527, -0.06450602, -0.012149392, 0.17978314, 0.15634626, -0.2836322, 0.14882863, 0.10502833, -0.16009775, -0.10486963, 0.037842657, -0.038362924, -0.22343613, 0.101130985) * g_18(pixel.xy);
  result += mat4x4<f32>(-0.013563463, -0.024395624, -0.12761684, -0.09748699, -0.089499116, -0.08085164, 0.058557037, 0.13672954, -0.118551984, -0.13629481, 0.094393395, 0.029314406, -0.080707505, -0.038193874, 0.13417166, -0.02425689) * g_19(pixel.xy);
  result += mat4x4<f32>(-0.17519292, -0.10705887, 0.20562781, 0.010688353, -0.020396186, 0.14856702, -0.07595417, 0.10375755, -0.15135598, -0.05276549, -0.14925396, -0.019424599, 0.06944723, 0.16936864, 0.100991525, -0.0070587527) * g_20(pixel.xy);
  result += mat4x4<f32>(-0.09268212, 0.06558073, -0.28194323, 0.08364666, -0.02612452, 0.054087568, 0.14668237, 0.115088925, 0.04907736, -0.121807694, 0.28625855, 0.07017234, 0.11742178, 0.014940573, -0.0030790027, 0.09556736) * g_21(pixel.xy);
  result += mat4x4<f32>(-0.2570902, 0.09647556, 0.15780881, 0.08517732, -0.07699583, -0.026643768, -0.09048383, 0.047831554, 0.19601518, -0.14882582, -0.12081898, -0.21000117, 0.22658183, 0.32082006, -0.06317293, -0.07006582) * g_22(pixel.xy);
  result += mat4x4<f32>(0.1865291, -0.07663154, -0.07021094, -0.07830695, 0.076760985, -0.10160548, 0.16065563, -0.10210155, -0.13542733, -0.023234889, 0.10826387, 0.2707354, -0.07200074, -0.019201742, -0.045061752, -0.15168877) * g_23(pixel.xy);
  result += mat4x4<f32>(0.00804967, -0.14787929, 0.009206717, -0.021477034, -0.084476404, -0.015345305, -0.13645084, 0.17224337, 0.16686128, -0.012185714, 0.15809548, -0.18986331, 0.1008467, 0.04329404, -0.22691965, -0.0038823795) * g_24(pixel.xy);
  result += mat4x4<f32>(0.15417027, -0.06945452, -0.20023187, -0.067604445, -0.036015324, -0.053225037, 0.075553775, -0.031289067, -0.10324133, -0.22750708, -0.0687051, 0.2233988, -0.032612424, -0.14323196, 0.21441486, 0.12729624) * g_25(pixel.xy);
  result += mat4x4<f32>(-0.07149902, 0.26289824, 0.17770901, 0.005413293, 0.08461791, -0.12599528, 0.21661244, 0.1305935, 0.16592002, 0.100489244, 0.06736797, -0.21842687, 0.22388805, -0.017664155, 0.21695323, -0.108672984) * g_26(pixel.xy);
  result += mat4x4<f32>(-0.03011306, -0.12135366, 0.1701224, -0.069647305, -0.21244405, 0.16653134, -0.116377264, 0.28703618, -0.06256598, -0.4135873, 0.12806, 0.38643956, -0.29591087, 0.14771672, -0.085469425, 0.07862257) * g_27(pixel.xy);
  result += vec4f(0.031112298, -0.004619042, 0.06137103, -0.028557438);
  textureStore(conv2d_21_tf3_tex, pixel.xy, result);
}