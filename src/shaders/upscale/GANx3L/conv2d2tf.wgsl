// Layer: Anime4K-v4.1-Upscale-GAN-x3-(L)-Conv-4x3x3x24
// Name: conv2d2tf
// Inputs: ['conv2d_tf', 'conv2d_tf1', 'conv2d_tf2']
// Output: conv2d_2_tf
@group(0) @binding(0) var conv2d_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_2_tf_tex: texture_storage_2d<rgba16float, write>;
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
  return max4(textureLoad(conv2d_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_4(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_5(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_2_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(0.1881249, -0.14544061, -0.022969106, 0.088232316, 0.0058642747, -0.049336948, -0.039974928, 0.06410949, -0.09211665, -0.034005307, -0.1095955, 0.10930763, -0.26397142, 0.1384094, 0.017342392, -0.21376696) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.14526816, -0.0639951, 0.11742242, -0.006982521, -0.05208895, 0.089485295, -0.19564004, -0.08121572, -0.11621622, 0.15375662, -0.15378582, 0.0596373, 0.14132364, -0.06385903, 0.05449634, -0.047440365) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.082622305, -0.23856479, 0.06367865, -0.019509695, 0.094882965, -0.04511791, 0.16706854, 0.20536391, 0.1409632, -0.10635743, 0.038904104, -0.0039008786, 0.16198882, -0.17409256, 0.13213669, 0.08329318) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.1186756, 0.2009846, -0.086417995, 0.20491274, -0.13763973, -0.0800847, 0.16069777, 0.10931271, 0.14152408, 0.047218926, 0.041168302, -0.054257084, -0.08315953, -0.1573787, 0.20787828, 0.118524544) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.19046788, 0.10213364, -0.112078644, -0.16287695, 0.011410189, -0.016858546, -0.09383451, -0.063516155, -0.17561492, -0.15199865, -0.112707786, -0.18099716, 0.19017689, -0.20048961, -0.5382596, -0.24332014) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.1465597, 0.044423096, 0.04632811, -0.015121401, -0.051081203, -0.09574356, -0.10018257, -0.019390205, -0.1562855, 0.041693382, -0.012624074, 0.057703923, 0.09825134, 0.1544577, 0.1683734, 0.018580355) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.22240564, -0.051839057, 0.12950379, 0.0048653902, 0.0144696245, -0.10698864, -0.08654499, -0.131132, 0.15429983, 0.025204081, -0.09136411, -0.053068906, -0.005858075, -0.02560129, 0.0469077, 0.018962694) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.4698737, -0.053354982, 0.27541625, -0.020424731, 0.06935965, 0.008045162, -0.11538889, -0.038876567, -0.049084928, 0.1629101, -0.012742019, 0.12038333, -0.0705842, 0.12735052, 0.17640172, 0.050716672) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.10064598, 0.016594354, -0.14633141, -0.09175336, -0.12889755, -0.1671076, 0.22031903, 0.0759859, 0.102435045, -0.072596334, -0.17714, 0.03531571, -0.022843607, 0.047148425, 0.105391234, 0.05260699) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.1057386, 0.020954097, -0.022159133, 0.064248964, -0.031145383, -0.008180922, -0.023611609, 0.05197287, -0.017418958, 0.02461813, 0.0584847, -0.10087345, -0.16315617, 0.15651843, 0.10478647, 0.08347392) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.01323452, 0.044956483, -0.007983463, 0.10643116, -0.030048033, -0.11766427, -0.101889476, 0.015120098, 0.031690307, 0.014470776, -0.10197176, -0.10045749, -0.065616645, -0.15230782, -0.26183948, -0.071056716) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.026220636, -0.044518135, 0.17167594, 0.3016424, 0.12054841, 0.042369425, 0.04208856, 0.14938886, -0.07018442, -0.008244587, 0.14260693, -0.094418734, -0.032693435, 0.042990524, -0.053002246, -0.003936231) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.10141095, 0.17178011, -0.10951717, -0.28119737, 0.008288983, 0.14197187, 0.10903869, 0.017220182, 0.041842293, -0.03106527, -0.05892881, 0.02668739, 0.072505936, -0.060759444, 0.00032896115, -0.03440771) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.13831837, -0.13864368, 0.15232176, 0.31198958, 0.033965178, 0.053397447, -0.30352455, -0.17199865, -0.06429645, 0.013913047, 0.10764071, -0.12238359, -0.04544379, 0.17074125, 0.024108075, -0.14521888) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.11011318, -0.0102100335, -0.37701187, -0.36465186, 0.16052358, -0.06683314, 0.16916892, 0.23348652, -0.17332914, 0.007918098, -0.055450343, 0.12134491, 0.002598775, 0.050541576, 0.16586582, -0.08609246) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.055008903, -0.038048673, 0.12065314, -0.034293417, 0.026340824, 0.0635937, 0.0072025824, 0.1099919, -0.022833373, 0.06988719, 0.098066956, 0.09838032, 0.027212605, -0.10769643, 0.025036965, 0.07822364) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.12550583, -0.015590264, -0.20009072, -0.2595937, -0.040573828, -0.07032441, 0.13428123, 0.0024277875, -0.103335135, -0.08461066, 0.05634581, -0.113169014, 0.05591198, -0.16420694, -0.06915715, -0.19497992) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.088232726, -0.05118527, 0.119473234, 0.23262945, 0.06746001, 0.14686997, -0.25685823, 0.08349066, 0.120035954, 0.11132579, 0.1024914, 0.008478224, -0.054700002, -0.029634893, 0.050064556, -0.08939752) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.022236016, -0.14602192, -0.011037687, 0.09127931, 0.14263593, 0.2303995, -0.07378528, 0.07426219, -0.25500375, 0.18845809, -0.065374866, 0.016772734, 0.02813176, 0.15021992, -0.032982655, 0.0046127643) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.110158965, 0.02073459, 0.1380525, 0.017634321, -0.3546499, -0.099760525, -0.1195462, 0.057210118, -0.53130746, 0.23352407, -0.18252264, -0.19651698, -0.10013627, -0.006907238, -0.022171183, 0.023419948) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.009217382, 0.00943576, 0.005295363, 0.010542551, -0.21079898, -0.14469005, -0.19105618, 0.2098414, 0.18261504, 0.19765937, 0.044775106, -0.25939676, 0.072466746, -0.08828442, 0.066161856, 0.05692894) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.051633067, 0.019243274, 0.28932014, -0.029704608, -0.06255436, -0.4573925, -0.10963281, 0.121834375, 0.10874706, -0.093909726, 0.06983889, 0.048236616, -0.15379356, -0.06354611, -0.10668147, -0.02901699) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.044167574, 0.022249546, -0.3618917, -0.054136246, -0.105739385, -0.22325896, -0.070169605, -0.19650152, 0.07689512, -0.17047665, -0.07742679, 0.031095566, -0.01903123, -0.033752028, -0.2286711, 0.044381924) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.05709193, 0.15251294, -0.16776492, 0.09025173, 0.18235344, 0.3685535, -0.053927444, 0.10351524, -0.0938133, -0.26824594, -0.036424845, -0.106756285, -0.13051414, -0.07613318, -0.10721611, -0.13445549) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.0268394, 0.017245602, 0.1185864, 0.031915247, -0.037321728, 0.037805032, 0.13701047, 0.025731707, 0.03791209, -0.16549957, 0.08953334, -0.13901101, -0.1287722, 0.072961085, 0.06859001, 0.18934746) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.11152981, 0.13712928, -0.05714947, 0.05542204, -0.32208005, -0.015176284, 0.10014709, -0.030125491, -0.04422843, 0.12897238, 0.108573034, -0.025267191, 0.02247499, -0.058167085, -0.15205052, 0.043249656) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.12951276, -0.14417744, 0.012708804, -0.0040302873, 0.09192804, -0.092346616, -0.09659876, -0.13512622, -0.0737095, 0.002481852, 0.048459593, 0.05455724, -0.14035852, 0.07777282, 0.07471883, 0.107781895) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.028793033, -0.039604917, -0.0045903274, -0.05023892, 0.04976248, -0.026074547, 0.1733191, -0.06694405, -0.12434122, 0.12477937, -0.105804294, 0.06170465, 0.33725888, -0.15944988, 0.09790923, 0.030690596) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.005191585, 0.08373177, -0.018288689, 0.020527333, -0.055718876, -0.12754384, 0.17755422, 0.1597085, 0.17601304, -0.0258804, 0.16454586, 0.106551126, -0.20891763, -0.05360957, -0.24229631, -0.15886526) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.03740399, -0.0043318006, -0.010840595, -0.01674406, -0.17876416, 0.09188681, -0.12203759, -0.09808559, 0.1243873, -0.184597, 0.07484877, 0.14448164, -0.15161137, 0.033237204, -0.054772068, -0.085399576) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.071139924, 0.025827989, 0.021663137, -0.12484576, -0.07799051, 0.20053016, 0.014714873, -0.041652568, 0.046397317, -0.07650734, 0.06753141, 0.080667324, 0.4557549, -0.029605106, -0.25674006, -0.27842438) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.16805562, -0.03722638, 0.021958483, -0.04969856, -0.15340807, -0.22158863, -0.25280216, -0.024268134, 0.085401855, 0.22427009, -0.04698029, -0.071075134, -0.10739174, 0.030285811, 0.31068414, 0.2882289) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.010069354, -0.045132317, -0.08054911, 0.19212297, -0.11246117, 0.203382, 0.10145021, 0.1476792, -0.022835081, 0.16916804, -0.018178321, 0.076025024, -0.29570428, -0.007177177, -0.1047155, -0.0178633) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.076137505, 0.117270656, -0.077183075, -0.052782975, -0.08236995, 0.053947527, 0.13501388, 0.17139077, -0.2424162, -0.15007298, 0.123724684, 0.09327283, 0.19777925, 0.07314544, -0.18668725, -0.010371631) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.15866037, 0.053233996, -0.026709981, -0.1574147, -0.012303242, 0.06893102, 0.031804018, 0.10116885, -0.016902728, -0.082480945, 0.05133729, -0.20160739, -0.012635841, 0.032104325, 0.00968726, -0.018941477) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.02683365, 0.14024723, 0.0020279875, 0.035137076, -0.019948762, 0.3120297, -0.018649966, -0.17814124, -0.14863688, -0.12977526, -0.09194036, 0.19637106, 0.12040974, 0.09383599, 0.10559805, -0.0319509) * go_3(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.07015076, -0.07818044, 0.12413185, -0.0018199648, -0.015275738, -0.21548629, 0.046161238, -0.10475311, 0.082367115, 0.0053079966, 0.09559984, 0.039583992, -0.1681236, -0.23862287, -0.09229484, -0.12317666) * go_4(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.17587087, -0.097817905, 0.08857801, 0.14012139, -0.20023742, 0.029083535, 0.056073546, -0.06810832, 0.08625035, 0.023427716, 0.1797412, 0.048568305, -0.09278378, -0.09250215, -0.12440772, 0.2587798) * go_4(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.24181388, -0.016290328, -0.026988767, -0.005399553, -0.061761368, -0.0013004051, -0.1990831, -0.07799404, 0.03282008, 0.079514205, -0.07474829, -0.36701006, 0.078521594, -0.156468, 0.09041213, 0.1292482) * go_4(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.21960634, 0.041841425, 0.122728646, 0.06800145, 0.07355482, 0.26123464, -0.13518283, -0.05085496, -0.099832244, 0.04960356, 0.066544525, 0.09741243, -0.10965899, -0.16163626, 0.09816793, -0.014595947) * go_4(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.07614604, -0.062298786, -0.07941662, -0.22525579, -0.29955792, 0.11145522, 0.123146005, 0.13863817, 0.15309983, 0.025902487, -0.08610474, -0.07598799, -0.26134565, -0.2818921, 0.0046356185, 0.007307074) * go_4(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.15936229, -0.10145381, 0.058567517, 0.21258314, -0.18010478, -0.22477242, -0.039975245, -0.34447697, -0.21647838, 0.31467855, -0.0674453, -0.5146147, 0.05382176, -0.026282668, -0.24090777, 0.10222359) * go_4(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.1045028, -0.027515164, 0.013251722, 0.108239084, 0.03163253, -0.030052185, 0.10836872, 0.15349132, 0.09593661, 0.0062710177, -0.19837233, -0.098303355, -0.23947543, -0.04082913, 0.16908304, -0.031784274) * go_4(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.07773699, 0.30408737, 0.10054892, 0.36721498, 0.51369953, -0.11931886, -0.17019019, -0.3288588, 0.11095048, -0.29225063, -0.075574756, -0.18392691, -0.10289336, 0.06882282, 0.20403436, 0.12073833) * go_4(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.024539007, 0.053005982, -0.099204265, -0.084534295, -0.2587164, -0.31929657, 0.07193254, 0.18271501, -0.043669797, 0.062497724, -0.055462, 0.057130013, -0.015285072, -0.030743862, -0.07051513, -0.13783172) * go_4(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.4343681, 0.35928357, -0.004770178, -0.079942055, 0.014088603, -0.20866469, -0.1378781, -0.06831558, 0.21436058, -0.08427488, 0.2455502, -0.065596916, -0.06559933, -0.027101375, 0.023555819, -0.20939256) * go_5(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.37720296, -0.111260146, -0.25392932, -0.33377793, -0.17806955, -0.008747484, 0.17404033, 0.058826912, 0.0039355545, -0.18436235, 0.15803719, 0.15143508, 0.11155828, 0.09333553, -0.17960371, -0.036842924) * go_5(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.087490946, 0.0959697, -0.08301798, -0.19364063, -0.00996324, 0.014655412, 0.021732382, 0.07269497, 0.012744119, 0.01542146, 0.109438084, 0.18674947, -0.05728511, 0.017406877, 0.036412247, -0.044986803) * go_5(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.30902067, 0.25019556, -0.079495244, -0.26099077, 0.08450634, -0.08346094, 0.004498276, -0.119334444, -0.08587327, -0.019446453, -0.1811446, -0.16136086, 0.006683898, 0.0005228834, -0.11937812, -0.2045503) * go_5(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.19326456, -0.052496854, 0.12926556, 0.10167019, 0.090374604, 0.07595169, -0.0048561483, 0.12414255, 0.19320521, -0.027459998, 0.08993327, -0.035830285, 0.006461366, 0.023297347, 0.0691706, -0.00831113) * go_5(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.13971736, 0.0788502, 0.12267767, 0.004433991, -0.053574555, -0.08087108, -0.26019198, -0.04175351, -0.13934188, 0.04144695, -0.070562504, -0.068388134, -0.1347503, -0.02173245, -0.1099242, -0.020897312) * go_5(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.07843604, 0.04441641, -0.016214373, -0.15351163, -0.021339556, 0.023823377, -0.01442564, -0.09113205, -0.02552644, 0.14885889, -0.16178642, 0.14472331, 0.14082494, 0.05760455, -0.11503234, -0.16907685) * go_5(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.042953692, -0.3268466, 0.13181087, -0.06399399, 0.17543526, 0.111214496, 0.07369484, -0.003378238, 0.040965978, -0.0073295045, 0.07711077, -0.033094298, -0.08758825, -0.01715938, 0.056862406, -0.010732023) * go_5(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.039256442, -0.07153648, 0.10314899, -0.1192048, -0.033410206, 0.13077301, 0.19343375, -0.07479033, 0.10759806, -0.037313893, 0.06156247, 0.021744521, -0.18148352, -0.15683053, 0.017884498, -0.11338723) * go_5(pixel.xy, 1, 1);
  result += vec4f(-0.077597156, 0.024995416, 0.0048880246, -0.06210122);
  textureStore(conv2d_2_tf_tex, pixel.xy, result);
}
