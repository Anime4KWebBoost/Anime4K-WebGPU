// Layer: Anime4K-v3.2-Upscale-CNN-x2-(VL)-Conv-4x3x3x16
// Name: conv2d1tf
// Inputs: ['conv2d_tf', 'conv2d_tf1']
// Output: conv2d_1_tf
@group(0) @binding(0) var conv2d_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_1_tf_tex: texture_storage_2d<rgba16float, write>;
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


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_1_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.0056740534, -0.21186607, -0.18014967, 0.118979976, -0.0015611284, -0.07708486, 0.060131397, 0.11653345, 0.027150517, 0.10837246, 0.08583816, -0.14032431, 0.017552888, 0.0035846964, 0.03980114, 0.064649396) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.03289318, -0.12004539, 0.26514888, -0.15079662, 0.04214227, -0.027273783, -0.027950313, 0.19614808, 0.18510003, -0.10346252, -0.029836183, 0.09174428, -0.0088710375, -0.18273513, 0.06601674, 0.009983851) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.08476211, 0.043996535, 0.056711517, 0.009976895, 0.07039107, -0.024862664, -0.059921104, 0.046850603, 0.04983447, 0.04863198, 0.21777405, -0.0576961, 0.045321796, -0.0060038245, 0.096396215, -0.10842004) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.15746164, 0.041757874, 0.035169285, -0.1734288, -0.24219254, -0.13318908, 0.2272079, -0.02902605, 0.07750601, -0.1467191, -0.12296749, -0.07533314, -0.07073083, 0.17909113, 0.04789308, 0.17245363) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.057547905, 0.1464685, -0.33115456, -0.26956198, -0.26298407, -0.059824817, 0.022509675, -0.09251868, 0.36277944, -0.2072429, 0.21095088, -0.45492023, 0.07428653, 0.1593302, -0.2945834, 0.12825087) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.1318458, 0.27804148, 0.037600737, 0.12047866, 0.0065036337, 0.0017241207, 0.060497303, -0.14786585, -0.15149063, 0.02731698, 0.048886403, -0.0025970868, -0.026979815, 0.07348884, 0.015636757, -0.107966796) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.079988025, -0.01626299, 0.06517438, 0.086406484, -0.1484504, 0.070595, 0.20620634, 0.09713373, -0.13620836, 0.012067949, -0.00068703433, -0.038030174, 0.22300471, -0.0012400965, -0.014827909, -0.08927486) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.15634936, 0.052028038, 0.038081627, 0.12720168, 0.07342066, -0.04318368, -0.0065998454, 0.12109317, -0.45398173, 0.03666754, -0.17773737, 0.038516667, -0.13009632, -0.007457001, -0.013938809, 0.09776142) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.029636936, 0.12864171, 0.11347291, -0.11812842, -0.0870342, 0.035678383, 0.050338242, 0.045754932, -0.07072752, 0.010447726, 0.039642975, -0.08795004, -0.1191525, 0.00967509, 0.13485421, -0.053204738) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.011072695, -0.09613245, -0.09094804, 0.028029291, -0.04031162, 0.15690295, 0.25094184, -0.21776834, 0.06524669, 0.06412185, -0.052852992, -0.08097702, -0.039127756, 0.036357917, 0.104585476, 0.25095442) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.08328618, -0.006246033, 0.099708706, -0.014916097, 0.17727195, 0.4369228, 0.14760216, 0.06707674, 0.025167737, -0.022487842, -0.038962565, 0.15380669, 0.08125089, 0.09844594, 0.33538374, -0.003161368) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.0128195705, -0.05475118, -0.037705053, -0.0012077648, -0.17425515, 0.091487505, -0.12909423, 0.0074876705, 0.13438368, 5.778033e-05, 0.04563314, -0.12185897, -0.053612474, -0.049824294, -0.12851205, 0.12856449) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.025741795, 0.01867236, -0.00027440622, 0.10502768, 0.27042285, -0.14947751, 0.11143123, 0.2575913, -0.07414089, -0.33919522, -0.13194235, -0.20088726, 0.23121537, -0.08197353, 0.06693911, 0.015411386) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.09143717, 0.22842278, 0.06501074, -0.20009698, -0.042117566, -0.23452093, -0.074082755, -0.10612558, 0.077631965, 0.08343657, -0.07657599, -0.43297377, 0.7092466, -0.16272525, 0.17222248, -0.056038965) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.081200436, 0.046752565, 0.028254949, 0.18820632, 0.096592255, 0.05896745, 0.14845169, 0.034777895, 0.07195204, -0.1908046, -0.015341971, 0.02606145, -0.010377239, 0.0755547, -0.15285216, 0.047916733) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.06825636, -0.049540907, -0.024328846, 0.03506251, 0.2060094, 0.054119263, -0.06671269, 0.052428722, 0.055792283, -0.14336903, -0.03180757, 0.013760968, -0.037398104, -0.06880077, -0.023608573, 0.0360965) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.16937497, -0.30156836, 0.0021435453, 0.025772978, -0.17990975, 0.046133514, -0.32447076, -0.083382785, -0.081322014, -0.022132374, -0.05319431, 0.11794733, 0.08943906, 0.12927428, 0.105764806, -0.051034793) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.011012306, 0.047636557, 0.050260928, 0.051847618, 0.010985655, -0.13752967, 0.023869954, 0.07011459, -0.18244945, 0.07239806, -0.013638856, -0.026982805, 0.11395993, -0.031304818, -0.08714153, 0.077115685) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.08707592, 0.2265186, 0.13363098, -0.039588258, -0.029561255, 0.019238092, 0.024606103, -0.0019022018, -0.062285982, -0.0629511, -0.03753033, 0.109805316, 0.016018672, -0.08284564, -0.04092752, -0.030386891) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.0016500859, 0.01616536, -0.099148355, 0.24161765, 0.028064307, -0.028680569, 0.054400917, -0.1978921, -0.08584302, -0.096797146, -0.06546965, -0.09342837, 0.030265866, 0.07057579, -0.02080932, 0.053178705) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.030304352, 0.047440585, -0.04248429, 0.08568772, -0.051317703, 0.036739342, 0.00865767, -0.018183297, -0.07335176, 0.025001721, -0.068509035, 0.1814819, -0.09756565, -0.024179723, -0.05959287, 0.0352454) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.023015196, -0.022870664, -0.12028372, -0.111095205, 0.11065281, -0.19900022, -0.24012049, -0.017028643, -0.13484617, 0.050107025, 0.10741765, 0.037951697, 0.013090438, -0.0010045726, -0.029447839, -0.1859787) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.17922719, -0.24138594, -0.44595388, -0.032014426, 0.06897096, 0.07125395, 0.1944457, -0.035794795, -0.24022278, -0.13230884, -0.1277025, 0.21229011, -0.12249393, 0.06141907, 0.2687936, -0.26896995) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.0397242, -0.30710965, 0.28815824, -0.06642567, -0.07588877, -0.019552408, 0.0057806037, 0.11465521, 0.03560534, -0.10640553, 0.023589289, -0.16667193, 0.02066607, -0.01026633, -0.02655378, 0.082493655) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.007902949, -0.08501038, -0.029395591, -0.07072227, -0.01800967, -0.14564751, -0.08372804, -0.049974415, 0.1756957, -0.02042449, -0.04413007, -0.016873527, -0.2385717, -0.001741017, 0.08298281, -0.019873247) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.01803727, 0.0642893, 0.21513617, 0.066888265, -0.042107955, -0.123470366, 0.045296013, -0.11958806, 0.48208967, -0.027188249, 0.12136116, 0.05246265, 0.13522038, -0.016297493, 0.028486907, -0.059840377) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.1373251, -0.11281026, -0.06418318, 0.08444032, 0.062874556, -0.009133875, -0.049571835, -0.042995855, 0.12483249, -0.025967957, -0.11202483, 0.09862257, 0.099986054, 0.009230306, -0.09042664, 0.046612263) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.03203309, 0.106030256, 0.045741174, -0.020529225, -0.028610658, -0.055219248, -0.21404657, 0.07746393, -0.059359375, 0.0033258004, -0.0054513607, 0.06856653, 0.18043655, -0.119936846, -0.05639265, -0.10240379) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.0004331875, 0.10426754, -0.008130048, 0.012795991, -0.14372933, -0.40797862, 0.105197415, -0.0041354536, -0.079792455, 0.0914027, 0.012418237, -0.11449173, 0.020261409, -0.14681602, -0.13355242, 0.18290488) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.052306626, 0.010864275, -0.072627716, -0.009773121, 0.09484167, -0.09631301, 0.14896165, -0.21220942, -0.11994051, -0.002957136, -0.118194886, 0.08661347, 0.10005298, -0.029620873, 0.101668894, 0.0242806) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.055188183, -0.06322889, 0.12994595, 0.03140751, -0.092755616, 0.04239107, 0.18460171, 0.08471877, 0.014203371, 0.13608724, 0.035351243, -0.07883493, -0.10067456, 0.14417742, 0.0054235114, 0.100745104) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.043811034, -0.16055201, -0.11927185, 0.20517266, 0.16734722, 0.27720267, 0.1205665, 0.045803893, -0.07874647, 0.06764307, -0.11157022, 0.080770165, -0.044105835, -0.03276538, -0.10945451, 0.100562036) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.044731796, -0.12854387, -0.061937924, -0.21604767, -0.036132332, -0.024353411, -0.16718283, 0.14903957, -0.11620588, 0.14563644, 0.23363836, 0.08400659, 0.15248756, -0.1424437, 0.112882614, -0.04096889) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.0486021, -0.05714939, 0.042517707, -0.06106919, -0.12970918, -0.071898215, -0.044727243, -0.026308542, 0.05687118, -0.0394057, -0.109454155, -0.0021216893, 0.018588595, 0.08061093, 0.0500373, -0.0034918839) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.11269324, -0.17924047, -0.12965205, -0.07287767, -0.015830642, -0.044497102, 0.20014328, -0.14054494, 0.1232692, 0.2395109, 0.14093149, 0.03518561, -0.14088139, -0.09045081, -0.07283352, 0.053434785) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.020512339, 0.026349569, -0.06666101, 0.05554806, -0.03044066, 0.26656216, 0.019155584, -0.12118906, 0.087923005, -0.1716557, 0.050843164, 0.037432503, -0.030232614, 0.030457936, 0.04232163, -0.066400655) * go_3(pixel.xy, 1, 1);
  result += vec4f(-0.0216415, 0.09015036, -0.030761974, -0.26541537);
  textureStore(conv2d_1_tf_tex, pixel.xy, result);
}
