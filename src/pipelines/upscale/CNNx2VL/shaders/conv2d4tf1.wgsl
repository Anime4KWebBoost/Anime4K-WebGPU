// Layer: Anime4K-v3.2-Upscale-CNN-x2-(VL)-Conv-4x3x3x16
// Name: conv2d4tf1
// Inputs: ['conv2d_3_tf', 'conv2d_3_tf1']
// Output: conv2d_4_tf1
@group(0) @binding(0) var conv2d_3_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_3_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_4_tf1_tex: texture_storage_2d<rgba16float, write>;
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
  return max4(-textureLoad(conv2d_3_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_4_tf1_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(0.01973856, -0.05053795, 0.015545361, 0.10867395, 0.33441806, 0.14731607, 0.6793983, -0.21394718, -0.00846322, 0.09146322, -0.07427475, -0.078477465, -0.090998545, 0.133366, 0.105515696, -0.13784988) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.05404873, 0.09784018, -0.1337389, -0.18082313, 0.13461179, -0.3816801, 0.12209786, 0.08176651, 0.10461896, -0.43315184, 0.017470734, 0.20423968, -0.03941875, -0.101959296, -0.09440259, 0.09154717) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.17229515, -0.06907825, -0.008382803, -0.16671611, -0.01576541, 0.03985307, 0.08209482, -0.11707446, -0.11793074, 0.13702396, -0.02013158, 0.07302033, -0.022301994, -0.11464677, 0.036753565, -0.093276784) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.017650167, 0.009475923, -0.17856382, 0.15925962, 0.06434641, -0.15568036, 0.038135886, 0.18855911, -0.04427734, 0.1878215, 0.10856261, 0.0041275816, -0.12046199, 0.13610138, 0.3741596, -0.12934728) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.24631616, 0.0169485, -0.035534818, 0.37795424, -0.08546174, 0.07817259, 0.42897213, -0.47965595, -0.0146556785, -0.20510523, -0.18889453, 0.06476019, 0.1021008, -0.35398817, -0.031071864, -0.21416448) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.32810766, 0.050585747, -0.17658374, -0.13881154, 0.16417882, -0.21286008, -0.106835455, -0.1722344, -0.14151084, 0.08962986, 0.057395387, -0.01623662, 0.02570415, 0.15626897, -0.12687978, 0.080729105) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.050597478, -0.018753758, -0.036346875, -0.017908493, 0.058593344, 0.008303028, 0.05254987, -0.06635018, -0.022532012, 0.029511122, 0.026682215, -0.054647952, 0.069466785, -0.08892492, 0.025351115, -0.023130694) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.2412473, -0.16138165, -0.15117447, 0.11851003, -0.096868426, 0.082690425, 0.27923304, 0.11590443, 0.19363573, -0.15770023, -0.066793665, 0.011681678, 0.14037277, -0.112065665, -0.048159517, 0.009453693) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.1580054, -0.0060506654, 0.05267837, -0.09178131, -0.09107123, 0.23191126, 0.21108283, -0.070422985, 0.024321035, 0.06131459, 0.066626504, 0.032481454, 0.044402298, 0.1390604, -0.14432502, 0.040869843) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.10264861, 0.013504324, 0.012482852, -0.1781206, -0.12799414, -0.27026084, -0.123830505, 0.098105, -0.039127555, 0.09367889, 0.122323096, 0.1416734, 0.044763107, -0.21801683, -0.14018978, 0.17646866) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.017453065, 0.11498537, -0.10998983, -0.3116098, -0.3099762, 0.5024706, 0.051817298, 0.03170681, -0.18937826, 0.07946567, -0.11978771, -0.09523745, -0.0033551592, -0.11768945, 0.08932359, -0.06689581) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.1507582, -0.013266159, -0.073085934, -0.07252967, -0.06301927, -0.13218755, 0.12984878, -0.13678701, 0.023422396, 0.082123175, 0.006906731, -0.004018426, -0.15813835, 0.13711788, 0.016018609, 0.13443229) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.06960673, 0.16156524, -0.1374069, -0.05803206, -0.077960715, -0.10676749, 0.26282015, 0.03521529, 0.058099385, -0.014738148, 0.0011174522, 0.24279532, -0.023991548, -0.108812414, -0.08886019, 0.20584475) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.08043308, 0.063343, 0.055290066, -0.15991378, -0.08096304, -0.23888679, 0.019161629, 0.38381267, 0.3672934, -0.119608454, -0.43623593, -0.46014485, -0.5323366, 0.1318621, 0.087373205, -0.05535459) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.20640239, -0.1369444, -0.21677823, 0.08202178, 0.10515278, 0.06810837, 0.073207974, 0.23623931, 0.102422275, -0.05016664, -0.0039228587, -0.1810343, -0.2235563, -0.1246854, 0.1428113, -0.10609135) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.031941894, -0.08905056, 0.21501167, 0.11244667, -0.011811734, 0.21630247, 0.07589472, -0.040489636, -0.11824066, -0.11520391, -0.10075633, -0.035642453, 0.062144946, 0.0073282206, 0.14119269, -0.060479023) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.29382935, -0.056808118, 0.051812876, -0.061358813, -0.08344258, 0.124203674, 0.037964176, -0.01961274, -0.000951725, 0.50005037, -0.24176972, 0.06487161, -0.15469861, 0.04336187, 0.17826353, 0.040010225) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.02044482, -0.0879271, -0.01053958, -0.31148303, 0.07497373, -0.11548258, -0.1666126, 0.02369657, -0.058044076, 0.010801491, -0.005933901, -0.08910467, 0.007953008, 0.03761974, -0.029501524, 0.16816042) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.1779597, -0.10213089, 0.29942423, -0.016642543, -0.015537001, -0.04676146, 0.09585872, -0.0055750017, -0.014361908, -0.20667697, -0.11348746, 0.13081487, -0.10437329, 0.14328459, 0.11648822, -0.09163837) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.019033967, -0.12420627, -0.07748253, 0.43203858, -0.109799065, 0.07605535, 0.060791396, -0.24517195, -0.15674245, 0.21267459, 0.10665515, -0.073150024, -0.1358355, 0.0054066703, -0.16434059, -0.06031853) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.18834068, 0.26840356, -0.12937617, 0.16103932, -0.0062331813, -0.13630053, -0.013911821, 0.022389365, -0.044232946, -0.056454606, 0.022426741, 0.18010215, 0.041900013, 0.03375041, -0.11376866, -0.010313381) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.12497669, -0.31161824, 0.097568035, 0.19443443, -0.05056519, -0.0031457904, 0.1055554, -0.083650924, 0.07630523, -0.34177595, -0.093093194, 0.20701368, -0.030962149, -0.054470222, -0.23853977, 0.004326528) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.34370202, 0.085750066, -0.16071722, -0.54335934, -0.35595295, -0.050744478, -0.17405547, 0.008628697, -0.007086256, 0.23164117, 0.340156, 0.5475976, -0.15292351, 0.28019544, 0.038059216, 0.0044727) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.08231968, -0.0052294536, 0.07451547, 0.22278999, -0.3305531, 0.0017458396, 0.10818422, -0.21325395, -0.08807993, -0.110342845, 0.10082142, -0.051594347, 0.24192205, -0.18042035, -0.0095462985, -0.08757798) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.096379586, 0.021887815, -0.05097233, -0.06797989, -0.026171045, 0.022944937, -0.015915364, 0.037667938, 0.17216732, -0.014889412, 0.07343887, 0.028236505, 0.0015047621, 0.1355103, -0.09918284, -0.07673695) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.25385055, 0.15163356, 0.0030003798, 0.18464413, 0.05611221, 0.099498056, -0.07128191, 0.042955168, 0.027493173, 0.07440157, 0.07814497, 0.096160784, 0.13571084, 0.056412842, -0.031997006, -0.16073681) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.21634746, 0.025153082, -0.064477116, 0.0005679147, -0.0029436245, 0.12794618, 0.024849026, 0.03018052, 0.11723976, 0.059955597, -0.013594654, 0.09091745, 0.04775348, 0.21260159, -0.07463213, -0.06727042) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.12166018, 0.024545137, 0.08611618, -0.17627168, 0.09042604, -0.14157623, -0.22147785, 0.09100581, 0.11078359, 0.031410985, -0.17170976, 0.09532806, -0.059569277, 0.09392676, 0.11784347, -0.21471368) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.1483187, -0.2217563, 0.12032977, 0.14932398, 0.27428308, -0.04568031, 0.12670338, 0.09586169, 0.06700745, 0.005126449, 0.0027694793, -0.033667028, 0.06447861, -0.08585174, -0.05509812, -0.11358761) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.22750492, 0.032906335, -0.029479047, 0.11580199, -0.05812372, -0.032269973, 0.05219915, 0.041658226, 0.010897959, 0.065550454, 0.0076911976, -0.045743827, 0.11614996, -0.10393113, -0.0012606392, -0.034367524) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.09350742, 0.09561609, 0.3735968, 0.031685118, -0.042026598, 0.17006761, -0.3910107, 0.16984761, 0.25679177, 0.036610503, -0.13772772, 0.11101589, -0.1137049, 0.07211461, 0.18065079, -0.12324793) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.020749722, 0.14413361, -0.061903823, -0.21550268, 0.31306142, -0.11532895, 0.029482557, 0.03282164, -0.09800627, -0.20765196, 0.33030233, 0.075725295, 0.49252015, 0.042455837, -0.07264194, -0.10401895) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.22697076, -0.15738785, 0.09740376, -0.072098814, -0.06638972, 0.12336611, 0.0073687397, 0.048267826, 0.06717852, -0.027047804, -0.123397194, 0.17829034, 0.04215185, 0.066311836, -0.061742183, -0.046373066) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.041311592, 0.2813485, 0.055084586, -0.01823069, 0.08105147, -0.087944716, -0.10135052, -0.02653456, 0.063169874, -0.1351186, 0.06722432, -0.016406318, 0.08666922, 0.0555909, 0.12086502, -0.17224412) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.26026788, -0.18303715, 0.029279215, -0.12858874, 0.027197823, 0.0919464, 0.00849638, 0.10547888, -0.12952055, -0.14414985, 0.1903315, 0.05004528, -0.12657289, 0.038008716, -0.036606666, -0.054025438) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.069167465, 0.2699947, -0.11137602, -0.05888806, -0.107324794, -0.07598601, 0.06042177, 0.0064530694, -0.039780665, -0.076666445, -0.00846108, -0.06165907, -0.06978219, -0.19108103, -0.040026028, -0.120319635) * go_3(pixel.xy, 1, 1);
  result += vec4f(-0.14375664, -0.0056876075, 0.052177623, 0.07152566);
  textureStore(conv2d_4_tf1_tex, pixel.xy, result);
}
