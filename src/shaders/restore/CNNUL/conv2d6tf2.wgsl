// Layer: Anime4K-v4.0-Restore-CNN-(UL)-Conv-4x3x3x24
// Name: conv2d6tf2
// Inputs: ['conv2d_5_tf', 'conv2d_5_tf1', 'conv2d_5_tf2']
// Output: conv2d_6_tf2
@group(0) @binding(0) var conv2d_5_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_5_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_5_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_6_tf2_tex: texture_storage_2d<rgba16float, write>;
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
  return max4(textureLoad(conv2d_5_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_5_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_4(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_5_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_5(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_5_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
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
  result += mat4x4<f32>(-0.028246857, 0.09429872, 0.034600366, 0.022117741, -0.034094583, -0.1416488, 0.114190586, -0.19039942, -0.03329484, 0.054765828, 0.0518203, -0.20784369, -0.11068853, -0.03985197, -0.040889204, -0.15233918) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.0034295225, -0.0047144215, -0.13811362, 0.1063775, -0.042283904, -0.11053704, 0.031115215, -0.19094694, -0.07958675, 0.25251713, 0.27887833, 0.032974306, -0.007945948, 0.005038382, -0.018204618, -0.033514593) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.021439308, 0.09934385, 0.06221231, 0.20019929, 0.031433582, 0.10136135, 0.03170799, 0.22528099, -0.13307518, 0.0042947256, 0.12888439, 0.057041943, -0.093636274, -0.098759346, -0.0013004189, -0.11623657) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.12425962, 0.06631687, 0.03538785, 0.12683366, 0.036875088, -0.388709, 0.021293538, -0.06568616, -0.022915881, -0.17667641, -0.21997124, -0.15674002, 0.12193349, 0.05480543, -0.028813047, -0.092471436) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.23961155, -0.10273245, -0.08654801, 0.20536228, 0.15906096, -0.28645602, -0.20196053, -0.24955072, 0.030706927, 0.0390173, -0.18619792, 0.042841963, -0.021935288, 0.18055134, 0.056804277, 0.06829802) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.17750104, 0.060207605, -0.16278192, 0.10637904, 0.09263751, -0.15864064, -0.1921883, 0.15418245, -0.21325666, -0.060680047, -0.17831814, 0.08721947, 0.028428067, 0.110841654, -0.0018111315, -0.14204408) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.05341328, 0.022792514, 0.12271092, 0.10998399, -0.05194629, -0.0019651174, 0.096098036, 0.05388034, -0.09140511, -0.09375859, -0.033423815, -0.051705707, 0.40354738, -0.09664782, -0.16623749, -0.063937105) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.036799524, -0.0768793, -0.13867554, 0.0018584719, -0.1217911, -0.24234816, 0.09708973, -0.011562908, -0.04658245, -0.0382149, -0.06386236, -0.18728544, -0.07053968, 0.022178814, -0.011753032, 0.09338199) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.040192164, -0.042503025, -0.10662553, 0.04789613, -0.14751524, -0.10168207, 0.09263359, -0.042696435, -0.32350782, 0.12660037, -0.004465994, -0.006698753, 0.11897201, -0.046830907, -0.13950327, 0.06639755) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.35137546, 0.16106302, -0.03942045, 0.20408326, -0.21793413, -0.19028474, 0.03843431, 0.16594443, 0.06715659, -0.12361966, 0.09516593, -0.07226092, -0.0021764247, 0.09041338, -0.042596035, 0.17071731) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.1597755, -0.0058896556, -0.14055388, -0.1015749, 0.03897486, -0.14616072, 0.14914623, 0.04983836, 0.19837128, 0.031061351, -0.012111387, -0.14318599, 0.015185477, 0.015783781, 0.0806122, -0.029704068) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.039973997, -0.039424386, -0.00023192639, 0.08071814, 0.096021704, -0.20885538, -0.12213241, -0.023790348, 0.09664941, -0.10268222, 0.13096042, -0.05173415, -0.37291482, 0.07015618, -0.33403385, -0.083771) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.03271248, 0.30518225, -0.07270691, 0.028075088, -0.05705947, -0.15325841, 0.100330696, -0.025110118, -0.076902226, 0.14327222, 0.06624428, 0.13375239, 0.37281695, 0.07052823, -0.14584045, -0.21908635) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.120670766, 0.31895483, 0.025020262, -0.07187204, 0.12886079, -0.044927042, -0.016122498, -0.042634714, 0.13163976, -0.042178337, 0.1995516, 0.0356841, 0.15696648, 0.08892613, 0.21146311, -0.119200125) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.07862659, -0.04457566, 0.026738126, -0.21411496, 0.10438254, -0.18654525, -0.01533368, 0.13947518, 0.10588101, -0.028714191, 0.15771964, 0.121909015, -0.10983157, 0.2185668, -0.068225995, -0.12562555) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.12062531, 0.0967178, 0.09571875, 0.23502766, 0.09096207, -0.21987092, 0.024857553, -0.048271395, 0.14787363, -0.033102654, 0.13895266, -0.04427544, 0.04914057, 0.048905186, -0.057733577, -0.26991108) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.06448222, 0.0056067007, 0.06258581, 0.16081811, 0.11269595, -0.120004445, -0.013984294, -0.13933693, -0.07139989, -0.052229576, 0.14940026, 0.023361623, -0.09279362, -0.18860416, 0.08875797, -0.007527515) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.074545845, 0.030673563, 0.15330285, 0.13776723, 0.10154421, -0.092071116, 0.04683676, -0.06964785, 0.10431926, 0.08699972, 0.23528512, -0.033892516, -0.14641368, 0.117580056, -0.004050138, -0.02582363) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.14190136, 0.077225044, 0.09930474, 0.007267315, 0.092006706, 0.037188467, -0.027249279, -0.054990012, -0.03665177, 0.12651706, -0.100975744, -0.09072935, 0.24675299, 0.06761549, -0.05267532, 0.10347854) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.10791531, -0.1370413, -0.08286376, 0.03607253, -0.0308955, 0.07522176, 0.018555947, -0.12568206, 0.112782314, 0.28888306, -0.003996075, 0.028732201, 0.25184667, -0.2680978, 0.02647103, -0.046891168) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.016372435, 0.010370288, 0.048521012, 0.17552224, 0.12718126, -0.07016058, 0.07195029, -0.020361308, 0.12597205, 0.08013731, -3.848295e-05, 0.0050118286, -0.009566892, -0.20061424, -0.03470485, -0.006634675) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.014340514, -0.061068784, 0.073101744, -0.026097663, -0.060043298, 0.03856278, -0.06831028, 0.01917565, 0.0030782523, -0.27292702, 0.009022088, -0.0835327, 0.15536709, 0.19875537, -0.04220971, 0.12280315) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.05038896, -0.0450083, 0.11035315, 0.017889546, -0.04486168, 0.02630088, 0.076166764, 0.040405206, 0.101371124, 0.013579925, -0.14421356, 0.10385705, -0.040398728, 0.16730694, 0.21123065, 0.08927596) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.14247608, -0.020986153, 0.23048729, 0.016399987, 0.08749712, -0.042591766, 0.10078401, -0.235661, 0.16211063, 0.06193226, -0.074332505, -0.016298788, 0.045263976, 0.15765212, 0.07818007, -0.04620609) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.021306554, -0.09750117, 0.08551645, -0.04607957, 0.023408834, -0.023608467, -0.20876807, -0.059991024, 0.073818475, -0.011034656, 0.021592963, 0.2020669, 0.0658326, -0.037186112, -0.12142336, 0.024981985) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.14970483, -0.034374855, 0.059193425, -0.053641498, -0.012546929, 0.12899692, -0.14678986, 0.010604312, 0.06670342, -0.16510558, 0.008418653, -0.07479036, 0.18447658, -0.048377503, -0.09458383, 0.0069656954) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.058000036, -0.16915704, -0.019119963, -0.045525633, -0.037617203, 0.25589603, -0.25075126, 0.06523698, 0.17653236, -0.061193496, 0.06445885, 0.012287812, 0.102899276, 0.110979825, -0.22975717, 0.1812179) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.06707089, -0.20528378, 0.046027422, 0.09201046, -0.026794929, -0.14959913, -0.1530082, -0.11166134, -0.1543093, -0.018212209, 0.1530343, 0.16413027, -0.041838966, 0.10568013, 0.027219504, -0.045931514) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.0007681395, 0.027546167, -0.055535425, -0.16842778, 0.031941716, 0.10155229, -0.15778649, 0.20752658, -0.040377192, -0.30390355, -0.023281433, -0.030623253, -0.09503612, -0.17188235, 0.09639771, 0.006249103) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.06934318, -0.0011609821, -0.1791592, 0.03465803, -0.24253, 0.05893978, 0.13887544, -0.07227747, 0.01218867, 0.029141122, -0.05214466, -0.12778749, -0.1760804, -0.06785066, -0.007493355, 0.14466043) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.018881964, -0.05313997, 0.026167642, -0.11774113, 0.106899664, -0.04816693, -0.032971296, -0.2197493, -0.30351043, 0.41334164, 0.09371295, 0.117004104, -0.32039383, 0.21075623, 0.059145812, 0.22701162) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.15627995, -0.068059504, -0.025623176, -0.099454194, 0.053013522, -0.1204116, -0.019655226, 0.07376517, -0.25296777, -0.08185056, -0.055070046, -0.0901355, -0.11905481, -0.05469155, -0.017616548, -0.081166655) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.13076767, -0.05530982, -0.050112855, -0.12159198, -0.13501246, -0.003588778, -0.13545947, 0.11865785, -0.05613547, -0.068032116, -0.08055732, 0.21331398, 0.004210958, 0.0020068642, 0.028101314, -0.09094483) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.06359586, 0.13318597, -0.013024477, 0.108700395, 0.11144461, -0.20727357, -0.024350716, -0.22389533, -0.09566586, -0.0131226955, -0.11817035, 0.09054735, -0.27647895, 0.07672232, -0.047891885, 0.071800984) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.030071015, 0.1333995, 0.031153332, -0.086189225, -0.0019152679, -0.01622374, 0.040289503, -0.15809211, -0.12741992, 0.10740146, -0.051979292, -0.116695315, 0.320744, 0.0039460426, -0.0836046, -0.09634563) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.09536935, -0.052188914, 0.047246125, 0.015771315, 0.044488825, -0.08132813, -0.27927315, -0.13175185, 0.024771225, -0.24907906, -0.023289192, -0.04971131, 0.05681843, 0.07283831, 0.064641275, -0.26641592) * go_3(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.027925663, -0.1507286, 0.1326965, 0.016842714, 0.008826637, -0.16630088, 0.057058703, -0.18538098, -0.023735443, 0.032016642, 0.12527052, 0.16732964, 0.086843535, 0.035672616, 0.2063971, 0.09174031) * go_4(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.1374101, 0.0033208288, 0.10667102, 0.010594156, 0.046161152, -0.0973723, 0.038522966, 0.021097187, 0.016156282, -0.19751011, 0.28385642, 0.05756371, -0.05513193, -0.2048188, -0.21631682, 0.07647592) * go_4(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.17377815, 0.15260585, 0.053718828, 0.05137225, -0.022358606, -0.1206224, 0.18654475, -0.36442846, 0.037749466, -0.1104878, -0.11404351, -0.06023782, 0.20938018, 0.07982189, 0.07250349, -0.07269494) * go_4(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.21727799, 0.060607027, 0.020804053, 0.18055809, 0.065868735, 0.027194923, 0.07823965, -0.0036479903, -0.00017318636, 0.08600115, -0.025587326, 0.07114245, -0.019529548, -0.13423847, 0.13471194, 0.09455981) * go_4(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.0054947184, 0.08912019, -0.0287804, 0.06010462, 0.01399159, 0.06061662, -0.11517458, -0.097311266, 0.050931722, 0.22020856, 0.1323814, -0.04628687, -0.11665284, -0.28899986, -0.24807844, -0.26831678) * go_4(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.030188283, -0.03878683, -0.017246237, 0.06085806, -0.018588748, 0.022792742, 0.25868282, -0.07614454, 0.13609566, 0.048479818, 0.1144347, -0.11878534, -0.0087716095, -0.10999109, -0.052827284, 0.05120022) * go_4(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.13541034, 0.01645716, -0.058492333, -0.038296085, 0.100599736, -0.116733365, 0.04200369, -0.025886245, 0.10077625, -0.16246797, -0.17139618, 0.1154542, 0.048264973, 0.28143618, 0.21083501, 0.1901906) * go_4(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.17519377, 0.11165914, 0.06639653, 0.07394748, -0.007674659, 0.16630298, 0.19389485, -0.095608205, 0.08834474, -0.014449134, -0.1498579, 0.10741625, -0.15439212, 0.067960866, -0.037635356, -0.15552957) * go_4(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.06438933, 0.014048397, 0.10090704, -0.113563396, 0.16256817, 0.05490672, 0.07492557, -0.117161274, 0.21595421, -0.043381806, -0.051558085, 0.1740199, 0.2152678, 0.2786416, 0.16830157, 0.2127052) * go_4(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.15677509, -0.43225375, 0.060302902, -0.25911507, 0.33240193, -0.042785197, 0.12322616, 0.060724694, 0.19070825, 0.06739152, -0.11829862, -0.29873747, 0.044883754, -0.02737334, 0.35752672, 0.027660733) * go_5(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.031477857, -0.061355617, 0.14307205, -0.27185053, 0.0042110113, -0.17895593, 0.18448347, 0.1663187, -0.027779656, -0.038476624, -0.20109327, 0.0049036117, -0.33461937, -0.11617029, 0.16388293, 0.08732086) * go_5(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.14116575, -0.2656471, 0.11648339, -0.0032394545, 0.1182878, -0.3112847, 0.022472465, 0.01861419, -0.17598355, 0.09062213, -0.078444645, 0.08435301, -0.076718464, -0.27557522, 0.2719488, -0.2709603) * go_5(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.27406302, -0.038197294, 0.08674393, -0.1581159, 0.13235791, -0.2564229, 0.1109576, -0.0176378, 0.15548801, -0.0590908, -0.017661547, -0.2397164, -0.13061532, 0.23031203, 0.13042833, -0.1644423) * go_5(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.07506608, 0.038386136, -0.079568535, -0.14536263, -0.14519933, 0.049832735, -0.0716522, 0.08434604, -0.12847446, 0.0008543391, -0.14790097, 0.021308336, -0.28987315, 0.2929442, -0.057600517, 0.0779305) * go_5(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.026810233, 0.11869411, -0.11281911, -0.14480188, -0.22689806, 0.28260702, 0.08524954, -0.016079135, -0.139977, 0.1590218, 0.24256052, 0.11876038, 0.1039834, 0.10720082, 0.15955658, -0.08241476) * go_5(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.0018456473, -0.044888236, 0.2312576, -0.2259125, 0.1552541, -0.10646746, 0.25436193, -0.0140782725, -0.11281806, -0.045578834, 0.089749135, -0.14050213, 0.09813328, -0.5474639, 0.084324725, -0.13670866) * go_5(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.18577714, 0.0991832, 0.02898408, 0.04317898, 0.25488335, -0.30257443, 0.0083487155, 0.00078779995, -0.0014885734, -0.116033524, -0.12751958, 0.20800439, -0.13863127, -0.14012383, -0.082795866, 0.07694529) * go_5(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.124679685, 0.012901697, 0.15855546, -0.031145798, 0.044944238, -0.1519666, -0.015208867, 0.029840399, 0.07195047, 0.17145973, 0.06601934, -0.03358433, 0.16031715, 0.16808309, -0.007914282, -0.19619752) * go_5(pixel.xy, 1, 1);
  result += vec4f(-0.109316595, 0.025873583, 0.05582306, 0.10272255);
  textureStore(conv2d_6_tf2_tex, pixel.xy, result);
}
