// Layer: Anime4K-v4.0-Restore-CNN-(VL)-Conv-4x3x3x16
// Name: conv2d7tf
// Inputs: ['conv2d_6_tf', 'conv2d_6_tf1']
// Output: conv2d_7_tf
@group(0) @binding(0) var conv2d_6_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_6_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_7_tf_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_6_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_1(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_6_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_2(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_7_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(0.21919365, 0.36627784, 0.12603314, 0.24306288, 0.06447028, 0.06472204, -0.05997039, -0.15651788, 0.017059859, -0.006497198, -0.4189735, 0.021636713, -0.23887977, -0.014220949, 0.031113686, -0.17342716) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.10818789, -0.03273837, 0.33918005, -0.19290088, 0.0955361, -0.34107623, -0.054906327, -0.18083344, -0.060723677, 0.24395694, 0.112975016, -0.07254578, -0.14389384, 0.13235968, -0.15054801, -0.26216486) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.23442148, -0.07857079, 0.022283873, -0.2656417, 0.037092753, -0.037313666, -0.5057047, 0.042533103, -0.120424, 0.00021930189, -0.0044566668, -0.45536995, 0.00040759926, 0.14597592, -0.094990164, -0.036161344) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.15024352, 0.19903262, -0.0734784, 0.092836305, -0.025753846, 0.024750374, -0.07550193, 0.035420835, 0.11084378, 0.26119822, -0.08443512, -0.0047807065, -0.042685136, 0.24889739, 0.098650105, 0.2088369) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.25551823, 0.14455976, 0.19886157, -0.23465924, 0.20711218, -0.20875362, -0.11320392, -0.30852005, -0.06795657, 0.008670962, 0.30601278, 0.6929064, 0.17079145, 0.15744895, 0.06441601, 0.06514001) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.03142604, -0.006410137, -0.023654792, -0.05708553, 0.062985405, -0.077010594, 0.078804865, 0.050882503, 0.010274228, -0.15558401, 0.09490256, 0.14964707, -0.11966925, -0.36176664, 0.27809814, -0.18862294) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.05609992, 0.0041612233, -0.08498908, 0.04479823, -0.080117956, -0.17423204, -0.22858045, 0.054569032, -0.050866384, -0.020000307, 0.027000953, -0.67724514, 0.16240878, -0.04641204, 0.0648367, -0.20613132) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.08542306, -0.08254248, -0.11090553, -0.14140448, -0.10788511, -0.13011602, -0.29319742, -0.26007155, 0.11033401, -0.31966573, 0.32668245, 0.19542319, 0.06329418, 0.20904626, 0.2724067, -0.009155685) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.007403411, 0.0012836396, -0.23446666, -0.03017208, 0.062420018, -0.13611084, -0.2975928, 0.13173148, -0.03679939, 0.13743873, -0.10121899, 0.074514665, 0.1497629, -0.09523838, 0.39018926, 0.37807035) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.11441487, -0.19565523, -0.25757137, -0.16148767, 0.15575317, -0.12657928, 0.10479676, 0.062919036, 0.010544159, 0.22931573, 0.20360178, 0.4637635, -0.3395036, -0.52467215, 0.08759308, 0.028030418) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.2699195, -0.34218305, 0.15259695, 0.03139074, -0.024053533, -0.029567484, 0.28480124, 0.20525953, 0.15452823, -0.217713, 0.15861876, -0.012275699, 0.21408023, 0.097508304, -0.57126766, -0.14679857) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.0755847, -0.09751562, -0.29480466, -0.22285318, 0.14196442, 0.114573136, -0.22294767, 0.12463806, 0.3322209, -0.04631724, -0.11097061, -0.27986854, -0.16099304, -0.060079545, 0.00299308, 0.120776065) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.050933484, -0.13776319, -0.18809728, 0.24035202, -0.32528606, -0.41684148, -0.029342847, 0.28642926, -0.07963454, -0.12905268, 0.07606093, 0.24670005, -0.08815598, -0.23320907, -0.008099349, 0.21512873) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.19247563, 0.18083979, -0.09719762, 0.15314941, -0.22350982, 0.46515045, -0.3571128, 0.35953265, 0.06921985, -0.4482386, -0.18732521, -0.5043983, 0.35159567, -0.33315298, -0.21884166, -0.16283798) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.021124054, -0.007966742, 0.0052493825, 0.022550896, 0.030403977, 0.3377868, -0.47602004, -0.077664234, -0.07222509, -0.07486097, -0.37971064, -0.5107857, -0.06299477, 0.04930232, -0.3330487, 0.29845512) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.063705474, -0.07917637, -0.02026607, -0.05142568, 0.021577014, -0.07379867, 0.033937998, 0.08148773, -0.02717838, -0.03233838, 0.098000035, 0.036476444, -0.13366953, 0.014477577, 0.24064232, 0.39313284) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.16046515, -0.094624564, 0.35435164, 0.09942324, -0.07137174, -0.27999225, 0.124644354, -0.0062176553, 0.015016751, -0.05500243, -0.23249559, -0.4508382, 0.1860433, 0.10671491, -0.033345353, -0.06611453) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.21614046, -0.01307525, -0.18941112, -0.20533535, -0.14481686, -0.47801897, 0.22605121, -0.20298961, -0.06744227, -0.20377496, -0.11926173, 0.15645133, -0.31570885, -0.3495616, -0.024666889, 0.040965475) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.11748018, -0.039976366, -0.00084064255, -0.028653437, -0.16216733, -0.036768105, 0.018064514, -0.0928936, 0.14008482, -0.064511225, 0.24329947, -0.0268608, 0.050330248, 0.08540601, -0.07272679, -0.01187671) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.09459936, -0.011723822, -0.06952858, -0.07808506, -0.065588176, 0.332501, -0.0120042395, 0.07668016, 0.14735217, -0.14856043, -0.06702449, -0.020953184, -0.023006834, 0.06135422, 0.1491448, -0.028061569) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.25136968, 0.25146323, -0.108277924, -0.20407207, -0.0013780294, 0.16108194, 0.25143847, 0.06672421, -0.033905584, -0.021144686, -0.019152718, 0.34619498, 0.14560962, 0.034437314, 0.024790365, -0.049976267) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.24928351, 0.12637813, 0.23609994, 0.12722939, -0.036997862, -0.16554876, 0.11144095, -0.10040036, -0.020359103, -0.080701865, -0.3142192, 0.27257237, 0.13546956, -0.14416885, 0.028196262, -0.2886465) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.28524777, -0.4236231, 0.27420738, -0.21095508, 0.23475651, 0.115876295, -0.18837357, -0.0260708, 0.030670704, -0.11516913, -0.11365572, -0.2203149, -0.018612983, -0.10719593, -0.031727783, 0.1403327) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.07240512, 0.03139215, 0.12328737, -0.021201206, -0.13971715, 0.072742075, -0.0011289873, 0.0053133667, 0.035639685, -0.04322272, -0.19288473, -0.15812221, -0.19126481, 0.0698514, 0.17619178, -0.035605464) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.18552057, 0.07259671, 0.011667668, -0.15630563, 0.11414356, 0.14482655, -0.04021029, 0.18495587, -0.11386139, -0.09058561, -0.011265998, 0.23358451, 0.0521358, 0.12495261, 0.021644838, -0.048094347) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.09222373, 0.0533347, 0.055820454, 0.22382596, 0.18713981, 0.2668916, -0.019384036, 0.012698582, 0.13325234, 0.20361474, -0.33106443, -0.08571572, -0.21243028, -0.10996386, 0.123459645, 0.1534967) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.18133277, 0.18108074, -0.05638664, 0.29533157, -0.2108019, -0.033636626, 0.5015888, -0.15116066, -0.041320793, -0.14764231, 0.07314567, -0.18865979, 0.10276937, 0.094240844, -0.1364283, 0.27812913) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.06040915, 0.23753685, 0.19019844, 0.23948252, -0.07535012, 0.11848904, 0.14389765, 0.050067905, 0.16150077, -0.030053454, 0.12478255, 0.26020208, 0.111198805, 0.06787492, -0.12771018, 0.006687384) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.5421617, 0.10414128, -0.21526064, -0.08883624, 0.13145073, -0.29695904, 0.57386386, 0.073361695, -0.09538372, 0.27593842, 0.070922814, 0.21769938, 0.06214975, 0.11847816, 0.10033405, 0.29360098) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.16294672, -0.014815565, 0.22046989, 0.16858687, 0.058917344, 0.21384977, 0.18803519, 0.105688855, 0.0355118, 0.20571202, -0.07341922, 0.26624045, -0.0415102, 0.050942056, 0.19727907, 0.20122413) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.020470422, 0.15815964, -0.13437317, -0.1967045, 0.074902646, 0.08356444, 0.055913117, -0.12837863, -0.18647918, 0.07002247, 0.038864706, -0.07288784, 0.04135125, -0.016055549, -0.1340297, -0.15578008) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.07685624, 0.00079105416, -0.068755336, 0.110282525, -0.014170752, 0.041282844, -0.17035173, 0.19439398, -0.3036256, 0.024148455, -0.19566648, -0.06736254, 0.14203559, -0.13016985, -0.32845357, -0.14266774) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.0087252045, 0.098839566, -0.08770506, -0.08499465, 0.015245115, -0.110854514, 0.054458305, -0.018121868, -0.09666134, -0.08316006, 0.24617113, -0.17195955, 0.2574254, 0.06734342, -0.13792352, -0.07306126) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.0073954533, -0.20126835, -0.22545357, -0.29462856, 0.057408337, 0.11939119, -0.01846476, 0.12534486, 0.15751605, -0.14282645, -0.14219986, 0.14283386, 0.14090413, 0.10500912, 0.03039335, 0.17448832) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.043910783, -0.09140025, -0.21666165, 0.07616939, 0.104454786, 0.309926, -0.12906921, 0.1140117, 0.09372434, 0.049547072, -0.086615674, -0.034449168, 0.096705064, 0.26001686, 0.027063297, 0.12422948) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.1365422, 0.2679611, 0.12037257, 0.43346113, 0.08223084, -0.016788265, 0.13570398, -0.017974345, -0.17922844, -0.09475725, 0.073539585, -0.106947675, 0.08998511, 0.04133868, 0.16586913, -0.26291734) * go_3(pixel.xy, 1, 1);
  result += vec4f(-0.19233678, 0.016725872, -0.008011114, -0.1977463);
  textureStore(conv2d_7_tf_tex, pixel.xy, result);
}