// Layer: Anime4K-v4.1-Upscale-GAN-x4-(UUL)-Conv-4x3x3x48
// Name: conv2d4tf
// Inputs: ['conv2d_3_tf', 'conv2d_3_tf1', 'conv2d_3_tf2', 'conv2d_3_tf3', 'conv2d_3_tf4', 'conv2d_3_tf5']
// Output: conv2d_4_tf
@group(0) @binding(0) var conv2d_3_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_3_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_3_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_3_tf3_tex: texture_2d<f32>;
@group(0) @binding(4) var conv2d_3_tf4_tex: texture_2d<f32>;
@group(0) @binding(5) var conv2d_3_tf5_tex: texture_2d<f32>;
@group(0) @binding(6) var conv2d_4_tf_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_3_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_1(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_3_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_2(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_3_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_3_tf3_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_4(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_3_tf4_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_5(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_3_tf5_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_6(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_7(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_8(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_9(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf3_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_10(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf4_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_11(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf5_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_4_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.16133928, -0.006756952, 0.13545449, 0.07060866, -0.16981398, -0.106657766, 0.022805378, -0.0035351648, 0.038761076, 0.058264326, 0.16199178, -0.06511896, -0.17973545, -0.09506077, 0.02306629, 0.08721258) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.100562446, -0.05475565, 0.01873388, -0.013671649, 0.14916395, -0.067826256, 0.032623593, -0.060436044, -0.0122893145, 0.09967451, 0.120976925, 0.10229753, 0.13948052, 0.17415452, -0.011262652, -0.037956428) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.16161971, 0.02982422, 0.049742486, 0.015267549, -0.055522446, -0.009517889, 0.10921511, -0.08333722, 0.059517074, -0.023159515, 0.13170207, 0.015733222, 0.013808399, -0.011851306, -0.024589658, -0.050633222) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.00227671, 0.30201057, 0.11319067, 0.1133962, -0.04852214, -0.19454744, -0.07127992, -0.11690175, 0.12344371, -0.0811454, -0.031156603, 0.04270805, -0.06546707, -0.023155082, -0.06664943, 0.19928366) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.11345815, 0.12714691, 0.071744405, 0.103484415, 0.0023571255, -0.06398675, 0.30560458, 0.30617425, -0.0005386149, -0.041429702, 0.13761137, -0.14517422, 0.13975474, -0.026216023, 0.08931679, -0.07163053) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.11686376, 0.070224725, 0.10019609, -0.109919794, 0.04557366, 0.023907041, 0.00767809, 0.0013940547, 0.015182983, -0.029614698, 0.076304965, -0.0011633933, -0.13530292, 0.00056007045, -0.057679377, -0.13049605) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.038706653, -0.12585612, -0.0590175, 0.07387271, -0.20598301, -0.039461385, 0.018922692, 0.090926535, 0.007763573, 0.038042054, -0.020345435, 0.016759971, 0.033337165, -0.091677584, -0.06344887, 0.05610023) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.17988396, 0.093451336, -0.018993216, -0.05381074, -0.02964974, -0.1913282, 0.06552725, -0.050367884, -0.015466344, 0.033029303, -0.0096563175, 0.05186194, 0.0033302843, -0.15092133, 0.064511806, -0.04485651) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.024405021, 0.038516898, 0.015061607, -0.04192331, -0.015869368, 0.017929645, 0.07922887, -0.054948222, -0.013361282, 0.0033160122, -0.12909667, -0.012857738, -0.0068476, -0.012239811, 0.0029081944, -0.08033987) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.055734444, 0.0094752135, 0.10845729, -0.10329405, 0.17336772, 0.07117447, -0.049073327, -0.10629648, 0.1611813, 0.027324779, -0.16710818, 0.07097851, -0.017817533, -0.15294223, -0.06685321, 0.023941878) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.04015555, -0.057957835, -0.04012829, 0.11909982, -0.06483754, -0.09342866, 0.020691587, -0.0051632426, 0.10992608, 0.0037598521, 0.20579205, 0.013045941, -0.016678521, 0.06126397, -0.16735047, 0.053845536) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.046297137, 0.100343026, 0.0724331, 0.05753326, 0.025728337, 0.07448563, -0.017905511, -0.05812705, -0.05747221, 0.05252139, -0.0022827995, 0.009535698, 0.27295315, -0.026006082, -0.12689655, 0.04623798) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.11685835, -0.015142521, -0.13885486, 0.019486092, -0.20875208, -0.34251136, -0.0700515, 0.02718998, 0.1638258, -0.16402523, -0.42462748, 0.17106175, 0.19568646, -0.052654434, -0.024262564, 0.37246057) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.07555664, 0.18153746, -0.003098694, 0.014292224, -0.12814312, 0.4459735, 0.041419946, 0.17212822, -0.06420285, -0.06265219, 0.17119808, -0.030034862, -0.14114997, 0.123509236, -0.105649926, -0.111933716) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.0019030712, -0.02515307, 0.19928412, -0.004469821, 0.017613214, 0.015647614, 0.08936756, -0.08414862, -0.036098205, -0.022081148, 0.08306485, -0.008411014, 0.02704273, -0.13972263, 0.095762834, -0.09297345) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.025891948, -0.17626308, -0.061084367, -0.04712799, -0.0472, -0.26856974, -0.06539752, 0.013616317, -0.059423175, -0.098188885, 0.025495678, 0.0031581502, -0.03285922, -0.022789126, -0.045184094, 0.14847386) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.011830537, -0.12030199, -0.053715575, 0.09420908, -0.016697582, -0.101909086, 0.0052315956, -0.038581654, -0.013728641, 0.14887422, -0.20061015, 0.12874006, 0.035768256, 0.18918842, -0.11919466, -0.12912689) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.050202396, 0.03138417, -0.050705705, 0.02818433, 0.080382414, 0.036221508, -0.0042167716, -0.052568164, 0.08052105, 0.103576005, -0.028431175, -0.007257336, -0.079250015, 0.043258842, 0.020142734, -0.10986943) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.06272645, 0.015670467, 0.14403056, 0.017797878, -0.08169692, 0.040103715, -0.095533915, -0.059653286, 0.07473774, -0.17296436, -0.019161535, -0.041325334, -0.038807016, -0.043070696, 0.06584265, 0.22001688) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.018589705, 0.02944848, 0.14810379, 0.06810516, -0.032104094, 0.007841817, -0.055268675, 0.059648626, 0.08636726, 0.12378364, -0.008725567, -0.002871493, 0.19164857, -0.032345578, -0.023310618, 0.04684608) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.07348036, -0.004544571, -0.14452362, 0.16110179, 0.13347302, 0.04389134, -0.029372944, -0.007604985, 0.029121475, -0.025094448, 0.03175599, 0.06217274, 0.07115858, 0.13647805, 0.10111285, 0.0034638855) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.05997947, 0.024786323, -0.08678267, -0.012526823, -0.0220639, 0.023112366, 0.07861742, -0.19187176, 0.03293625, 0.10128404, 0.09530748, 0.06404156, 0.19316022, 0.21244249, 0.02258886, -0.1616932) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.15327139, -0.069000825, 0.15589428, 0.14515664, 0.12859896, 0.14179786, 0.060607996, 0.21198936, -0.2507868, -0.022061916, -0.038542237, -0.1808869, 0.031881858, -0.19330673, -0.037499044, 0.13342386) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.05988526, -0.09544103, -0.016432738, -0.017414998, 0.0046385103, -0.20584446, 0.09174897, -0.12748675, 0.024459438, -0.07905607, 0.06139659, 0.075841114, -0.025305571, -0.07030918, 0.023217013, 0.08051247) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.037737433, 0.027603755, 0.05098685, 0.042382807, -0.011197322, 0.06492134, -0.0906253, -0.053419977, -0.045706257, 0.079379134, 0.16454495, 0.040260073, 0.015778258, 0.21647462, 0.08369584, 0.060196582) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.013863368, 0.101593465, -0.049138572, 0.049191948, 0.12123321, 0.06259525, 0.09837069, 0.045398068, -0.021721708, 0.17811406, -0.31950596, -0.14456001, 0.04377062, -0.056147244, -0.13187714, 0.13418218) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.074299, 0.087283604, 0.049188152, -0.04601051, 0.043187305, 0.105247594, 0.067160025, -0.10978978, -0.021780532, 0.16378258, -0.04006729, 0.041094404, 0.12237769, 0.01013395, -0.046020973, 0.058959812) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.10759802, -0.05844557, -0.16433835, 0.02379762, 0.027131278, -0.020398108, -0.03034064, -0.07654222, -0.030525263, -0.071624376, -0.038216878, -0.14220032, -0.015000659, 0.024406437, -0.118754864, -0.019906608) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.05946246, -0.037770055, 0.05371964, -0.04762644, -0.023789868, 0.15548596, -0.0022103225, -0.08290816, 0.059680905, -0.06700105, -0.3027294, 0.05302431, 0.060560275, 0.119091325, 0.011910897, -0.0611307) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.048199076, -0.005808951, -0.050281305, 0.010793577, 0.052124035, -0.027270628, 0.09903184, 0.083696134, 0.10440056, 0.02289494, -0.07162003, -0.0062849876, 0.1393764, 0.007761962, -0.08147549, -0.120649576) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.06300759, -0.03393544, 0.074379005, 0.09672255, -0.065820985, -0.15880246, 0.06331057, 0.09052317, -0.17283176, -0.05706484, 0.055020954, -0.17695414, -0.017047746, -0.09395422, 0.11524346, 0.091663584) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.12924798, -0.06557826, 0.005698939, 0.05151969, 0.023980606, -0.031310424, 0.0983691, 0.027031474, 0.22763366, 0.13239998, -0.069468655, -0.01557182, 0.062858954, 0.21231271, -0.030290892, 0.17677142) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.081439696, 0.020450905, -0.012162494, 0.08146154, 0.01614436, 0.04890599, 0.11159027, 0.17375018, 0.04622331, -0.110857576, 0.025216697, -0.060947504, 0.0678939, -0.095830016, 0.099071994, -0.02898622) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.028128562, -0.023531286, -0.0008795096, 0.0704722, -0.10301007, 0.029321423, -0.021746516, 0.09696239, 0.09645322, -0.040263638, 0.06301727, -0.08709368, 0.09035671, 0.13559014, -0.07670181, -0.03276494) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.055680234, 0.07293633, -0.022003002, -0.044560425, -0.0373804, 0.15495904, 0.13096857, -0.025550859, 0.023868699, -0.023058083, -0.1235014, -0.10734169, 0.010809003, -0.25039196, -0.014217269, 0.07412059) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.03694641, 0.051798698, -0.07326607, 0.053899962, 0.02812039, 0.022284172, 0.0029374901, -0.07449402, -0.16211948, 0.026257169, -0.0037779722, 0.15171492, -0.052307416, 0.0024355229, 0.0063564116, 0.0046692565) * go_3(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.019450054, 0.017427495, 0.14512521, 0.04938662, 0.006202705, -0.08233491, 0.22789595, 0.09831528, 0.0404036, -0.016220046, -0.009567857, -0.10365957, -0.05455351, -0.082637355, -0.18112423, -0.18289614) * go_4(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.019659022, -0.057440203, 0.038178887, -0.024574915, 0.09476514, 0.16418602, 0.096884474, -0.008543215, -0.1006523, 0.1330037, 0.013882872, -0.0050533605, -0.09158922, 0.030192483, 0.13139597, 0.27340072) * go_4(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.014864847, -0.058110245, -0.04089836, -0.027095364, 0.15525354, -0.04222943, 0.114998884, -0.0074308664, 0.02298135, -0.08942385, 0.07597391, -0.07266409, -0.1486214, 0.12592529, 0.008856135, -0.03815847) * go_4(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.016115177, -0.05787365, 0.14374281, -0.065732814, -0.026940078, -0.090105265, 0.09092125, -0.067427695, 0.06799277, 0.046577964, -0.12558952, 0.2282373, -0.050858285, -0.005724691, -0.14264332, 0.0725394) * go_4(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.14321874, -0.17630744, -0.030244285, -0.11968165, 0.0214558, 0.08285664, 0.16521458, 0.20328104, 0.07671273, -0.30493468, 0.021776592, 0.011971024, 0.023633704, -0.2776264, -0.10879595, -0.07339406) * go_4(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.05762395, 0.11391274, 0.07526661, 0.08930487, -0.050805196, -0.033572827, -0.0138379475, -0.0027166037, 0.051784392, -0.06812382, -0.06657226, -0.029933205, 0.037111796, 0.12770545, -0.19708967, -0.017368592) * go_4(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.034721598, 0.07238717, 0.021580521, 0.0032361194, 0.02682915, 0.11429618, 0.006246969, -0.011384502, -0.10198539, 0.044490647, 0.026510842, -0.08242405, 0.10116388, 0.06562081, 0.107485555, -0.0012590926) * go_4(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.030852526, 0.047721054, -0.13123205, 0.10543791, -0.05943997, -0.046062008, -0.060958795, -0.009572606, 0.10642023, -0.044935644, 0.017086817, 0.17646314, -0.00961127, -0.41264644, 0.018992305, -0.07547571) * go_4(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.045347903, -0.038964048, 0.056273893, 0.12708911, -0.03469611, 0.10069531, -0.22192168, -0.022682197, 0.043401085, 0.018264271, 0.076982856, 0.011487361, 0.027886251, -0.12259783, -0.099470966, -0.039430864) * go_4(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.08624949, 0.012376808, 0.0077479514, -0.1170666, 0.0716742, -0.11046843, -0.077850066, -0.044300415, 0.053915314, 0.09339476, -0.069813095, -0.06957861, -0.001374164, 0.14245875, -0.06634346, -0.103644006) * go_5(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.024505014, -0.041000646, -0.037310645, -0.19960494, -0.11286237, -0.039952476, -0.014555522, 0.094842575, -0.077469945, 0.09608264, -0.075717196, 0.057115197, 0.16915609, -0.014995497, -0.13742553, -0.004681802) * go_5(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.0549783, 0.030727496, -0.04337882, -0.06925114, -0.019843027, 0.059288803, -0.079616524, 0.01963306, 0.02820184, 0.052798875, 0.046409376, -0.04965568, -0.19409747, -0.004536743, -0.16434522, -0.008230561) * go_5(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.1839738, 0.042379227, -0.16860627, -0.061752677, -0.01604508, 0.030754698, -0.074875444, 0.084691316, 0.038282342, 0.30632535, 0.05114634, 0.121252306, 0.07699079, 0.3056959, -0.10636499, -0.110272214) * go_5(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.08497261, -0.061560262, -0.044905245, -0.054917242, -0.08900476, -0.031761087, 0.011166559, -0.07907292, 0.076665536, -0.14452234, -0.18915282, 0.18507777, -0.108493246, -0.31385952, 0.27914372, 0.33188236) * go_5(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.09645311, 0.07250647, 0.115785874, 0.09124687, -0.056559183, 0.05863247, -0.08140737, -0.05012514, -0.1059255, 0.034764946, 0.097291306, -0.0025682407, -0.009076726, 0.013445683, -0.065667965, 0.12148862) * go_5(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.0034297407, 0.0011929716, -0.025974274, -0.122696795, -0.16790242, -0.026815463, 0.02342119, 0.08819499, 0.049951926, 0.0009924982, 0.05151504, -0.09561283, 0.08813568, -0.09092365, -0.10566983, -0.09292515) * go_5(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.12156009, -0.011645673, -0.07497513, 0.07160764, 0.033775024, -0.007643766, 0.12486011, -0.0766719, -0.022502638, -0.12700734, 0.056804404, 0.2373573, -0.052466217, 0.041492254, 0.010128061, -0.03906922) * go_5(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.06947017, 0.039409123, -0.09709905, -0.035098486, -0.04671096, -0.025924092, -0.10862489, 0.014876228, -0.004171268, -0.055684786, -0.0430162, -0.015479635, -0.07883754, 0.028366983, -0.07044784, 0.026371619) * go_5(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.12491029, -0.01923031, 0.06077587, -0.11972133, 0.09019155, 0.07630519, 0.0030505152, 0.059707895, -0.033507288, 0.004496867, -0.11517756, 0.12770605, 0.094082855, 0.074296735, -0.1412585, -0.1442703) * go_6(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.1385727, 0.038624324, -0.046046253, 0.05311024, -0.06940295, 0.04701938, 0.11245861, -0.005019864, -0.014386482, -0.012019259, 0.14635965, -0.06122487, -0.06906494, -0.16240194, 0.082200415, 0.048237212) * go_6(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.14468831, -0.056279324, -0.046586104, -0.018987626, 0.052040957, -0.011430102, -0.035632648, 0.014202148, -0.11370422, 0.08197359, -0.16257696, -0.034705233, -0.06485444, -0.019303367, -0.09146792, 0.010801243) * go_6(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.043830894, -0.2320351, 0.3333112, 0.2630448, 0.07373748, 0.33049798, 0.001642668, 0.22351044, 0.017811265, 0.23345731, -0.08962462, -0.1396011, 0.09703513, -0.01986389, -0.09969773, -0.14018197) * go_6(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.12336034, -0.123443455, 0.0593038, -0.081452504, 0.04679253, -0.0040808073, -0.12084844, -0.20217294, -0.037490703, 0.19642612, 0.24421008, 0.5276441, -0.16672747, 0.014775753, 0.0105408225, 0.10049115) * go_6(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.089774966, -0.047527924, -0.0007001913, 0.071103655, -0.03167252, -0.06652405, 0.021832626, -0.0027828882, -0.14941277, 0.13698508, -0.05485965, 0.0018984928, 0.05728955, 0.05286551, -0.042861003, 0.1204859) * go_6(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.04797686, 0.017278861, 0.09963163, -0.07403156, 0.16224588, -0.00022055063, -0.035451055, -0.054200813, 0.0075777066, 0.032946784, 0.054119565, 0.013952389, -0.03471897, 0.119187325, 0.103756696, -0.16748244) * go_6(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.12169368, -0.09832273, -0.07356938, 0.012601864, 0.0033501373, 0.06226625, -0.05481353, 0.057701286, 0.0074527394, 0.04647796, -0.01752196, -0.009819254, -0.055218786, 0.2523621, 0.0018503782, 0.013713094) * go_6(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.07547788, 0.019841697, -0.063743204, 0.0016271871, -0.011909185, 0.025960762, -0.032695234, 0.05598399, 0.0324628, -0.032277346, 0.06817223, 0.094046466, -0.026146894, 0.04707096, -0.015286299, 0.021633716) * go_6(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.06242534, -0.0050779823, -0.120014794, 0.12003254, -0.07670613, -0.020087022, 0.052733466, 0.05739494, -0.06948649, -0.086232655, 0.044364158, -0.025977671, 0.00048737816, 0.10551334, -0.012772333, 0.0695593) * go_7(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.021200884, 0.04894996, -0.066838525, -0.18435371, 0.042426147, 0.020211088, 0.055953514, -0.051933434, -0.10550434, -0.0026846863, -0.13971733, -0.02184495, 0.0014545146, -0.0915335, -0.027734866, -0.038728945) * go_7(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.10364436, -0.08102991, 0.008440821, -0.09785022, -0.013573327, -0.071765065, 0.025664581, -0.03018756, 0.06772861, -0.036794353, -0.047585115, -0.051343437, -0.2573073, 0.0023996837, -0.008496379, -0.10749119) * go_7(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.12116202, 0.035012618, 0.06828631, -0.011810479, 0.15149537, 0.2697212, -0.0818064, -0.12058153, 0.007521522, 0.1254704, 0.13602273, -0.042921092, -0.19474955, 0.08889511, 0.11905765, -0.48354828) * go_7(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.06622801, -0.24205731, 0.00039195677, -0.018191213, 0.1418333, -0.23763578, 0.1262838, 0.3101213, 0.10095308, 0.092712864, 0.035186313, -0.05094548, 0.18132727, -0.11579797, 0.12947337, 0.17984942) * go_7(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.024080344, 0.030900456, -0.07827444, -0.03047019, -0.07694487, -0.033968464, -0.09684677, 0.01864093, 0.08061825, 0.028564071, -0.06351325, 0.045664158, -0.02435513, 0.07335545, -0.15416555, 0.033914436) * go_7(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.0066844383, 0.18998615, 0.08110769, 0.06075703, -0.00035976124, 0.17410082, -0.016190415, -0.072515815, 0.06237005, 0.039860904, -0.07000151, -0.044377264, -0.0135860015, 0.09124136, 0.07817149, -0.13900073) * go_7(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.027519895, 0.11568574, 0.0938243, -0.054063454, 0.032663487, 0.0032921168, 0.12618391, -0.002021597, 0.051823083, -0.16533224, 0.028921695, -0.078465916, -0.058265906, -0.19176663, -0.04167813, -0.018580772) * go_7(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.09653387, -0.06955171, -0.0032987394, -0.0822022, -0.110497184, 0.027078046, -0.16925058, 0.022800285, -0.065462455, -0.06652677, 0.041567896, -0.03914663, 0.08393093, -0.027193561, 0.029169211, 0.026189756) * go_7(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.028530449, -0.030343069, -0.094984, 0.0457086, 0.030453794, -0.10934838, 0.026118102, 0.05388074, 0.01141028, 0.17053983, 0.025053402, 0.10237525, -0.018245628, 0.0466102, 0.10027888, 0.007031101) * go_8(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.031947598, 0.0142047815, 0.1008171, -0.021267543, 0.028890727, 0.015997184, 0.00904217, -0.07394312, -0.075407095, -0.123822875, 0.053960808, 0.03218678, -0.078903474, -0.0074488954, 0.006436021, -0.019293945) * go_8(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.093168706, 0.008948909, 0.04137674, -0.0897038, -0.020926308, -0.09558734, -0.022406321, 0.002949651, -0.011116838, 0.023297548, 0.15090843, -0.083772644, -0.07124868, -0.091127455, -0.046792395, -0.031992402) * go_8(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.110468656, -0.03484454, 0.053979196, 0.13552794, -0.04660422, -0.14299203, -0.10245069, 0.15799181, 0.052099496, -0.05660036, 0.09624473, -0.059447583, -0.19582441, -0.19371855, 0.029592248, 0.15151422) * go_8(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.081927694, 0.010878782, 0.05471361, -0.038445257, -0.10004111, -0.00742982, -0.121207744, -0.07186629, 0.19857378, -0.12072702, 0.16502617, 0.3030395, 0.02941075, 0.16125154, 0.036315985, -0.12341535) * go_8(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.076093376, 0.108250566, -0.04474227, 0.0005430772, -0.056557942, 0.12507966, 0.043558195, 0.13094783, -0.009826428, -0.030642144, 0.044561736, -0.01616312, 0.124570616, 0.032103647, 0.00094704446, -0.062467944) * go_8(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.05288774, -0.04173261, -0.094127834, -0.048326064, -0.051140305, -0.09304907, 0.07285711, 0.10539822, 0.0757148, -0.10271482, -0.05926938, -0.011032404, 0.04824878, -0.13786948, -0.044193707, -0.06005154) * go_8(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.029262906, -0.04053909, -0.10859774, -0.024688296, -0.07468686, 0.02183861, -0.05050053, -0.036748923, -0.04600484, 0.13406211, 0.3144956, 0.03387907, 0.030911079, 0.03854964, 0.040388837, -0.051211257) * go_8(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.04581977, -0.050508924, -0.09192806, 0.045895346, -0.042796656, -0.075065635, 0.06755441, 0.1621575, 0.07225555, -0.021305092, 0.07891141, 0.062734276, 0.032362953, -0.01723129, 0.056368362, -0.095162146) * go_8(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.1290508, 0.09830274, 0.19029498, -0.13119996, 0.061265036, 0.023812773, -0.03416971, -0.027166106, 0.1472619, 0.110970646, -0.13354625, 0.115644634, -0.09297424, -0.045373987, -0.07155728, -0.02823285) * go_9(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.29414526, 0.031436007, 0.13467501, 0.23785688, 0.020552235, -0.17962979, -0.011401214, 0.07844186, 0.0020100463, 0.033093207, 0.21094067, -0.006131698, 0.036331773, -0.056775156, 0.28799078, 0.21105652) * go_9(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.05108093, 0.062294826, 0.0753641, 0.061110258, -0.07275481, 0.034971233, -0.19592805, 0.010506673, -0.07471706, 0.010695946, -0.058127686, -0.013674127, -0.11572427, 0.0047275554, 0.07725011, 0.077781096) * go_9(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.021191953, -0.16302282, 0.031195858, -0.016690757, -0.042332754, 0.12576906, 0.028911225, -0.042581353, 0.14656056, -0.002111526, -0.054867882, 0.053384244, -0.00054000184, 0.2865656, 0.08568847, -0.005297186) * go_9(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.24459156, -0.0040446254, -0.011034847, 0.020034194, -0.13969189, 0.026051244, 0.010284825, 0.052832644, -0.3302616, -0.1641068, 0.05866752, 0.049114868, -0.19706532, -0.038541116, 0.15689386, -0.014460528) * go_9(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.20088449, -0.18249178, -0.19120571, -0.021813335, -0.02567551, -0.10124292, -0.2129278, -0.15769608, -0.100296415, 0.12818226, -0.18814573, 0.057463627, -0.2173712, 0.14296606, -0.19845422, 0.04402624) * go_9(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.04501396, -0.016134484, -0.048776157, -0.027523788, 0.14263803, -0.033841856, 0.14165118, 0.11231477, -0.117087275, 0.071836635, 0.033528548, 0.025089972, -0.11626535, -0.059059534, 0.039012797, 0.056363076) * go_9(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.019880112, -0.10156109, 0.14758001, 0.12805681, 0.096986346, -0.047886547, 0.007990481, 0.2734917, -0.03103439, 0.07075354, 0.074489154, 0.048702024, 0.024555484, 0.28999108, 0.06102981, -0.10981428) * go_9(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.074777, 0.001804593, 0.07410528, -0.08746074, -0.039508138, 0.015179453, 0.032183602, 0.12169698, 0.05552145, -0.10485944, 0.05223517, -0.083807155, 0.1067679, -0.040424254, -0.051757596, 0.03411554) * go_9(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.08332494, -0.017157076, -0.15541728, -0.02507669, 0.09043872, 0.053027406, -0.098478906, 0.014016389, 0.07899013, 0.09959897, 0.13936171, 0.16692483, 0.017292997, 0.13855843, 0.0750788, 0.14084084) * go_10(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.06163187, 0.050483577, 0.17532788, 0.12694873, 0.036072567, -0.12612706, -0.068937264, 0.0208678, 0.0955886, -0.21836248, 0.05693701, 0.11552043, 0.05373496, -0.0076306504, -0.1134099, -0.23140456) * go_10(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.02418352, 0.07047251, -0.08015661, -0.020395076, -0.12786765, 0.06069527, 0.035371967, 0.045634307, -0.1251301, 0.17768264, -0.09586097, 0.10744777, 0.06199948, -0.06666097, -0.031270064, -0.029521335) * go_10(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.08700529, 0.0521275, 0.0134138055, 0.12139678, 0.06302291, 0.021202987, -0.07977008, 0.048815608, 0.15826204, -0.09358012, -0.02154612, -0.24544328, -0.013697682, 0.0016321354, 0.13801077, -0.06325918) * go_10(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.20855603, 0.13971342, 0.20750982, 0.054931514, -0.0072197737, -0.18407024, -0.05493873, -0.12714154, -0.030079355, 0.118419215, -0.10421147, 0.036947545, 0.0629553, 0.14460443, 0.06846684, 0.0016486015) * go_10(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.0019238774, -0.06716329, -0.036974065, -0.025171692, 0.003145538, 0.009222313, -0.08951116, -0.028844675, 0.0019689503, 0.0038089454, 0.049644902, 0.015088383, -0.08523328, -0.057811886, 0.13893504, 0.084998205) * go_10(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.017735925, -0.027136771, -0.018788278, 0.0014902869, -0.039537203, -0.0032515842, 0.010640472, -0.048517723, 0.14024682, -0.026336543, 0.051186156, 0.03411434, -0.12304973, -0.018773645, -0.07901994, -0.014950501) * go_10(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.04492738, -0.09235136, 0.016306276, -0.07114585, 0.021729728, -0.00079245685, 0.025323827, -0.0053302613, -0.10879124, -0.13935542, 0.058140572, -0.030897664, 0.017131852, 0.2910438, -0.05578602, 0.1226322) * go_10(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.064604685, 0.0016290275, -0.05219982, -0.046904758, 0.055705804, -0.09864041, 0.0959681, 0.01864796, -0.11455475, -0.09758585, -0.022786105, -0.038040295, -0.0051123835, 0.13658151, 0.07356666, -0.05481127) * go_10(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.099208795, -0.057029903, -0.16799642, -0.0044347527, -0.06552306, 0.048165623, 0.045094546, -0.039906844, -0.0046389205, -0.02457306, 0.015797745, 0.058697045, -0.054800622, -0.12494134, 0.07049534, 0.037583154) * go_11(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.009378128, 0.035244588, -0.09924745, 0.18942085, 0.0014096628, 0.11226739, 0.0072757765, -0.055776034, 0.082616255, -0.11925312, -0.06925827, 0.14569838, -0.19810294, 0.06581726, 0.09252449, 0.0068915454) * go_11(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.064408444, -0.061193526, -0.038778774, 0.053977504, 0.039270118, -0.10278301, 0.086721204, -0.113875344, 0.06850686, -0.012360228, 0.015361166, 0.046675045, 0.13093628, 0.0005417212, 0.13471904, 0.06485523) * go_11(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.07989225, -0.100406826, -0.10944563, 0.07256156, 0.10232373, 0.009566911, -0.0461756, -0.16797575, 0.039543778, -0.15199925, 0.031132417, -0.092911355, -0.09814002, -0.31025404, 0.02272795, 0.2248659) * go_11(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.08360824, -0.0737838, -0.14736836, 0.15890516, 0.13234118, 0.08391826, -0.076949224, 0.34322366, -0.115592755, 0.049026012, 0.020826623, 0.17741196, 0.16721897, 0.26695272, -0.34930348, -0.14795424) * go_11(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.06995868, 0.0056425664, 0.00419832, -0.10647465, 0.0044470876, -0.09307231, 0.30857167, 0.10302482, 0.19641803, 0.0001864599, 0.16174625, 0.12199131, -0.044310175, 0.0552523, 0.09890855, -0.10056144) * go_11(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.0007076519, -0.022538826, -0.013704813, 0.12702727, 0.061103735, 0.05082559, 0.08556586, -0.062643535, -0.021830598, 0.026547015, 0.002573239, -0.037739865, -0.07985882, 0.15111215, 0.0019819294, 0.014503066) * go_11(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.07269095, 0.030431513, 0.12673184, -0.015513133, 0.12458577, 0.04736781, 0.25453326, -0.016506296, 0.018488389, 0.06741469, -0.1681027, -0.060571954, 0.041646067, -0.034232, -0.09514311, 0.06477151) * go_11(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.02164016, -0.081735596, 0.18272854, -0.00049256656, 0.048891954, 0.075129755, 0.064598955, 0.027568849, 0.06284424, 0.05611894, 0.15823774, 0.10164623, 0.08859664, 0.00096352655, 0.05039276, 0.059170373) * go_11(pixel.xy, 1, 1);
  result += vec4f(0.0307871, 0.026051836, -0.027859464, -0.064916685);
  textureStore(conv2d_4_tf_tex, pixel.xy, result);
}