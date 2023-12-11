// Layer: Anime4K-v4.1-Upscale-GAN-x4-(UUL)-Conv-4x1x1x96
// Name: conv2d15tf4
// Inputs: ['conv2d_12_tf', 'conv2d_12_tf1', 'conv2d_12_tf2', 'conv2d_12_tf3', 'conv2d_12_tf4', 'conv2d_12_tf5', 'conv2d_14_tf', 'conv2d_1_tf', 'conv2d_4_tf', 'conv2d_7_tf', 'conv2d_10_tf', 'conv2d_13_tf']
// Output: conv2d_15_tf4
@group(0) @binding(0) var conv2d_12_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_12_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_12_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_12_tf3_tex: texture_2d<f32>;
@group(0) @binding(4) var conv2d_12_tf4_tex: texture_2d<f32>;
@group(0) @binding(5) var conv2d_12_tf5_tex: texture_2d<f32>;
@group(0) @binding(6) var conv2d_14_tf_tex: texture_2d<f32>;
@group(0) @binding(7) var conv2d_1_tf_tex: texture_2d<f32>;
@group(0) @binding(8) var conv2d_4_tf_tex: texture_2d<f32>;
@group(0) @binding(9) var conv2d_7_tf_tex: texture_2d<f32>;
@group(0) @binding(10) var conv2d_10_tf_tex: texture_2d<f32>;
@group(0) @binding(11) var conv2d_13_tf_tex: texture_2d<f32>;
@group(0) @binding(12) var conv2d_15_tf4_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn g_0(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_12_tf_tex, pos, 0), 0.0);
}

fn g_1(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_12_tf1_tex, pos, 0), 0.0);
}

fn g_2(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_12_tf2_tex, pos, 0), 0.0);
}

fn g_3(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_12_tf3_tex, pos, 0), 0.0);
}

fn g_4(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_12_tf4_tex, pos, 0), 0.0);
}

fn g_5(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_12_tf5_tex, pos, 0), 0.0);
}

fn g_6(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_12_tf_tex, pos, 0), 0.0);
}

fn g_7(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_12_tf1_tex, pos, 0), 0.0);
}

fn g_8(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_12_tf2_tex, pos, 0), 0.0);
}

fn g_9(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_12_tf3_tex, pos, 0), 0.0);
}

fn g_10(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_12_tf4_tex, pos, 0), 0.0);
}

fn g_11(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_12_tf5_tex, pos, 0), 0.0);
}

fn g_12(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_14_tf_tex, pos, 0), 0.0);
}

fn g_13(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_14_tf_tex, pos, 0), 0.0);
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


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_15_tf4_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(0.14196062, -0.02053057, -0.07263348, 0.22242844, -0.069366455, -0.07599116, -0.24256042, 0.054868866, -0.17625082, -0.007019716, -0.113896124, 0.06029265, -0.33038747, -0.24047355, -0.07707203, -0.12618175) * g_0(pixel.xy);
  result += mat4x4<f32>(0.2641447, 0.20302898, 0.11049544, 0.06935479, 0.08874244, -0.11180222, 0.22703084, -0.037252616, 0.049151152, -0.26571065, 0.2566087, -0.19559465, 0.026178649, -0.09336953, -0.15396582, -0.060832605) * g_1(pixel.xy);
  result += mat4x4<f32>(-0.14049934, 0.037963107, -0.21600282, -0.024867453, 0.23356499, 0.25709978, 0.20883206, 0.025470912, 0.081024416, 0.086439654, 0.039591312, 0.0703785, 0.08931542, -0.017118547, 0.08146628, -0.20914824) * g_2(pixel.xy);
  result += mat4x4<f32>(0.16301146, 0.055098668, -0.17369606, 0.1285926, -0.21210109, -0.21506578, 0.2993681, -0.18734126, 0.10324259, -0.10892179, 0.16455299, -0.09379545, 0.07187383, 0.18076982, -0.19408746, -0.14634538) * g_3(pixel.xy);
  result += mat4x4<f32>(-0.17136872, 0.18589741, -0.26261556, 0.27026632, -0.06397295, -0.19135362, -0.13612793, 0.04076611, -0.14749071, 0.0644836, 0.029172575, 0.14051709, 0.018954301, -0.17011856, 0.03518231, 0.14694777) * g_4(pixel.xy);
  result += mat4x4<f32>(0.01462739, 0.16519663, -0.06963009, -0.26547143, 0.053700965, -0.07965579, 0.030911697, 0.08216649, -0.09090798, -0.14469762, 0.101480395, 0.2453987, 0.16511187, 0.09583153, -0.051365204, -0.31418574) * g_5(pixel.xy);
  result += mat4x4<f32>(-0.14265122, 0.013500145, -0.27755547, -0.35044006, -0.28055587, 0.14820805, -0.07966734, 0.20943366, 0.3879986, 0.044507142, 0.28056288, 0.12725809, -0.043548014, 0.054243155, 0.053768754, -0.07648862) * g_6(pixel.xy);
  result += mat4x4<f32>(-0.16118912, -0.15949926, 0.10161533, 0.22494748, -0.14213897, 0.012663654, 0.19885182, -0.15045607, -0.17744212, 0.15615463, -0.17122573, 0.041775905, 0.16900201, 0.09705761, -0.003141293, -0.031626303) * g_7(pixel.xy);
  result += mat4x4<f32>(0.26178294, 0.13443723, -0.10966655, -0.025935082, 0.11178123, 0.10601803, 0.11125899, -0.04168405, 0.07152025, -0.12318109, 0.06391876, -0.26012185, -0.26537088, -0.01870863, -0.31110883, 0.072430775) * g_8(pixel.xy);
  result += mat4x4<f32>(-0.11461679, -0.11115381, -0.11512802, -0.0849818, -0.19124708, -0.09565243, -0.31988642, -0.007379634, 0.13623501, -0.27210787, 0.20422134, 0.17212251, 0.20176752, -0.2088367, 0.057676136, 0.26400682) * g_9(pixel.xy);
  result += mat4x4<f32>(0.06382013, -0.019412925, 0.11166499, -0.1167881, -0.071942225, 0.018743433, -0.14072515, -0.07148564, -0.10749998, 0.12237429, -0.10744663, 0.04025467, 0.26050708, 0.351076, -0.02934236, -0.22102655) * g_10(pixel.xy);
  result += mat4x4<f32>(-0.10656222, -0.09071829, -0.34339997, -0.07646886, 0.02796594, 0.005340661, 0.115450874, 0.14969155, 0.03835863, -0.010790472, -0.05871064, 0.01423236, 0.22537707, 0.33385828, -0.15029915, 0.07367339) * g_11(pixel.xy);
  result += mat4x4<f32>(0.30884805, -0.23663065, 0.031883277, -0.03320561, -0.050423212, -0.3281527, 0.10394608, -0.0749873, -0.064002484, -0.35469085, -0.2122367, 0.020249272, -0.27326742, 0.02000293, 0.20578866, -0.018839063) * g_12(pixel.xy);
  result += mat4x4<f32>(-0.5473822, -0.10873662, -0.29810318, -0.07632667, 0.047157068, 0.06275736, -0.09811392, 0.24783231, -0.12046891, 0.41266727, 0.2436679, 0.024679149, -0.12600063, -0.17010899, -0.21425788, 0.07119708) * g_13(pixel.xy);
  result += mat4x4<f32>(0.117677234, -0.054181933, 0.065846235, -0.04929893, 0.08533609, 0.04636543, 0.30038458, 0.02330411, 0.024728734, -0.09597387, 0.010447719, -0.20696889, -0.017916039, 0.079871304, 0.010056369, 0.06291176) * g_14(pixel.xy);
  result += mat4x4<f32>(-0.0579763, 0.018944405, -0.14009921, 0.08765421, -0.029314717, -0.13179289, -0.009668318, -0.117530614, -0.0853067, 0.03650012, 0.0078530945, -0.19518211, -0.05920554, 0.19264583, 0.008880586, -0.03560413) * g_15(pixel.xy);
  result += mat4x4<f32>(0.042966127, 0.025064057, 0.094821475, -0.016764855, -0.21325764, -0.060747217, -0.07825418, -0.1374183, 0.06629058, -0.093919374, 0.15805462, 0.1187494, 0.21715021, -0.09113653, 0.06076613, 0.1753257) * g_16(pixel.xy);
  result += mat4x4<f32>(0.23275353, -0.045174975, 0.17990083, -0.03170214, -0.20888183, -0.050161786, -0.44225174, -0.07750995, 0.055791933, 0.1754295, 0.13890503, -0.087261945, 0.015942331, -0.002073752, 0.23700726, -0.1406417) * g_17(pixel.xy);
  result += mat4x4<f32>(-0.17989896, 0.052198254, 0.09631692, -0.16038898, 0.03376904, -0.042175625, -0.039186575, -0.2520231, 0.04852203, 0.09647585, -0.011128373, 0.010953865, -0.1797949, -0.058203597, 0.06857295, 0.040861364) * g_18(pixel.xy);
  result += mat4x4<f32>(-0.025050908, -0.1299404, 0.28858674, -0.017769823, 0.06310829, 0.086729944, 0.08149323, -0.055179875, 0.13012943, -0.07458519, 0.1382156, 0.051026117, -0.18673064, 0.086739376, 0.09040544, 0.0836127) * g_19(pixel.xy);
  result += mat4x4<f32>(0.020357449, 0.22048305, 0.09739252, 0.24337311, 0.010595294, -0.11086683, 0.059038695, 0.05644574, -0.16103926, -0.035155784, -0.26436335, -0.06716334, 0.17485845, 0.16937979, -0.20187125, -0.038486667) * g_20(pixel.xy);
  result += mat4x4<f32>(-0.0045594163, -0.21635443, 0.06031479, -0.19148222, -0.006656789, 0.08385509, -0.03819692, -0.17931695, 0.07232661, 0.23445003, -0.17640385, 0.16671506, -0.184719, -0.029015712, -0.022614706, 0.014873415) * g_21(pixel.xy);
  result += mat4x4<f32>(0.32585597, -0.16295198, 0.04640218, 0.07696528, 0.069500424, 0.105702765, 0.1296909, 0.24009204, 0.14028086, 0.28418058, 0.11589889, -0.22921228, 0.010826454, -0.054120503, -0.25884682, -0.30648708) * g_22(pixel.xy);
  result += mat4x4<f32>(0.07101887, -0.41187993, 0.31501228, -0.11794851, -0.20814322, -0.18655151, 0.14477637, -0.22380604, -0.058629174, -0.02504061, -0.09827353, 0.046498295, 0.18585126, 0.011712637, -0.10845518, -0.1348349) * g_23(pixel.xy);
  result += vec4f(0.04891512, -0.022042824, 0.015331318, -0.0034486696);
  textureStore(conv2d_15_tf4_tex, pixel.xy, result);
}