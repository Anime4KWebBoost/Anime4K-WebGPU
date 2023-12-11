// Layer: Anime4K-v4.1-Upscale-GAN-x4-(UUL)-Conv-4x3x3x48
// Name: conv2d5tf
// Inputs: ['conv2d_3_tf', 'conv2d_3_tf1', 'conv2d_3_tf2', 'conv2d_3_tf3', 'conv2d_3_tf4', 'conv2d_3_tf5']
// Output: conv2d_5_tf
@group(0) @binding(0) var conv2d_3_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_3_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_3_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_3_tf3_tex: texture_2d<f32>;
@group(0) @binding(4) var conv2d_3_tf4_tex: texture_2d<f32>;
@group(0) @binding(5) var conv2d_3_tf5_tex: texture_2d<f32>;
@group(0) @binding(6) var conv2d_5_tf_tex: texture_storage_2d<rgba16float, write>;
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
  let dim_out: vec2u = textureDimensions(conv2d_5_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(0.014753134, -0.04786919, 0.11870752, 0.062323157, 0.012823349, -0.18270767, 0.05781849, 0.009605695, -0.11679257, -0.031872023, 0.06138625, 0.035083354, 0.0090230685, -0.226682, 0.06104293, -0.27476013) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.057164494, 0.031943344, -0.026907986, 0.1625164, 0.063061535, -0.05563398, -0.050311144, 0.052950714, -0.13305314, 0.095417894, -0.019991228, -0.10098878, -0.04697902, -0.095713176, 0.15546167, -0.029640567) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.070663795, 0.10422805, 0.014885193, 0.045137066, 0.0693627, -0.08800005, -0.110621534, -0.16098051, 0.03345156, -0.13288338, 0.052109558, 0.08176279, -0.0874141, -0.085414626, -0.026397523, -0.061462812) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.016594352, 0.15287156, 0.074731305, 0.0964361, -0.08787371, -0.13661076, 0.2141366, -0.028111434, 0.1326143, -0.20716804, -0.08138669, -0.099190034, 0.06144844, -0.110713564, -0.014771929, -0.14836042) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.09738207, -0.14664938, -0.1250703, -0.038655713, 0.05584081, 0.03942745, 0.073783375, 0.056581516, -0.15187903, 0.08551972, 0.022938624, 0.15554221, 0.028497955, 0.095256545, 0.06512413, 0.028258305) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.15085734, 0.17242025, -0.034663428, 0.07946447, -0.023244603, 0.009506006, 0.017019462, 0.037655763, -0.03177796, -0.1733154, 0.12542902, -0.08050667, -0.07999971, -0.018520301, -0.034357913, -0.13834344) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.03910769, -0.05480014, 0.10282842, 0.11273193, -0.117832065, -0.03342582, 0.024672383, 0.01922069, 0.052449033, -0.07383957, -0.06616735, -0.07622469, 0.07522412, -0.011379491, -0.10019852, -0.09873271) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.13609584, 0.03403247, -0.080141336, 0.077994175, -0.117510326, -0.09721173, 0.11609589, -0.011041011, 0.08279879, 0.034463685, -0.029874083, -0.09348013, -0.012873403, 0.023173302, 0.13702866, -0.016699987) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.012070883, 0.020341417, -0.017083466, 0.036868714, -0.04590393, -0.0042756707, 0.034706842, 0.10106157, 0.020871256, 0.07026538, -0.008456792, -0.031980522, -0.037377477, 0.0024875633, -0.048794776, 0.054988988) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.10563537, 0.11606471, 0.18385051, 0.037006877, 0.10408082, -0.041231528, -0.15187787, -0.09085941, 0.08950542, 0.06414686, -0.22425447, -0.27310994, -0.02024463, -0.025200754, 0.11368761, 0.10785044) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.030225338, -0.10834746, -0.10231699, -0.03254886, 0.11373231, -0.054429933, 0.026529413, -0.07203562, 0.020784596, -0.08582458, 0.011069094, -0.16185156, -0.1382461, 0.024487281, -0.120093465, -0.29875785) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.008845826, -0.11932165, 0.07947179, 0.19418922, 0.00601994, 0.08698007, 0.0070720594, -0.12667209, 0.077381305, -0.05648546, 0.058756344, 0.118710436, -0.15738462, -0.113216214, -0.18746306, -0.16013232) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.11823833, -0.10346257, 0.16498324, 0.017223012, 0.16676189, -0.03270543, 0.08681522, -0.019200213, 0.27930862, -0.39976546, -0.08013078, -0.07730102, 0.1775448, -0.23172536, 0.3080911, 0.066501014) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.13012904, 0.05373303, -0.04057597, 0.098716326, -0.012068175, 0.007822063, -0.10612095, 0.10029054, -0.03896638, 0.092982456, 0.44525465, 0.105101556, -0.01651052, 0.12284007, -0.29234242, -0.016989872) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.03517081, -0.15103249, -0.024740495, 0.11605604, -0.0063804537, 0.0851682, -0.074134536, -0.0820308, -0.051267844, 0.026468761, 0.12227241, -0.023516016, -0.036753807, 0.009863132, -0.18385997, -0.006226107) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.042300962, 0.0612368, 0.04273769, -0.009331085, 0.024928207, 0.036657955, -0.026505891, -0.0995487, 0.040830083, -0.05794873, -0.2301118, -0.25562578, 0.15100408, -0.11114937, 0.12458043, -0.031075275) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.12209181, -0.159118, -0.044463716, 0.12174668, 0.080834165, -0.030461645, -0.21788771, 0.15906425, -0.08619984, -0.2559847, -0.111772224, 0.089261115, 0.03629327, 0.031571757, -0.19015229, -0.13537124) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.05894997, 0.036665007, -0.057672605, -0.043688748, 0.010406858, -0.025670307, -0.17934126, -0.028273577, -0.027246438, -0.12550274, -0.13044403, 0.18990144, -0.06271228, -0.09306704, -0.14787146, -0.037143167) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.24538438, 0.07817913, -0.03810617, -0.0063618342, -0.034510795, -0.09723374, 0.0042433045, 0.02840398, -0.008296004, 0.03182418, -0.020445613, 0.040570706, 0.06958669, -0.074645676, -0.045477536, -0.31765696) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.07984125, 0.060450725, 0.047792103, 0.008377732, -0.20518395, 0.05043399, -0.01679626, -0.071454376, 0.22970293, -0.014139528, -0.011059268, -0.066941515, 0.07590278, 0.06008143, 0.110568896, 0.051596068) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.043445505, 0.07130074, -0.110674106, 0.1135976, -0.17528361, 0.027846763, -0.17418873, 0.062023338, 0.022821834, 0.05296679, 0.10935556, 0.12795413, 0.042655166, 0.0106115835, 0.2004836, -0.081612624) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.0065808836, 0.07898094, 0.03718763, -0.025817946, -0.1892885, 0.17788704, -0.01939055, 0.0058550234, 0.09937207, -0.051095694, -0.05730913, 0.059234787, 0.28931195, -0.09421872, -0.37408957, -0.20798929) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.16620718, -0.14868094, -0.12021037, -0.057172157, 0.10535018, -0.0759594, -0.14075747, -0.02022368, -0.18982969, 0.14067341, -0.05750312, 0.08877888, 0.10700357, -0.026717503, -0.033623595, 0.12195265) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.17748521, -0.03286829, 0.0053956825, 0.07372289, 0.055121407, -0.10435926, 0.014667389, 0.0427475, 0.18460171, 0.08454504, -0.08122923, -0.06552034, 0.10567158, 0.1778359, 0.17437135, 0.05902918) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.08628083, 0.04757524, 0.013566496, 0.058866933, 0.028604174, 0.022337232, 0.036754955, 0.14828879, -0.12659909, -0.010767183, 0.02895015, 0.07494568, -0.02031085, -0.18338795, 0.06491627, 0.18581006) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.086914204, 0.17564085, 0.20865819, 0.003970879, -0.065245375, 0.0719146, 0.0036821382, -0.0005362681, 0.17954963, -0.044090744, -0.0004970521, -0.08508769, -0.0038966718, 0.12987554, 0.10152699, -0.07551662) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.12458449, 0.046369124, -0.21519043, -0.14829193, 0.0010138899, 0.035694696, 0.038200002, -0.042452868, -0.10323941, 0.12175021, -0.03257118, 0.03198656, 0.014596667, -0.050239712, 0.06553759, -0.0055009895) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.042482298, -0.08873179, 0.09256576, 0.075650096, 0.08212508, -0.027149782, -0.13923948, -0.029412258, -0.046472896, -0.10929789, 0.11386972, 0.09277685, -0.03398996, -0.03957954, -0.08847087, -0.079389304) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.10738428, -0.060133323, 0.058830995, 0.053890802, 0.05381688, -0.017617341, 0.09074316, -0.14257678, -0.04499134, 0.027924139, 0.1744376, 0.11245277, -0.021527067, -0.0448567, 0.019239385, 0.036269695) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.022881636, 0.08740093, 0.03667878, -0.022591162, -0.027113255, -0.058345437, 0.07440467, 0.07153011, -0.076189674, -0.0150532955, 0.023971885, -0.033418965, -0.09023294, -0.038390294, -0.09872095, 0.042008042) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.016122708, 0.10938718, 0.011049308, -0.026979597, -0.09640132, 0.027440734, 0.059382755, -0.16636404, 0.06228894, -0.06278199, -0.029541656, 0.07371035, 0.15832236, -0.110187896, 0.04382764, 0.0028967306) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.059453584, -0.14479995, -0.07264137, 0.051669978, -0.04175092, 0.0438449, -0.16053757, -0.3129702, -0.044897456, 0.13238364, -0.16941388, -0.0010662815, -0.058727518, -0.009789796, 0.056073397, 0.24528863) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.042534802, -0.031428255, -0.13127099, 0.03545817, -0.12471701, -0.11506875, -0.04119249, 0.09132754, -0.1016195, -0.03640248, 0.007980519, 0.052966777, -0.023626154, -0.1328367, -0.10114847, 0.03886791) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.09101958, -0.0018387871, 0.012616483, -0.17484885, 0.011751878, -0.089530915, 0.051097844, -0.04996934, -0.01005944, -0.020370236, -0.24793504, -0.012510409, 0.00786229, 0.04249317, -0.008741537, -0.016400656) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.09523166, -0.042383313, -0.054711856, -0.04637368, 0.102178566, 0.2631821, 0.01233508, -0.010458087, 0.30316606, -0.22986925, -0.5806165, 0.23202705, -0.008722518, -0.010904748, -0.043592352, -0.05686299) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.033423536, 0.098218225, 0.14418946, 0.02657937, 0.03015286, -0.0767474, 0.042458575, 0.1935135, 0.18014516, -0.11874242, -0.1996855, 0.08370151, 0.0690025, 0.07693498, 0.052911133, -0.116886765) * go_3(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.08134629, -0.017970117, -0.018347586, -0.02937847, 0.0003775313, 0.19711903, -0.08546992, -0.021621648, 0.08250089, -0.01672797, -0.032528374, -0.038942847, 0.049553294, 0.04604846, 0.14648306, 0.013710108) * go_4(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.15212478, 0.06189338, 0.06345135, 0.124090515, 0.053533733, -0.04025595, -0.020564085, -0.28515917, 0.19415195, -0.015337308, -0.018422237, -0.15629065, 0.18082593, -0.011574442, -0.14429837, -0.05707318) * go_4(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.0925495, -0.037113782, 0.065900736, 0.008590338, -0.051698808, 0.10596262, 0.2240978, -0.07484259, -0.03791268, -0.10214985, -0.113221854, 0.021240849, -0.086688854, 0.020506943, -0.006777104, -0.016338166) * go_4(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.24208999, 0.0559375, -0.08700456, 0.079334885, 0.046569377, -0.12452623, -0.07567508, 0.11901736, 0.058025084, -0.10933379, 0.01499338, -0.059329115, 0.07900936, -0.0967382, 0.14649267, -0.21533011) * go_4(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.051437758, -0.056239348, 0.10826396, 0.0103973355, -0.11036472, 0.089677304, -0.13641821, -0.008562795, -0.0915165, 0.080974646, -0.066158704, 0.08619487, -0.14883414, 0.27063388, 0.26023057, -0.10478266) * go_4(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.013550296, 0.11880657, 0.10764064, 0.0048602303, -0.053477768, -0.012384154, -0.051058087, -0.21776162, 0.026556205, -0.14465022, 0.029675877, 0.024327768, -0.0044619385, -0.06656158, -0.3113407, 0.078604944) * go_4(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.051143095, 0.040067013, 0.0048092115, -0.030791068, 0.005094653, 0.050343107, -0.035564423, -0.13350213, -0.09505067, -0.032024544, 0.046505388, -0.012083068, -0.061293676, -0.018872263, -0.088480964, 0.09508143) * go_4(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.014669387, -0.03827568, 0.009706187, 0.091904245, 0.10861065, 0.024155458, 0.027196333, -0.0537285, -0.13822891, 0.08269879, 0.112572595, -0.07349772, -0.07239221, 0.07875581, 0.15151146, -0.08660275) * go_4(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.08294598, 0.12766667, 0.118720144, -0.018032918, -0.1013107, -0.013210103, -0.030159824, -0.1633461, 0.16121638, -0.11505265, 0.05771879, 0.17782801, -0.009709625, 0.009048779, 0.0643717, -0.04127436) * go_4(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.08944967, 0.10843843, 0.03210341, 0.07035867, 0.00338879, -0.007892554, 0.044288695, -0.039942343, -0.030615557, 0.09317879, 0.0762409, 0.18437877, -0.1321277, 0.05252213, 0.026333284, 0.06269435) * go_5(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.04965776, -0.032139134, -0.09895266, 0.2961244, 0.06335117, -0.16791527, -0.059079025, -0.082506865, -0.056972325, 0.1104244, -0.07652271, -0.07872344, -0.056179147, -0.14230897, 0.039492704, 0.14285105) * go_5(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.15735546, -0.060425457, -0.058934245, 0.05505039, -0.097881585, 0.1263457, -0.045253854, 0.09278876, -0.041899607, 0.11877196, 0.002355081, -0.059991844, 0.022999011, -0.0561775, 0.010565752, 0.069077805) * go_5(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.11142972, -0.07061307, -0.11946659, -0.099400096, 0.03367043, -0.013575439, -0.043519527, -0.16127248, -0.032205965, -0.105285004, 0.0021813486, 0.23383193, -0.088821694, 0.11629688, -0.031751737, 0.091282874) * go_5(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.19746882, 0.15382765, -0.067304626, 0.22248238, 0.089283146, -0.060740154, 0.12944831, 0.0401885, -0.07014485, 0.015746152, -0.05599315, -0.31444058, -0.123802215, -0.1703309, -0.057243284, -0.0058260057) * go_5(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.033563264, -0.10897218, -0.014746295, -0.06774955, -0.036188614, 0.10475296, 0.044433076, -0.07463308, 0.008685612, -0.017900765, 0.037735194, 0.14636718, 0.0055965157, 0.008190972, -0.012111877, 0.10777833) * go_5(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.22119878, -0.00934439, -0.024470452, -0.021684358, 0.049842075, -0.15857697, -0.070558004, -0.0033294354, -0.26865304, -0.0141610075, 0.021627605, 0.04901091, 0.030171307, -0.047846876, -0.021054259, 0.03347177) * go_5(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.06303298, -0.1380914, 0.13821393, -0.12413124, 0.07129274, 0.085286, 0.0061419164, 0.087412804, 0.033100057, -0.23397031, 0.032436803, 0.042869877, -0.107296675, 0.042882215, -0.012395404, -0.0022080743) * go_5(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.008780741, -0.09572746, 0.235107, -0.005934799, -0.031246934, -0.022992684, 0.06114156, -0.07160206, 0.06099364, -0.08785622, 0.14756297, 0.01614596, -0.22117889, 0.071189515, 0.15055332, 0.08069156) * go_5(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.15729329, 0.036501955, 0.074508026, 0.014924277, 0.024376784, 0.11048761, -0.0662262, 0.0018295659, 0.09283897, 0.027042102, 0.05291126, -0.06471004, -0.30125985, 0.10795915, 0.06779594, 0.31680325) * go_6(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.11615968, -0.04447013, 0.10447689, 0.1350562, -0.11144621, 0.03709077, 0.032952994, 0.096276626, 0.06868203, -0.16554776, 0.18624458, 0.049578857, -0.013442014, 0.070959665, -0.15082222, 0.26545084) * go_6(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.024599882, -0.07956594, -0.13679305, -0.14679682, -0.05684212, 0.03376889, -0.04935937, 0.09255551, -0.04888347, -0.03642756, -0.012279385, 0.0029056766, 0.08576277, 0.061712924, 0.025902992, -0.11700455) * go_6(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.35002708, -0.014724336, -0.17723122, 0.11554662, 0.20964158, 0.070235215, -0.15499143, 0.20215057, -0.05240247, 0.100447476, -0.22313856, -0.15757738, -0.17158219, 0.070982456, 0.17847545, 0.0545739) * go_6(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.18775995, 0.24853617, 0.31312263, 0.041823838, 0.11542879, -0.079676114, 0.016512455, 0.014672186, 0.10925544, -0.18216388, 0.13738453, 0.02856321, 0.01878391, -0.10745682, -0.16716598, -0.18430677) * go_6(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.12586334, -0.13059859, -0.032940686, -0.12445521, 0.08744824, -0.024449022, 0.07755207, -0.011887521, -0.044642143, 0.15666896, 0.009933376, 0.21113835, 0.018695675, 0.008285816, 0.23940869, 0.05274216) * go_6(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.14385052, -0.013701985, -0.18334188, -0.13801612, 0.06973971, 0.020687139, -0.15838577, 0.0682283, 0.17290114, 0.021822037, -0.1593011, 0.12368296, -0.051909417, 0.099816486, 0.18414661, -0.00997897) * go_6(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.098671384, -0.11953922, 0.0187697, -0.08119316, 0.08544758, 0.0026141745, -0.11786651, 0.0861657, 0.05167917, -0.07486402, 0.17135052, 0.045870405, 0.17885911, 0.06896784, -0.22618207, -0.09696675) * go_6(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.030892538, -0.040262762, -0.033995286, -0.19412598, -0.0058172327, -0.10667594, 0.045098327, 0.08596532, -0.14027297, -0.13492948, 0.09068293, -0.012210107, 0.049472895, -0.046960693, 0.041833356, -0.036665313) * go_6(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.11448471, -0.05200127, 0.10448566, 0.06749669, -0.046686202, 0.028539846, -0.071284495, -0.013776608, 0.009059756, 0.005694205, 0.107392795, 0.16345471, -0.040614177, -0.011328381, -0.12204681, 0.016511405) * go_7(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.17095669, -0.076325886, -0.081076495, 0.0766774, 0.06282146, 0.09396067, -0.099288605, -0.2057644, -0.06705021, 0.08401648, -0.006124241, 0.1259643, -0.13008131, -0.14129867, 0.15516123, 0.083607264) * go_7(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.0022957388, 0.05856265, 0.004291894, -0.13992007, 0.051110834, -0.06343282, -0.19713216, -0.009634957, -0.07137837, 0.0568723, -0.031844866, -0.14029147, 0.10511341, -0.03694283, -0.039790563, 0.12079957) * go_7(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.116678536, 0.017967895, -0.084222384, -0.18979242, -0.16373818, -0.051625438, -0.007469872, 0.07698895, -0.08559179, 0.22747229, 0.06252753, 0.17239036, -0.1672435, 0.19882563, 0.05094709, 0.15420969) * go_7(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.021038907, -0.15289949, -0.1812001, -0.06270831, 0.05773661, -0.09890353, -0.22504179, 0.28661346, 0.030380948, -0.047244404, 0.028095953, -0.16042343, 0.10631722, -0.28756708, 0.19875197, 0.0046880767) * go_7(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.017992627, 0.09583775, -0.16261324, -0.10037523, 0.15027897, 0.008308924, -0.12523991, -0.09218689, -0.04166017, 0.04481005, -0.07018378, 0.04660488, 0.012251093, -0.02155709, 0.07439554, 0.16595757) * go_7(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.10128157, 0.05230012, 0.010505274, -0.0045971354, -0.04436229, 0.0686891, -0.06143502, -0.06329947, -0.037828725, 0.06929396, 0.014732045, 0.019532068, -0.20194429, 0.094608404, -0.09255989, 0.0006712487) * go_7(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.13456346, 0.19428526, 0.03124889, 0.09431909, -0.057245445, -0.19396421, 0.021673629, 0.26870468, -0.0748189, 0.18683752, -0.041134145, 0.058044426, -0.11280808, -0.069663584, 0.11809443, 0.10898257) * go_7(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.032437522, -0.020943642, -0.0012967433, -0.040504962, -0.0055941883, 0.05663316, -0.17987259, -0.09858358, -0.022033866, 0.017183136, -0.00373911, -0.10786088, 0.04599657, -0.010730183, -0.015808778, -0.073432535) * go_7(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.027450806, -0.07123867, -0.115826175, -0.20558152, 0.015793063, 0.00917592, -0.047437448, -0.10743293, -0.08270229, -0.03460581, -0.22865953, -0.09833294, 0.058562107, 0.066225894, 0.09546966, 0.039175145) * go_8(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.0062890495, -0.14731838, 0.013251237, -0.05258336, 0.07339424, -0.09859438, -0.007957546, -0.09032201, 0.01912405, 0.10851486, 0.14476706, -0.045722447, -0.009007182, -0.04607908, 0.11694388, -0.1312195) * go_8(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.08320868, 0.021944063, -0.0063242465, 0.11779457, 0.043611903, -0.009892264, 0.031338774, -0.0071105906, 0.17312275, 0.06534067, -0.13700318, -0.15632129, -0.032851465, 0.07614353, -0.0068492275, -0.007339044) * go_8(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.1567212, -0.028788604, 0.014872978, 0.023775656, 0.1888344, -0.18292429, 0.0036885971, 0.059944462, 0.019628597, 0.12139034, 0.03521284, 0.07654702, 0.09544245, -0.01730226, 0.11372192, 0.08958013) * go_8(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.18358994, 0.008457774, 0.066629425, 0.031368256, -0.16939671, 0.116705574, 0.15289108, 0.09006569, 0.057086732, 0.03173233, 0.1337826, 0.20374574, -0.20242977, 0.11535693, -0.04644542, 0.12053215) * go_8(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.025165526, 0.0986568, -0.0019998797, -0.081331715, -0.08333373, -0.028121378, -0.10888794, 0.05499222, 0.065238185, 0.17770849, -0.00065088284, -0.014400954, 0.025441216, -0.089684874, -0.011330411, -0.037265968) * go_8(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.07548163, -0.032338325, 0.05066688, 0.047633644, -0.04150886, 0.020289602, 0.15300341, -0.12956989, 0.12961324, -0.068314, 0.08058171, 0.0086898785, -0.05619691, -0.10243323, 0.047004003, -0.0047387057) * go_8(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.060505453, -0.08456763, -0.050554518, 0.03934322, -0.009900384, -0.016025173, 0.15428478, -0.08673094, 0.06779942, -0.052596506, -0.01919229, 0.06718782, -0.055366307, 0.040410925, -0.17166302, 0.04139781) * go_8(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.0054792594, -0.04857173, -0.10938263, -0.002808973, 0.11411507, 0.06460528, 0.125212, 0.052846473, -0.0045314883, -0.09431864, -0.053420343, 0.076576754, -0.051726155, 0.047666553, -0.038724992, 0.12973335) * go_8(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.32793117, 0.10536563, -0.121571936, 0.0819257, -0.02026979, 0.045693934, -0.03842899, 0.047471542, -0.06476304, 0.020106113, -0.014928283, -0.040539287, 0.13236661, -0.04688991, 0.12435977, 0.047430243) * go_9(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.15486266, -0.15256862, -0.034016702, -0.074529134, -0.06449022, 0.09587099, -0.083922915, 0.14717162, -0.06547674, -0.12714347, -0.23995708, -0.18052177, 0.070112504, 0.15591848, -0.32457027, -0.19917747) * go_9(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.12048215, -0.013003214, -0.113487795, 0.029351957, -0.014786703, 0.03716927, -0.08821999, -0.008626208, 0.018643484, 0.013666749, -0.043723207, -0.012135213, -0.08323913, -0.04146574, -0.22227862, -0.055937964) * go_9(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.044348344, 0.045776278, 0.021677578, 0.017165996, -0.034954507, 0.08561954, -0.14646047, -0.13231587, -0.04729133, -0.08174899, -0.11179197, -0.11426391, -0.024943672, 0.04607219, -0.23119277, -0.07512565) * go_9(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.11036188, 0.15960318, -0.03556543, -0.06765656, -0.2021666, 0.19273448, -0.10892626, -0.09404772, -0.076368466, 0.1813536, 0.032177098, 0.0842, 0.19333756, 0.053526193, -0.009715162, -0.14322306) * go_9(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.030871768, -0.0074464646, -0.1635315, -0.0031961869, -0.075362965, 0.104896225, -0.021082822, -0.2416909, -0.22069727, 0.020561663, 0.028545292, 0.052814715, 0.19980742, 0.2074361, 0.11841944, 0.05509825) * go_9(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.013732159, 0.1374818, 0.07453946, 0.1636285, 0.07283316, 0.22762041, 0.21240574, 0.019950854, 0.15626834, -0.060864933, -0.07968664, 0.03479737, 0.10357597, -0.08328792, -0.0006691867, -0.0381467) * go_9(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.1819537, 0.044216722, -0.023299925, 0.05007542, 0.17286481, 0.09262543, 0.2994342, -0.10637366, 0.04639522, 0.06452959, 0.15362616, 0.067861795, 0.021456653, 0.15361351, 0.261385, 0.04604455) * go_9(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.009122387, 0.048340186, -0.07658522, -0.19766617, -0.051280595, 0.003623177, 0.042376805, -0.04431547, 0.065149754, 0.034897484, 0.02154426, 0.07047, -0.08721426, 0.07704638, 0.0060646655, -0.024416646) * go_9(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.044220358, -0.12177787, -0.06103336, -0.08130916, 0.022953589, -0.08504309, 0.039640404, -0.042649914, -0.11253562, 0.05210924, -0.03506059, -0.016069679, -0.078641035, 0.0039112084, -0.0062618195, -0.17446917) * go_10(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.01247942, 0.023309292, -0.10943914, 0.062411055, -0.075556256, 0.030011179, 0.068354815, -0.050935294, -0.078005195, -0.031145953, -0.081349626, 0.12883238, -0.121446736, -0.03411904, 0.003731427, 0.13872771) * go_10(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.1397899, -0.030694358, -0.13986057, -0.01456527, 0.13519372, 0.009538593, 0.039709106, -0.03508142, 0.034425747, 0.102543324, -0.092791595, -0.012264085, 0.05396018, -0.11684392, -0.10459425, -0.19696747) * go_10(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.24276726, -0.21673095, -0.10106586, -0.051018015, -0.02559439, 0.049109787, -0.026405439, -0.06197655, -0.17754024, 0.15494283, 0.15298724, 0.17503484, -0.13531163, 0.14061542, 0.02137645, 0.08091585) * go_10(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.017142862, 0.016195927, -0.32190144, 0.11874316, 0.037051585, -0.039087534, 0.015433603, 0.015701048, 0.04637381, -0.11968243, 0.06242134, 0.04560534, 0.12370247, -0.11292332, 0.09618765, 0.0023660306) * go_10(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.19133906, -0.11650241, -0.011775885, -0.009825516, -0.054749526, 0.06524658, -0.013433133, -0.060871173, -0.11068996, 0.050650746, 0.0019352552, 0.08599543, 0.16217573, 0.013373967, -0.16456692, 0.099531464) * go_10(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.11285318, 0.00018417467, -0.20670767, -0.065584615, 0.011944516, 7.744912e-05, -0.037524782, 0.056939438, 0.031899396, -0.0038092835, 0.016791284, 0.0506775, 0.046540234, -0.048709188, 0.03119377, -0.0712156) * go_10(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.027347967, 0.08333226, 0.06065502, -0.09395132, -0.13586216, -0.08702288, -0.099219136, 0.12588762, 0.08082661, -0.005074681, 0.12843885, 0.06986843, -0.0053627244, 0.056996074, -0.022097634, -0.15663457) * go_10(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.069395415, 0.0043090186, -0.1853728, -0.05153937, 0.062754065, 0.03969911, -0.029014869, 0.11187697, -0.1032801, 0.07209643, 0.1677695, -0.13300064, 0.083935894, -0.046223458, -0.033849694, 0.1742876) * go_10(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.041404765, -0.15952879, -0.055672616, -0.14790176, -0.013831066, -0.047978397, -0.28346768, -0.08638548, -0.21872658, -0.020834675, 0.058469106, -0.021048449, 0.06864195, -0.06668591, -0.084808566, 0.07891877) * go_11(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.060619947, 0.1009842, -0.17300764, -0.26239192, 0.1340643, 0.20667392, -0.14698872, -0.35110018, -0.37209937, -0.07078585, -0.05318964, 0.033973537, -0.17849341, -0.03924582, -0.09075869, -0.1777723) * go_11(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.23023579, 0.13480036, -0.22323267, 0.018318858, 0.10835291, -0.13343185, 0.013547803, -0.12702204, -0.008225446, -0.014552931, 0.15907833, 0.040752955, 0.013315338, 0.07751878, 0.150926, -0.11256944) * go_11(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.09436202, 0.04043043, -0.10118068, -0.110989, 0.09390222, 0.110257804, 0.09612221, 0.005879994, 0.032777414, 0.12892056, -0.06661622, 0.078207776, 0.025562935, -0.041329056, 0.036348246, -0.055320274) * go_11(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.04770027, 0.13019262, -0.06838029, -0.061760966, -0.06446806, -0.07964198, -0.016272204, -0.08714364, -0.14706036, 0.07334957, 0.015852954, -0.07909504, 0.3089915, 0.109102525, -0.015825126, -0.27486005) * go_11(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.10764013, 0.19844711, -0.09302359, 0.0054327343, 0.5287512, -0.15161927, 0.024464406, -0.089903906, -0.19313338, -0.07728969, 0.18436882, -0.026266089, 0.0842011, -0.024945607, -0.0038182868, -0.18219624) * go_11(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.09759823, -0.071663424, 0.065186486, -0.023156485, -0.025800427, 0.16197275, 0.050794635, -0.042893115, 0.023938533, 0.012962341, 0.0795926, 0.0003265065, -0.0220062, 0.10227259, -0.0033829797, -0.103184715) * go_11(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.020551044, 0.078421816, 0.01739726, 0.19147848, 0.25223428, -0.21913454, -0.17867994, 0.018781869, -0.054134224, 0.06478987, 0.1793624, -0.08970641, 0.049855165, 0.0020986055, 0.06884598, 0.089142375) * go_11(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.026820185, -0.04953101, 0.09645142, 0.1821389, -0.2354278, 0.05535592, -0.14191186, 0.20774509, -0.13335133, 0.034332983, 0.40410507, 0.1728577, 0.13332304, -0.022786276, 0.0019173969, -0.0044472194) * go_11(pixel.xy, 1, 1);
  result += vec4f(0.060646188, -0.0038556247, -0.10473039, -0.021283383);
  textureStore(conv2d_5_tf_tex, pixel.xy, result);
}