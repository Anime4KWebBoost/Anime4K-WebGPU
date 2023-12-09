// Layer: Anime4K-v4.1-Upscale-GAN-x3-(L)-Conv-4x3x3x24
// Name: conv2d4tf
// Inputs: ['conv2d_3_tf', 'conv2d_3_tf1', 'conv2d_3_tf2']
// Output: conv2d_4_tf
@group(0) @binding(0) var conv2d_3_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_3_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_3_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_4_tf_tex: texture_storage_2d<rgba16float, write>;
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
  return max4(-textureLoad(conv2d_3_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_4(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_5(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
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
  result += mat4x4<f32>(-0.032557677, 0.15826401, -0.11499422, -0.08640765, -0.09198991, -0.007192731, 0.010252954, 0.023780089, 0.15372203, -0.0009684923, 0.051660325, 0.011104123, 0.023871671, 0.005045307, 0.10722681, 0.065446004) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.04723326, 0.21495502, -0.4453857, -0.020825233, 0.021379868, 0.04798187, 0.11383445, 0.08597329, 0.05730255, -0.046370696, -0.105095126, -0.03220056, -0.10122536, 0.06955123, -0.023051325, -0.04296927) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.02551809, 0.16179861, -0.15771814, -0.00045056897, 0.05842655, 0.11279471, 0.08018674, 0.05973765, 0.044070918, 0.08054599, -0.070336945, 0.05499731, -0.039118823, 0.003635353, -0.019759493, -0.040480837) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.04707628, 0.040738698, -0.013698143, -0.047391538, 0.031729057, -0.01837267, -0.10985463, -0.0028168112, -0.03167109, 0.0007989082, 0.011234699, 0.06895626, -0.12226361, 0.016290974, -0.055669673, -0.17432979) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.05069543, 0.15450205, 0.06981913, -0.377529, -0.14111535, 0.124757245, 0.021858096, 0.044034548, -0.16741593, 0.09746289, -0.045757677, -0.11644043, -0.09906484, 0.19128124, 0.061969943, -0.14589702) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.12177423, 0.077437244, 0.059054222, 0.14925033, 0.016682645, -0.004765056, -0.2194741, 0.11314126, 0.2384071, -0.12049565, 0.12753354, 0.19679058, 0.03558123, 0.018636368, -0.11018761, -0.027520377) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.03618456, -0.030103968, 0.02968891, -0.00393875, -0.07128213, 0.022181263, -0.08430743, -0.027601235, -0.09228556, 0.04661313, 0.054729965, 0.052708175, 0.050483003, -0.022951633, 0.099321984, -0.043519083) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.034695346, 0.10380181, -0.043013666, 0.037639238, 0.118943654, 0.027931944, 0.07628075, -0.12427217, 0.14970858, -0.065848, 0.0030750742, 0.011039123, 0.27721024, -0.055808693, 0.25105593, -0.1825985) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.03627934, -0.17293514, 0.09188732, 0.11569783, -0.035355445, -0.10536353, -0.0068529076, -0.0929389, 0.09053234, 0.05907859, 0.049182277, 0.15194432, -0.09835422, 0.00061943196, 0.066343345, -0.06307589) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.10120336, -0.10855617, 0.13412404, -0.018874792, 0.037988223, 0.0957435, 0.015402347, -0.08589699, -0.07694196, -0.03258571, 0.064437136, -0.0495422, 0.24836332, -0.0041739377, 0.093993485, -0.0076778256) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.20205948, 0.035698004, 0.0120531265, 0.03971649, 0.07550046, 0.047750015, -0.049045984, 0.04001014, -0.030263485, -0.0030697742, 0.05283423, -0.00014085052, -0.062447365, -0.0503476, -0.085151225, -0.04436882) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.1516312, -0.073820546, -0.01047401, 0.0002717457, -0.17057727, 0.20856272, -0.09357496, -0.17346743, -0.068092465, -0.023344085, -0.03279074, -0.077289, -0.09844614, -0.035491887, 0.048796505, -0.03633584) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.0073127835, 0.041834716, 0.015633723, -0.042742077, 0.08359733, -0.13898548, 0.1343008, 0.04692816, 0.051663343, -0.1277769, 0.029269615, 0.021745533, 0.09920264, 0.032076713, -0.05319438, 0.040574815) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.052737534, -0.02136074, -0.18437223, 0.030766862, 0.23291707, -0.010449272, 0.032748792, 0.1304141, 0.27302903, 0.008562884, 0.13475919, 0.044446316, -0.17819557, 0.08270108, 0.06075267, -0.112788476) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.093748294, -0.004655885, -0.044859763, -0.11719146, -0.4701752, 0.09076277, -0.2283514, -0.34524822, -0.11999304, -0.010338027, 0.026785752, 0.029790966, -0.0635327, -0.024085084, -0.12074973, 0.080456585) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.023425102, -0.105786875, 0.1220016, 0.017974272, -0.12736784, -0.050550908, -0.1985566, 0.09139255, -0.18943925, -0.0067088404, -0.15007311, -0.015332959, 0.16430685, 0.006736225, -0.009263825, -0.08230126) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.15165123, 0.057155497, -0.09756418, 0.0475568, -0.14430566, 0.05169595, -0.24240975, 0.061147846, 0.0017831615, 0.028189357, -0.12519005, 0.03604646, -0.0460214, 0.05936097, -0.0213775, -0.28192145) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.019390648, 0.005514995, -0.0024649797, 0.056670878, -0.10385216, -0.05531206, 0.23233996, -0.16394126, 0.1718211, -0.08723329, 0.08580946, -0.028214762, -0.060853615, 0.0458013, 0.106201656, 0.031685878) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.105268896, 0.0106684705, -0.10355101, -0.07401398, 0.12425712, -0.21308881, 0.05200582, -0.024954682, -0.1120292, 0.07799603, -0.031506516, 0.0031533986, -0.05264893, -0.11141642, 0.107277475, 0.049987797) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.08439962, -0.14181082, -0.20358182, 0.09080642, -0.061622817, 0.24017061, -0.12030436, 0.17224449, -0.0220505, 0.20025904, 0.1032571, 0.032335218, -0.09232964, -0.06172056, -0.1011141, -0.07322099) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.10896482, 0.06107763, -0.100641444, -0.018832406, 0.020139545, -0.0037260412, -0.10512619, -0.24599148, 0.014342631, 0.056689363, -0.06662091, 0.03999069, 0.00824376, 0.030449467, 0.027041748, -0.056902107) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.18174766, 0.040627997, 0.1140224, -0.20088135, 0.07404639, 0.01215843, -0.050341435, -0.0011868333, -0.5206288, 0.53214884, -0.60289955, 0.25364086, -0.05814184, 0.21600877, 0.07475344, 0.0624221) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.07710521, 0.030054979, -0.28164682, -0.13994755, 0.028757188, 0.04356096, -0.14357159, 0.2761477, -0.5300268, 0.44994202, -0.15364286, -0.18580483, 0.084563375, -0.13093601, 0.08291044, 0.017790407) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.013963807, 0.0032885068, 0.0069646467, 0.03777879, -0.30103573, -0.047965538, 0.057550967, -0.3402889, 0.0026557294, 0.2289777, 0.01937088, 0.18484715, 0.083694465, -0.056240357, -0.0023172104, -0.13328342) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.05847699, 0.06990862, -0.0076244893, 0.03992696, 0.088809974, -0.059422277, -0.10557949, 0.058280375, -0.37764055, -0.19777957, -0.86350954, -0.21546844, 0.21863134, -0.074350335, 0.039010234, -0.021216504) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.18698102, -0.024641648, -0.16558538, -0.06499548, 0.10435924, 0.0030438402, -0.021636335, 0.046050593, -0.22217542, -0.14033853, -0.21516539, -0.4834089, 0.061894827, -0.024107188, 0.045805957, 0.20019397) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.0657418, 0.074276686, -0.07074239, -0.0101531055, -0.17146541, -0.016556345, -0.16196094, -0.13551502, -0.017605018, 0.065230414, 0.10717515, 0.41153327, 0.07095331, -0.05611257, -0.09297768, -0.054604497) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.051999312, 0.28559515, -0.09147715, 0.04536181, 0.077552326, 0.052161235, 0.006652824, 0.12593806, -0.07654755, 0.056134425, 0.029163264, -0.05461885, 0.04772557, 0.14073811, 0.07795857, -0.0397234) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.0698435, 0.17774913, -0.07301677, -0.14336437, -0.104051985, 0.14831689, 0.045199208, -0.1867252, 0.07530157, 0.12153924, 0.1397731, -0.026905237, 0.056165505, 0.21213025, 0.073159344, 0.03143804) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.029820994, -0.079599164, 0.12901585, 0.014192698, -0.0816397, 0.02425821, 0.10938256, 0.0077257096, -0.009784561, 0.20602871, -0.07226973, -0.16234052, 0.0064664064, -0.023469927, 0.0037447219, 0.015258041) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.028296372, 0.23841251, 0.04076168, 0.061052933, -0.082375534, 0.11200519, 0.025308013, 0.1736187, 0.23024227, -0.004161287, 0.16408522, -0.0141539015, 0.01496407, -0.037708607, 0.15057993, 0.14573294) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.22485349, -0.2217838, -0.011602474, 0.22668324, 0.2172098, -0.21826234, -0.09506227, -0.06592076, 0.14401191, 0.014868243, 0.41509256, 0.2799861, 0.04998898, -0.121938676, -0.29612163, 0.16926381) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.009154201, -0.14300221, 0.0121250935, -0.049595118, -0.3256411, -0.07036471, -0.066481166, -0.32643607, 0.13287841, -0.096211806, -0.24969384, -0.36735064, -0.14625767, 0.07217462, 0.06205977, 0.13962744) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.10122661, -0.042678952, 0.08920629, -0.022906423, -0.048781462, 0.008094098, 0.16410494, 0.01511925, 0.009355741, -0.034123767, 0.06522056, -0.04114966, 0.025140515, -0.046565775, 0.18292467, 0.009392873) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.06604219, -0.10034091, 0.10934946, 0.18707348, -0.19358878, 0.11417287, -0.024397675, 0.04772407, -0.10278711, -0.03847901, -0.025120566, 0.047323767, -0.26464674, 0.15394583, -0.042590924, -0.09511779) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.13339657, 0.13506593, 0.011463314, 0.077461444, -0.022262955, 0.06132727, -0.113292165, -0.1987806, 0.0027555283, -0.016475892, 0.14219329, -0.211625, 0.11405046, -0.12044097, -0.088240534, 0.17436995) * go_3(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.08783496, 0.06564822, -0.10796846, -0.13460107, 0.10140343, 0.08105866, 0.0040176474, -0.045305755, -0.09299188, -0.18928377, -0.099694185, 0.11314726, -0.018881949, 0.04591721, 0.117965475, -0.00035760578) * go_4(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.043456256, 0.10901491, 0.010485461, -0.061420415, -0.04018357, 0.1689085, 0.015425885, 0.061508525, 0.069377325, -0.18156749, 0.19194232, -0.25884745, -0.036184482, -0.0069973134, 0.021037813, -0.08046543) * go_4(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.044377886, 0.18098527, -0.07314578, -0.00287104, 0.038114406, -0.044841792, -0.063126855, 0.19896339, -0.09739791, -0.24212237, 0.19623765, -0.06326722, 0.062247403, 0.054567214, 0.10500492, 0.04231698) * go_4(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.12399143, -0.09728722, 0.06730315, -0.011540306, -0.116925925, 0.0074092527, 0.21276267, 0.068349704, -0.05713399, 0.17656437, -0.10295556, -0.12709019, 0.102335855, 0.2679535, -0.06597912, -0.022839248) * go_4(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.1265364, 0.16177331, -0.075765, -0.06347739, -0.056721687, 0.18794554, 0.006572088, -0.00011200755, 0.05219661, 0.21530084, -0.101604566, 0.04750483, -0.09394214, -0.11256657, 0.11389309, -0.011598962) * go_4(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.015922887, -0.046698473, 0.0130271325, -0.052948795, 0.16426764, 0.09934194, -0.07745314, 0.038738497, -0.040967297, 0.06423774, 0.034312535, -0.013723525, -0.0030767843, 0.041221425, 0.041528914, 0.027097305) * go_4(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.13077654, 0.046842843, 0.034140635, 0.10109363, 0.20840693, -0.012975956, -0.041564208, 0.009877259, -0.033334266, -0.106034294, 0.2507187, -0.01512933, -0.008589095, 0.1849223, -0.06436464, 0.087347835) * go_4(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.13326278, -0.035467118, 0.12698379, -0.034838732, 0.023856519, 0.05274121, -0.09120117, 0.070493534, -0.14804247, 0.08772896, -0.1343374, -0.058013596, -0.1194792, -0.07288297, 0.074856065, 0.021033823) * go_4(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.023594514, -0.018284807, -0.037060708, -0.06051526, 0.13681069, 0.09436225, -0.044987947, 0.21031074, -0.14567234, 0.04987286, -0.24576813, -0.091558464, 0.0040201824, -0.045261826, 0.050834723, 0.04080285) * go_4(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.12843935, 0.11059404, 0.035774253, 0.016019672, 0.13419932, -0.082884714, 0.086934, -0.027470622, -0.0055711996, 0.14726739, 0.00025540774, -0.082832016, 0.015134819, -0.1869738, -0.15580305, 0.118347436) * go_5(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.03210018, -0.07439424, 0.09171389, 0.0061248797, -0.122092225, -0.0055175424, 0.060848907, 0.05447007, -0.1005626, -0.13843839, -0.11508479, 0.034595586, 0.16528612, 0.07630222, 0.10175574, -0.034656286) * go_5(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.05687666, -0.1130296, -0.038044114, 0.1376985, 0.02434624, -0.21984427, -0.0038558878, -0.10872551, 0.00807944, 0.019718373, 0.07016335, 0.001672884, -0.051990695, -0.04958167, -0.036594924, -0.0008506928) * go_5(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.07842389, -0.0907049, 0.10945533, -0.14496571, 0.03524454, -0.12881151, -0.13281278, -0.023060825, -0.037150636, -0.0001619192, 0.07462792, 0.19251943, -0.048907887, -0.09152158, 0.077018015, -0.0076050037) * go_5(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.06379491, 0.22390717, -0.044009656, -0.19816853, -0.14713046, 0.114638254, -0.008227305, -0.014490413, 0.04359834, 0.10032826, -0.17928778, -0.13981889, -0.07729277, 0.11685862, 0.21970165, -0.09117455) * go_5(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.21068226, 0.030921075, 0.109845765, 0.058498275, 0.015876649, -0.0067828237, -0.10064077, 0.13756661, 0.017506564, 0.041748323, 0.17195722, 0.012285508, -0.023290245, 0.07060226, 0.069730066, -0.018874977) * go_5(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.19153018, -0.07691863, -0.03687873, -0.069982305, -0.097453654, 0.060358603, -0.030159682, -0.048520114, 0.12498585, -0.07376571, -0.01039302, -0.099845245, 0.00042995642, 0.035783857, -0.12854497, -0.024975097) * go_5(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.11177764, -0.02895167, 0.09053559, -0.24130683, -0.09276382, 0.04739869, -0.005453787, 0.031923447, 0.089385964, -0.048109047, 0.061177306, 0.117845595, 0.014615613, 0.1153759, -0.0007218852, -0.10042441) * go_5(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.041179586, 0.00042151578, 0.07818137, 0.06354339, 0.0049364083, -0.055836283, -0.0073542926, 0.047470722, -0.15328479, 0.03497268, -0.17375292, 0.0006636334, -0.043640774, -0.007737031, 0.10040319, -0.09145891) * go_5(pixel.xy, 1, 1);
  result += vec4f(-0.0542914, -0.045369092, 0.029350873, -0.018128533);
  textureStore(conv2d_4_tf_tex, pixel.xy, result);
}
