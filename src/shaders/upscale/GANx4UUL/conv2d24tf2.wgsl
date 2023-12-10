// Layer: Anime4K-v4.1-Upscale-GAN-x4-(UUL)-Conv-4x1x1x120
// Name: conv2d24tf2
// Inputs: ['conv2d_21_tf', 'conv2d_21_tf1', 'conv2d_21_tf2', 'conv2d_21_tf3', 'conv2d_21_tf4', 'conv2d_21_tf5', 'conv2d_23_tf', 'conv2d_1_tf', 'conv2d_4_tf', 'conv2d_7_tf', 'conv2d_10_tf', 'conv2d_13_tf', 'conv2d_16_tf', 'conv2d_19_tf', 'conv2d_22_tf']
// Output: conv2d_24_tf2
@group(0) @binding(0) var conv2d_21_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_21_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_21_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_21_tf3_tex: texture_2d<f32>;
@group(0) @binding(4) var conv2d_21_tf4_tex: texture_2d<f32>;
@group(0) @binding(5) var conv2d_21_tf5_tex: texture_2d<f32>;
@group(0) @binding(6) var conv2d_23_tf_tex: texture_2d<f32>;
@group(0) @binding(7) var conv2d_1_tf_tex: texture_2d<f32>;
@group(0) @binding(8) var conv2d_4_tf_tex: texture_2d<f32>;
@group(0) @binding(9) var conv2d_7_tf_tex: texture_2d<f32>;
@group(0) @binding(10) var conv2d_10_tf_tex: texture_2d<f32>;
@group(0) @binding(11) var conv2d_13_tf_tex: texture_2d<f32>;
@group(0) @binding(12) var conv2d_16_tf_tex: texture_2d<f32>;
@group(0) @binding(13) var conv2d_19_tf_tex: texture_2d<f32>;
@group(0) @binding(14) var conv2d_22_tf_tex: texture_2d<f32>;
@group(0) @binding(15) var conv2d_24_tf2_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn g_0(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_21_tf_tex, pos, 0), 0.0);
}

fn g_1(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_21_tf1_tex, pos, 0), 0.0);
}

fn g_2(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_21_tf2_tex, pos, 0), 0.0);
}

fn g_3(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_21_tf3_tex, pos, 0), 0.0);
}

fn g_4(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_21_tf4_tex, pos, 0), 0.0);
}

fn g_5(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_21_tf5_tex, pos, 0), 0.0);
}

fn g_6(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_21_tf_tex, pos, 0), 0.0);
}

fn g_7(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_21_tf1_tex, pos, 0), 0.0);
}

fn g_8(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_21_tf2_tex, pos, 0), 0.0);
}

fn g_9(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_21_tf3_tex, pos, 0), 0.0);
}

fn g_10(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_21_tf4_tex, pos, 0), 0.0);
}

fn g_11(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_21_tf5_tex, pos, 0), 0.0);
}

fn g_12(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_23_tf_tex, pos, 0), 0.0);
}

fn g_13(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_23_tf_tex, pos, 0), 0.0);
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

fn g_28(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_22_tf_tex, pos, 0), 0.0);
}

fn g_29(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_22_tf_tex, pos, 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_24_tf2_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.092858694, -0.05931229, 0.08649155, -0.19388752, 0.09477594, -0.22718045, -0.1061536, -0.1075417, 0.070740245, -0.06802919, 0.011984387, 0.04561339, -0.123741224, 0.108184166, 0.08394222, -0.14939074) * g_0(pixel.xy);
  result += mat4x4<f32>(0.058254354, -0.0013696381, 0.016420096, -0.13577567, -0.08013081, -0.32121193, 0.10837322, -0.027337125, 0.006335759, -0.022232484, 0.08410539, -0.19057351, 0.124672756, 0.07544909, 0.25975785, -0.12386142) * g_1(pixel.xy);
  result += mat4x4<f32>(0.124638155, -0.047200475, 0.18284287, -0.066423684, -0.013056071, -0.10780445, -0.046076063, 0.16543722, 0.011813712, 0.18919142, -0.054241043, -0.14428662, -0.072056115, 0.22149223, 0.020946557, -0.19635367) * g_2(pixel.xy);
  result += mat4x4<f32>(-0.011655322, -0.02780763, -0.041065313, 0.07305037, 0.065463156, -0.055100318, 0.053504564, 0.12533133, 0.1791797, 0.07803201, 0.14791118, -0.17383428, -0.13258645, -0.057591084, -0.06590273, 0.24618948) * g_3(pixel.xy);
  result += mat4x4<f32>(-0.076750286, 0.16913669, -0.041372858, -0.04987621, -0.09025659, 0.04717571, 0.17061087, -0.0018001683, 0.088723816, -0.1515349, -0.09417965, 0.025807919, 0.10298056, -0.07137411, 0.0913601, -0.0032140615) * g_4(pixel.xy);
  result += mat4x4<f32>(0.076089844, -0.18487781, -0.031016396, 0.04298503, -0.07412648, -0.05946974, -0.029923726, -0.17263255, 0.044034805, 0.07122984, -0.022364214, -0.16337745, -0.3163445, 0.20027465, 0.006309955, -0.25441465) * g_5(pixel.xy);
  result += mat4x4<f32>(-0.05660039, -0.03776745, -0.062613666, 0.1953333, 0.027620526, -0.081940845, 0.13821705, -0.030160451, 0.30174896, -0.063806735, -0.21273777, -0.23096886, 0.028107658, -0.035367317, 0.06729705, 0.18349262) * g_6(pixel.xy);
  result += mat4x4<f32>(-0.024347452, -0.10386407, -0.0013563661, 0.09973845, 0.07293425, -0.04880119, -0.05229062, -0.18888217, 0.11884971, 0.05060733, -0.0013016739, 0.18116015, -0.038804606, 0.022207338, -0.043657467, 0.10695812) * g_7(pixel.xy);
  result += mat4x4<f32>(-0.16758966, 0.15170631, 0.12204208, 0.1287092, -0.032021195, -0.1063502, -0.08161841, -0.2446335, -0.02391331, -0.061028045, 0.13008249, 0.10459833, -0.04717144, 0.05381585, -0.33450723, 0.291269) * g_8(pixel.xy);
  result += mat4x4<f32>(0.07273305, 0.13187234, 0.04062448, 0.081797674, 0.00045577955, 0.09757571, -0.37391075, -0.17263971, 0.021420933, -0.07653126, 0.055799145, 0.04442693, 0.11818517, -0.044239108, 0.044269893, -0.41765675) * g_9(pixel.xy);
  result += mat4x4<f32>(0.018076504, -0.085451566, 0.09415942, 0.12273072, 0.41912425, -0.2747585, -0.07259103, 0.08299482, -0.20763668, 0.14662866, 0.026512189, -0.10415019, -0.09460718, 0.17926225, -0.1907316, -0.058848727) * g_10(pixel.xy);
  result += mat4x4<f32>(-0.13229714, 0.2401772, 0.08083883, 0.008972119, 0.090474635, 0.18910415, 0.14324625, 0.15242074, 0.16881411, -0.18706103, 0.1793161, -0.10074233, 0.2067493, -0.3289337, 0.13461551, 0.20269714) * g_11(pixel.xy);
  result += mat4x4<f32>(0.07219379, -0.11565219, 0.028837852, 0.26118317, -0.13906774, 0.10994847, 0.1192699, 0.097068354, -0.10574048, -0.010274859, -0.041781224, -0.0022481561, 0.12714253, -0.41399276, 0.19635102, -0.23090687) * g_12(pixel.xy);
  result += mat4x4<f32>(-0.100183904, -0.18720408, -0.13301018, 0.03502532, 0.031246057, -0.06721582, -0.17222083, -0.063806996, -0.08393857, -0.19553204, -0.05699341, -0.20882502, 0.048502672, -0.015325282, -0.14586648, 0.07136885) * g_13(pixel.xy);
  result += mat4x4<f32>(-0.09550682, -0.09559199, 0.0093339095, 0.20071933, -0.07908767, 0.19251561, -0.13115655, 0.0072511537, 0.14562629, -0.20998305, -0.2212794, 0.061366275, -0.10772557, 0.29247293, 0.25483248, -0.06853779) * g_14(pixel.xy);
  result += mat4x4<f32>(0.19130619, -0.08254158, -0.41616592, -0.12058406, 0.26799643, 0.018203866, 0.02795237, -0.026012532, -0.24163988, 0.27320904, 0.075838536, -0.43140167, 0.14748523, 0.2741325, 0.0313845, 0.0612638) * g_15(pixel.xy);
  result += mat4x4<f32>(0.32383236, -0.05585864, 0.087669775, -0.15189308, -0.07285363, -0.10978753, 0.038074855, -0.20369512, 0.0534748, 0.09033383, -0.3636552, 0.2022929, 0.1410257, 0.0006435122, 0.31075886, 0.09591187) * g_16(pixel.xy);
  result += mat4x4<f32>(-0.056077003, 0.22655378, -0.3908979, 0.3520772, 0.27514228, 0.028264234, -0.33393502, 0.12211863, -0.12077039, 0.3201821, 0.15064837, -0.2715489, 0.2161978, 0.2011329, -0.15005851, -0.19502445) * g_17(pixel.xy);
  result += mat4x4<f32>(-0.006493266, -0.067167185, 0.1981182, -0.2185078, -0.098532386, 0.0012275389, 0.014535081, 0.022241963, -0.065986834, -0.13995624, -0.08640626, -0.036836196, -0.24935777, -0.12563467, -0.22868343, -0.043145802) * g_18(pixel.xy);
  result += mat4x4<f32>(-0.24015582, -0.1428461, -0.10846771, -0.03822917, 0.25849542, 0.21787684, -0.10540706, -0.15437967, 0.09093761, 0.16064538, -0.040830817, 0.03802804, 0.07929484, 0.22184348, 0.17115451, -0.020434693) * g_19(pixel.xy);
  result += mat4x4<f32>(-0.16424751, 0.18149984, -0.08263852, 0.10497438, -0.0057385676, -0.18649873, 0.1049834, 0.0753644, 0.07605413, -0.024556413, 0.16013342, 0.006168524, 0.14073265, 0.02001347, -0.08537071, -0.24739261) * g_20(pixel.xy);
  result += mat4x4<f32>(0.014010803, -0.057850603, 0.0732021, -0.1718671, 0.024967216, 0.19706325, -0.14325745, -0.0021808648, -0.039533336, 0.058277003, -0.09344739, -0.004221897, 0.13857067, 0.081996195, 0.030180087, -0.013901144) * g_21(pixel.xy);
  result += mat4x4<f32>(0.024102923, 0.056380466, 0.008602807, 0.09951257, 0.04897817, 0.045386482, 0.13025592, -0.21351977, -0.11473196, 0.1844349, 0.07928108, 0.1533404, 0.07377011, -0.1464216, 0.096964546, -0.007197212) * g_22(pixel.xy);
  result += mat4x4<f32>(0.22597581, -0.13459527, 0.22883248, 0.14732298, -0.063105844, -0.034603957, -0.07247968, 0.19268765, 0.10675177, 0.0975782, 0.00033931955, 0.08774923, -0.12306441, 0.025208015, 0.04571016, 0.13542841) * g_23(pixel.xy);
  result += mat4x4<f32>(0.013317153, -0.09033908, 0.033545654, -0.054263383, 0.1317443, -0.05465494, -0.074301384, -0.30426916, -0.007050128, 0.12030467, -0.11348823, 0.19741662, -0.04095728, -0.017503742, 0.0642433, -0.28208658) * g_24(pixel.xy);
  result += mat4x4<f32>(0.02021165, 0.17795627, 0.043012455, 0.053738635, -0.017870188, 0.15490524, 0.040613562, 0.15851468, -0.12762383, 0.10450818, -0.0020172964, -0.25615835, -0.012736579, 0.06002046, -0.04626082, 0.019401643) * g_25(pixel.xy);
  result += mat4x4<f32>(-0.0025097467, -0.02072768, 0.034803562, -0.08400342, -0.14013165, 0.2091311, -0.03782157, 0.0023983517, 0.19771661, 0.04676574, -0.03392009, 0.20773077, 0.076976426, 0.04612587, 0.22233194, -0.13806564) * g_26(pixel.xy);
  result += mat4x4<f32>(-0.032217447, 0.073498376, -0.07565292, 0.05969695, 0.16941096, -0.3131595, 0.07141137, -0.15926841, 0.108835146, -0.0040562055, 0.15678787, -0.0012778786, -0.13674988, 0.034171615, -0.19931208, -0.13748777) * g_27(pixel.xy);
  result += mat4x4<f32>(-0.18563417, 0.106456436, 0.078709476, -0.1308007, -0.1398474, 0.11156628, -0.33099747, -0.19933923, -0.12798372, 0.04342623, 0.074146606, 0.21212427, 0.09915748, -0.09082417, 0.3366307, -0.23036873) * g_28(pixel.xy);
  result += mat4x4<f32>(0.14234035, -0.072425894, -0.18067764, 0.1100069, 0.10129257, 0.10165853, 0.18862309, -0.04466708, -0.037151866, 0.011230992, -0.013572791, 0.20083474, -0.18335798, 0.13396202, -0.2539405, 0.1323329) * g_29(pixel.xy);
  result += vec4f(-0.02703924, 0.18005958, -0.12375494, 0.031321514);
  textureStore(conv2d_24_tf2_tex, pixel.xy, result);
}
