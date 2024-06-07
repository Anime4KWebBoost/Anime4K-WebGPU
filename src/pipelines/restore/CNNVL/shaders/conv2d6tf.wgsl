// Layer: Anime4K-v4.0-Restore-CNN-(VL)-Conv-4x3x3x16
// Name: conv2d6tf
// Inputs: ['conv2d_5_tf', 'conv2d_5_tf1']
// Output: conv2d_6_tf
@group(0) @binding(0) var conv2d_5_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_5_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_6_tf_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_5_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_1(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_5_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_2(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_5_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_5_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_6_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.082203194, 0.021720003, 0.03725474, -0.08048348, 0.2063248, -0.033020593, -0.17585336, 0.06476272, 0.012244563, 0.026554609, 0.014708393, 0.26606125, 0.14248778, 0.12817341, -0.039826933, -0.12751861) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.24573852, 0.19695967, -0.06257417, -0.04782871, 0.3511875, -0.018083302, -0.077342674, 0.15247667, 0.20321761, -0.07479984, -0.09548503, 0.08109568, -0.23808748, 0.07246303, -0.004242619, 0.16162953) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.13296306, 0.19495387, 0.009222276, 0.033592198, 0.20443891, 0.16063854, -0.2581601, -0.016132578, -0.2296461, -0.23647323, -0.15407176, -0.18265317, 0.2343241, -0.049697313, -0.09398783, 0.41931856) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.10866088, -0.40605694, -0.0042648134, 0.07943803, 0.26914695, 0.14816476, 0.037706107, -0.123223364, -0.19962949, -0.053534556, -0.08397409, -0.04244924, -0.075791344, 0.29629225, 0.2311928, 0.099177904) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.1748319, -0.2003186, -0.32659066, -0.21007413, 0.20122464, 0.032196607, -0.026299698, 0.33395135, 0.11411664, 0.05971959, 0.09001304, -0.15936212, 0.012322024, 0.19936106, -0.411186, -0.08319479) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.07349218, 0.006184436, 0.096199185, -0.050186496, 0.064047046, -0.03813128, -0.057007037, -0.025550695, -0.2863145, -0.008512981, -0.20615962, 0.18009211, 0.008298396, 0.22452813, 0.010843521, 0.20169461) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.2691149, 0.059546687, 0.08922005, 0.2252196, 0.30341956, -0.024489028, 0.087045394, -0.03856442, -0.14083561, -0.17683443, 0.14137806, 0.15520614, 0.2073925, -0.19525874, 0.23661858, 0.3098405) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.006530723, 0.04180736, -0.04762067, -0.064395495, 0.02396811, -0.13332283, 0.0037775645, 0.026309434, 0.0033065109, -0.08315753, 0.02917419, 0.12330464, 0.22819455, -0.07489677, 0.12829056, -0.097994626) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.09983759, 0.032783493, 0.11085758, 0.08993078, -0.057110567, -0.018973934, -0.14946178, -0.03921629, 0.039757587, 0.015860094, 0.04989561, -0.19634786, 0.04351146, 0.019315343, 0.25972188, 0.17989321) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.04111906, -0.165601, 0.0003682197, -0.056232415, -0.32716644, -0.24015541, -0.057547837, 0.05966729, 0.06854747, 0.03599213, -0.18798864, 0.1183447, 0.014268468, -0.1310834, 0.06415977, -0.19414157) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.00070661673, 0.17671427, 0.10584568, -0.060910843, -0.104282066, -0.22676118, -0.01907062, 0.24882245, -0.043454725, 0.07691623, -0.48371696, 0.013537671, -0.025488405, 0.061228953, 0.18548754, 0.028671112) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.0121596735, 0.09595702, -0.08244918, -0.1176173, 0.26773354, -0.021729136, 0.075465776, -0.0928876, 0.12461298, 0.16830076, -0.15302569, 0.113850676, 0.09811088, 0.13006307, 0.24999009, 0.10261325) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.032246377, 0.038265374, -0.26476422, -0.1442876, -0.19866082, 0.08649541, 0.041478764, 0.11155026, 0.21576422, -0.09572912, -0.11174068, -0.19722937, -0.15801935, 0.29604745, -0.08606268, -0.15532136) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.06315591, 0.16151646, -0.009230362, -0.04341246, 0.09085519, 0.21924476, 0.38044852, 0.193819, 0.16622902, 0.0025134624, -0.22688466, -0.025276015, 0.07714917, 0.16302192, -0.11767101, -0.11086476) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.04170153, 0.001859292, -0.26352355, 0.10982333, -0.031867817, 0.15773517, -0.060263418, 0.11117763, -0.017359972, 0.0127261225, 0.0782802, -0.16908924, 0.080516845, -0.05691526, -0.07530135, -0.14553802) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.06112685, -0.032287434, 0.17445667, -0.044935808, -0.11449107, -0.051394563, -0.029589338, -0.14555557, 0.03440661, 0.11035615, -0.17175, -0.14851089, 0.037362, -0.18740481, 0.17278154, 0.18073405) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.27670652, 0.19484822, 0.2609349, 0.1455016, 0.04438468, 0.1449185, 0.11185832, -0.18598269, -0.019846648, 0.11886126, -0.098498635, 0.15737785, 0.011406795, -0.18860829, -0.13705735, 0.17535745) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.30244905, -0.28695273, 0.1146976, 0.21144345, -0.037980128, -0.027679864, -0.13992494, -0.04884521, -0.032023884, -0.07921183, -0.16042095, -0.06935386, -0.06570237, -0.1107404, -0.018163798, 0.22625941) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.07292955, -0.07321777, -0.045146503, -0.33291966, -0.096732594, -0.07203495, 0.33692798, 0.2870733, 0.122160144, -0.076574564, 0.042844944, 0.26448342, 0.07672146, -0.028775277, -0.12088313, 0.15583947) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.21589327, 0.05258274, 0.09705794, -0.024653846, -0.039402515, 0.28485695, 0.14711736, -0.10556087, -0.15140481, 0.09039498, 0.017308712, 0.11862922, 0.08230978, 0.21678248, -0.043815188, -0.226433) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.029258793, 0.26618922, 0.02564014, -0.23189862, -0.24074338, -0.18556763, 0.25973624, 0.04746873, 0.0137007125, -0.22239363, -0.12414957, 0.048228756, -0.22406264, 0.282667, -0.021001073, -0.17465611) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.32401654, -0.1495363, -0.20869227, 0.04271639, -0.0087802755, 0.031325378, 0.23834595, 0.039336167, 0.17265107, 0.20947595, 0.28737286, 0.0028783784, -0.057340365, -0.050347418, -0.11915604, -0.1831807) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.1811338, 0.07732653, 0.20975596, -0.47129005, 0.07121942, 0.08410583, 0.44170937, -0.19524159, -0.17807977, 0.12837476, 0.20816846, -0.1741958, -0.04411918, 0.06024972, 0.18159702, -0.052485272) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.15229738, 0.27513, 0.28150418, -0.19543962, -0.02045864, -0.07207227, 0.09589587, 0.09110817, 0.061413247, 0.0046052113, 0.11619411, -0.2988938, 0.065739445, 0.10205611, 0.12847126, -0.028355654) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.0657154, -0.047568597, -0.16148911, 0.16392621, -0.25281775, -0.061153214, 0.017480455, -0.026288848, 0.20319715, 0.04763355, 0.010444491, -0.26671803, -0.25821987, 0.32863674, -0.30734694, -0.18190521) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.042703815, 0.06633036, -0.048434302, -0.17176376, -0.12699759, -0.1124558, 0.083266065, 0.03354623, -0.13468939, 0.12706263, 0.053659134, -0.06930602, 0.008196115, 0.2034998, -0.06351442, -0.039730288) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.09614661, 0.22500272, 0.088511504, -0.16960482, 0.15364788, -0.18854137, -0.13163191, -0.07503735, -0.23177068, -0.0053305267, -0.041978605, 0.0971947, -0.049034655, 0.04486706, 0.09076307, -0.02310868) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.1304683, 0.17743458, -0.09817326, -0.0646786, 0.07886976, 0.20109388, -0.034114968, -0.2029261, -0.03348398, 0.029337432, -0.07302782, -0.02240758, 0.030242773, -0.30032325, 0.02085572, -0.027314361) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.037377544, 0.026350772, -0.07430488, -0.114671774, -0.126935, -0.046512567, -0.033628833, -0.19018382, -0.041053895, -0.031206857, 0.08562848, -0.01875709, 0.21099389, -0.092511, 0.0073047103, -0.009811013) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.11358029, 0.17468451, -0.12739041, -0.14332245, -0.22230148, 0.16862972, -0.04462456, 0.2469604, -0.008622369, 0.0081848325, -0.17032363, -0.16024362, 0.21178265, 0.037127133, 0.08559072, 0.11584694) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.008993893, -0.08037705, 0.4426555, 0.15593371, 0.15273719, -0.03249998, 0.055109, -0.1512612, -0.037183985, 0.20825677, -0.08516227, -0.06664223, -0.10011001, -0.3505215, -0.17941694, 0.052089088) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.109703645, -0.13505603, 0.1336451, 0.13118869, 0.010915504, 0.12748592, 0.21201555, -0.40841985, -0.11059143, 0.033772044, -0.039282143, 0.03095394, 0.10394723, -0.21343367, -0.10699851, -0.028351074) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.019704714, 0.06243651, 0.09896519, -0.17492259, 0.012675787, -0.004239029, 0.21319824, 0.069183126, -0.0071114586, 0.123431124, -0.24479835, 0.00723795, -0.045293927, 0.014101029, 0.15746681, 0.042405806) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.023828225, -0.0015190929, 0.1194638, 0.082163885, 0.10532113, 0.042044062, 0.02528007, 0.015175004, 0.026613194, 0.33525538, -0.1627064, -0.29887968, -0.197707, 0.038967777, -0.15811683, -0.106895216) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.044362027, -0.04946742, -0.14815849, -0.17660522, -0.034201477, -0.012243106, -0.050183997, 0.06407372, 0.039822515, 0.15880872, -0.0672721, -0.4081093, 0.019489579, -0.060278706, -0.015096743, -0.07799167) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.11861756, 0.27113584, -0.14107186, -0.10246008, -0.124051, -0.1627854, 0.10698585, 0.2846401, -0.061731786, 0.1724438, -0.12428688, -0.09986041, -0.034171514, -0.07100923, 0.041739646, -0.11308375) * go_3(pixel.xy, 1, 1);
  result += vec4f(-0.02981662, -0.26338395, -0.011632586, 0.15063232);
  textureStore(conv2d_6_tf_tex, pixel.xy, result);
}
