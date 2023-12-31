// Layer: Anime4K-v4.1-Upscale-GAN-x4-(UUL)-Conv-4x1x1x80
// Name: conv2d9tf
// Inputs: ['conv2d_6_tf', 'conv2d_6_tf1', 'conv2d_6_tf2', 'conv2d_6_tf3', 'conv2d_6_tf4', 'conv2d_6_tf5', 'conv2d_8_tf', 'conv2d_1_tf', 'conv2d_4_tf', 'conv2d_7_tf']
// Output: conv2d_9_tf
@group(0) @binding(0) var conv2d_6_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_6_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_6_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_6_tf3_tex: texture_2d<f32>;
@group(0) @binding(4) var conv2d_6_tf4_tex: texture_2d<f32>;
@group(0) @binding(5) var conv2d_6_tf5_tex: texture_2d<f32>;
@group(0) @binding(6) var conv2d_8_tf_tex: texture_2d<f32>;
@group(0) @binding(7) var conv2d_1_tf_tex: texture_2d<f32>;
@group(0) @binding(8) var conv2d_4_tf_tex: texture_2d<f32>;
@group(0) @binding(9) var conv2d_7_tf_tex: texture_2d<f32>;
@group(0) @binding(10) var conv2d_9_tf_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn g_0(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_6_tf_tex, pos, 0), 0.0);
}

fn g_1(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_6_tf1_tex, pos, 0), 0.0);
}

fn g_2(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_6_tf2_tex, pos, 0), 0.0);
}

fn g_3(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_6_tf3_tex, pos, 0), 0.0);
}

fn g_4(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_6_tf4_tex, pos, 0), 0.0);
}

fn g_5(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_6_tf5_tex, pos, 0), 0.0);
}

fn g_6(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf_tex, pos, 0), 0.0);
}

fn g_7(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf1_tex, pos, 0), 0.0);
}

fn g_8(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf2_tex, pos, 0), 0.0);
}

fn g_9(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf3_tex, pos, 0), 0.0);
}

fn g_10(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf4_tex, pos, 0), 0.0);
}

fn g_11(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf5_tex, pos, 0), 0.0);
}

fn g_12(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_8_tf_tex, pos, 0), 0.0);
}

fn g_13(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_8_tf_tex, pos, 0), 0.0);
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


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_9_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.069604576, 0.02780287, 0.10479145, 0.0598677, -0.15447794, 0.014002432, 0.15952754, -0.16364509, -0.17146967, 0.27360946, -0.06118358, 0.06562993, -0.0034575097, 0.27649418, 0.025365477, -0.081556045) * g_0(pixel.xy);
  result += mat4x4<f32>(0.098523565, -0.014438212, -0.17889059, -0.08759605, -0.097737536, 0.27787977, 0.016156938, -0.11134956, 0.10582375, -0.20247018, 0.08988277, 0.17063816, -0.072689526, -0.1143116, 0.30750987, 0.09236675) * g_1(pixel.xy);
  result += mat4x4<f32>(-0.28383443, -0.15268843, 0.42559057, 0.3357241, 0.012547255, -0.09958958, 0.04154182, -0.06517361, 0.08784381, 0.03416716, -0.036624804, -0.034195926, -0.009735854, -0.037226725, 0.044228237, 0.098523915) * g_2(pixel.xy);
  result += mat4x4<f32>(0.13222544, 0.1690658, -0.10114831, 0.0418428, -0.03539878, 0.06732558, 0.044486526, 0.18264133, 0.09283543, -0.0875049, -0.27786124, 0.31696528, 0.13372223, 0.06539235, -0.07225442, -0.053972196) * g_3(pixel.xy);
  result += mat4x4<f32>(0.10303975, -0.027461063, 0.12720948, 0.11982775, 0.010745893, -0.258443, -0.038602423, -0.031108906, 0.03577269, 0.06814439, -0.30761826, 0.18308763, 0.030638998, 0.00069125916, 0.041647576, -0.037805513) * g_4(pixel.xy);
  result += mat4x4<f32>(0.28049946, -0.19036528, -0.20298155, -0.20855707, -0.012317928, 0.08052685, -0.2087141, 0.22641854, 0.10379512, -0.19354534, 0.038190875, -0.31573087, -0.08755006, 0.10582216, -0.103582926, -0.051279992) * g_5(pixel.xy);
  result += mat4x4<f32>(-0.019805856, 0.32306147, -0.10066396, 0.1077401, -0.08169178, -0.20293216, 0.015578836, -0.030745748, 0.091820225, -0.13066763, 0.022633377, 0.011552452, -0.123327985, 0.25311312, 0.22652766, 0.011176362) * g_6(pixel.xy);
  result += mat4x4<f32>(-0.16592886, -0.003341361, 0.05655243, -0.04907018, -0.14266169, -0.07653183, 0.39557743, -0.044829868, 0.035589613, -0.23692629, 0.02729001, 0.23751497, -0.074999005, 0.06162688, 0.06201382, 0.15069327) * g_7(pixel.xy);
  result += mat4x4<f32>(-0.12884079, 0.037352398, -0.12884715, 0.15350881, -0.089926146, -0.1700947, -0.10188416, -0.029826047, -0.031419244, -0.15877514, 0.074799135, -0.123011, -0.007537871, -0.24274765, 0.10594629, -0.042308845) * g_8(pixel.xy);
  result += mat4x4<f32>(0.028796997, 0.009780028, 0.08393684, 0.08876159, 0.2958322, 0.13797538, -0.23441544, -0.064725965, 0.13806176, -0.015037291, 0.060964797, -0.30482304, -0.041055765, -0.15156971, 0.20623018, 0.10922641) * g_9(pixel.xy);
  result += mat4x4<f32>(-0.0057864957, -0.18726483, 0.037883427, 0.14638895, -0.10522743, 0.09113031, 0.11673609, -0.21051702, 0.028723987, -0.062990315, 0.002952929, 0.01469057, 0.034846026, 0.19609974, -0.1934369, -0.18243392) * g_10(pixel.xy);
  result += mat4x4<f32>(0.118073694, 0.119863555, -0.30531943, -0.205375, -0.22113605, -0.28978834, -0.23192821, 0.28978485, -0.021390624, -0.18431179, -0.15690218, -0.14960553, -0.15185611, 0.0028554697, -0.02074978, 0.056506403) * g_11(pixel.xy);
  result += mat4x4<f32>(0.31187654, -0.2761366, 0.020066198, 0.031995732, -0.1848675, 0.08065148, 0.14539121, -0.23896545, 0.0257927, -0.054032624, -0.07259492, 0.18765905, -0.17117564, -0.33104083, -0.0332479, 0.15349889) * g_12(pixel.xy);
  result += mat4x4<f32>(-0.18720639, 0.19843848, 0.3385621, -0.19166066, 0.21356635, 0.21394755, 0.15651105, 0.037805296, -0.16349375, -0.13504027, 0.19122715, 0.120806016, 0.16379046, -0.0026540656, 0.04739934, -0.07981541) * g_13(pixel.xy);
  result += mat4x4<f32>(-0.28539544, 0.21816348, -0.15019035, 0.23157135, 0.121298485, 0.2268759, -0.24653979, -0.025725443, -0.055981506, 0.10309359, 0.12415594, 0.010752708, 0.15175724, -0.12113609, -0.04674751, 0.1452768) * g_14(pixel.xy);
  result += mat4x4<f32>(0.084147684, -0.32716796, -0.3735181, -0.06994641, -0.17994325, -0.14905843, -0.06946874, 0.35039115, -0.05100555, -0.08730691, -0.23854558, -0.1746263, -0.011508492, 0.10305763, 0.13472022, -0.28137568) * g_15(pixel.xy);
  result += mat4x4<f32>(0.10937542, -0.038041312, -0.0995303, 0.14773457, 0.15991186, 0.22984092, -0.20170724, -0.3805271, 0.11831765, -0.07383792, 0.14768845, -0.311674, -0.019428516, 0.18180147, 0.056651186, -0.10447611) * g_16(pixel.xy);
  result += mat4x4<f32>(0.04605112, 0.046965037, -0.08334886, 0.037097372, 0.18561974, 0.3021062, 0.1629304, -0.090214364, -0.005229353, 0.18200208, -0.07720685, 0.25807604, 0.2524869, -0.16809419, -0.4000575, -0.3306678) * g_17(pixel.xy);
  result += mat4x4<f32>(0.09674466, 0.07551325, 0.016270272, -0.22326164, -0.1256328, -0.08318501, 0.24199782, 0.008043517, -0.3336808, -0.019305306, -0.18930039, 0.3224243, -0.020935204, -0.21364902, 0.029509636, -0.1468745) * g_18(pixel.xy);
  result += mat4x4<f32>(-0.22094682, -0.27292994, -0.1963563, -0.37204334, 0.13046952, 0.2838346, -0.15947977, 0.07602889, -0.023213187, -0.06235404, -0.09553055, 0.03893353, 0.28796852, 0.09727489, 0.13416602, 0.34785405) * g_19(pixel.xy);
  result += vec4f(0.063622594, 0.0041231937, 0.015656473, -0.044245835);
  textureStore(conv2d_9_tf_tex, pixel.xy, result);
}
