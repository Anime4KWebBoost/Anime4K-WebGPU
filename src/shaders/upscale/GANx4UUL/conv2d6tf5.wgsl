// Layer: Anime4K-v4.1-Upscale-GAN-x4-(UUL)-Conv-4x1x1x72
// Name: conv2d6tf5
// Inputs: ['conv2d_3_tf', 'conv2d_3_tf1', 'conv2d_3_tf2', 'conv2d_3_tf3', 'conv2d_3_tf4', 'conv2d_3_tf5', 'conv2d_5_tf', 'conv2d_1_tf', 'conv2d_4_tf']
// Output: conv2d_6_tf5
@group(0) @binding(0) var conv2d_3_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_3_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_3_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_3_tf3_tex: texture_2d<f32>;
@group(0) @binding(4) var conv2d_3_tf4_tex: texture_2d<f32>;
@group(0) @binding(5) var conv2d_3_tf5_tex: texture_2d<f32>;
@group(0) @binding(6) var conv2d_5_tf_tex: texture_2d<f32>;
@group(0) @binding(7) var conv2d_1_tf_tex: texture_2d<f32>;
@group(0) @binding(8) var conv2d_4_tf_tex: texture_2d<f32>;
@group(0) @binding(9) var conv2d_6_tf5_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn g_0(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_3_tf_tex, pos, 0), 0.0);
}

fn g_1(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_3_tf1_tex, pos, 0), 0.0);
}

fn g_2(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_3_tf2_tex, pos, 0), 0.0);
}

fn g_3(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_3_tf3_tex, pos, 0), 0.0);
}

fn g_4(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_3_tf4_tex, pos, 0), 0.0);
}

fn g_5(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_3_tf5_tex, pos, 0), 0.0);
}

fn g_6(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf_tex, pos, 0), 0.0);
}

fn g_7(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf1_tex, pos, 0), 0.0);
}

fn g_8(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf2_tex, pos, 0), 0.0);
}

fn g_9(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf3_tex, pos, 0), 0.0);
}

fn g_10(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf4_tex, pos, 0), 0.0);
}

fn g_11(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf5_tex, pos, 0), 0.0);
}

fn g_12(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_5_tf_tex, pos, 0), 0.0);
}

fn g_13(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_5_tf_tex, pos, 0), 0.0);
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


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_6_tf5_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(0.3184051, -0.13755248, -0.23732315, -0.023162326, 0.01720298, -0.13192378, 0.016757166, -0.11769522, -0.09113053, 0.045006696, 0.11998161, 0.22151577, -0.09237514, 0.25612727, 0.031724155, 0.03275836) * g_0(pixel.xy);
  result += mat4x4<f32>(0.16658157, 0.09904747, 0.12178111, -0.21332578, -0.084959686, 0.25737628, -0.07269974, -0.0044502337, -0.16059934, 0.14796074, -0.2408073, -0.283023, -0.02290089, -0.12150798, 0.122527674, 0.33295074) * g_1(pixel.xy);
  result += mat4x4<f32>(-0.13768205, -0.032166574, 0.10757663, -0.19916943, 0.22137393, 0.097398534, -0.028636161, 0.057976738, 0.021234423, 0.16993561, -0.006663144, 0.056026485, -0.17463136, 0.011491455, -0.34180948, -0.052859932) * g_2(pixel.xy);
  result += mat4x4<f32>(0.2173205, -0.025248244, -0.24675395, -0.23414998, -0.062658116, 0.18439959, -0.050601244, -0.11459134, -0.22184677, -0.18934494, 0.20033342, -0.028426873, -0.12788561, 0.09256763, 0.04540186, -0.041159313) * g_3(pixel.xy);
  result += mat4x4<f32>(-0.0993446, -0.04936769, -0.092339985, -0.36057615, -0.07563136, 0.16411334, 0.18075173, 0.06588899, 0.020508798, 0.06469463, 0.070499524, -0.032993205, 0.02209328, -0.03959476, 0.2591428, -0.31618914) * g_4(pixel.xy);
  result += mat4x4<f32>(0.18500368, -0.27579078, 0.15843801, -0.19448781, 0.066866614, 0.00010545493, 0.15846692, 0.15597339, 0.2097692, 0.047041208, -0.16916004, -0.112265535, -0.31957072, -0.039543174, 0.27903298, 0.238342) * g_5(pixel.xy);
  result += mat4x4<f32>(-0.24176823, 0.004759584, 0.30377442, -0.28161818, -0.01639163, 0.28049424, 0.15209472, -0.13002338, -0.034997053, 0.14607708, -0.16109394, -0.3709857, 0.06600745, -0.06402065, 0.09106263, -0.08173308) * g_6(pixel.xy);
  result += mat4x4<f32>(0.00085082283, -0.1385803, -0.096698835, -0.018731076, -0.13685198, -0.066617444, -0.021327814, 0.047615487, -0.0067158537, -0.305055, -0.030938676, 0.103631414, -0.10505161, 0.1377772, -0.21578938, -0.08955101) * g_7(pixel.xy);
  result += mat4x4<f32>(-0.012543417, 0.14635363, -0.34157932, 0.13002996, -0.08412303, -0.035678063, -0.018591393, -0.07879708, 0.052513346, -0.2033995, -0.2095011, 0.09329585, -0.10069142, 0.06845934, 0.34163034, 0.08352417) * g_8(pixel.xy);
  result += mat4x4<f32>(-0.22950074, -0.028784348, 0.19254303, -0.08938541, 0.15025762, -0.28843135, 0.032744445, 0.31275362, 0.013827366, -0.0037322342, -0.20390843, 0.18030973, 0.014234129, 0.12213843, -0.021821825, 0.04274312) * g_9(pixel.xy);
  result += mat4x4<f32>(0.14702202, 0.14780809, -0.050316352, 0.008637546, -0.018341271, -0.18107755, -0.034195397, -0.016785527, 0.01823875, -0.04468439, 0.11064914, -0.05889276, -0.052540354, 0.072073415, -0.2706125, 0.21487243) * g_10(pixel.xy);
  result += mat4x4<f32>(0.5024447, 0.058864042, -0.257565, 0.1780413, -0.065261215, 0.03483217, 0.46696317, -0.055783324, 0.13675097, -0.0388672, 0.22358736, -0.019960344, 0.11402829, 0.040916674, 0.042867694, -0.19926277) * g_11(pixel.xy);
  result += mat4x4<f32>(0.00014269089, 0.03286679, -0.024311759, -0.10549739, -0.21425818, 0.06221074, 0.040516183, -0.107838914, 0.14727353, 0.17660016, -0.20832092, -0.23476245, -0.09223368, 0.09435899, -0.06876976, -0.032683436) * g_12(pixel.xy);
  result += mat4x4<f32>(-0.061027218, 0.0023568163, 0.03251149, 0.120799825, 0.18775438, -0.022180539, -0.23275055, -0.10154802, -0.078680724, -0.23514764, 0.15737699, 0.1601879, 0.124354616, 0.038517214, 0.14103456, 0.0208124) * g_13(pixel.xy);
  result += mat4x4<f32>(0.22970279, 0.021356303, -0.11624362, -0.20197557, -0.12733872, 0.20742093, 0.35425633, -0.1574453, 0.045965664, -0.23022245, 0.16394545, -0.15241143, 0.24514204, 0.22437558, 0.113987625, -0.0011856258) * g_14(pixel.xy);
  result += mat4x4<f32>(-0.35714933, -0.31235123, 0.12664467, 0.15167892, 0.16453564, -0.010062876, -0.0831791, 0.19339912, -0.1188241, -0.056378998, -0.22127298, -0.15548877, -0.24432793, -0.034023006, 0.041227486, -0.2873007) * g_15(pixel.xy);
  result += mat4x4<f32>(-0.032629743, -0.27882102, 0.1215572, -0.017597208, 0.116811305, 0.14217746, 0.015951436, -0.5205457, -0.038023748, -0.14943328, -0.15468231, 0.074514836, 0.16636418, -0.062607236, -0.032341167, -0.11533553) * g_16(pixel.xy);
  result += mat4x4<f32>(-0.08205011, 0.16940303, 0.18777788, 0.16565365, 0.1837101, 0.18085457, 0.018884834, 0.3717715, 0.083659224, 0.25785285, -0.21427527, -0.057258263, 0.07784925, 0.29109064, 0.23607136, 0.21052702) * g_17(pixel.xy);
  result += vec4f(-0.04224999, -0.02424048, 0.054364916, -0.013123425);
  textureStore(conv2d_6_tf5_tex, pixel.xy, result);
}
