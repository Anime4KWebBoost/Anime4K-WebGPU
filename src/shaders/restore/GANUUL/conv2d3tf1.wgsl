// Layer: Anime4K-v4.1-Restore-GAN-(UUL)-Conv-4x3x3x32
// Name: conv2d3tf1
// Inputs: ['conv2d_tf', 'conv2d_tf1', 'conv2d_2_tf', 'conv2d_2_tf1']
// Output: conv2d_3_tf1
@group(0) @binding(0) var conv2d_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_2_tf_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_2_tf1_tex: texture_2d<f32>;
@group(0) @binding(4) var conv2d_3_tf1_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_1(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_2(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_4(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_2_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_5(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_2_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_6(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_2_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_7(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_2_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_3_tf1_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.39232063, -0.31443354, 0.016747609, -0.19821034, -0.11440283, -0.108339086, 0.09855654, 0.09687135, -0.15667859, -0.30788472, -0.057983518, -0.30048364, -0.5892024, -0.03315241, 0.036535796, 0.042668976) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.12170337, -0.31539497, -0.0080226185, -0.28167912, -0.026236918, 0.26168135, -0.086754136, 0.07140889, -0.11411177, 0.15551405, -0.04641522, 0.046217185, 0.080186784, -0.0001861396, -0.5990683, -0.24228567) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.0850365, -0.10327682, -0.1407833, 0.15661862, -0.1448079, -0.2993967, 0.08681482, 0.00483843, 0.18711449, 0.12147834, 0.114697695, -0.015375287, -0.39649305, -0.22024211, -0.08587565, -0.002201199) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.30565795, -0.3130614, 0.15354335, -0.21783416, -0.3877839, 0.003429585, -0.21440028, -0.024295159, 0.35766846, 0.02559725, -0.120454274, -0.10827954, -0.3355037, 0.6561727, -0.065990135, 0.30999345) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.46554184, 0.43995824, 0.25583804, 0.20159459, 0.03730261, -0.15794723, 0.16795531, 0.11421282, 0.17099904, -0.22430302, 0.072461665, -0.06345064, 0.36006132, 0.47494593, -0.18869492, -0.04085313) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.27438906, 0.00022448118, 0.099661484, 0.1397181, 0.12914467, -0.102830835, 0.045909263, -0.07967794, 0.2870382, 0.055183165, -0.031485636, 0.029727582, 0.37630266, 0.9301813, 0.28615892, 0.122112595) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.15251397, 0.09909433, -0.17192633, 0.0061163795, 0.06472459, -0.04261906, -0.13661696, -0.077453144, -0.7501463, 0.017666366, 0.16321932, 0.043644384, -0.05170323, 0.46000114, 0.32755983, 0.28597534) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.48834783, -0.038160775, -0.08875091, 0.04970968, 0.4627543, 0.03755849, 0.2540123, -0.21826492, -0.38032553, 0.32484698, -0.008446612, 0.23523396, 0.02375393, 0.27418464, -0.28132874, 0.15265541) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.13747992, 0.11715287, 0.13201898, 0.0015658925, -0.2934619, -0.39777488, -0.07560646, -0.10565406, -0.04838937, 0.08350108, -0.019061742, 0.16467288, -0.05936286, -0.015435401, 0.4184143, 0.10496155) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.3240166, 0.08215981, -0.2075559, 0.19689886, 0.11150226, 0.06310339, -0.13621064, -0.15570635, 0.33679137, 0.04409631, -0.28714085, 0.031056935, 0.6626613, -0.08051886, 0.1722458, -0.22435535) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.24195263, -0.04580777, -0.4145571, -0.1574205, -0.042835433, 0.03784082, -0.026375433, 0.35892, 0.15977724, 0.0630263, -0.088371195, 0.02971135, 0.25729623, -0.15589325, 0.14479266, -0.05088765) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.48559383, -0.25281984, 0.36621982, -0.21811092, -0.32971957, -0.035721473, 0.019352507, -0.06045977, 0.2761817, 0.19758923, 0.089941375, 0.041624714, -0.041388534, 0.16949178, 0.031209668, -0.064278066) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.32959136, 0.5905178, -0.121284775, 0.004792909, 0.23675677, -0.020328185, 0.13438764, 0.24885756, -0.17519131, 0.13370351, -0.1229379, 0.048159435, 0.17464967, -0.42540422, -0.13947602, 0.22700138) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.33010545, 0.31171462, 0.405461, -0.19268602, -0.19920933, -0.05938957, 0.0026099307, -0.24588005, -0.80367726, 0.67246026, -0.2002546, 0.06855837, -0.21781918, 0.74446076, -0.5982218, 0.2985812) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.5674039, -0.4777194, -0.13907014, 0.12356176, -0.2920615, 0.0718882, 0.17865288, 0.20312083, -0.27032906, -0.34635755, 0.16373387, 0.03063499, -0.19903831, -0.19363025, 0.10843769, -0.26495013) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.17949842, -0.29433724, -0.23462017, 0.09636558, 0.20076938, -0.24068621, -0.056744654, 0.10993452, 0.04466387, -0.2755299, -0.13640761, -0.024520185, -0.46797183, 0.367952, 0.11696459, 0.22428559) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.011885658, 0.0891566, -0.037328225, 0.121865466, 0.048127756, 0.19165848, 0.031010484, -0.059921212, -0.21560976, -0.1529375, 0.12882216, 0.026642917, -0.11849831, 0.1641988, -0.06821976, 0.038913097) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.014311083, 0.0046286825, 0.03766498, 0.030933104, 0.3158337, 0.014788744, -0.25061515, 0.3439588, 0.3746984, 0.011211178, 0.06807453, -0.14517218, -0.08588519, -0.44777295, -0.14026845, -0.112901196) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.30676752, 0.22429968, 0.010868903, 0.19810227, 0.07854048, 0.0401537, -0.21871732, 0.024473034, 0.0754844, 0.21695364, 0.015986437, 0.32385147, -0.049408115, -0.0382484, -0.109464966, -0.17461152) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.08928476, 0.16673279, 0.04767194, 0.09194907, 0.048144393, 0.10040854, 0.34817588, 0.038137782, 0.036133062, -0.037641533, 0.28543243, -0.2839514, -0.11791945, -0.19487488, -0.11268661, 0.05276339) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.16383977, -0.31993598, 0.05208131, -0.0903597, 0.11033569, -0.0088908225, -0.054778915, -0.08319848, -0.06639396, -0.24900046, -0.2512979, -0.0019553688, -0.048192777, 0.03562768, 0.047395132, -0.05525853) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.7830732, -0.4262562, -0.2673563, 0.13023588, 0.31384844, 0.1693089, 0.048528794, 0.15604164, -0.39588538, -0.08493865, 0.3310555, 0.08203675, -0.066885136, -0.0058401288, -0.17974985, -0.16163951) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.6983336, -0.59333223, -0.20371103, -0.3932194, 0.10534863, 0.04589214, -0.12699358, -0.15107739, -0.43941692, 0.13968801, -0.1860207, 0.25864246, -0.31358764, 0.02336987, -0.114363804, -0.2314969) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.13214386, 0.2762571, -0.07932436, -0.011312506, -0.1585973, -0.01644935, 0.0013558406, 0.073481865, -0.38878354, -0.008272082, -0.010028009, -0.12177282, -0.19708647, -0.20147185, -0.009344351, -0.039000046) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.36948234, -0.027262207, 0.073340006, -0.11237642, -0.014205325, -0.033619095, 0.090520136, 0.044478547, 0.89536375, -0.25342697, 0.06966775, -0.25697634, 0.44092584, -0.02181121, -0.23286918, -0.16207126) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.5282722, 0.2186328, -0.06594115, -0.005403383, -0.9999943, 0.1652842, -0.40371686, 0.045263674, 0.48378405, 0.5981784, -0.8636207, 0.48454443, 0.61362064, 0.40381622, -0.20037466, -0.35095415) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.15710682, -0.082183905, 0.025527366, -0.06832543, 0.45136708, 0.28492203, 0.21369967, -0.1544125, -0.21440476, 0.2747644, -0.07809032, -0.05409878, -0.09492401, -0.0042038485, -0.08335747, -0.1286338) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.092377424, -0.29580644, 0.037406705, -0.057557207, -0.068813734, 0.025797142, 0.005817593, 0.13936609, -0.5533757, -0.0055351052, 0.3490144, -0.10275609, -0.3246664, -0.22240998, -0.06546209, 0.04502687) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.040512305, -0.15789752, 0.3350875, 0.3248354, 0.11479105, 0.072781734, 0.11961662, 0.009017058, -0.7485467, -0.2354417, -0.18182847, -0.39436963, -0.21553181, 0.06693962, -0.10265758, -0.101919465) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.29808417, 0.16832493, -0.36638075, -0.003277357, 0.30853003, -0.11783712, -0.04467285, 0.09799486, -0.29557002, -0.051879432, -0.10781173, -0.012533523, 0.13472205, 0.0886817, -0.095418304, 0.20694672) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.54963315, -0.51755005, -0.11815116, 0.44336796, -0.26965025, 0.063990854, -0.06830417, -0.22906917, 0.15537436, -0.12382655, 0.040594, 0.13573219, -0.32865304, -0.051071506, 0.07789849, -0.17451958) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.108385645, 0.19099213, -0.13721561, -0.10001342, 0.36975056, -0.15690732, -0.011564509, -0.4645765, 0.9664348, -0.4172701, -0.12434381, -0.20082358, 0.025960991, -0.07957984, 0.06240927, 0.06882944) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.55891496, 0.5313842, -0.0052928664, -0.31153533, 0.27312106, 0.11299291, -0.20902458, -0.22780886, 0.18460937, 0.20829925, -0.22429292, 0.11375158, -0.24776565, 0.013294957, 0.108396605, 0.18705682) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.17449534, -0.014089195, -0.005522746, -0.26652694, -0.3059182, -0.077219255, 0.13172182, 0.22815189, 0.29824528, -0.0018969525, -0.049221557, -0.02434726, 0.28403616, -0.30762187, -0.18281007, -0.069536164) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.11734828, -0.099142194, -0.1678673, 0.113515854, -0.16090973, -0.018343726, 0.09375435, -0.11457814, 0.29799998, 0.14911132, -0.030187404, -0.0033569376, 0.51210696, 0.20057757, 0.018672027, -0.00072862353) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.4207862, 0.23023506, -0.045380734, 0.35523587, -0.31482896, 0.0016041965, 0.031437084, -0.11878056, -0.09631354, -0.44702205, 0.07262705, -0.019627657, 0.27565527, 0.30019623, -0.2416735, 0.13827145) * go_3(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.21828848, -0.05362182, 0.092769556, 0.058445822, -0.015375804, 0.032911193, -0.016062194, 0.0023879025, -0.07955863, -0.18912281, 0.100602634, 0.18384646, 0.09833795, 0.13066116, 0.08606998, 0.060196545) * go_4(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.30196983, -0.13994773, -0.04102513, -0.021608166, 0.15173563, -0.0014104879, 0.013970848, 0.069105186, -0.046455324, -0.55526954, 0.39444688, 0.0815259, 0.10904215, 0.21681397, 0.06073383, 0.10265119) * go_4(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.11820481, -0.05975609, -0.13999549, 0.030522387, -0.013776436, -0.14367265, 0.009655233, -0.020354088, -0.117309436, -0.21025649, -0.0852297, 0.0050804066, 0.07790261, -0.07352538, -0.016056273, 0.030884959) * go_4(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.01982244, -0.14982677, 0.08542808, 0.114587806, -0.093505375, 0.009862345, -0.17831016, 0.15021613, 0.017223043, -0.05448468, 0.19507179, 0.005433668, -0.28699195, -0.0943735, 0.005008677, -0.084489435) * go_4(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.17592743, 0.16011396, -0.4458925, 0.03776147, -0.22227006, -0.1765121, -0.023907507, -0.12340803, 0.69395095, -0.42174822, 0.2619632, -0.08317782, 0.06564856, -0.07574905, 0.19617046, -0.15101147) * go_4(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.0031664995, 0.0048539517, -0.029761892, -0.024908772, 0.038988, 0.083212, 0.022871153, 0.049879767, 0.5655658, -0.39324993, -0.41707525, -0.00069710996, -0.088931695, 0.5349101, -0.03700674, 0.19864099) * go_4(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.09978203, -0.12430744, -0.005363638, -0.078683436, 0.16000083, 0.09070007, -0.08223272, 0.10610758, -0.09339724, -0.25193405, 0.060660124, 0.022009233, 0.028552014, -0.30671445, 0.04395066, -0.022646846) * go_4(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.0025377637, -0.10979372, 0.0953052, -0.041535445, 0.028650977, -0.18192725, -0.13626699, -0.04126641, 0.41577348, 0.070594355, 0.17786773, -0.0019128436, 0.21811736, -0.3097873, -0.1697477, -0.05985297) * go_4(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.0029388457, -0.08754279, -0.057417464, -0.045205314, 0.14254501, -0.14048617, -0.029115621, 0.017037913, 0.23511319, 0.58405197, -0.045535047, -0.093041405, 0.24495944, 0.048594877, 0.16573521, -0.016364215) * go_4(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.0061783222, 0.03700483, 0.03310341, 0.03506661, 0.18640573, 0.060847793, -0.03938158, 0.002558664, 0.0066146054, -0.03961683, 0.11786358, -0.018774983, -0.023232952, -0.018498667, -0.02113431, -0.03875601) * go_5(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.07762769, 0.3220323, 0.0019882289, 0.11455374, 0.12809245, 0.054234043, -0.032796185, -0.004923056, 0.03533371, 0.23241599, -0.047939382, -0.005454499, 0.018655885, -0.06090632, -0.074992895, -0.022785714) * go_5(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.024499241, -0.0656105, 0.033745233, -0.06109949, 0.02657246, 0.099547654, 0.048236806, -0.08930123, -0.028375195, 0.21267472, 0.04065708, -0.029539475, -0.0034377375, -0.076174065, -0.08033416, 0.014191793) * go_5(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.09567274, 0.17149109, 0.057815317, -0.02354373, -0.053182393, 0.07036649, 0.11426706, 0.0073960987, -0.042224813, -0.03242704, 0.028637128, -0.018156664, 0.027350018, -0.059693146, -0.025782553, -0.059870392) * go_5(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.29396304, -0.14174098, 0.044468317, 0.048983667, -0.09083888, 0.14550914, -0.17293338, -0.019666478, -0.27275094, -0.026832746, -0.16039373, 0.05072858, 0.13158675, -0.0014240668, -0.19267258, 0.028367419) * go_5(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.14670749, -0.20505863, -0.25351146, -0.18028821, -0.09074548, 0.12591866, -0.11648123, 0.08052676, -0.1030718, 0.055071495, -0.027647234, 0.036372066, 0.042164043, -0.24193078, -0.018126357, -0.08488727) * go_5(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.002951344, -0.07835709, 0.0412822, 0.024059866, -0.17239328, -0.045480777, 0.031516057, -0.02321261, 0.16131492, -0.108720064, -0.13902234, 0.009038252, 0.019813707, -0.13780454, -0.08646045, -0.03967984) * go_5(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.087156996, -0.43204084, 0.08196673, 0.09000798, 0.11798731, -0.2800244, 0.013827372, 0.006278623, -0.027538646, -0.47985002, -0.07989979, 0.0101940865, 0.11476763, -0.08189494, -0.107904315, 0.0034190493) * go_5(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.10922693, -0.13929938, -0.14316928, -0.06415228, 0.10821941, -0.09326445, -0.10437615, -0.019490898, 0.02572968, -0.23569673, -0.18372843, 0.018998442, 0.019020457, -0.078145295, -0.12052183, -0.02904386) * go_5(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.047391865, -0.14862657, 0.10497325, -0.0060389596, 0.04090357, 0.07597069, -0.16701244, -0.045025267, 0.05439692, -0.0046527646, 0.10107427, -0.017686805, -0.09081038, 0.0033508723, -0.07428749, 0.083581686) * go_6(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.24039297, 0.10254748, -0.08497433, 0.06220285, -0.21642606, 0.06099548, 0.05618001, 0.027991194, 0.11916666, 0.001376908, -0.04484436, -0.063753836, -0.080493644, -0.12548241, 0.22396187, -0.060979564) * go_6(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.09228674, -0.10189853, -0.019978495, 0.055631284, -0.056667626, 0.042379495, -0.11306628, 0.015792474, -0.024159636, 0.17669754, -0.0015470447, 0.030659685, 0.049270805, 0.01379507, -0.07484134, 0.03997324) * go_6(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.08015897, -0.1573799, -0.0068566655, 0.024327071, -0.00024650464, -0.11511224, 0.10626316, -0.09424342, 0.035164617, -0.0071606585, 0.023877172, -0.0032834266, 0.03981932, 0.00094573526, 0.07893367, 0.058131382) * go_6(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.09480482, -0.13352568, 0.11975561, 0.04046284, 0.017295167, 0.14661242, 0.034784466, 0.16060774, 0.12513426, 0.11618688, -0.19043984, -0.006898629, 0.33333287, 0.02068534, -0.144777, 0.054585308) * go_6(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.040517613, 0.13882688, -0.10775904, -0.01107748, -0.22891715, 0.023514308, -0.07362997, 0.050480675, -0.15309371, 0.22601646, 0.050979435, 0.0078024655, 0.09704638, -0.113768086, 0.159759, -0.19680989) * go_6(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.038060542, 0.060299598, -0.06167331, 0.070311025, -0.056030717, -0.10937594, -0.094534926, -0.05876128, 0.04186674, 0.05846574, 0.046057925, 0.050594475, -0.15031303, 0.033675846, 0.14669393, -0.020838607) * go_6(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.006198633, 0.008096492, -0.061412863, -0.038600348, 0.13099104, -0.024788823, 0.143207, 0.08146842, -0.09880114, 0.020192526, 0.093205445, -0.006562488, -0.10218187, 0.34932604, 0.017245278, 0.022239687) * go_6(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.019581253, -0.071536854, -0.079313144, 0.0039378665, 0.04372604, 0.0350227, -0.13975748, 0.02514243, 0.1482172, -0.1795845, 0.016553031, -0.114758186, -0.13846005, 0.028443053, -0.0028277517, 0.073823154) * go_6(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.019089226, -0.002865448, 0.114264086, -0.14795631, 0.052681867, 0.06782111, 0.005056374, 0.03333905, -0.045924906, 0.1271522, -0.022228748, 0.09460952, 0.0257857, -0.0404471, -0.100172006, -0.009518522) * go_7(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.0919395, 0.024952088, 0.02894272, -0.02876963, -0.17500453, 0.22578874, -0.05303085, -0.0015600728, -0.0076474883, -0.0018742654, 0.044667635, -0.029744165, -0.00179505, -0.012467833, -0.12192312, 0.034183223) * go_7(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.11467171, 0.036459688, -0.12508968, 0.062637016, 0.05442847, 0.023415027, -0.058653936, 0.27762222, 0.0033886922, -0.056405902, -0.1611357, -0.042607184, -0.029176304, -0.033276357, -0.060190573, 0.006230224) * go_7(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.10476976, 0.20189178, 0.013450291, 0.017824117, -0.07174306, -0.16174208, -0.0790696, -0.13154395, -0.119226985, 0.03126223, 0.08976427, -0.0017329347, 0.03171847, -0.062868886, 0.04638837, -0.03491934) * go_7(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.059950083, 0.10400816, -0.046370424, -0.012014035, -0.43914387, -0.18396273, -0.060568314, 0.010451131, -0.43835276, 0.026284682, 0.1604382, -0.10625134, 0.044843365, 0.10809218, 0.06464759, -0.046850365) * go_7(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.06787761, -0.042850304, -0.15407841, 0.058458067, -0.17467526, 0.096576124, 0.21345392, 0.09298287, -0.01394914, -0.13355762, -0.13184176, 0.0003088022, 0.046734177, 0.028196447, -0.13506489, 0.0067693642) * go_7(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.053602345, -0.08111152, -0.017126815, -0.028242027, 0.092225246, 0.076781385, -0.089152336, 0.0012632497, -0.09276537, -0.24698547, 0.04423726, -0.06601727, 0.01814881, -0.13947123, -0.032667328, -0.019452555) * go_7(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.0888714, -0.14888728, -0.03935948, -0.020991955, -0.07616056, -0.04555924, -0.09465727, -0.13786288, -0.305734, -0.3085076, 0.03795676, -0.021256099, -0.012537832, -0.23650081, -0.07035176, -0.028411875) * go_7(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.0868341, -0.14694329, 0.08679206, -0.014810077, 0.022454316, -0.094533004, -0.17521082, -0.0076950863, -0.077531025, 0.11369054, -0.131653, -0.014213835, -0.08936547, -0.123560406, -0.031929504, 0.017496165) * go_7(pixel.xy, 1, 1);
  result += vec4f(0.05049932, 0.08230575, 0.58376503, 0.86909854);
  textureStore(conv2d_3_tf1_tex, pixel.xy, result);
}
