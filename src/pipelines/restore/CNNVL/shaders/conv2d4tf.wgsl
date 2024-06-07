// Layer: Anime4K-v4.0-Restore-CNN-(VL)-Conv-4x3x3x16
// Name: conv2d4tf
// Inputs: ['conv2d_3_tf', 'conv2d_3_tf1']
// Output: conv2d_4_tf
@group(0) @binding(0) var conv2d_3_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_3_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_4_tf_tex: texture_storage_2d<rgba16float, write>;
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
  let dim_out: vec2u = textureDimensions(conv2d_4_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.06738501, 0.034009207, -0.21538448, 0.14296548, 0.12896985, -0.23526315, -0.08848608, 0.019602662, 0.14937137, 0.11353096, 0.11884168, -0.016765572, 0.030985225, 0.046430565, 0.06614828, -0.19202724) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.10326068, 0.11014975, 0.17069744, -0.21474148, 0.16761585, 0.13434832, -0.101021074, 0.006307025, 0.07478008, -0.1060066, 0.035315692, 0.033488914, -0.24906659, 0.06269967, 0.11120735, -0.040928528) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.09334615, 0.057705753, 0.12213245, -0.06402275, 0.30694544, 0.034585163, 0.20345578, 0.07489286, 0.07483618, -0.14240396, 0.034846418, -0.03811241, 0.010882573, 0.13204294, 0.017563924, -0.047203008) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.21673942, -0.024010994, -0.10238504, -0.041160326, 0.06838163, -0.20950818, 0.06526309, -0.079094924, 0.02208821, -0.28130978, 0.086275116, -0.089067616, 0.12133826, -0.062600106, -0.020521903, -0.07654401) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.03055029, -0.15683146, -0.20331301, -0.06252028, 0.13350682, 0.20338707, 0.038425338, 0.1581342, -0.27322498, -0.14999662, -0.16681097, 0.0971585, -0.20014858, -0.081635274, -0.0781877, -0.20625232) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.38375977, -0.019825654, 0.1886721, 0.22616312, 0.3402173, 0.1825304, -0.05531195, 0.30973226, -0.2676023, 0.14413352, 0.021706983, 0.01732799, 0.23466855, -0.13805965, 0.22570935, 0.018103868) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.15169825, 0.0270689, -0.2503316, 0.17289825, -0.16437647, 0.039233048, -0.35572487, -0.048393793, 0.19270042, 0.24260359, 0.12041881, -0.0009793913, 0.11656858, 0.11007414, -0.0757491, 0.047933612) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.18657999, -0.11252566, -0.05237504, -0.07368097, 0.13882741, -0.13710637, -0.006996468, -0.062354874, 0.23452504, 0.15333645, -0.0022776406, -0.17910439, 0.03629509, -0.16264829, -0.010011833, -0.15313338) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.060544558, -0.04913478, -0.061717357, 0.02323648, 0.28739056, -0.07434013, 0.19110644, 0.100050166, 0.0073363045, 0.08185653, -0.024797903, -0.14424153, -0.20838726, 0.16154376, -0.048517212, -0.025453888) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.14975396, -0.13142908, 0.36210674, -0.054021083, -0.10632155, 0.045697935, -0.18946633, 0.02228141, -0.08919603, 0.09800842, -0.17634438, 0.09512711, -0.03425503, -0.12298555, -0.05354435, -0.17112055) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.09958265, -0.057276618, -0.16262266, -0.06415915, 0.14579074, -0.36784375, 0.08034197, -0.04537706, 0.005460582, 0.22313322, 0.07382161, 0.014990379, 0.044636846, -0.2811128, -0.22621547, -0.06044004) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.10569276, -0.03738662, 0.16100396, 0.058593616, -0.048862137, -0.08796426, 0.20101094, -0.11039573, 0.17196764, -0.04601554, 0.008571281, -0.073729075, 0.051433694, -0.051276565, 0.087334655, -0.0360379) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.011119538, -0.28781965, 0.28637868, -0.1742508, -0.07121849, 0.10379717, 0.012615981, -0.029563965, -0.18678424, 0.05291095, 0.039143506, -0.028248642, -0.014103922, 0.029155696, 0.10433492, 0.16305852) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.2231037, -0.13697462, -0.29124337, 0.08519773, 0.15893684, -0.17763218, 0.06950923, 0.34361118, -0.024844287, 0.044008408, -0.033844844, -0.086971916, -0.07884748, 0.2543499, 0.056884114, 0.10068364) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.07710048, -0.23218372, 0.04346047, 0.21769643, 0.06473219, -0.18066105, -0.2511205, 0.15309611, 0.04535977, 0.16450433, 0.10846344, 0.0016952346, -0.010874939, 0.28966382, -0.121990964, 0.12956186) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.007910202, 0.17766511, 0.14364475, 0.1016258, 0.0051045395, 0.18691733, 0.005813767, -0.0070582186, 0.019418601, -0.1604435, 0.016088275, -0.18265302, -0.15719391, -0.17369832, -0.036745597, -0.19647408) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.08938396, -0.0073808245, 0.11225727, -0.012303106, 0.096785046, 0.030483445, 0.027719889, -0.052584838, -0.14887555, -0.03422243, 0.12646855, -0.1722482, 0.010239037, 0.06406088, -0.20053658, 0.01964698) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.120734036, -0.12450362, -0.06582111, 0.1639675, -0.19787048, -0.08049789, -0.014257596, 0.058436662, -0.0009387449, -0.08698089, -0.017400503, 0.06295286, 0.09890349, -0.057190523, -0.103520766, -0.04207548) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.0118413875, -0.031288836, 0.09749554, -0.012266401, -0.07998591, 0.22615653, -0.06207416, 0.03257896, -0.076378696, -0.079426095, -0.13968349, -0.15423697, -0.1091681, -0.02893125, -0.032659534, -0.063735925) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.119372696, 0.013176554, -0.029381052, 0.21919228, 0.045041792, 0.24844484, 0.26363325, 0.08480674, 0.087083444, 0.11984778, -0.088715754, 0.06421046, 0.05225977, -0.05140334, -0.055052705, -0.049854077) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.0035781674, 0.0861361, -0.07675145, -0.056479637, 0.16973391, -0.12113791, 0.10729832, -0.03773517, 0.058618728, 0.12148276, 0.17260705, -0.06968724, 0.076358154, -0.15307103, 0.17700425, -0.13467014) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.02752418, -0.06366472, -0.025610954, 0.0013539721, -0.06465272, 0.0806373, -0.07336035, 0.10114861, 0.0041146413, 0.15878421, -0.044668555, -0.12150811, -0.1071482, -0.05086587, 0.18589285, 0.05065092) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.07200056, 0.021739854, 0.29476613, -0.08475931, 0.15018553, -0.07886365, 0.36336347, -0.020576432, 0.25866082, -0.059272554, 0.054249667, -0.17822553, 0.1755872, 0.3244387, -0.39173844, 0.33894604) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.11570926, 0.1342677, -0.19511898, 0.0075454637, -0.01890476, -0.14239742, 0.18921931, 0.033990458, 0.31306365, -0.006998358, 0.029190077, -0.005679954, -0.15341778, 0.07766778, -0.25691047, -0.0964161) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.019746238, 0.0021332854, -0.00879096, -0.1338671, -0.0001600663, -0.29465106, 0.0867611, -0.114963025, 0.07874301, -0.012734178, -0.11124061, -0.010926616, -0.04941506, -0.07516841, 0.116663, -0.29018974) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.01651721, 0.05955898, 0.023618208, 0.098695934, 0.018553663, -0.054378513, 0.1436929, 0.1693743, -0.27483663, 0.029127488, 0.09619316, -0.06109113, -0.08619361, 0.09315214, -0.02478657, 0.18544984) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.09570196, -0.016528936, -0.1559397, 0.14312246, 0.04029428, 0.08773151, -0.043646842, 0.17894371, -0.082413055, 0.0027082344, -0.100171275, 0.01547501, 0.18122818, -0.11933676, 0.26404107, -0.3169703) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.12073344, 0.08683522, -0.09249099, 0.058786053, -0.14480567, -0.121013954, 0.033335857, 0.009353379, -0.055087596, -0.13002734, 0.08890566, 0.05508963, -0.0075715426, -0.15936922, -0.03968994, -0.1690259) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.2011206, 0.23898427, 0.23656492, 0.1287573, 0.14850396, 0.40532517, -0.107408255, 0.40119782, 0.099813245, -0.03830304, 0.101520434, -0.026478073, -0.048469637, 0.106440455, 0.056632314, -0.17825997) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.076735444, 0.05965795, -0.0052469415, -0.21785147, 0.11887833, 0.067560315, 0.051149055, 0.23626682, -0.1297049, -0.035512198, 0.20352256, -0.025064934, 0.04958706, 0.0454198, 0.0113334535, 0.0417486) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.09055751, 0.033915352, -0.21836667, 0.22006813, -0.099022895, 0.11720966, -0.15686816, -0.13586599, -0.094427735, -0.08831514, -0.06182928, 0.09213704, -0.03642064, 0.18129414, -0.012926811, 0.12179882) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.19389409, 0.09512252, 0.14768016, -0.16623649, -0.031052284, -0.026814984, 0.106168024, -0.2026781, -0.04581419, -0.0016849053, -0.04101923, 0.038959503, -0.011938445, 0.20096186, -0.26666564, 0.4824324) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.17727576, 0.07309147, 0.12131863, -0.163096, 0.17225246, 0.26256254, 0.27685758, 0.09094053, 0.029605515, -0.20217367, 0.047564875, 0.043115832, 0.15089568, -0.09670934, 0.24131384, 0.03337442) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.34192136, 0.12063195, -0.31159517, 0.04170889, -0.30147067, -0.21330686, -0.1514457, -0.121126845, 0.04409098, 9.2206596e-05, 0.027680017, 0.03230512, -0.27993527, -0.093485355, 0.07568645, -0.23585452) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.0537712, -0.20847629, 0.1740093, -0.013894753, -0.32719997, -0.059484575, -0.006098233, -0.10336451, -0.14706188, -0.07424865, -0.07045905, 0.17093194, -0.22147557, 0.09086218, -0.11033544, -0.05306482) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.00489003, -0.11509064, -0.021005848, 0.16637677, -0.089347586, 0.17545725, -0.17313693, 0.13742085, -0.14577347, 0.07951095, -0.092139855, 0.017118992, -0.053472433, 0.079414465, 0.0330263, -0.11189824) * go_3(pixel.xy, 1, 1);
  result += vec4f(-0.034743138, 0.012946433, -0.082333155, 0.07721756);
  textureStore(conv2d_4_tf_tex, pixel.xy, result);
}
