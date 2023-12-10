// Layer: Anime4K-v4.1-Upscale-GAN-x4-(UUL)-Conv-4x3x3x48
// Name: conv1ups4
// Inputs: ['conv0ups', 'conv0ups1', 'conv0ups2', 'conv0ups3', 'conv0ups4', 'conv0ups5']
// Output: conv1ups4
@group(0) @binding(0) var mySampler: sampler;
@group(0) @binding(1) var conv0ups_tex: texture_2d<f32>;
@group(0) @binding(2) var conv0ups1_tex: texture_2d<f32>;
@group(0) @binding(3) var conv0ups2_tex: texture_2d<f32>;
@group(0) @binding(4) var conv0ups3_tex: texture_2d<f32>;
@group(0) @binding(5) var conv0ups4_tex: texture_2d<f32>;
@group(0) @binding(6) var conv0ups5_tex: texture_2d<f32>;
@group(0) @binding(7) var conv1ups_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn go_0(fragUV: vec2<f32>, x_off: f32, y_off: f32) -> vec4f {
  var uv = fragUV;
  let dim: vec2f = vec2f(textureDimensions(conv0ups_tex));
  uv += vec2f(x_off / dim.x, y_off / dim.y) * 0.5;
  return max4(textureSample(conv0ups_tex, mySampler, uv), 0.0);
}

fn go_1(fragUV: vec2<f32>, x_off: f32, y_off: f32) -> vec4f {
  var uv = fragUV;
  let dim: vec2f = vec2f(textureDimensions(conv0ups1_tex));
  uv += vec2f(x_off / dim.x, y_off / dim.y) * 0.5;
  return max4(textureSample(conv0ups1_tex, mySampler, uv), 0.0);
}

fn go_2(fragUV: vec2<f32>, x_off: f32, y_off: f32) -> vec4f {
  var uv = fragUV;
  let dim: vec2f = vec2f(textureDimensions(conv0ups2_tex));
  uv += vec2f(x_off / dim.x, y_off / dim.y) * 0.5;
  return max4(textureSample(conv0ups2_tex, mySampler, uv), 0.0);
}

fn go_3(fragUV: vec2<f32>, x_off: f32, y_off: f32) -> vec4f {
  var uv = fragUV;
  let dim: vec2f = vec2f(textureDimensions(conv0ups3_tex));
  uv += vec2f(x_off / dim.x, y_off / dim.y) * 0.5;
  return max4(textureSample(conv0ups3_tex, mySampler, uv), 0.0);
}

fn go_4(fragUV: vec2<f32>, x_off: f32, y_off: f32) -> vec4f {
  var uv = fragUV;
  let dim: vec2f = vec2f(textureDimensions(conv0ups4_tex));
  uv += vec2f(x_off / dim.x, y_off / dim.y) * 0.5;
  return max4(textureSample(conv0ups4_tex, mySampler, uv), 0.0);
}

fn go_5(fragUV: vec2<f32>, x_off: f32, y_off: f32) -> vec4f {
  var uv = fragUV;
  let dim: vec2f = vec2f(textureDimensions(conv0ups5_tex));
  uv += vec2f(x_off / dim.x, y_off / dim.y) * 0.5;
  return max4(textureSample(conv0ups5_tex, mySampler, uv), 0.0);
}

fn go_6(fragUV: vec2<f32>, x_off: f32, y_off: f32) -> vec4f {
  var uv = fragUV;
  let dim: vec2f = vec2f(textureDimensions(conv0ups_tex));
  uv += vec2f(x_off / dim.x, y_off / dim.y) * 0.5;
  return max4(-textureSample(conv0ups_tex, mySampler, uv), 0.0);
}

fn go_7(fragUV: vec2<f32>, x_off: f32, y_off: f32) -> vec4f {
  var uv = fragUV;
  let dim: vec2f = vec2f(textureDimensions(conv0ups1_tex));
  uv += vec2f(x_off / dim.x, y_off / dim.y) * 0.5;
  return max4(-textureSample(conv0ups1_tex, mySampler, uv), 0.0);
}

fn go_8(fragUV: vec2<f32>, x_off: f32, y_off: f32) -> vec4f {
  var uv = fragUV;
  let dim: vec2f = vec2f(textureDimensions(conv0ups2_tex));
  uv += vec2f(x_off / dim.x, y_off / dim.y) * 0.5;
  return max4(-textureSample(conv0ups2_tex, mySampler, uv), 0.0);
}

fn go_9(fragUV: vec2<f32>, x_off: f32, y_off: f32) -> vec4f {
  var uv = fragUV;
  let dim: vec2f = vec2f(textureDimensions(conv0ups3_tex));
  uv += vec2f(x_off / dim.x, y_off / dim.y) * 0.5;
  return max4(-textureSample(conv0ups3_tex, mySampler, uv), 0.0);
}

fn go_10(fragUV: vec2<f32>, x_off: f32, y_off: f32) -> vec4f {
  var uv = fragUV;
  let dim: vec2f = vec2f(textureDimensions(conv0ups4_tex));
  uv += vec2f(x_off / dim.x, y_off / dim.y) * 0.5;
  return max4(-textureSample(conv0ups4_tex, mySampler, uv), 0.0);
}

fn go_11(fragUV: vec2<f32>, x_off: f32, y_off: f32) -> vec4f {
  var uv = fragUV;
  let dim: vec2f = vec2f(textureDimensions(conv0ups5_tex));
  uv += vec2f(x_off / dim.x, y_off / dim.y) * 0.5;
  return max4(-textureSample(conv0ups5_tex, mySampler, uv), 0.0);
}

@fragment
fn main(@location(0) fragUV: vec2<f32>) -> @location(0) vec4<f32> {
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.034727804, -0.0002637053, -0.04078105, -0.08927365, -0.07645947, 0.076919794, 0.005021898, 0.058050282, 0.015864419, -0.028619323, -0.071649395, 0.038069222, -0.08295531, -0.0003540787, -0.0004084796, 0.09838099) * go_0(fragUV, -1.0, -1.0);
  result += mat4x4<f32>(0.053080674, 0.002008403, -0.030753473, -0.00059351645, 0.21958888, -0.047472507, -0.10333183, 0.01189763, -0.25521263, 0.06761254, 0.033002634, 0.15817507, 0.056013178, 0.005128271, -0.0057734093, 0.026915452) * go_0(fragUV, -1.0, 0.0);
  result += mat4x4<f32>(0.018198377, -0.030808125, -0.005123907, -0.09906635, -0.0022847415, 0.027329655, 0.12032622, -0.053246, 0.17812891, -0.0034940862, -0.05836999, -0.17489943, -0.058187198, -0.04797969, 0.03180951, -0.0068172915) * go_0(fragUV, -1.0, 1.0);
  result += mat4x4<f32>(-0.007893344, -0.04144954, 0.022285834, -0.069708645, 0.011978968, -0.0041609593, -0.09588643, -0.09790428, 0.10254975, -0.07055374, 0.015816301, -0.008875658, -0.020530261, -0.037710804, -0.08531446, -0.16354285) * go_0(fragUV, 0.0, -1.0);
  result += mat4x4<f32>(0.009672311, 0.05724347, 0.1139366, 0.029182902, -0.16538447, 0.053901788, -0.05012634, 0.20983797, -0.11215055, -0.0032693828, 0.13143851, -0.07319714, 0.07356394, 0.21913917, -0.02512947, -0.09149598) * go_0(fragUV, 0.0, 0.0);
  result += mat4x4<f32>(-0.10140455, 0.017164832, 0.032349866, 0.088012405, -0.02051974, -0.079648875, 0.0045336485, -0.025527513, -0.103990085, 0.027295498, 0.034057755, 0.007966114, -0.019226998, 0.03644731, 0.07082869, 0.061730456) * go_0(fragUV, 0.0, 1.0);
  result += mat4x4<f32>(-0.019575765, 0.055050828, -0.06451268, -0.0031637426, 0.029987715, -0.09300758, -0.08723479, -0.023979021, -0.004959102, 0.055621523, 0.04736208, -0.017018013, -0.1752648, -0.047154278, 0.025960885, 0.20475896) * go_0(fragUV, 1.0, -1.0);
  result += mat4x4<f32>(-0.0056192777, -0.025803288, 0.032227412, -0.02016798, -0.031833343, 0.06160066, -0.06491425, 0.0011419505, 0.16180488, 0.024346532, -0.023937434, -0.10019908, 0.053700123, 0.08749021, -0.051140826, 0.002127793) * go_0(fragUV, 1.0, 0.0);
  result += mat4x4<f32>(-0.10793633, 0.0058197114, -0.013801388, -0.0061892844, -0.028018648, 0.011631394, 0.015553901, 0.057576846, 0.07057829, -0.03060998, 0.022989806, 0.012193347, 0.08022945, -0.07045989, 0.02723698, 0.0030155836) * go_0(fragUV, 1.0, 1.0);
  result += mat4x4<f32>(-0.04512287, -0.041164827, -0.032029074, -0.06730429, -0.019684372, -0.020619368, 0.11050403, -0.08812864, 0.032124072, 0.019207481, -0.023409393, -0.019082036, 0.014939763, 0.01212131, 0.0019187465, 0.08177548) * go_1(fragUV, -1.0, -1.0);
  result += mat4x4<f32>(0.17723826, -0.07731568, -0.0106458245, -0.0949864, -0.42690027, -0.005360146, -0.11773051, 0.27470574, 0.09827681, -0.015561, 0.1043857, 0.018999008, 0.029409967, -0.09800717, -0.106550716, 0.059578367) * go_1(fragUV, -1.0, 0.0);
  result += mat4x4<f32>(-0.14227667, 0.025659012, -0.087051585, 0.088987745, -0.038849983, -0.038027756, 0.13187966, -0.002485406, 0.0014433947, -0.025459114, 0.03288196, -0.02150798, -0.020861674, -0.04538319, 0.033835832, -0.03215041) * go_1(fragUV, -1.0, 1.0);
  result += mat4x4<f32>(-0.1553871, 0.029722217, 0.035195246, -0.10880293, 0.1550117, 0.005851412, -0.063834764, -0.1988861, -0.08803912, 0.052023105, -0.061123103, 0.026238514, -0.06444424, 0.034957945, 0.013564579, -0.04922909) * go_1(fragUV, 0.0, -1.0);
  result += mat4x4<f32>(-0.30188507, 0.041812148, -0.0051415698, 0.4225713, 0.123012245, 0.006190092, -0.11784305, -0.09278702, -0.032476064, 0.01649785, 0.06873298, 0.003889617, 0.12036293, 0.010126355, -0.0159458, -0.07610982) * go_1(fragUV, 0.0, 0.0);
  result += mat4x4<f32>(0.09901913, -0.08349318, 0.048260756, 0.015416775, -0.04753114, -0.059718408, -0.06824792, -0.17603761, 0.00778662, -0.0059375027, -0.083089516, -0.14063439, -0.12862016, 0.042804226, 0.023634497, -0.09797641) * go_1(fragUV, 0.0, 1.0);
  result += mat4x4<f32>(-0.024001475, -0.010116277, -0.053517547, -0.012852274, -0.06398481, 0.048043747, 0.033992432, 0.07568637, 0.19207221, -0.045017365, -0.14834619, -0.05611828, 0.012974322, 0.033472214, -0.069440804, 0.019957287) * go_1(fragUV, 1.0, -1.0);
  result += mat4x4<f32>(-0.06514664, 0.07197869, -0.10582491, -0.04518758, -0.04605446, -0.103915684, 0.09963303, 0.112704754, 0.0116696, 0.048416674, 0.043518696, 0.15309274, 0.079236075, -0.10255372, -0.024120726, 0.08078583) * go_1(fragUV, 1.0, 0.0);
  result += mat4x4<f32>(0.08656825, -0.059274856, 0.068748064, -0.09998145, 0.04256707, 0.07933082, -0.07329948, 0.10178932, 0.11183659, -0.028112091, 0.061075397, -0.0588522, -0.051063843, -0.013038464, -0.027286172, -0.03975418) * go_1(fragUV, 1.0, 1.0);
  result += mat4x4<f32>(0.11182532, 0.026677538, 0.01931928, -0.09913016, 0.025954673, -0.10134136, -0.03812254, -0.03199443, 0.100416884, -0.032493666, 0.05390669, -0.1215946, 0.030413928, 0.049877644, -0.059447087, -0.017498257) * go_2(fragUV, -1.0, -1.0);
  result += mat4x4<f32>(0.06850377, -0.023795482, 0.0076700076, 0.027123824, -0.17540605, 0.090537384, 0.089903906, 0.08784665, 0.056886338, 0.07318396, 0.017845241, 0.036417425, 0.00984014, 0.047083918, 0.057152037, -0.052876327) * go_2(fragUV, -1.0, 0.0);
  result += mat4x4<f32>(-0.121944204, -0.0068513937, -0.023799203, 0.04849627, 0.1347227, -0.1030107, 0.001971158, -0.115433335, 0.10797434, -0.012841425, -0.057837863, 0.0155828055, -0.19377467, 0.0055032945, 0.003947639, 0.017919105) * go_2(fragUV, -1.0, 1.0);
  result += mat4x4<f32>(-0.20650981, 0.07069638, 0.038973074, 0.09843876, 0.068253726, 0.09169397, 0.10435845, -0.0691921, 0.051520117, -0.037182227, 0.04543112, 0.075975135, 0.12886383, -0.062047563, 0.09874315, 0.009082724) * go_2(fragUV, 0.0, -1.0);
  result += mat4x4<f32>(-0.079879194, -0.079275034, -0.056224998, 0.19465743, 0.08354674, -0.12681249, -0.064639136, 0.11830915, -0.23791347, 0.011471329, -0.028716747, 0.090518124, -0.14705297, -0.14800677, 0.040497895, 0.2106043) * go_2(fragUV, 0.0, 0.0);
  result += mat4x4<f32>(-0.10478849, 0.14821102, 0.006451715, -0.0054948176, -0.21951425, 0.058777, -0.055765983, -0.017423972, -0.03932819, 0.03443368, 0.061615612, 0.0059949807, 0.117751196, 0.06963176, -0.056414824, -0.023910165) * go_2(fragUV, 0.0, 1.0);
  result += mat4x4<f32>(0.07807272, -0.032261666, 0.021192279, -0.11579501, 0.0188122, 0.017952453, 0.06170359, -0.021977829, 0.16133995, -0.13010149, -0.16331437, -0.010100977, 0.050390303, 0.055919446, 0.033072688, 0.025785616) * go_2(fragUV, 1.0, -1.0);
  result += mat4x4<f32>(-0.022184338, -0.14055336, -0.095062464, -0.0041828197, -0.025712729, 0.031116307, 0.036420126, -0.09461098, -0.12736198, 0.03323538, 0.070970595, 0.11801352, -0.025641473, -0.04504696, 0.0030125964, -0.091391) * go_2(fragUV, 1.0, 0.0);
  result += mat4x4<f32>(0.04494935, 0.10812193, 0.080031045, 0.018296331, 0.018970827, -0.052274104, -0.0689094, -0.019235257, 0.02062231, -0.082279414, -0.0175502, 0.017041082, 0.06990016, 0.06712624, 0.023160413, -0.057801697) * go_2(fragUV, 1.0, 1.0);
  result += mat4x4<f32>(0.049425572, -0.02474476, 0.07820988, 0.05521917, 0.052971717, -0.007768393, -0.001464341, -0.2064974, -0.03196784, 0.02195545, 0.12278798, -0.11918513, 0.06497295, 0.022542082, 0.08465838, -0.21600927) * go_3(fragUV, -1.0, -1.0);
  result += mat4x4<f32>(0.07904455, -0.00799822, -0.07466292, 0.012005663, -0.17555022, 0.1637635, 0.063736685, -0.0021971513, 0.08062457, -0.08926104, -0.052941434, 0.12072748, 0.15161732, -0.010707747, -0.052357092, -0.1074367) * go_3(fragUV, -1.0, 0.0);
  result += mat4x4<f32>(-0.023624638, -0.022204673, 0.021252679, 0.016148455, -0.00191494, -0.00606788, -0.017119512, -0.13170989, -0.11873442, 0.067021996, 0.005754373, 0.042165596, -0.19932863, 0.0850464, -0.010264557, 0.16757919) * go_3(fragUV, -1.0, 1.0);
  result += mat4x4<f32>(0.0379892, 0.052664872, -0.12167355, 0.2524495, 0.08369987, -0.07664706, 0.007957599, -0.04493479, 0.036094286, 0.042244308, 0.09976276, -0.1014558, 0.00077894697, 0.02168721, 0.13530052, 0.07524451) * go_3(fragUV, 0.0, -1.0);
  result += mat4x4<f32>(-0.0307444, 0.06874138, 0.10381962, 0.0039765453, 0.19239871, -0.115774564, -0.039901294, 0.13674201, 0.23891816, -0.26257655, -0.13401362, -0.0026337842, 0.14189234, -0.16459025, -0.07943012, -0.024599468) * go_3(fragUV, 0.0, 0.0);
  result += mat4x4<f32>(0.10089985, -0.065910965, -0.060871962, 0.020102434, 0.10416804, 0.0026375954, 0.00017099817, 0.07224531, -0.050626464, 0.05784554, -0.04115028, 0.03422795, 0.0849365, 0.07881633, -0.04332016, 0.012389496) * go_3(fragUV, 0.0, 1.0);
  result += mat4x4<f32>(0.0968923, -0.11488315, -0.33647102, -0.07759128, -0.065646835, 0.08871705, 0.06547451, -0.052951876, 0.031025445, 0.05321443, 0.0861705, -0.01150282, -0.017868344, 0.05863463, -0.048652783, -0.00302825) * go_3(fragUV, 1.0, -1.0);
  result += mat4x4<f32>(-0.08623984, 0.030496845, 0.13282211, 0.036924344, -0.051652618, 0.045645814, -0.04972949, -0.06819525, 0.07043929, -0.03750826, -0.061573654, -0.02713896, -0.02949009, -0.15784396, 0.04846532, -0.01809239) * go_3(fragUV, 1.0, 0.0);
  result += mat4x4<f32>(-0.055429317, 0.020174243, 0.056924883, 0.015847506, -0.020308318, 0.006933419, 0.055292472, -0.08543373, -0.04522778, 0.015520184, 0.049334437, -0.06302532, -0.033106968, 0.07696187, -0.028078254, -0.07835302) * go_3(fragUV, 1.0, 1.0);
  result += mat4x4<f32>(0.06727477, -0.015105682, 0.037172996, 0.040687807, -0.13228765, -0.029248675, -0.14732817, -0.023869514, -0.0059372024, -0.08419329, 0.051801164, -0.014700099, -0.13818024, -0.07835987, -0.05691042, 0.16196246) * go_4(fragUV, -1.0, -1.0);
  result += mat4x4<f32>(-0.067745954, 0.050429884, 0.015547787, 0.028301466, 0.065669335, -0.0015817108, 0.0043691727, 0.14655195, 0.11468205, 0.05447307, -0.018185347, -0.044705737, -0.071984716, -0.116617225, -0.13028212, 0.040051438) * go_4(fragUV, -1.0, 0.0);
  result += mat4x4<f32>(0.07309806, -0.05016123, 0.014905728, -0.054026593, -0.14251226, -0.068813756, -0.046204448, 0.033708956, 0.07477926, -0.07824067, -0.06448796, 0.0962089, -0.091852166, 0.033222884, 0.05655323, -0.07739394) * go_4(fragUV, -1.0, 1.0);
  result += mat4x4<f32>(0.07736231, -0.024777608, -0.1293071, 0.013133082, -0.07063114, 0.1109699, 0.101938464, -0.08170503, -0.03952933, 0.020189505, 0.10726348, -0.0038012264, -0.10198266, 0.074299835, -0.027496899, -0.016759772) * go_4(fragUV, 0.0, -1.0);
  result += mat4x4<f32>(-0.14961888, 0.1258593, -0.0052209287, 0.039395887, 0.12711245, 0.0013706739, -0.08743356, -0.08160573, -0.1520503, 0.24310453, -0.03702458, -0.09234655, 0.06342837, -0.10495964, -0.038142283, 0.013867651) * go_4(fragUV, 0.0, 0.0);
  result += mat4x4<f32>(0.08367, 0.0056849197, 0.029983053, 0.058390055, -0.019536944, 0.0028544245, 0.011593604, -0.051143557, -0.05816587, 0.027562857, -0.0017863734, -0.08943097, -0.093870126, -0.028033571, -0.054928187, 0.08027421) * go_4(fragUV, 0.0, 1.0);
  result += mat4x4<f32>(0.033707395, -0.044078007, -0.053134337, 0.0507039, -0.09321825, 0.012356747, 0.0040974314, -0.003692714, 0.069862105, -0.18684517, -0.0284769, -0.006533823, 0.04286592, 0.03399364, 0.12019272, 0.02192102) * go_4(fragUV, 1.0, -1.0);
  result += mat4x4<f32>(-0.023521578, 0.053177245, 0.03841634, 0.04009258, -0.05288018, 0.03800796, -0.027160875, -0.022709413, -0.012118504, 0.11544428, -0.064255424, -0.047267172, 0.031934835, -0.058591012, -0.12601322, -0.04370528) * go_4(fragUV, 1.0, 0.0);
  result += mat4x4<f32>(-0.056990914, -0.010060407, -0.07240389, 0.06684859, 0.0032037962, -0.07508207, 0.069522485, -0.01681518, 0.013611935, -0.16260943, 0.027228389, 0.10390345, -0.014050312, -0.0047456035, 0.042484682, 0.047142867) * go_4(fragUV, 1.0, 1.0);
  result += mat4x4<f32>(-0.019846022, 0.063520834, 0.017347157, -0.13179752, 0.007603209, -0.028248534, -0.028568985, 0.093736105, -0.17765392, 0.05268901, -0.0186878, 0.033344116, 0.024792168, 0.017350389, -0.0081479745, 0.06272762) * go_5(fragUV, -1.0, -1.0);
  result += mat4x4<f32>(0.0059420844, -0.1867459, -0.018476382, 0.052615725, 0.02969877, -0.04300831, 0.09686539, -0.055483308, 0.13513166, -0.1240312, 0.007219588, 0.15463871, -0.011168133, 0.060228556, 0.052193474, 0.008193267) * go_5(fragUV, -1.0, 0.0);
  result += mat4x4<f32>(-0.1624262, 0.114470325, -0.0026692473, 0.072655715, 0.022212451, -0.105359286, 0.003962184, 0.059404753, -0.062533595, -0.0073033636, 0.032570038, 0.07631924, -0.037281662, 0.052920066, -0.10017278, 0.20030634) * go_5(fragUV, -1.0, 1.0);
  result += mat4x4<f32>(-0.017912557, 0.082836725, 0.11956426, 0.031851728, 0.026227003, 0.1358852, -0.00038559595, -0.03953659, 0.012969185, 0.058900252, 0.00449276, -0.11351474, 0.0055319364, -0.027457854, -0.16637279, 0.018961368) * go_5(fragUV, 0.0, -1.0);
  result += mat4x4<f32>(0.05881227, -0.12862639, 0.009855859, -0.07688508, 0.04652196, -0.0533903, -0.007106217, 0.018683957, -0.07146832, -0.11476164, -0.103965536, 0.07516234, -0.019355783, 0.007153188, 0.041109473, -0.18096745) * go_5(fragUV, 0.0, 0.0);
  result += mat4x4<f32>(-0.04096085, -0.0120420605, -0.07280902, -0.047139794, -0.047899578, 0.16604978, -0.053028557, 0.011966148, -0.184552, -0.002035077, 0.0024748729, -0.09468539, 0.094834864, -0.051123336, 0.026882114, -0.066742696) * go_5(fragUV, 0.0, 1.0);
  result += mat4x4<f32>(0.038528133, -0.033147186, -0.02949031, -0.02029768, -0.040530026, -0.015674416, 0.09512282, 0.018635508, -0.067790225, -0.02075488, 0.043550573, 0.1306589, 0.086521745, -0.058867045, -0.036897544, -0.007429917) * go_5(fragUV, 1.0, -1.0);
  result += mat4x4<f32>(-0.020455752, 0.036337826, 0.08651425, -0.063962474, -0.06910245, -0.08926637, -0.08221216, 0.023650987, 0.0064421804, -0.051710796, 0.03269987, 0.03594872, -0.09746091, 0.064322695, 0.09333605, 0.04992705) * go_5(fragUV, 1.0, 0.0);
  result += mat4x4<f32>(0.03991011, 0.0053357375, -0.014087123, 0.017906683, -0.043873426, -0.008717143, 0.023789125, 0.08014774, 0.08554654, 0.010068118, -0.015257393, -0.014789898, -0.031751424, -0.05767671, 0.012219075, -0.02111906) * go_5(fragUV, 1.0, 1.0);
  result += mat4x4<f32>(0.0141180735, -0.010895809, 0.052282777, 0.097730994, 0.015570911, -0.05456141, 0.047802925, -0.024732279, 0.08743008, -0.0649473, 0.09175468, -0.09115185, 0.05110333, -0.030661354, 0.043550953, -0.027077332) * go_6(fragUV, -1.0, -1.0);
  result += mat4x4<f32>(0.069662735, 0.014375632, -0.025021026, -0.08532459, -0.1172516, 0.08657796, -0.017789776, 0.057316136, -0.019252973, -0.11636445, -0.121823244, 0.076532796, 0.025541514, -0.117330685, 0.009741623, -0.13352062) * go_6(fragUV, -1.0, 0.0);
  result += mat4x4<f32>(0.07859826, -0.03841275, 0.026950957, 0.012414173, -0.15537256, 0.048285972, -0.036940835, 0.078606136, 0.12113207, 0.0019378428, 0.0036203277, -0.109209254, -0.14025345, 0.014132115, 0.049628686, 0.02013767) * go_6(fragUV, -1.0, 1.0);
  result += mat4x4<f32>(-0.018229844, 0.009986906, -0.0020206913, 0.06816855, 0.12637497, -0.012840852, -0.098092966, 0.0066382973, -0.080831006, 0.08936906, 0.061671916, -0.025697216, 0.06976024, 0.07710459, 0.025804073, 0.09451786) * go_6(fragUV, 0.0, -1.0);
  result += mat4x4<f32>(0.13568228, -0.07880537, -0.0030531003, -0.18527938, -0.12759425, -0.031123286, 0.1039914, -0.05713946, -0.022119742, 0.044847313, -0.049640287, 0.29528186, -0.011861515, -0.056314517, 0.12202725, 0.03458099) * go_6(fragUV, 0.0, 0.0);
  result += mat4x4<f32>(-0.31482193, 0.15610562, 0.011000054, 0.22054587, 0.16342026, 0.046199072, -0.069771886, 0.052295752, -0.08888668, -0.030175507, -0.043750275, 0.07468628, -0.1403002, -0.08709627, -0.16045636, 0.17453533) * go_6(fragUV, 0.0, 1.0);
  result += mat4x4<f32>(-0.15869538, -0.041802768, 0.07982854, 0.10661079, -0.026911188, 0.033564463, -0.028775161, 0.1129868, -0.13782723, -0.030502934, -0.029017925, 0.16539475, 0.15872754, 0.0072790803, 0.0005220163, -0.16314733) * go_6(fragUV, 1.0, -1.0);
  result += mat4x4<f32>(0.08336712, 0.013299961, -0.004736551, -0.12530428, 0.068627216, -0.038133577, 0.07625137, -0.13831565, -0.12425708, 0.012594521, 0.048374295, -0.09718588, -0.12617798, -0.15565023, 0.025003273, 0.063952625) * go_6(fragUV, 1.0, 0.0);
  result += mat4x4<f32>(-0.09114798, -0.107948475, -0.008782385, -0.012404769, -0.047347188, 0.06744946, -0.029818984, 0.037601177, 0.0022323371, 0.0120422365, -0.027577981, -0.056484457, 0.03623973, 0.11577824, -0.05978022, -0.11340042) * go_6(fragUV, 1.0, 1.0);
  result += mat4x4<f32>(0.07920609, 0.049682815, -0.09747983, 0.032554645, -0.053569455, -0.00999872, -0.069765046, 0.065798655, 0.0055020596, -0.02180595, 0.097490765, 0.056493532, -0.028652878, 0.007181037, 0.047301996, 0.041324418) * go_7(fragUV, -1.0, -1.0);
  result += mat4x4<f32>(-0.070817575, 0.016761765, 0.10452257, -0.059046734, 0.004419305, 0.030409766, 0.0064111007, 0.13009071, -0.063529834, 0.014894562, -0.1425434, 0.06799876, 0.10536852, 0.16146809, 0.11159344, -0.24632217) * go_7(fragUV, -1.0, 0.0);
  result += mat4x4<f32>(0.04417992, -0.021688385, 0.014431484, 0.021390032, -0.012122509, 0.022933502, -0.13032858, -0.025157295, 0.054504506, 0.054097243, 0.054826245, 0.15188119, -0.034925304, 0.10371481, -0.07059149, -0.0050918995) * go_7(fragUV, -1.0, 1.0);
  result += mat4x4<f32>(0.19140609, -0.05802228, 0.094347574, -0.12581742, -0.0625323, 0.022887295, 0.06422475, 0.03780498, 0.09092349, -0.015626192, 0.07367314, -0.058542114, 0.06868667, -0.035847936, -0.024409411, 0.1747349) * go_7(fragUV, 0.0, -1.0);
  result += mat4x4<f32>(-0.30528593, -0.10157623, -0.12546054, 0.39260107, 0.09250387, -0.0030448753, -0.007666954, -0.21076955, 0.1802103, 0.056665543, 0.02010969, -0.08567675, 0.04852171, -0.00719571, 0.12876126, -0.020769617) * go_7(fragUV, 0.0, 0.0);
  result += mat4x4<f32>(-0.07077291, 0.09790252, -0.039679084, 0.035164144, 0.03944513, 0.09567806, 0.06502516, 0.08660869, -0.045210075, 0.024901882, -0.034987845, 0.03644262, 0.13453478, -0.10065292, -0.10663197, 0.17999896) * go_7(fragUV, 0.0, 1.0);
  result += mat4x4<f32>(0.11361161, 0.049233153, 0.17776433, -0.11848224, -0.12014295, -0.048427843, -0.038806908, 0.0044329837, -0.015402301, 0.06310864, 0.103736125, 0.088702485, 0.018769085, -0.03721601, 0.08529103, 0.07698302) * go_7(fragUV, 1.0, -1.0);
  result += mat4x4<f32>(0.2228605, -0.16978644, -0.084252514, -0.030923214, -0.07607342, 0.062837236, -0.072185166, 0.033597596, 0.056401767, -0.118337765, -0.038241208, -0.056982394, -0.2012854, 0.12231061, -0.008026072, -0.109389454) * go_7(fragUV, 1.0, 0.0);
  result += mat4x4<f32>(0.0015117185, 0.05613352, -0.06825942, 0.009839623, 0.042997725, -0.07901763, 0.029729009, -0.0028087173, -0.08048221, 0.035971392, -0.054953404, 0.06957555, -0.002079063, -0.033700537, 0.019343253, 0.031806916) * go_7(fragUV, 1.0, 1.0);
  result += mat4x4<f32>(-0.07396316, -0.012248619, 0.033239935, 0.14771299, -0.069767915, 0.12465951, 0.008810514, -0.04538992, -0.028040458, 0.024957748, 0.033437315, -0.021906354, -0.019794602, -0.0068365987, 0.04044681, 0.078028694) * go_8(fragUV, -1.0, -1.0);
  result += mat4x4<f32>(0.06884948, 0.07350869, -0.074930884, -0.007918249, -0.03207752, -0.09060679, -0.03723486, 0.13875768, 0.063804045, -0.019163225, -0.058482785, -0.003301451, 0.03025363, 0.031453874, 0.023407444, 0.10760923) * go_8(fragUV, -1.0, 0.0);
  result += mat4x4<f32>(-0.082054876, -0.0019968427, 0.07620411, -0.029166577, 0.08874712, 0.18888156, -0.030155689, 0.054525856, 0.052349947, -0.003841255, 0.082797535, -0.1112327, -0.11962874, -0.010657527, -0.06920624, 0.12807392) * go_8(fragUV, -1.0, 1.0);
  result += mat4x4<f32>(-0.04174062, -0.11311825, -0.043029234, -0.005712201, -0.07848321, -0.09407437, -0.036250837, 0.02130589, -0.046314713, 0.030492928, -0.028527915, 0.088576436, 0.05369699, 0.05489917, -0.03764619, -0.15915689) * go_8(fragUV, 0.0, -1.0);
  result += mat4x4<f32>(-0.046594873, 0.20227629, 0.040293384, -0.08287198, -0.005414862, -0.28493062, -0.04951152, -0.031801622, 0.11361959, -0.14512685, -0.0513244, 0.014590199, 0.06330705, 0.06599253, -0.0758426, -0.024604654) * go_8(fragUV, 0.0, 0.0);
  result += mat4x4<f32>(0.045725603, -0.16616176, 0.008172408, -0.16198505, -0.109427124, -0.04342513, 0.095679626, -0.021264061, -0.036292598, 0.052533228, 0.034383826, 0.13430162, 0.012503482, -0.16574247, 0.0145925265, -0.12279197) * go_8(fragUV, 0.0, 1.0);
  result += mat4x4<f32>(0.059712145, 0.03292878, -0.06478352, -0.04920082, -0.12868343, -0.017725367, -0.029865744, 0.06404541, -0.061571013, 0.052956223, 0.04353032, 0.093550734, 0.12689152, -0.08983797, -0.022431724, -0.08593952) * go_8(fragUV, 1.0, -1.0);
  result += mat4x4<f32>(0.03359343, 0.048530146, 0.09413768, 0.11177407, 0.04880107, 0.24067947, 0.011833709, -0.078301296, -0.042119082, -0.034178667, 0.061119724, -0.120325305, -0.0983844, 0.13863018, 0.009808043, 0.1421859) * go_8(fragUV, 1.0, 0.0);
  result += mat4x4<f32>(-0.010974268, -0.1115841, -0.054475926, -0.0034415766, 0.026416495, -0.01970317, 0.03224585, -0.058208283, -0.11544842, -0.0020619717, -0.08399764, 0.0026783822, -0.1718955, -0.041662555, -0.015576194, 0.06694191) * go_8(fragUV, 1.0, 1.0);
  result += mat4x4<f32>(0.00800654, 0.033414684, 0.0059746862, -0.063755505, -0.10903599, 0.008542795, -0.037268512, 0.16888456, 0.056287125, -0.03404509, -0.09667668, 0.104763724, -0.008024127, -0.04937347, -0.10452099, 0.10492107) * go_9(fragUV, -1.0, -1.0);
  result += mat4x4<f32>(0.06546199, -0.031890426, 0.069498874, -0.078704424, 0.25283763, -0.14762846, 0.04530997, -0.045402203, -0.12743446, 0.11075257, 0.07440054, -0.06769535, -0.18811068, 0.25209752, 0.08396347, -0.028190762) * go_9(fragUV, -1.0, 0.0);
  result += mat4x4<f32>(-0.058439903, 0.05627421, -0.021890977, -0.037036832, -0.114436746, -0.08907827, 0.044764686, 0.01914178, 0.1590001, -0.07434893, 0.02097053, -0.07084182, 0.1515443, -0.2537095, -0.0027643284, 0.084454305) * go_9(fragUV, -1.0, 1.0);
  result += mat4x4<f32>(-0.076359995, -0.0627694, 0.018656332, 0.04576309, -0.11114888, 0.10748641, 0.0005612302, -0.07483226, -0.123604506, -0.01065677, -0.12491006, 0.17782594, -0.042662233, -0.13512325, 0.002357882, 0.041785236) * go_9(fragUV, 0.0, -1.0);
  result += mat4x4<f32>(0.044498313, -0.034588944, -0.060735952, 0.10017004, 0.1829563, -0.110846855, -0.0071944734, -0.21084824, -0.09436389, 0.075625, 0.11743136, 0.082467705, -0.12590492, 0.16034272, -0.027081264, 0.12026207) * go_9(fragUV, 0.0, 0.0);
  result += mat4x4<f32>(0.023862181, -0.039685655, -0.03180271, -0.07354787, -0.004479257, 0.10744732, 0.009859138, -0.012063299, -0.022220258, 0.047518592, 0.033523124, -0.0649853, -0.07418109, -0.0014141474, 0.050895244, -0.11969986) * go_9(fragUV, 0.0, 1.0);
  result += mat4x4<f32>(-0.13460042, -0.005373036, 0.031577356, -0.059198633, 0.14659238, -0.03347293, 0.02293272, 0.01125362, 0.038268805, -0.023691624, -0.056778222, 0.046417404, 0.043189395, 0.061058786, -0.03529992, -0.0040747337) * go_9(fragUV, 1.0, -1.0);
  result += mat4x4<f32>(-0.009540408, 0.026412092, -0.021290602, 0.05017281, -0.1377568, -0.030549733, -0.015086134, 0.011051821, -0.008516101, -0.019729864, 0.040555786, -0.0020136, -0.017682496, -0.04843083, 0.04729837, 0.019968264) * go_9(fragUV, 1.0, 0.0);
  result += mat4x4<f32>(0.09082752, 0.0026033274, 0.028575374, -0.025889728, -0.050833948, 0.013812897, -0.04887108, 0.09218356, 0.022451764, 0.037223153, -0.027608475, 0.085869305, 0.12708172, -0.051653415, -0.024209773, 0.010738581) * go_9(fragUV, 1.0, 1.0);
  result += mat4x4<f32>(-0.0878504, -0.002425818, -0.058977496, 0.06816431, -0.039408945, 0.039009362, 0.05321227, 0.029558498, 0.011840146, 0.07260068, -0.057486057, -0.06833475, 0.09252713, -0.0047036964, -0.034099206, 0.015589183) * go_10(fragUV, -1.0, -1.0);
  result += mat4x4<f32>(-0.28815338, -0.00087825046, 0.0071661393, 0.16078453, -0.1556803, 0.11429835, 0.050905548, 0.13695535, 0.019274501, -0.0524514, -0.03422561, 0.073096104, -0.116625205, 0.044406146, 0.010334628, -0.030600524) * go_10(fragUV, -1.0, 0.0);
  result += mat4x4<f32>(0.10218649, -0.08387807, 0.092632025, -0.08798674, 0.10308468, -0.056788463, -0.02508743, -0.1875314, -0.04963394, -0.02515536, 0.016212277, -0.11503518, -0.0781842, 0.06420591, -0.108524114, 0.17282988) * go_10(fragUV, -1.0, 1.0);
  result += mat4x4<f32>(0.003542966, 0.019591188, -0.08079507, -0.11198943, 0.01007831, -0.2011082, 0.067526735, -0.047118634, -0.10812045, -0.059538897, -0.045146156, 0.13073483, 0.05126951, -0.02858464, -0.004749588, -0.031439688) * go_10(fragUV, 0.0, -1.0);
  result += mat4x4<f32>(0.072345056, -0.09738051, 0.08760573, -0.022531908, -0.047364343, -0.17568587, -0.2608395, 0.045407616, -0.07019225, -0.13740852, 0.058587123, 0.18292065, 0.09621877, -0.020006223, 0.15761665, -0.13615946) * go_10(fragUV, 0.0, 0.0);
  result += mat4x4<f32>(-0.1718546, -0.01606792, -0.13376851, -0.101972945, 0.0070967157, 0.04433216, 0.11647199, 0.14794576, 0.030467365, -0.009967707, 0.032096114, 0.088179365, 0.04789371, -0.02212034, -0.0864584, -0.014849047) * go_10(fragUV, 0.0, 1.0);
  result += mat4x4<f32>(-0.06263458, 0.049204566, 0.0074049286, 0.08565975, -0.110386156, 0.12832628, 0.09386574, 0.049480855, -0.0016362247, 0.074590564, 0.0054266076, -0.045816354, -0.05795489, -0.016349988, -0.031305015, 0.05890967) * go_10(fragUV, 1.0, -1.0);
  result += mat4x4<f32>(-0.0501839, -0.05510687, -0.028112158, -0.11355264, -0.05924529, -0.08571114, -0.013579364, 0.017053023, 0.0010346711, -0.046210892, -0.0037062326, 0.029555755, -0.05744646, 0.12624447, 0.1155726, 0.089930065) * go_10(fragUV, 1.0, 0.0);
  result += mat4x4<f32>(0.007059197, 0.009385381, 0.03781498, 0.029385434, 0.019378664, 0.05941773, -0.019638034, 0.042409096, 0.006617822, 0.12051479, -0.029510934, -0.02263101, 0.030360708, -0.019180574, -0.026342172, -0.041857187) * go_10(fragUV, 1.0, 1.0);
  result += mat4x4<f32>(0.0818786, -0.032271262, 0.071428634, -0.08608651, -0.04190674, -0.00824319, 0.10103971, 0.0037571234, 0.008354248, -0.042853825, -0.009960182, -0.032470513, 0.032495033, 0.026434308, -0.09047023, -0.0852796) * go_11(fragUV, -1.0, -1.0);
  result += mat4x4<f32>(0.06265211, 0.074583925, -0.3457799, 0.29229483, -0.012138351, 0.06712728, -0.012218277, -0.1310903, -0.053811703, 0.13035119, -0.0029521107, -0.104537845, 0.01667666, -0.13404848, -0.06062046, -0.06467337) * go_11(fragUV, -1.0, 0.0);
  result += mat4x4<f32>(-0.0877269, -0.006120627, 0.015308095, -0.07658341, 0.044869956, 0.110927165, -0.017984338, -0.05883644, 0.10883275, -0.05540534, -0.066199474, -0.035501923, 0.08745832, -0.051100407, -0.012019903, -0.21526352) * go_11(fragUV, -1.0, 1.0);
  result += mat4x4<f32>(-0.15372752, -0.089689255, -0.013654722, 0.06576831, 0.027755309, -0.104312494, -0.028859973, -0.03941162, 0.038844027, -0.05383401, -0.015755473, -0.022027731, -0.022023248, -0.010001586, 0.04700765, -0.08062122) * go_11(fragUV, 0.0, -1.0);
  result += mat4x4<f32>(0.28677022, -0.00547834, -0.30174148, 0.029182414, -0.048473436, 0.025972357, 0.055102646, 0.101237364, -0.23414372, -0.08980447, -0.021093715, 0.35020643, -0.01737129, 0.079039715, -0.030023094, 0.30941373) * go_11(fragUV, 0.0, 0.0);
  result += mat4x4<f32>(0.00023344456, 0.016616862, 0.20732638, -0.073667265, -0.077047884, -0.1365057, -0.0055750906, 0.18779595, -0.036738984, 0.07126904, 0.107798554, 0.106782034, -0.123831004, 0.026100466, 0.025854755, 0.10167399) * go_11(fragUV, 0.0, 1.0);
  result += mat4x4<f32>(0.099524446, -0.022513278, -0.12082586, 0.06544828, -0.007710609, -0.007333112, -0.00392318, 0.02316836, 0.017616706, 0.019067803, -0.020043733, -0.055381116, -0.0026772777, 0.043929495, 0.12632295, -0.055047728) * go_11(fragUV, 1.0, -1.0);
  result += mat4x4<f32>(-0.007819067, 0.04826883, -0.031578127, -0.007692658, -0.049392797, 0.10384446, -0.11374874, -0.0072268755, 0.023231281, -0.0048957644, -0.056877382, -0.09215107, 0.26584074, -0.14522901, -0.18154982, 0.006760759) * go_11(fragUV, 1.0, 0.0);
  result += mat4x4<f32>(0.049991615, -0.016547658, -0.037466943, 0.011288937, -0.029595152, 0.029153928, 0.03047645, -0.017851416, 0.08244422, 0.015353446, 0.056757286, -0.13458207, 0.06421748, 0.02236419, 0.054289207, -0.021456666) * go_11(fragUV, 1.0, 1.0);
  result += vec4f(-0.024596691, -0.0062545678, 0.0007283314, -0.0012659894);

  return result;
}
