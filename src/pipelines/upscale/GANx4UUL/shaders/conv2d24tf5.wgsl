// Layer: Anime4K-v4.1-Upscale-GAN-x4-(UUL)-Conv-4x1x1x120
// Name: conv2d24tf5
// Inputs: ['conv2d_21_tf', 'conv2d_21_tf1', 'conv2d_21_tf2', 'conv2d_21_tf3', 'conv2d_21_tf4', 'conv2d_21_tf5', 'conv2d_23_tf', 'conv2d_1_tf', 'conv2d_4_tf', 'conv2d_7_tf', 'conv2d_10_tf', 'conv2d_13_tf', 'conv2d_16_tf', 'conv2d_19_tf', 'conv2d_22_tf']
// Output: conv2d_24_tf5
@group(0) @binding(0) var conv2d_21_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_21_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_21_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_21_tf3_tex: texture_2d<f32>;
@group(0) @binding(4) var conv2d_21_tf4_tex: texture_2d<f32>;
@group(0) @binding(5) var conv2d_21_tf5_tex: texture_2d<f32>;
@group(0) @binding(6) var conv2d_23_tf_tex: texture_2d<f32>;
@group(0) @binding(7) var conv2d_1_tf_tex: texture_2d<f32>;
@group(0) @binding(8) var conv2d_4_tf_tex: texture_2d<f32>;
@group(0) @binding(9) var conv2d_7_tf_tex: texture_2d<f32>;
@group(0) @binding(10) var conv2d_10_tf_tex: texture_2d<f32>;
@group(0) @binding(11) var conv2d_13_tf_tex: texture_2d<f32>;
@group(0) @binding(12) var conv2d_16_tf_tex: texture_2d<f32>;
@group(0) @binding(13) var conv2d_19_tf_tex: texture_2d<f32>;
@group(0) @binding(14) var conv2d_22_tf_tex: texture_2d<f32>;
@group(0) @binding(15) var conv2d_24_tf5_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn g_0(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_21_tf_tex, pos, 0), 0.0);
}

fn g_1(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_21_tf1_tex, pos, 0), 0.0);
}

fn g_2(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_21_tf2_tex, pos, 0), 0.0);
}

fn g_3(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_21_tf3_tex, pos, 0), 0.0);
}

fn g_4(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_21_tf4_tex, pos, 0), 0.0);
}

fn g_5(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_21_tf5_tex, pos, 0), 0.0);
}

fn g_6(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_21_tf_tex, pos, 0), 0.0);
}

fn g_7(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_21_tf1_tex, pos, 0), 0.0);
}

fn g_8(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_21_tf2_tex, pos, 0), 0.0);
}

fn g_9(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_21_tf3_tex, pos, 0), 0.0);
}

fn g_10(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_21_tf4_tex, pos, 0), 0.0);
}

fn g_11(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_21_tf5_tex, pos, 0), 0.0);
}

fn g_12(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_23_tf_tex, pos, 0), 0.0);
}

fn g_13(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_23_tf_tex, pos, 0), 0.0);
}

fn g_14(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_1_tf_tex, pos, 0), 0.0);
}

fn g_15(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_1_tf_tex, pos, 0), 0.0);
}

fn g_16(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_4_tf_tex, pos, 0), 0.0);
}

fn g_17(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_4_tf_tex, pos, 0), 0.0);
}

fn g_18(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_7_tf_tex, pos, 0), 0.0);
}

fn g_19(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_7_tf_tex, pos, 0), 0.0);
}

fn g_20(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_10_tf_tex, pos, 0), 0.0);
}

fn g_21(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_10_tf_tex, pos, 0), 0.0);
}

fn g_22(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_13_tf_tex, pos, 0), 0.0);
}

fn g_23(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_13_tf_tex, pos, 0), 0.0);
}

fn g_24(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_16_tf_tex, pos, 0), 0.0);
}

fn g_25(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_16_tf_tex, pos, 0), 0.0);
}

fn g_26(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_19_tf_tex, pos, 0), 0.0);
}

fn g_27(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_19_tf_tex, pos, 0), 0.0);
}

fn g_28(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_22_tf_tex, pos, 0), 0.0);
}

fn g_29(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_22_tf_tex, pos, 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_24_tf5_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.035401143, 0.11828543, 0.16110167, -0.07777353, -0.075349845, -0.013435769, -0.01727356, 0.033077683, -0.30605403, -0.11320239, 0.18582572, 0.060256433, 0.016494479, 0.14741373, -0.07789023, -0.008053446) * g_0(pixel.xy);
  result += mat4x4<f32>(-0.09569302, -0.114564046, 0.042041153, 0.22988442, -0.19345377, -0.13841586, 0.19079803, 0.064525254, -0.24899781, -0.21335086, -0.040545136, -0.06732098, -0.054337524, -0.16457275, -0.09898493, 0.076531336) * g_1(pixel.xy);
  result += mat4x4<f32>(0.14414783, -0.09589099, -0.018284459, 0.006014089, -0.14312598, 0.07321137, 0.16399357, 0.120017864, -0.09322919, 0.22950031, 0.034323998, 0.22690134, -0.12497395, 0.026865529, 0.045670614, 0.02153663) * g_2(pixel.xy);
  result += mat4x4<f32>(-0.0885093, -0.20960386, 0.09523425, -0.001182881, -0.13660184, -0.0988858, -0.10529192, 0.151602, -0.019795151, -0.0056292973, -0.090651646, -0.058967516, -0.034077972, -0.087830566, 0.06904268, 0.01972361) * g_3(pixel.xy);
  result += mat4x4<f32>(-0.041968595, 0.07223882, 0.028611, -0.05274203, 0.09716402, 0.14615181, -0.008819137, 0.19477727, -0.22391073, -0.188192, -0.23159504, -0.0659422, 0.038915258, 0.06506808, 0.026602015, 0.106757455) * g_4(pixel.xy);
  result += mat4x4<f32>(-0.03167345, 0.09288782, 0.06510763, -0.1371696, 0.0670977, 0.13643882, -0.16221057, 0.007994042, 0.12745698, -0.13189419, 0.18003656, -0.19340996, 0.054663222, 0.064832725, -0.11706334, 0.03498881) * g_5(pixel.xy);
  result += mat4x4<f32>(0.054250732, 0.050205093, -0.094529144, -0.073639154, -0.104345, -0.16036876, -0.116890386, -0.019142069, 0.11151763, 0.024416454, -0.21662898, -0.24609119, 0.012618986, -0.050505374, -0.05748476, -0.03385181) * g_6(pixel.xy);
  result += mat4x4<f32>(0.07575929, 0.20168582, 0.07593563, -0.120610684, 0.39353558, 0.092859395, -0.09407357, 0.11197022, 0.092431, 0.17169674, -0.052467786, -0.12509912, -0.04317581, 0.15022431, 0.053311728, -0.07824366) * g_7(pixel.xy);
  result += mat4x4<f32>(-0.19801709, 0.19595057, -0.03813935, 0.15429677, 0.043275412, -0.055777457, 0.051823862, -0.12536551, 0.054815408, -0.07399522, 0.111323185, -0.11293141, 0.112620935, 0.0036300484, -0.058666084, 0.0770841) * g_8(pixel.xy);
  result += mat4x4<f32>(0.055198528, 0.053080693, -0.07051254, 0.01369659, -0.064398214, 0.21947123, 0.25785065, 0.25085342, -0.18726042, -0.1834884, -0.05625831, -0.14207363, -0.08842582, -0.17124884, 0.017937114, 0.064309366) * g_9(pixel.xy);
  result += mat4x4<f32>(0.15159117, 0.07519266, -0.15370396, 0.042692114, -0.24344702, 0.09258916, -0.11990244, -0.17198385, 0.18952729, 0.1369525, 0.0025766129, 0.0012663774, 0.12561531, -0.14913428, 0.18643859, -0.29388568) * g_10(pixel.xy);
  result += mat4x4<f32>(-0.1093067, -0.12366066, -0.17348427, -0.007389768, -0.073157415, -0.060100462, 0.15647408, 0.09652795, -0.23171946, -0.13775213, -0.13687882, -0.030829927, -0.021940507, -0.0020031824, 0.028924773, 0.03574328) * g_11(pixel.xy);
  result += mat4x4<f32>(0.05167366, -0.097687796, -0.015811214, -0.03937127, 0.06846119, -0.020211786, 0.08710146, -0.098835036, 0.18396588, 0.31018186, -0.14081873, 0.16264582, -0.12390926, -0.20042141, 0.06262468, -0.10123357) * g_12(pixel.xy);
  result += mat4x4<f32>(0.24855806, 0.2536586, -0.06454596, 0.119326875, 0.12777822, 0.16621375, 0.124711774, 0.12201052, -0.012619612, -0.15139428, 0.24413742, -0.07166333, -0.07884437, 0.23534073, -0.024630731, -0.004739806) * g_13(pixel.xy);
  result += mat4x4<f32>(-0.14524974, 0.16234787, -0.3117823, -0.09532448, -0.38612852, 0.21183789, -0.024396734, 0.17140463, 0.27414736, 0.18016195, -0.18706764, -0.26449355, -0.19747467, -0.26563227, 0.06794068, -0.08063504) * g_14(pixel.xy);
  result += mat4x4<f32>(0.23652636, -0.21808079, 0.14081404, -0.08695713, 0.35874066, -0.3812793, -0.0042363345, -0.14822814, -0.7956462, 0.02542554, 0.18249872, 0.22436006, 0.04767605, 0.12073363, -0.13262282, -0.13139577) * g_15(pixel.xy);
  result += mat4x4<f32>(-0.052691665, 0.20573047, 0.091659784, 0.11605743, -0.49105322, -0.4048146, -0.15038882, 0.038508125, 0.08319267, -0.13713421, 0.19062464, -0.08124661, -0.27485934, 0.015815433, -0.021215012, 0.013882374) * g_16(pixel.xy);
  result += mat4x4<f32>(0.13657252, -0.117852926, -0.2632923, 0.20954777, 0.16333477, 0.35176206, 0.32558918, 0.07111971, -0.19528575, 0.022703214, -0.06283952, 0.0202241, 0.00062078034, -0.23761322, -0.0077519086, 0.25658375) * g_17(pixel.xy);
  result += mat4x4<f32>(0.020799367, 0.01067424, 0.083184645, -0.14095265, -0.037889767, 0.0034220286, 0.066995576, -0.05181846, 0.17500187, 0.034532286, -0.0034174314, 0.03789843, -0.043532915, -0.13418876, -0.2510271, -0.09374864) * g_18(pixel.xy);
  result += mat4x4<f32>(-0.13373125, -0.11939298, -0.18171094, -0.04362375, -0.09802522, 0.16033037, 0.033167798, 0.19249743, -0.09332724, -0.2715352, -0.016817318, -0.014301543, 0.20644864, -0.028817968, 0.362786, 0.14023119) * g_19(pixel.xy);
  result += mat4x4<f32>(0.09587087, 0.0074727098, 0.116851576, 0.023743093, -0.046995968, -0.069463834, 0.13753393, 0.17122227, -0.025173381, 0.13880321, 0.16658309, -0.022459678, -0.31136268, -0.027422085, -0.109531336, 0.18219715) * g_20(pixel.xy);
  result += mat4x4<f32>(-0.08894726, 0.19153637, -0.08311822, -0.074581176, 0.14477897, -0.21017817, 0.10784192, -0.16820575, -0.315781, -0.2630948, 0.08973418, -0.064013824, 0.075658046, 0.11888417, 0.13260478, -0.10950925) * g_21(pixel.xy);
  result += mat4x4<f32>(-0.11899363, -0.14369829, 0.008216912, 0.023432927, 0.06846148, 0.1828149, 0.06274231, -0.15299112, -0.0715763, -0.09635764, 0.13176271, -0.06144056, 0.059470557, 0.17273234, -0.08176308, 0.011923788) * g_22(pixel.xy);
  result += mat4x4<f32>(0.0061189565, -0.11297907, 0.09527446, 0.0046028066, 0.04282835, 0.055091605, -0.04165817, -0.025770452, -0.145678, 0.15372074, -0.11806497, 0.16658548, -0.10533239, -0.05720886, 0.0138695035, 0.11329029) * g_23(pixel.xy);
  result += mat4x4<f32>(-0.011732977, -0.12060142, -0.12039149, 0.03636631, -0.036845826, -0.054367594, -0.029417133, -0.17178303, -0.16985205, -0.06948697, 0.15569125, -0.0024068935, 0.17779039, 0.117133036, 0.034714937, 0.011719064) * g_24(pixel.xy);
  result += mat4x4<f32>(0.19989638, 0.071537495, -0.005817529, 0.024970375, -0.002606085, -0.23609988, 0.08164997, -0.004351663, -0.014960431, 0.021064563, -0.20076638, 0.012635818, -0.10835814, -0.10891674, -0.10495171, -0.1400281) * g_25(pixel.xy);
  result += mat4x4<f32>(0.22666031, -0.18522328, 0.11348862, -0.09860567, 0.039617456, 0.026495604, 0.1451495, 0.0882103, -0.17118423, -0.20988964, 0.14257617, 0.13353662, 0.026001312, 0.15666062, -0.10690302, 0.13496387) * g_26(pixel.xy);
  result += mat4x4<f32>(-0.18023312, 0.013624079, -0.059931513, 0.1235221, -0.22089219, -0.040241662, -0.13695398, -0.1404048, -0.052548394, 0.14687216, 0.14727584, -0.007241884, 0.08400108, -0.023925923, 0.004576988, 0.05896513) * g_27(pixel.xy);
  result += mat4x4<f32>(-0.03961407, 0.06747111, -0.06864713, -0.1582473, -0.13148493, 0.05195487, 0.07935757, 0.00300328, 0.10378651, -0.0113868695, 0.031623606, 0.12116739, -0.04027843, -0.14253578, 0.033800546, -0.44795546) * g_28(pixel.xy);
  result += mat4x4<f32>(0.13076074, 0.13541101, -0.06876114, 0.06036409, -0.09881141, -0.12100859, -0.14494787, -0.14920674, -0.040267494, -0.103508234, -0.092922576, 0.034120508, 0.17455834, -0.03198111, -0.021821547, 0.1617248) * g_29(pixel.xy);
  result += vec4f(0.01765179, -0.014072011, -0.040658478, 0.06147996);
  textureStore(conv2d_24_tf5_tex, pixel.xy, result);
}