// Layer: Anime4K-v4.1-Restore-GAN-(UUL)-Conv-4x3x3x16
// Name: conv2d1tf2
// Inputs: ['conv2d_tf', 'conv2d_tf1']
// Output: conv2d_1_tf2
@group(0) @binding(0) var conv2d_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_1_tf2_tex: texture_storage_2d<rgba16float, write>;
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
  let dim_out: vec2u = textureDimensions(conv2d_1_tf2_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(0.20217955, -0.1016539, -0.24689016, 0.026825983, -0.012303149, 0.016825393, 0.11242501, 0.1197403, -0.29600206, 0.27503014, -0.11554761, -0.051286228, -0.010749474, -0.0034162628, -0.07294611, -0.3771706) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.14065309, -0.20494242, 0.08172008, -0.24708536, 0.14010069, -0.0034903025, -0.13427053, 0.038706955, 0.14292285, -0.22876161, -0.08053654, -0.13691449, -0.32719252, 0.3200724, 0.41660982, 0.4663079) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.40426278, 0.42029375, 0.2581085, -0.08178537, 6.6040986e-05, 0.051414035, -0.09223715, 0.09467653, 0.0022885685, -0.36213446, -0.22484992, 0.11228845, -0.266375, 0.47065213, 0.18022436, 0.018949319) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.0967041, -0.4762878, -0.48147273, -0.38028395, 0.0096386345, 0.038764592, 0.31412536, 0.11140124, -0.26849043, 0.5565519, 0.43003628, -0.4071856, -0.07576129, -0.1801822, -0.47469202, 0.20814487) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.00062698213, -0.7789418, 0.35716832, -0.02369097, 0.3586657, 0.0046842257, -0.1294594, -0.42827508, 0.1843683, -0.109799415, -0.03444211, -0.4856736, 0.20326613, -0.20637028, 0.043016884, 0.2611685) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.4074533, 0.11487311, 0.3276686, -0.002443473, -0.18050632, 0.36538202, 0.23752166, -0.21289061, 0.08633338, -0.30124283, -0.020832658, -0.02058489, -0.18569615, 0.47561193, 0.29504526, -0.37081027) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.3032142, -0.05559384, -0.14362094, 0.4066231, -0.10048464, 0.123465545, 0.17526495, -0.05644113, 0.10546904, 0.04229368, 0.39113873, 0.31476578, -0.3210935, -0.2459354, -0.57513195, 0.42412075) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.012243576, 0.12146884, 0.07562772, 0.6030755, 0.11079806, -0.33577108, -0.34181613, -0.1494174, -0.03203171, 0.4393293, -0.28612396, 0.42938936, -0.043798693, -0.37709042, 0.26563555, -0.11072489) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.046751764, 0.0035097478, -0.01897875, 0.02122587, -0.12605189, -0.41298488, -0.03824162, 0.51710933, -0.052696224, -0.2337075, -0.12560573, 0.33835718, -0.31342196, 0.51827186, 0.1890404, -0.03768498) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.17229721, 0.062260006, 0.21993148, 0.075963624, 0.067087546, -0.20411918, -0.06633631, -0.05168393, -0.055554014, 0.07146849, -0.11320391, -0.5016039, -0.015768923, -0.029974159, 0.003875134, -0.7003569) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.0693014, 0.23172057, -0.12445124, 0.10486695, 0.024282364, 0.104390465, 0.10902425, 0.044662107, -0.14725766, -0.12317419, -0.24799284, -0.5018698, -0.09759714, -0.08109111, -0.16864298, -0.21465865) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.05006012, -0.091789775, -0.039711423, -0.025967857, 0.004903828, 0.27684125, 0.090259, 0.25723773, 0.25361672, -0.63184565, -0.2300667, -0.10245676, -0.43677995, 0.4948819, 0.23426977, 0.27520937) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.24944058, -0.2630142, 0.087730475, 0.14870866, -0.05221804, -0.11076067, -0.28590345, 0.30941877, 0.12329378, 0.0869489, 0.3449555, 0.26338112, 0.27513418, -0.34140083, -0.44811395, -0.32881838) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.2300291, 0.026097683, 0.011726505, 0.33332226, -0.24714379, -0.052737463, 0.16558985, 0.43402666, -0.040318843, 0.14610682, 0.32763618, 0.1530442, 0.46671808, -0.36680204, 0.30263212, 0.4588324) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.04394229, 0.1959856, -0.23437811, -0.42994127, 0.2209785, 0.08641096, 0.059983835, 0.3301891, -0.20396693, 0.21257658, -0.17936775, -0.17046471, -0.3278646, -0.015171337, -0.39279112, 0.7612752) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.0721009, 0.03914034, -0.03603309, 0.0032750098, 0.02849652, -0.22286695, -0.21038975, -0.5404214, -0.09446682, 0.13351013, 0.19801673, 0.3039991, 0.06969349, 0.47980356, 0.4956948, -0.22736946) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.10723219, -0.23137522, -0.12172196, 0.041468218, -0.07041226, 0.06390648, 0.14080569, -0.35228798, 0.07642974, -0.13615544, -0.039689478, 0.07113939, 0.28258353, 0.060358338, 0.17336333, -0.2321431) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.17947374, 0.03477672, 0.14946933, -0.27187726, 0.18819115, 0.032378223, 0.0020400453, -0.48512584, -0.12591578, -0.1212832, -0.116236545, 0.045565434, -0.15292491, -0.24064177, -0.10086153, 0.23591255) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.106525, -0.12032337, 0.17431536, 0.0052562207, -6.420632e-05, -0.01623248, -0.08095955, -0.13127506, 0.27539784, -0.31894428, 0.08169528, 0.062290672, -0.18432364, 0.21473673, -0.025179744, 0.094855726) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.31541437, -0.24790616, 0.013607132, 0.039480396, -0.122884266, 0.19012398, 0.09748719, -0.09533564, -0.292556, 0.18304445, -0.1432241, 0.1381094, 0.21733786, -0.18149674, -0.1615431, 0.03368751) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.28429464, -0.40165743, -0.26162243, -0.02550708, 0.08182439, -0.142696, -0.029649947, 0.047006324, -0.041352388, 0.45716748, 0.14035358, -0.0074519147, 0.30095938, -0.4907558, -0.19573994, -0.0730125) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.015484458, 0.18262957, 1.1304622, 0.13020717, 0.08094596, -0.041125435, -0.011831079, 0.016813423, 0.27810735, -0.64546406, -0.09420503, 0.30469316, -0.298747, 0.56795603, 0.42592815, 0.31302226) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.04343304, -0.4498391, -0.5037316, 0.19293165, -0.53385746, 0.33699542, 0.27228716, -0.19133756, -0.32839635, 0.35161376, 0.2137489, 0.38544926, -0.25985554, 0.20467313, 0.19342346, 0.20128295) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.22484256, -0.23751211, -0.30022943, 0.051273867, -0.007936754, -0.68916345, -0.71587783, -0.1656445, -0.097008295, 0.10184849, -0.051216517, -0.3001333, 0.44228783, -0.3494149, -0.3600727, 0.061474547) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.1976335, 0.11761563, 0.25485405, -0.24935004, 0.21836887, -0.0373093, -0.06946182, 0.049853157, -0.19294016, 0.027994758, -0.7352471, -0.40208367, -0.29396078, 0.27974385, 0.23464991, -0.21713316) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.11203325, -0.07249998, 0.03275291, -0.5243432, 0.027975427, 0.65923446, 1.1487273, 0.13650933, 0.18981944, -0.41047823, 0.24949239, -0.038735647, -0.16338153, 0.19802837, 0.2097514, -0.15370321) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.05246577, -0.10527885, -0.023790307, 0.02944672, 0.21446787, 0.22428256, -0.30655965, -0.4283235, 0.073304355, 0.2829255, 0.30902624, -0.14685656, 0.24827917, -0.33014455, -0.32007882, -0.20629856) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.08960087, 0.0050927363, -0.30011386, -0.047652043, -0.094598204, 0.11405335, 0.06829049, 0.059407845, -0.022997437, -0.106863946, 0.07900994, 0.44502714, 0.15836091, -0.066640936, 0.15023214, 0.54916424) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.06162481, -0.3285692, -0.022469657, -0.11277432, -0.09067458, 0.030319816, -0.14839767, -0.23583637, 0.06760135, -0.028171305, 0.014077104, 0.35498118, -0.025291484, 0.24540594, -0.017083582, 0.28348377) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.17504841, 0.060240712, 0.17431584, 0.16914812, 0.06998317, -0.30380917, -0.09968582, -0.30383462, -0.4403573, 0.78940177, 0.020485763, 0.27871025, 0.6351977, -0.37790725, -0.22219525, -0.4110773) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.08675536, 0.27092165, -0.058764063, 0.20293204, 0.009523148, 0.09759644, 0.32254717, -0.48095647, -0.23190324, -0.12567216, -0.44106624, -0.30251557, -0.29637465, 0.16701616, 0.039250236, 0.20024182) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.12002944, 0.13862704, 0.17594223, -0.044401992, 0.36661845, -0.038946245, -0.29144734, -0.033288293, -0.48884743, 0.08073716, -0.31537253, 0.1283542, -0.5425199, 0.19174723, 0.15365373, -0.14512973) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.15586664, -0.16834132, 0.05371874, 0.36174223, -0.15587626, -0.0017205992, 0.02366499, -0.13222694, 0.27792883, -0.20452052, 0.07238269, -0.6005766, 0.45729572, -0.057850257, 0.3978193, -0.42369977) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.0125904465, -0.28701517, -0.06483255, -0.36696205, 0.0041157743, 0.16688906, 0.16022897, 0.32454333, 0.24528491, -0.22117196, -0.15657167, -0.27925336, -0.21296152, -0.27980646, -0.35671264, 0.1338135) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.09333434, 0.2844371, -0.0012270715, -0.08979275, -0.06961038, -0.011850921, -0.14248405, 0.69844127, -0.39664406, -0.024479598, 0.055128384, -0.44450662, -0.2171763, -0.027311027, -0.22850873, 0.21512528) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.05754468, -0.06023853, -0.10660665, 0.001042397, -0.0098680295, -0.020704228, 0.022198498, 0.22380444, 0.2768453, -0.0008279344, 0.026585666, -0.4575448, 0.25150645, 0.11999355, 0.12135898, -0.39513355) * go_3(pixel.xy, 1, 1);
  result += vec4f(0.025650544, 0.03663525, -0.016599739, 0.0293095);
  textureStore(conv2d_1_tf2_tex, pixel.xy, result);
}
