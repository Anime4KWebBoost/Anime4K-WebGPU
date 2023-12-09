// Layer: Anime4K-v4.1-Upscale-GAN-x3-(L)-Conv-4x3x3x24
// Name: conv2d5tf
// Inputs: ['conv2d_3_tf', 'conv2d_3_tf1', 'conv2d_3_tf2']
// Output: conv2d_5_tf
@group(0) @binding(0) var conv2d_3_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_3_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_3_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_5_tf_tex: texture_storage_2d<rgba16float, write>;
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
  let dim_out: vec2u = textureDimensions(conv2d_5_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(0.001049049, 0.017747996, -0.067229465, -0.020442853, -0.04868684, 0.09733606, -0.07313501, 0.02070675, 0.01012683, -0.034293324, -0.026002094, 0.008298949, -0.045532364, -0.069049254, 0.109774776, -0.092840426) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.3071666, 0.108723, -0.018787129, 0.17321438, -0.07934712, 0.11855833, -0.032467257, -0.048425578, -0.091413595, -0.08235019, -0.050003942, -0.007800964, -0.07821158, 0.120108165, -0.15341766, -0.04518874) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.0038995466, 0.059817232, -0.13333397, 0.022390908, -0.054531172, -0.12521502, 0.061349645, 0.08832908, 0.015541151, -0.005833245, -0.103023596, -0.031728514, -0.1393958, 0.12932369, -0.024058655, -0.02949061) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.10676212, -0.0919305, -0.045313094, 0.036725752, -0.2360789, 0.08090541, 0.08044168, -0.088691026, 0.05462964, -0.047420587, 0.011766264, -0.044065233, -0.09330811, -0.04302891, -0.09276843, 0.01615573) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.14728056, 0.014297587, 0.20523176, -0.016391741, -0.25267518, -0.09126818, 0.14681858, 0.0720258, -0.034471154, -0.103409246, 0.029827712, 0.09607032, -0.12944661, -0.09812552, 0.19399726, 0.18891408) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.0793041, -0.18886381, -0.08229493, -0.13476922, -0.034637094, -0.06667868, 0.09988945, -0.08209682, -0.07416632, 0.10529841, -0.14161663, -0.088301264, 0.0029876695, 0.11381751, 0.083498895, 0.15414985) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.20285544, -0.16456522, 0.06494461, -0.013555718, -0.07797077, -0.13418226, -0.0014035929, 0.056061633, -0.024789125, -0.053674392, 0.048963223, 0.121051155, 0.064334966, -0.0482476, 0.068401285, -0.07039275) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.098433256, -0.3636959, 0.2678772, -0.046356395, -0.1771877, -0.017444499, -0.06527938, 0.073921666, -0.1880833, 0.1873346, 0.10331725, -0.05711381, 0.049431477, -0.047258172, 0.13095368, -0.35352108) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.10444254, -0.16424808, -0.00615067, 0.1023235, -0.122729294, -0.2563471, 0.00030699265, 0.09230543, 0.07732433, -0.03397466, -0.03141724, 0.2431111, 0.009742008, -0.07286298, -0.015188814, 0.025636861) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.06326144, -0.045018848, -0.130233, -0.015639791, -0.015171213, -0.009451374, 0.06830251, 0.07718799, 0.009820809, -0.10778585, 0.011396909, -0.067577444, 0.16482629, 0.099055305, 0.0517957, 0.008594935) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.037354734, 0.09272911, -0.11168438, 0.1708543, -0.12653585, -0.042765, 0.008014873, 0.22469266, 0.019282004, 0.0041092015, -0.029787902, 0.025127187, -0.05086034, 0.0077483514, 0.010261478, 0.07023893) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.055195954, 0.004654069, -0.02118881, -0.05352797, -0.021830624, -0.010750989, -0.032053873, 0.18029462, -0.0703946, 0.06940036, 0.011578795, 0.049051903, 0.12236165, 0.1469314, -0.04752202, -0.02873477) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.11799468, -0.022473548, 0.0045530205, 0.0870364, 0.1895775, -0.041058388, 0.079169616, -0.08769193, -0.012526104, 0.03904729, 0.016011083, -0.010498281, 0.08499936, -0.050380737, 0.14939919, 0.009984251) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.10477428, 0.16810521, -0.1314053, 0.084377944, 0.17922944, -0.304226, 0.25293878, -0.15422472, 0.20214307, 0.10322054, -0.13431601, 0.04898287, 0.09717359, -0.07664543, 0.14711176, 0.15777126) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.027849296, -0.107415505, -0.048003152, -0.14503942, 0.16935585, -0.11120448, 0.19879252, 0.25992575, 0.10300595, 0.044460453, 0.095423825, -0.0006854256, 0.04321415, -0.042708825, 0.02633511, -0.06220348) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.004024937, 0.05021026, -0.00765448, 0.18315202, -0.078596614, -0.022813313, 0.09930163, 0.08525698, -0.0024254897, -0.06150155, 0.12159309, 0.056743085, -0.19437842, 0.02563038, -0.14668292, -0.0805431) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.037370156, -0.13586049, -0.11521326, -0.07453397, -0.025900846, -0.0823091, -0.14436729, 0.14114335, 0.055820756, 0.05531836, -0.1474026, 0.10203739, 0.053665128, 0.00896543, 0.13431323, -0.12663968) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.20144333, 0.05849729, 0.06303023, -0.17678042, 0.03238696, -0.19829398, 0.12956308, -0.20013878, -0.1353999, -0.001031907, 0.10556917, -0.14760506, 0.03315909, -0.10838441, 0.16175537, -0.001477876) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.087629505, -0.05908092, 0.16011593, -0.11285914, -0.4358247, 0.18938082, -0.31105244, -0.3638732, -0.0069619874, 0.029419519, -0.2156866, -0.13693112, -0.113110565, -0.09906378, -0.11164287, -0.084068194) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.072181284, 0.035425037, 0.028820323, 0.12786204, 0.37121117, -0.076626934, 0.058864776, -0.20865935, -0.0014984896, 0.05978116, 0.117927864, 0.013273026, 0.088378325, 0.13492325, 0.018144222, 0.22580223) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.045780275, 0.13346507, 0.056960598, -0.0019664192, -0.24231891, -0.13189796, 0.11114239, -0.07587297, 0.03099761, 0.10284658, 0.094186746, 0.04669001, -0.20374449, -0.12047404, -0.10640337, -0.03541381) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.14384045, 0.12343541, -0.029074568, 0.13204664, 0.18878254, 0.115503244, -0.20217639, 0.16410889, -0.79949176, 0.5460196, -0.09889672, 0.27109572, 0.10628155, 0.13510233, -0.20859608, -0.07706875) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.11215904, 0.08981538, -0.10094039, -0.054024383, 0.2652237, -0.2002571, -0.15960355, 0.032049023, 0.007806114, 0.10592316, -0.3487021, 0.048408728, 0.10263737, -0.026020324, 0.072276175, -0.11909672) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.03184955, -0.00798831, -0.028087616, -0.010780139, -0.05444991, 0.09402867, 0.30834422, 0.14518146, -0.010965188, 0.14643683, -0.02568113, 0.068982124, 0.044459574, -0.05092265, -0.0028792082, 0.17158687) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.0869746, 0.15908171, -0.0033584125, 0.049515188, -0.15995023, 0.20953654, -0.16041277, -0.08435643, 0.42034048, 0.096904315, -0.1927207, -0.0792477, 0.078221194, -0.10053459, -0.17969237, 0.08374661) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.10612468, -0.23303585, -0.08996894, 0.10191982, 0.10724305, 0.1258089, -0.08111434, 0.103680536, 0.00824538, 0.2173516, -0.601468, -0.17365147, -0.09311857, -0.045947216, 0.20118287, 0.00016345571) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.07453406, 0.02476293, -0.089717, -0.14455949, -0.1427004, -0.21921235, 0.1878364, -0.023677701, -0.29442346, 0.13739492, -0.10435927, -0.35067815, 0.00956389, 0.049088918, -0.055482347, 0.1527778) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.20727113, 0.23718962, 0.17435564, -0.017858913, -0.042935595, 0.1996666, -0.059547734, 0.09735509, 0.019539079, -0.012399102, 0.057370137, 0.027493393, -0.10042333, -0.07915818, 0.07218426, 0.1309558) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.032295313, 0.07833535, 0.22808518, 0.012292011, 0.09856554, -0.01996994, -0.028461069, 0.029348027, -0.25023523, 0.21794361, 0.14906348, 0.039845698, -0.004544177, -0.031246802, 0.019103816, 0.07738693) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.15647748, -0.048666175, -0.03838509, 0.22003315, 0.048363995, -0.077338494, 0.109276325, -0.000109877525, -0.10441263, 0.18494262, -0.08754767, 0.12850273, 0.03408794, 0.15086798, -0.19896401, 0.048397515) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.011858143, -0.121841036, 0.0048841173, -0.062427614, 0.14153655, 0.011297287, 0.12778129, 0.004588582, 0.021572713, 0.15850346, 0.06464319, 0.06260356, 0.0838926, 0.04272777, 0.0733926, -0.08732838) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.20364462, 0.15701732, 0.053049877, -0.46085536, -0.037331745, -0.05813282, 0.036300424, 0.05660442, 0.14007641, 0.12849629, 0.08266283, -0.07872285, 0.07497584, -0.102409676, -0.12487048, -0.06305082) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.26158065, -0.090300985, 0.3522249, 0.18087223, -0.06095069, -0.10725335, 0.285748, 0.15195337, -0.19382374, -0.11163994, -0.10937165, -0.05908017, 0.0042464877, -0.14594594, -0.16316739, -0.17099144) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.10028552, -0.18077525, 0.29705408, 0.12354066, 0.0198171, -0.08987044, 0.26377577, 0.075702764, 0.06952089, 0.0049671913, -0.3116211, 0.017268507, 0.37579817, -0.037516277, -0.09738986, 0.0917646) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.17661515, -0.17850937, -0.0018308868, 0.18318558, -0.0013081668, -0.113424055, -0.22193146, 0.15262845, -0.13412614, -0.13704826, -0.22099695, 0.24989522, 0.0740908, -0.3789193, -0.05141985, 0.14818457) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.31471825, 0.16524819, 0.03326876, -0.14611365, -0.1191457, -0.06510173, -0.13893965, -0.33106923, 0.13048746, -0.527816, 0.01877066, 0.26005507, -0.06294366, -0.24761125, -0.102864824, 0.094261676) * go_3(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.023637002, -0.07186282, 0.0946568, 0.13016573, 0.27244806, -0.08329611, 0.049762517, 0.14729369, 0.15868294, 0.07715838, -0.039478883, -0.06753388, 0.13460182, -0.092146814, -0.11814287, 0.12007007) * go_4(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.06190745, -0.023566067, 0.239366, -0.0068376404, -0.15343493, 0.043685004, -0.047154866, 0.06527902, 0.11998191, -0.2565534, -0.091910206, -0.24104144, -0.12814765, 0.18195467, 0.11766466, 0.06181653) * go_4(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.06866098, 0.11969287, 0.00997188, 0.09261804, -0.14177154, -0.0052282973, 0.008734555, -0.20822202, 0.0068409014, -0.00470473, 0.031823143, -0.0601048, 0.05632819, 0.01690721, 0.01305342, -0.05824624) * go_4(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.20557542, -0.10924632, 0.012821291, -0.11472336, -0.012862975, -0.09720539, 0.016499901, 0.053605244, 0.2183789, -0.014083709, -0.052786104, -0.075659566, -0.15531872, -0.1454758, 0.032142643, 0.28776056) * go_4(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.09832725, 0.3388722, -0.092447765, -0.16408351, -0.2557467, 0.031259898, 0.12057204, -0.018744074, -0.46363798, 0.042668946, 0.06506717, -0.25751963, 0.043604825, 0.11740889, 0.07365291, -0.027296776) * go_4(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.060943104, -0.00371101, 0.13572243, 0.013030143, 0.01196217, -0.14187267, -0.016784329, -0.048273906, 0.2050283, -0.02000498, -0.069050424, -0.09851947, 0.028769497, 0.1289265, -0.0022706073, -0.00296877) * go_4(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.015049836, 0.01153945, -0.006021933, -0.022156725, -0.030286482, 0.24230544, 0.040056467, -0.021735856, 0.20740065, -0.08999259, 0.006861033, -0.104062624, 0.26829463, 0.051726963, -0.12235904, 0.19572715) * go_4(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.12676726, 0.17367609, -0.03689342, -0.034580305, -0.006836569, -0.06386566, 0.30929026, 0.09361281, -0.06405332, 0.26401913, -0.33314535, -0.06335476, -0.10960964, 0.13062708, 0.058030583, -0.1269144) * go_4(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.03625719, 0.07449099, 0.021113826, 0.008309737, -0.09200202, -0.13108951, -0.0054502958, 0.19819209, -0.24836262, 0.22340319, -0.06844758, -0.22940424, -0.03410828, 0.03854127, -0.050844472, 0.019776637) * go_4(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.014228765, -0.013087027, -0.18055649, 0.001141047, 0.14329694, -0.008534367, 0.006927009, -0.058499523, -0.030727612, -0.07256724, 0.0025644915, 0.007111054, 0.036673337, -0.026148604, 0.120233335, 0.110904366) * go_5(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.008129229, 0.047908727, -0.1769762, 0.013220415, 0.066762984, 0.06523022, -0.016525066, -0.014394631, -0.008272182, -0.029847749, -0.10351308, 0.036801845, 0.11523106, -0.055156656, 0.11873017, -0.128935) * go_5(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.21848068, -0.002019241, -0.06304477, 0.026670042, 0.039536465, -0.14145948, -0.06304873, 0.023532849, -0.122648045, 0.036414735, -0.037745856, -7.688992e-06, 0.059370764, -0.015019475, -0.029084614, 0.015826277) * go_5(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.09427522, -0.001972529, -0.09509679, -0.104867265, 0.05705236, 0.00031401246, 0.096889675, 0.15868911, -0.033721585, 0.08299121, -0.095194876, -0.1062834, -0.029866459, -0.041780088, -0.023895228, -0.0026728562) * go_5(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.27093527, -0.026471421, 0.09702481, 0.036061123, -0.1268649, 0.099340335, 0.15685195, -0.070615016, -0.13991052, -0.04212775, 0.096722156, 0.056507673, 0.02626438, 0.030435594, -0.00033173471, -0.024930432) * go_5(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.21608484, 0.038410295, -0.10975598, 0.12944944, -0.034110125, 0.03908566, -0.030190451, 0.031670973, -0.018954927, 0.0726848, 0.023156218, 0.017966276, -0.09825987, 0.023912448, 0.07257811, -0.008502145) * go_5(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.044695053, -0.046481512, -0.098602146, -0.13273694, -0.09406325, -0.0062411693, 0.10242225, 0.025881069, 0.061662897, 0.019632077, -0.069696225, -0.14693011, 0.034227923, 0.037439592, -0.17188378, -0.19963826) * go_5(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.25531536, -0.050288115, 0.11258405, -0.24783169, -0.034263797, 0.054084245, 0.119918555, -0.027509615, 0.10056127, -0.09610037, 0.16208062, 0.005269051, 0.08660796, 0.11050934, -0.012584769, -0.0040703616) * go_5(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.07649277, 0.13011539, -0.052341804, 0.07836859, 0.18562089, 0.07701519, -0.15669914, 0.007145429, 0.018427812, -0.12513049, -0.03395353, 0.14632194, -0.108091615, -0.01585824, 0.0602756, -0.11572579) * go_5(pixel.xy, 1, 1);
  result += vec4f(0.028852103, -0.003142654, 0.019121574, 0.026819304);
  textureStore(conv2d_5_tf_tex, pixel.xy, result);
}
