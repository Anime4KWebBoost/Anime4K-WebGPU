// Layer: Anime4K-v4.1-Upscale-GAN-x4-(UUL)-Conv-4x3x3x48
// Name: conv2d16tf
// Inputs: ['conv2d_15_tf', 'conv2d_15_tf1', 'conv2d_15_tf2', 'conv2d_15_tf3', 'conv2d_15_tf4', 'conv2d_15_tf5']
// Output: conv2d_16_tf
@group(0) @binding(0) var conv2d_15_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_15_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_15_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_15_tf3_tex: texture_2d<f32>;
@group(0) @binding(4) var conv2d_15_tf4_tex: texture_2d<f32>;
@group(0) @binding(5) var conv2d_15_tf5_tex: texture_2d<f32>;
@group(0) @binding(6) var conv2d_16_tf_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_15_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_1(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_15_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_2(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_15_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_15_tf3_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_4(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_15_tf4_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_5(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_15_tf5_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_6(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_15_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_7(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_15_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_8(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_15_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_9(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_15_tf3_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_10(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_15_tf4_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_11(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_15_tf5_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_16_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(0.18401013, -0.13588756, 0.054256726, -0.1412752, -0.12243868, -0.03775943, -0.0927035, -0.07697188, -0.022187399, -0.06088916, -0.079055466, 0.19919616, 0.008391406, 0.0015257774, 0.044474147, 0.08149344) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.07563144, -0.17652713, -0.114881195, -0.37899107, 0.07671048, -0.14937408, -0.02114298, 0.044075787, 0.0042303097, 0.14191344, -0.023277637, 0.08528211, -0.09960068, -0.16445117, -0.03584855, -0.04641021) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.22003917, 0.17905737, 0.21757741, -0.12364477, -0.016672444, -0.018438077, 0.04201858, 0.07870777, 0.039740887, -0.052247927, -0.10656043, -0.00011003632, 0.041017633, -0.27342665, -0.06761997, -0.04528579) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.025336504, -0.13833694, 0.07437976, -0.08893717, -0.16371429, -0.061653934, -0.039204895, -0.028089175, -0.00015907192, -0.13354921, 0.02734657, 0.15964994, -0.041217323, -0.009264936, 0.079068765, 0.062053584) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.049570024, -0.10784191, -0.01837375, 0.21343361, -0.04372069, -0.020986352, -0.107839406, 0.05502148, 0.0992714, -0.018021397, 0.008725207, -0.017378684, 0.031728156, -0.008801241, -0.18357609, -0.016145747) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.04913707, 0.01682724, 0.041758772, 0.008508023, 0.026582265, -0.22879946, 0.13991572, -0.090997934, 0.0896516, -0.22281447, -0.055706218, -0.021541787, 0.015767794, 0.018899554, 0.013717163, -0.17347403) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.12547137, -0.09660737, 0.012978945, 0.07203537, -0.0054954574, 0.018496398, -0.011681787, 0.12737639, -0.045878302, -0.10701198, -0.03054825, 0.03009367, 0.1267522, 0.09850112, 0.057112776, -0.009593024) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.08928, 0.0683229, 0.17383668, 0.13218597, -0.031208025, 0.037092455, 0.042550884, 0.077692695, 0.01771997, 0.13132338, 0.006508737, -0.08525488, -0.045307394, -0.14343816, -0.01830292, 0.01989028) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.026735093, -0.023464149, -0.17231, -0.044292584, 0.08945477, 0.009001228, 0.066171594, -0.011970938, 0.028572584, -0.03996996, 0.016547613, -0.059090354, 0.0028927932, -0.063939616, 0.03321047, 0.13545637) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.10948995, -0.15711145, 0.054597083, -0.068569995, 0.026474394, 0.097653925, 0.04627575, -0.008275917, 0.25192523, 0.18235894, -0.08277455, 0.38575834, 0.022745483, -0.020903446, 0.04205318, -0.042380072) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.18891968, 0.052005906, 0.038103525, -0.111821555, -0.031023096, 0.011216633, -0.0035464338, 0.046839092, 0.25343683, 0.20273992, 0.15142617, -0.044875506, -0.001787997, 0.071683675, -0.07015657, -0.022576973) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.018181657, -0.09296044, 0.022081852, -0.06619681, 0.060951322, 0.05768129, 0.02035218, -0.019641668, 0.0013515889, -0.13848126, -0.1841656, 0.031004338, -0.051048316, 0.14258315, 0.05445368, 0.03247651) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.05203047, 0.12076639, -0.0077227005, 0.1184366, 0.06823599, 0.012450423, 0.1113311, 0.039102986, 0.35370106, -0.33157814, 0.37390196, -0.09912934, -0.10444121, 0.08402377, -0.16930288, 0.054857288) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.03270221, 0.14613907, -0.095933534, -0.19244863, -0.23159896, 0.1559275, 0.06728844, -0.0047268616, 0.011683535, -0.18843126, -0.04220783, -0.30654585, -0.10746214, -0.03227198, -0.03234777, 0.11203559) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.13327973, 0.09590377, 0.07102634, -0.20258962, -0.1457926, 0.07275891, 0.17606707, -0.12861401, -0.031180056, -0.18612963, -0.13088436, 0.33387327, 0.08283845, -0.15757847, 0.06846595, -0.057761926) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.07959099, -0.027871562, -0.00679305, -0.044345573, 0.0878471, -0.013418179, -0.058157764, -0.07929911, -0.19511378, -0.21550658, -0.18276486, -0.10306193, 0.06730515, 0.15307051, 0.060711797, -0.09848275) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.02309879, -0.028519675, 0.041512847, 0.049695335, -0.0258293, 0.050312288, -0.123789005, -0.046238117, -0.34710893, -0.017108874, 0.112747535, 0.0380458, 0.10313404, 0.13872932, -0.108138695, 0.11340562) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.09037467, 0.08282595, -0.049290337, -0.03558929, -0.036829695, 0.08418846, -0.0048224498, -0.018913696, 0.16916117, 0.18428025, -0.0325662, -0.013071526, -0.02406039, 0.11116436, -0.20665626, -0.036719907) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.12311881, 0.05806699, 0.1490677, -0.10510731, 0.0650881, -0.045123734, 0.10633921, 0.08102984, -0.17166427, 0.14187278, 0.06218691, 0.010134607, -0.024926946, -0.15645958, 0.01647525, -0.032007955) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.0064320094, -0.10348999, -0.0064104837, -0.104413785, 0.079153426, 0.19542186, 0.03652737, 0.15894827, 0.22364238, -0.03398967, 0.05108126, 0.035144717, -0.06397692, -0.032206714, 0.0922073, 0.012730258) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.08642296, 0.05683361, -0.032936133, 0.10762088, -0.01644649, -0.001429266, 0.08380367, 0.019923296, 0.08267726, -0.044601962, -0.012816315, 0.02492031, 0.072982386, -0.010330455, -0.0978465, 0.118156195) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.042400658, -0.055309903, 0.03207966, -0.121752515, -0.21621595, 0.024456523, -0.011958722, 0.12451922, -0.13696773, -0.20115459, -0.07348073, 0.0024619848, 0.01738986, -0.12202603, -0.111460805, -0.005058656) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.21546137, 0.12935314, -0.028532904, -0.008893691, 0.10135729, -0.17534581, -0.049937554, -0.33643374, -0.043661103, 0.102634795, -0.115369305, 0.026465349, 0.028970167, 0.026625225, 0.062238887, -0.026272973) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.105955236, 0.12651332, 0.07647607, 0.08280213, -0.123200215, 0.05615951, -0.05460551, -0.18601677, 0.08394111, 0.16563104, 0.040207952, 0.14093705, 0.052927166, -0.17315963, -0.03533011, 0.060746193) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.026084239, 0.045155637, 0.04272104, -0.16185169, -0.17862639, 0.05094037, -0.11442705, 0.020845752, 0.040759496, 0.12081268, 0.0075550107, -0.021916028, -0.11806642, -0.023612743, -0.071473576, -0.101335295) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.002712147, 0.16763973, -0.044307284, 0.040771365, -0.0031661778, -0.049930423, 0.28393164, -0.1455211, 0.054617744, -0.031105014, 0.11039813, -0.030323252, -0.033115745, 0.04220911, -0.12622428, -0.07630135) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.028186634, -0.003115328, -0.099139124, -0.086862855, 0.044807985, -0.11788244, 0.080867685, -0.0054060444, 0.018819673, 0.04957816, 0.019576633, 0.07436812, 0.024756659, 0.011649562, 0.03426825, -0.061746117) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.109345876, -0.07582799, -0.07580578, 0.0718188, 0.045793377, -0.071054064, -0.04769422, 0.01874575, 0.08088704, -0.08307951, -0.06366319, -0.019450737, 0.26841074, -0.03851925, -0.04642081, -0.0030378636) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.031708058, 0.02285141, 0.077648826, -0.1881658, 0.04816301, -0.13699746, -0.08999789, -0.16106066, 0.011150913, -0.044722255, -0.026864614, 0.028213168, -0.18842594, 0.19808589, 0.0007276151, 0.0031604283) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.31135795, 0.112032294, -0.026946368, 0.0031459567, 0.13888834, 0.10551288, -0.040594235, 0.048751246, 0.00039387803, 0.0142388055, 0.0008438835, -0.000215502, 0.15277672, 0.005665271, 0.07407217, -0.050055165) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.09536809, -0.029089805, 0.05876147, 0.19606937, -0.056980595, 0.12535319, 0.024123488, 0.077162944, 0.19549242, 0.16824779, 0.14160116, -0.15470776, 0.09047217, 0.0001769805, -0.018979235, 0.044140182) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.27798006, 0.49009305, -0.10300361, -0.15089208, 0.08056011, -0.04228279, -0.19938731, -0.1284759, -0.0960026, 0.07879816, -0.088942915, 0.09315675, 0.0301986, -0.035029355, -0.0511503, 0.11765551) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.07843372, -0.006018093, -0.05311663, -0.0075817537, 0.0424411, 0.07975493, 0.044189543, 0.13708349, -0.008551143, -0.13168351, -0.16907017, -0.07804317, -0.0024650225, 0.048722517, 0.1594775, -0.016862482) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.08130928, 0.289742, 0.061233968, -0.1805477, -0.04329093, 0.034262158, 0.023879131, -0.092462465, 0.037923817, -0.005596231, 0.0330041, 0.06661368, -0.036080886, -0.047671337, 0.05192108, 0.17042227) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.09510118, -0.07480796, 0.17427766, 0.16470622, 0.07585864, -0.012345573, 0.060487308, 0.07716671, 0.022240538, -0.019660212, 0.022591233, -0.0047452366, 0.04595507, -0.014236219, -0.06681773, -0.09052364) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.10433901, 0.0379166, 0.015618833, -0.0828069, 0.014377862, -0.016621938, -0.15152419, -0.0019374314, 0.012078275, -0.00887573, -0.13343875, -0.0125529785, 0.07976357, 0.0765987, -0.0056649507, 0.011301273) * go_3(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.041834418, -0.13372508, -0.10320997, 0.015072922, -0.029889522, 0.012992793, -0.09185873, 0.004004095, -0.065492816, -0.050909735, 0.0002255961, -0.12797303, -0.3083743, -0.05711855, 0.023806712, 0.04647377) * go_4(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.0738126, -0.1592134, 0.022746144, -0.11953307, -0.03188981, 0.16695242, 0.122664005, 0.14895225, 0.094388284, -0.29278672, -0.04656844, -0.19429022, -0.044872273, -0.038740084, 0.0248372, -0.077681266) * go_4(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.04854289, -0.2222598, -0.06694044, -0.07134871, -0.0056551537, 0.18670999, 0.029736828, 0.13020341, -0.1472964, -0.16671701, -0.07403152, -0.16548093, -0.064982556, -0.07949377, 0.073355116, -0.11815417) * go_4(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.056096863, 0.046716, 0.017137583, 0.00091687136, 0.019255593, 0.009841755, -0.03734741, 0.06731623, -0.06467937, -0.00014931819, -0.061866295, -0.03865882, 0.12549591, -0.04473098, 0.10254502, -0.19520067) * go_4(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.024812682, -0.05629554, 0.22076266, 0.07151472, -0.07329754, -0.019209638, 0.047727138, 0.028662292, -0.24604319, -0.042345352, -0.033282783, -0.07798896, -0.12942882, -0.09905983, 0.15368684, 0.106904276) * go_4(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.07929591, -0.10142135, -0.044078883, -0.052256215, -0.12313739, -0.15137856, 0.15978324, -0.17600586, -0.026426807, -0.076277286, -0.34938416, -0.1274297, -0.20080665, 0.23370647, 0.2738065, 0.30404314) * go_4(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.13837905, -0.067753285, 0.0764978, 0.03729214, 0.17639492, -0.027780103, -0.01209291, -0.07154623, 0.05318505, -0.041469146, -0.13914822, -0.034375183, 0.063493945, 0.098800704, 0.07209861, -0.081063025) * go_4(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.0885162, -0.004286808, -0.04590522, -0.009821024, 0.06929009, 0.1377115, -0.3040033, -0.36766884, -0.011379945, -0.00017395087, -0.21295871, -0.13242184, -0.22686961, -0.09711975, 0.219442, 0.07782863) * go_4(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.052216977, 0.0022526693, 0.08789426, 0.101838656, 0.055295188, 0.12478162, -0.17794913, -0.16096286, 0.03537816, -0.09675113, -0.12077911, -0.054987498, 0.09664434, 0.10522916, -0.184103, 0.20173639) * go_4(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.08799513, 0.053520318, -0.06829527, -0.061881334, -0.06998132, -0.016926985, -0.0034579965, -0.02244025, 0.08783364, -0.048509452, 0.06655328, 0.02509059, 0.14502525, -0.086991906, 0.124340616, 0.00037620167) * go_5(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.12045644, -0.0791683, -0.016914366, -0.0702782, -0.1417759, 0.113099955, 0.03572895, 0.03584289, -0.23530042, 0.16986006, -0.08690092, 0.20150651, 0.14820416, -0.0022669397, 0.16911735, -0.32364613) * go_5(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.2332167, -0.016162368, -0.07348933, 0.051037077, -0.029558603, 0.10703994, 0.09952783, 0.11973201, 0.080019765, 0.1711361, -0.033787925, 0.11096711, -0.0026446204, 0.12003299, 0.17813842, -0.15823579) * go_5(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.13115647, 0.04365931, 0.08948908, -0.0061321505, -0.17846593, -0.07659842, -0.18420176, -0.124986045, -0.077533804, -0.06662785, -0.06746059, 0.06722217, 0.06708974, 0.020013843, 0.057971753, -0.005804974) * go_5(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.018778078, 0.08638097, 0.12128037, -0.100785516, 0.020799557, -0.045280837, 0.065865815, -0.13772325, -0.14847542, -0.10060909, -0.07299966, 0.035418868, -0.2626101, 0.048298042, 0.117776625, 0.2014914) * go_5(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.027666502, -0.0080054365, 0.114057735, 0.11314715, -0.12363325, -0.113225006, 0.14003067, 0.06963901, 0.030006966, 0.11874836, 0.12775381, 0.058153503, 0.18982601, 0.107828185, -0.031235067, -0.28085175) * go_5(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.058084015, -0.22221348, -0.0896041, 0.0627608, -0.116209514, -0.061959576, 0.08820395, 0.065014645, 0.020963453, -0.025303738, 0.043819524, 0.0133228395, 0.033737265, -0.15635544, -0.11012964, 0.06452587) * go_5(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.013111555, 0.054879397, -0.084155306, -0.05129703, 0.14801842, 0.026329206, -0.024483597, -0.08906689, 0.05348424, -0.039064053, 0.08269973, -0.042230796, 0.09083986, 0.04736572, -0.11007553, -0.16672523) * go_5(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.012899352, -0.1294054, 0.1125801, -0.04872308, -0.06587377, -0.011649611, -0.0895225, -0.011717788, 0.12558992, -0.11246865, -0.005633265, 0.16554871, 0.09073155, -0.02444982, 0.051129293, 0.071896) * go_5(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.040985197, -0.11714439, 0.0050871605, -0.055462062, -0.08494001, 0.02960296, 0.095325224, 0.20950922, 0.04292618, -0.09899439, 0.028093863, -0.051682223, 0.29498738, 0.079777084, 0.06441235, -0.11312307) * go_6(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.0736591, 0.23490392, 0.0012234901, 0.0062587685, -0.0658678, 0.14087045, 0.16481075, 0.0865966, -0.043406636, 0.22310406, -0.042780004, 0.23647028, 0.12841848, -0.0035120498, 0.006173345, -0.024037007) * go_6(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.09205112, 0.059635665, 0.08538701, 0.022823967, -0.06477945, 0.06236264, 0.038886856, 0.013214306, 0.028087588, -0.10733406, -0.06626182, 0.072191566, 0.024621291, 0.009575019, -0.06411952, -0.1463673) * go_6(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.0054634516, 0.045507513, -0.007799662, 0.0076722545, -0.12650666, 0.14308643, 0.06477858, 0.24249618, -0.13591407, -0.13626933, -0.33021417, 0.14956667, 0.14996628, 0.01296905, 0.07415943, -0.2862635) * go_6(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.097647466, 0.10142995, -0.08994866, -0.18288863, -0.05146021, 0.051858053, 0.1065154, -0.018669382, 0.049175538, 0.01052338, -0.08475384, -0.03172579, -0.10427115, 0.16601573, 0.048708897, -0.16694255) * go_6(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.026975388, 0.059210766, 0.07111863, -0.06324248, -0.15227206, 0.16633601, 0.07461219, 0.267013, -0.047243737, -0.3753309, 0.008852686, -0.013038294, -0.08381937, 0.2180827, 0.11023216, 0.05140329) * go_6(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.07311599, -0.05057456, 0.023085596, -0.10682444, 0.063513815, 0.07356253, -0.12083916, 0.04450374, -0.22449435, -0.24517713, -0.15282468, 0.10999382, 0.04883995, 0.12952463, 0.077369794, -0.12015865) * go_6(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.032314647, -0.10842104, 0.08947376, 0.09801895, -0.23712908, 0.03993495, 0.11174641, 0.17067215, 0.10894186, 0.055918567, -0.03502335, -0.18856876, -0.062737584, 0.010392958, -0.11375558, -0.034413774) * go_6(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.03193526, -0.12611216, 0.012267307, -0.009893633, -0.12945518, -0.12617463, -0.013297298, 0.11985869, -0.013691836, -0.097269624, 0.039589375, 0.07388823, -0.009328134, 0.06370066, 0.02859016, 0.048128143) * go_6(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.10391301, 0.008188025, -0.048711997, 0.09241104, -0.038443137, 0.029809011, 0.024959557, -0.05881074, -0.04998583, -0.04124172, -0.028660027, 0.03466532, 0.011698102, 0.044361595, 0.04664061, -0.018566478) * go_7(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.09856062, -0.101091534, 0.06970033, -0.07585045, -0.12380092, 0.14135367, 0.019343793, 0.1737178, -0.16379696, -0.045019772, -0.058714505, -0.028094918, 0.15862615, 0.14155744, 0.07784022, 0.115407884) * go_7(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.013782505, -0.049060434, 0.000708752, -0.13372315, 0.09113942, -0.08684804, -0.0342819, -0.011987756, 0.009873064, -0.02924474, 0.025891695, -0.019425275, 0.023715625, -0.048975617, 0.10708091, 0.115210146) * go_7(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.0013538608, -0.012521754, 0.081756964, -0.071289025, -0.11118813, -0.02736482, -0.19032161, 0.061563436, 0.025607973, 0.11936482, 0.08191075, -0.058816638, 0.0739315, 0.015304525, 0.11458635, 0.07511394) * go_7(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.1808514, -0.083741136, 0.20993811, -0.12137578, 0.03407561, -0.030393306, -0.21573617, 0.057049792, -0.084746934, -0.08983451, 0.06681565, -0.020741878, -0.07407868, 0.06587669, 0.02362261, 0.18319516) * go_7(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.037588492, -0.10657281, -0.010977549, 0.04346086, 0.123472065, 0.025804061, -0.08596545, 0.014454042, -0.08765823, -0.08678077, -0.07755789, 0.031191997, 0.03477551, 0.07478537, 0.11362728, 0.09572332) * go_7(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.0900926, 0.19256, 0.12193432, -0.08833128, -0.093027934, -0.06769375, -0.16739862, -0.03577543, 0.017636668, 0.027024843, 0.06288048, 0.044872086, 0.10232667, 0.0068255565, -0.004028761, 0.029350126) * go_7(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.049896117, 0.15445383, 0.14894868, 0.02776866, 0.063110374, 0.17882115, 0.0042055226, -0.017513141, 0.091088936, 0.003010554, 0.056064103, -0.083869845, -0.048410174, -0.22603737, 0.051802166, -0.03973644) * go_7(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.05112879, -0.040702794, 0.08248044, 0.086119935, 0.06375491, 0.020072684, 0.15028115, 0.008888093, 0.082408555, 0.006811597, -0.123747684, -0.09731778, 0.11961848, -0.021594765, -0.09106974, -0.050286602) * go_7(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.2571731, -0.081907116, -0.033212937, 0.0620556, 0.009862383, -0.0070517566, -0.004764438, -0.0709893, 0.018923642, -0.057825282, -0.0064521073, 0.08952444, -0.022852743, 0.13909613, -0.019168667, 0.030131642) * go_8(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.020968758, 0.08022817, -0.008601074, -0.1097215, 0.047841262, -0.07995962, 0.08419089, -0.040025167, 0.039427646, -0.034424137, -0.02700686, 0.074861415, 0.0041469475, -0.18269539, -0.17760022, 0.12437888) * go_8(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.035323508, -0.115505636, 0.08674358, -0.16753072, 0.034209844, -0.0076614427, -0.0005810619, -0.05547449, -0.02653139, 0.0323624, 0.06460733, -0.035394993, -0.04853036, -0.023752727, -0.042929113, -0.15378472) * go_8(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.29659423, -0.0006672761, -0.047517773, -0.06199174, -0.017030012, 0.029558018, -0.02886189, -0.09088566, 0.019745167, 0.096069895, 0.18460031, 0.11346628, -0.0806195, 0.08387502, 0.04051519, -0.008846576) * go_8(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.05892242, 0.056606613, 0.015149992, 0.09476475, 0.07959804, 0.05704647, 0.10259821, 0.15022708, -0.042979885, -0.23327734, 0.2702623, 0.10974108, 0.03293819, -0.038108915, -0.110423155, -0.023343116) * go_8(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.03149034, 0.08331677, -0.08575176, -0.055300176, 0.008931783, -0.08674912, -0.022917027, 0.01648926, -0.1268374, 0.075792305, 0.15822591, 0.055847537, 0.0012736744, 0.19256137, -0.04431186, 0.06601694) * go_8(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.013500773, -0.11745078, -0.04050182, 0.06596709, 0.057272922, -0.020333195, 0.050690793, -0.015620617, -0.08613812, 0.056710016, 0.03490378, -0.12669475, 0.07707306, 0.07194328, 0.13534424, 0.051376734) * go_8(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.10094398, -0.021660322, -0.21838374, -0.093808286, -0.09158486, -0.014816265, -0.15103486, 0.08692401, 0.030954776, 0.015028527, 0.034968782, 0.07395348, -0.018183898, 0.07517873, 0.013613574, 0.065369695) * go_8(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.03792745, -0.006733627, 0.025750823, 0.014982917, -0.04316942, 0.03895343, 0.010674262, -0.02580279, -0.05217408, -0.048307255, 0.10277286, 0.11032194, -0.042484324, -0.094473965, 0.09480515, 0.15434706) * go_8(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.033276457, 0.002123263, 0.0064143906, 0.02557083, -0.055384915, 0.018320283, 0.013389597, -0.07641146, 0.06467656, 0.06509521, -0.01756422, -0.048893183, 0.066380076, -0.08305459, -0.123950765, 0.07847402) * go_9(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.038409892, 0.15350512, 0.19252667, 0.011370862, 0.018854687, -0.0037143677, -0.051887456, -0.024303446, -0.08148162, 0.09258359, 0.044794485, -0.0741859, -0.007914459, 0.16320546, 0.005944812, 0.006757313) * go_9(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.0028705026, -0.05118026, -0.09932788, -0.004281493, -0.036878936, -0.023730323, 0.050872713, -0.050899874, -0.07606518, -0.03521744, -0.07658885, -0.108464874, 0.10739581, -0.009181252, -0.0070966687, 0.05193587) * go_9(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.018943064, -0.00937319, 0.018877272, 0.014771399, 0.1178018, -0.0911264, 0.10991882, -0.15921818, -0.06767399, -0.059326403, -0.09600347, 0.009451356, 0.102710254, -0.0885573, 0.057603467, 0.01992773) * go_9(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.0046776338, 0.012952324, 0.033664063, -0.05237841, -0.054967895, -0.025386026, 0.079488695, 0.22789961, -0.013646531, -0.14056179, 0.043689843, 0.042846087, 0.036067236, 0.14239535, -0.281547, 0.07508984) * go_9(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.09807237, 0.0034014925, 0.044999514, 0.045813996, -0.053272054, 0.075805016, 0.029503575, -0.07698443, -0.084488615, 0.13008903, 0.04431506, -0.051466364, 0.021694876, 0.043624, -0.013493849, 0.0029076347) * go_9(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.013535879, -0.024679128, 0.036481153, -0.021314025, 0.0834024, -0.099808566, 0.05001698, 0.010658749, -0.06595134, -0.03521598, -0.103553504, 0.06790129, 0.035933115, -0.047610957, -0.0052558477, -0.1678799) * go_9(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.025644135, -0.034027576, -0.080036685, 0.03827762, -0.027871434, -0.070245065, -0.021769412, 0.027066302, -0.07604397, 0.05617383, -0.18923633, 0.15722784, -0.026357215, -0.02692877, -0.15795054, 0.0033001932) * go_9(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.02899885, 0.052839927, -0.024265958, -0.06958408, 0.0008551589, 0.0133860465, 0.075541645, 0.015619437, -0.040788416, 0.07190152, -0.12392664, -0.05369185, -0.15271576, -0.0103186015, 0.13524354, -0.07938339) * go_9(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.14343445, -0.028533014, 0.03347991, -0.023772543, -0.07142908, 0.014239871, -0.05316892, -0.03663716, 0.08939066, -0.020609157, 0.0054644085, 0.1524691, 0.1692467, 0.018540619, 0.044972885, 0.07313233) * go_10(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.09232455, 0.12691838, -0.056665517, 0.03202994, -0.076657206, -0.16730559, -0.05197493, 0.0138470195, 0.0018628361, 0.13816267, 0.10077216, 0.17797759, 0.043260746, 0.017978493, -0.06791809, -0.010487932) * go_10(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.03577261, 0.048712313, 0.06941375, 0.0051264153, 0.008309652, -0.028129293, 0.022743499, -0.013171842, 0.12213201, -0.0295121, -0.053002793, 0.016487766, -0.053577382, -0.08655959, -0.07344541, -0.064555615) * go_10(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.10845244, -0.0077420617, 0.03581785, 0.0038137652, 0.015107951, -0.059069965, -0.04678172, 0.048014846, -0.004465835, 0.0022898219, 0.073007226, 0.18142632, 0.07848132, 0.07515797, 0.012369896, 0.07600368) * go_10(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.08638719, 0.15884505, -0.08973742, -0.12369276, 0.08267924, -0.03720554, -0.17259789, 0.1946709, 0.016929558, 0.029375779, 0.01198965, 0.06847236, -0.06293463, -0.022434572, 0.07651499, 0.0346661) * go_10(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.025976323, 0.045778584, 0.05067603, -0.02544538, -0.05079276, 0.04841232, -0.17063946, 0.022753738, 0.06943225, 0.056274258, -0.13646449, 0.023894709, 0.0039852895, -0.084818296, 0.015410173, -0.032319937) * go_10(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.04807185, -0.0003949595, 0.025213908, 0.103080414, -0.0023272403, 0.023491438, -0.056150086, 0.12879792, -0.013982606, 0.036223706, 0.03940019, 0.024488496, 0.012625189, -0.07193314, 0.12854105, -0.032734193) * go_10(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.12367774, -0.035864305, 0.13639599, 0.03812523, -0.03994671, -0.11915718, 0.041367244, 0.16409606, 0.050837673, 0.06977757, -0.052018918, 0.09774216, 0.07573336, -0.003323072, -0.044979483, -0.021800824) * go_10(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.06765063, 0.07885527, -0.061796997, -0.033930518, 0.060318742, -0.04216291, -0.07221272, 0.09004521, -0.065076694, -0.026399218, 0.10466377, 0.08561086, -0.024088204, -0.070315324, -0.040125035, 0.004548777) * go_10(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.04096943, 0.046178315, 0.011453587, 0.048791222, 0.027209666, -0.08074877, 0.106461525, -0.10974307, -0.020276416, 0.06417489, -0.0028763798, -0.029264465, 0.03444099, 0.10803487, 0.0141790565, 0.009156893) * go_11(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.016227538, 0.19522339, -0.0053924974, 0.055647578, 0.026691278, -0.09364552, -0.04868968, 0.068987675, 0.11558127, -0.16214633, 0.000592678, -0.08047563, 0.03148686, -0.06717632, -0.09336522, 0.043072738) * go_11(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.0011174235, 0.08426773, 0.103897035, 0.11740773, 0.024287522, -0.020319004, 0.04015764, 0.010502566, 0.019457467, -0.04620711, 0.024066428, 0.05627311, -0.014574119, 0.0273105, 0.001676443, -0.023356035) * go_11(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.1606767, -0.086658545, 0.009466048, -0.030490771, 0.16992782, 0.06852414, 0.15293188, -0.08855474, -0.067096494, 0.017907407, -0.017089175, -0.0053409, 0.0733796, -0.018089872, 0.05572631, -0.035322845) * go_11(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.048777405, -0.038038082, 0.092394255, 0.08715676, 0.053691484, -0.23649393, -0.12883174, 0.012281466, -0.037717126, -0.07552516, 0.07210121, -0.17331205, 0.0016187717, 0.07259926, 0.145282, 0.014165023) * go_11(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.12497079, -0.104426414, -0.012715669, -0.19777615, -0.017443223, 0.06788143, 0.0614136, -0.002465718, -0.028014038, -0.011756029, 0.10710533, 0.058262154, -0.060565244, -0.03191098, 0.00991814, 0.076612055) * go_11(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.013859454, 0.061379608, 0.073247865, -0.0067830062, 0.16421017, 0.16367128, 0.02887352, -0.18079562, -0.08341499, -0.04535779, -0.07029753, -0.02935799, 0.09612428, -0.052309513, -0.04888333, 0.044868078) * go_11(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.12000188, -0.024868136, 0.123532094, -0.11463714, -0.06894127, -0.030455533, 0.056860894, 0.03772401, 0.03873448, 0.0840759, -0.08643597, -0.08898501, 0.035110738, -0.12644961, 0.065761074, 0.030739123) * go_11(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.01031014, -0.02494621, -0.18404531, -0.15162574, -0.04742816, -0.08756647, 0.16793372, -0.002655142, 0.01775816, -0.02193653, -0.047818832, -0.047989108, 0.021209596, 0.10485623, -0.092118226, -0.11965965) * go_11(pixel.xy, 1, 1);
  result += vec4f(0.038480498, 0.04292295, 0.03059564, 0.052293446);
  textureStore(conv2d_16_tf_tex, pixel.xy, result);
}
