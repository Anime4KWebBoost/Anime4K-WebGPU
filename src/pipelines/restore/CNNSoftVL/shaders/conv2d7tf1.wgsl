// Layer: Anime4K-v4.0-Restore-CNN-Soft-(VL)-Conv-4x3x3x16
// Name: conv2d7tf1
// Inputs: ['conv2d_6_tf', 'conv2d_6_tf1']
// Output: conv2d_7_tf1
@group(0) @binding(0) var conv2d_6_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_6_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_7_tf1_tex: texture_storage_2d<rgba16float, write>;
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
  let dim_out: vec2u = textureDimensions(conv2d_7_tf1_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.18413043, -0.12355504, 0.2708789, 0.17259507, -0.069752574, 0.12640886, 0.01075919, -0.028221423, -0.020598855, -0.17259665, 0.16907778, -0.10040477, 0.017177016, 0.0176426, 0.23724149, 0.14657862) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.16921899, -0.33950835, 0.37508205, 0.09996622, 0.13377811, -0.036743056, -0.11633877, -0.23046862, -0.009307903, 0.027441062, 0.054166224, 0.011627087, -0.22831611, 0.043198805, -0.12695734, 0.0062862337) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.17216596, -0.15588646, -0.14179194, 0.12487524, 0.10507964, 0.124544986, -0.0046104924, -0.116668865, -0.006100901, -0.022074439, 0.03376759, 0.10498887, 0.109659016, -0.03567928, 0.29972833, -0.045950003) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.29127, 0.21912472, 0.16494286, 0.027708547, 0.043136686, 0.04409876, -0.07686145, -0.13180132, -0.16630307, 0.15650205, -0.005864527, 0.03916553, 0.15750135, 0.1705246, 0.21626697, 0.06906506) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.055395894, 0.28228188, 0.114794776, 0.020619212, -0.031812593, 0.11964309, -0.24317431, -0.36277202, 0.54564184, -0.032843567, -0.118973784, -0.40999004, -0.118530475, 0.09256661, 0.06583871, -0.36627474) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.17914769, 0.33976436, -0.11220768, 0.1325754, 0.40586957, 0.3064959, -0.19086123, 0.014164092, -0.17376979, -0.0037554938, 0.11771888, 0.44933778, -0.15937245, -0.10635065, 0.084963776, 0.14630255) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.3723194, 0.21509883, 0.020062352, 0.094394304, 0.030794155, -0.11394617, -0.09103134, -0.0042343247, -0.28981096, -0.061873477, -0.17772584, 0.36440176, 0.007828069, -0.012121627, 0.25862312, 0.24646287) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.10368119, -0.06185447, -0.022830853, 0.10918094, 0.18888599, -0.09235343, -0.055134308, -0.2210923, 0.15334128, -0.3084707, 0.31606838, 0.39931116, 0.29489174, -0.24794856, -0.4799932, -0.2617589) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.32550937, -0.17103608, 0.3257806, -0.23358762, 0.20370598, 0.13325407, -0.020303056, -0.105462655, -0.22264756, -0.034177396, 0.36885822, 0.20504399, 0.36375418, -0.26149705, 0.022433946, 0.15646128) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.007481421, 0.005642636, -0.170087, -0.08915849, 0.6329519, 0.06880098, -0.20856442, -0.1801066, -0.1342754, 0.13643123, 0.26994216, -0.27503812, 0.018052012, 0.058687408, -0.19784917, 0.021157453) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.1486918, 0.12212738, -0.03104796, 0.08664756, 0.3464865, 0.27309546, -0.022896903, -0.32080007, -0.28113958, 0.74847424, -0.33735126, -0.04616876, -0.23119605, 0.4214322, -0.16457441, 0.09162191) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.15863913, 0.1303683, -0.06339421, 0.06328312, -0.3100047, -0.33906308, 0.13805804, -0.14923394, 0.4997829, -0.14977637, 0.02265068, -0.04585939, 0.29802153, 0.3767994, -0.031849556, -0.051892217) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.04541847, -0.13645087, 0.14119779, 0.06409465, -0.29877988, -0.0009743694, 0.028256422, 0.14978185, -0.13014801, -0.24171488, -0.10782599, 0.010709664, 0.21880737, -0.34132662, 0.22972895, -0.07159475) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.1510528, 0.115773134, 0.036761034, -0.284284, -0.35684052, 0.16348189, -0.105475456, 0.08259931, -0.6489164, -0.033928663, -0.04243186, 0.25324553, -0.31829014, 0.066608824, -0.11131264, 0.51919967) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.06517726, 0.1933327, 0.044391852, -0.013346896, -0.3033368, 0.106350735, -0.1351003, -0.13414839, 0.11720078, -0.24844061, -0.2900742, -0.047861837, 0.42789885, -0.47915378, -0.09643217, -0.22915216) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.109821886, 0.31451595, 0.13300805, -0.08792569, -0.023928089, -0.038061168, 0.17821129, 0.003772247, 0.14684688, -0.12646271, 0.16072205, 0.011095222, 0.09209181, 0.005167038, -0.08823252, 0.079890974) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.20074554, 0.39979288, -0.007316405, -0.047838025, 0.10849111, -0.22469573, -0.059183244, -0.13663793, 0.07881898, 0.105663374, -0.3152222, 0.08104766, -0.22965154, 0.118780024, -0.07886757, 0.073527716) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.1304303, 0.023158893, -0.081089824, -0.15955788, 0.42183343, -0.12898655, -0.14028409, 0.011985, 0.3977131, -0.313598, -0.148818, -0.048350018, -0.13534498, -0.12760727, -0.014968193, 0.06646305) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.18085147, -0.11859402, 0.117530234, -0.10420847, 0.1848264, -0.12192718, -0.18729533, -0.10098887, 0.011134682, -0.23658146, 0.12963286, 0.117404245, 0.054487415, -0.030003065, -0.32175776, -0.08044254) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.07251758, 0.073430285, -0.22191651, 0.030512359, -0.029650904, -0.15816379, 0.0418705, 0.04776615, -0.014070836, -0.14669086, -0.009874937, -0.015444495, -0.2747725, -0.061624944, -0.11261252, 0.14757589) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.09274913, 0.046194065, 0.05642919, -0.07803342, 0.23578037, 0.01224276, 0.015608659, 0.05847865, -0.091819406, -0.14424564, -0.034869857, 0.019276984, -0.031180726, -0.21905676, 0.100375675, -0.13659117) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.072157644, -0.13294607, 0.24301524, 0.048643183, -0.04338094, -0.0021709928, -0.06530963, -0.22672611, 0.07479903, 0.08388352, -0.07460508, -0.14517406, -0.072923675, -0.26912874, -0.2769797, 0.054033212) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.5648679, -0.28059873, -0.039906785, -0.39112374, -0.3841447, -0.20383365, 0.12607281, 0.16049421, -0.34394273, -0.022326993, 0.16646549, -0.23433913, 0.071224056, 0.048073303, 0.122035526, 0.14941359) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.11803124, 0.114169255, 0.018188128, 0.0053847185, -0.07537228, -0.048262373, 0.073838905, -0.041833423, 0.044405136, -0.03813592, 0.076818384, -0.06015139, -0.085042655, -0.14306667, -0.21477652, 0.31548396) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.19307283, -0.014985916, -0.14332882, -0.05549754, 0.14551677, 0.11406769, 0.2744144, -0.031179624, 0.17578745, -0.11309805, 0.010072839, -0.07453384, -0.23163621, 0.19061968, 0.11016298, 0.108093746) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.23180474, -0.12522835, -0.03218773, -0.0031955864, -0.14057393, 0.07269213, -0.20883523, 0.09332164, -0.16037942, 0.25845763, -0.002303125, -0.014625506, 0.17063208, -0.11648214, 0.13988028, -0.024688654) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.043369994, 0.12473897, 0.108142346, 0.10268199, 0.16159926, -0.17804666, -0.007889351, 0.07232418, 0.26326916, 0.0474316, -0.41637155, -0.11879895, 0.14051722, 0.08747377, 0.1162202, -0.06443569) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.0041097966, 0.109841965, 0.097240336, 0.08123332, -0.081065506, 0.12650634, 0.23450434, 0.09631333, 0.21942414, -0.108897425, -0.033703003, 0.047280088, -0.017764917, -0.058596086, -0.15305139, 0.09055131) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.26824722, 0.014116421, 0.11844865, -0.156046, 0.057152968, 0.21287468, -0.3243975, -0.18181354, -0.07131152, -0.17860547, 0.18918999, 0.15399154, 0.20270234, 0.11524436, 0.05146645, -0.18196748) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.2745638, -0.026905773, 0.045458756, 0.22942849, -0.21052304, 0.20649272, -0.03713028, 0.33655703, -0.12467089, -0.015030098, 0.15504798, -0.05647672, 0.18751477, 0.08505986, 0.04756538, -0.058810517) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.1737789, 0.06552432, -0.34797582, -0.05370679, -0.036056817, 0.085242435, -0.12802805, 0.03710984, -0.09883285, 0.08946925, -0.0446528, 0.07734006, -0.10973603, 0.262812, 0.14010249, -0.1543792) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.316673, -0.16414417, -0.23147403, -0.3080756, -0.056620106, -0.11389848, 0.0948114, 0.13236332, -0.40048537, -0.090742044, 0.12090404, 0.024549136, -0.19124876, -0.3007761, 0.16159211, -0.28620452) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.032962102, -0.05481415, -0.1185786, 0.18153866, -0.2105442, -0.03802839, 0.14060515, 0.072460145, -0.1523761, -0.11426362, 0.02610123, -0.053477813, -0.20768824, 0.04533907, 0.14381588, -0.041578818) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.021694858, -0.028784249, -0.09928565, 0.07335764, 0.1315628, 0.11288982, 0.078681685, -0.1229723, -0.09618894, -0.07387309, 0.04340066, -0.036534667, 0.37295115, -0.08176548, -0.16579813, -0.13485877) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.45979, -0.289226, -0.15456465, 0.0117592, 0.22803205, 0.15497394, -0.38995707, 0.005227681, -0.20515667, 0.17184737, -0.069968715, -0.24724679, -0.048521046, 0.013277072, 0.049562644, -0.05522196) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.14561136, -0.18995416, 0.18104567, 0.063063085, -0.09728072, 0.018328888, -0.17258182, 0.069259025, 0.15187183, 0.16760696, -0.14086077, 0.013297849, -0.07579904, -0.09294852, -0.24227127, -0.048749007) * go_3(pixel.xy, 1, 1);
  result += vec4f(0.31939298, 0.03303962, -0.010749771, 0.084496394);
  textureStore(conv2d_7_tf1_tex, pixel.xy, result);
}
