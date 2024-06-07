// Layer: Anime4K-v4.0-Restore-CNN-(VL)-Conv-4x3x3x16
// Name: conv2d5tf1
// Inputs: ['conv2d_4_tf', 'conv2d_4_tf1']
// Output: conv2d_5_tf1
@group(0) @binding(0) var conv2d_4_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_4_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_5_tf1_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_4_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_1(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_4_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_2(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_4_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_4_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_5_tf1_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(0.047881734, -0.09396414, -0.2839081, 0.3140853, 0.052613556, 0.09940423, 0.23960467, -0.022228222, -0.12065009, 0.07898222, 0.08657881, 0.010852739, -0.050450284, 0.01683982, 0.031813968, 0.053060856) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.10252411, -0.03116448, -0.30114275, -0.0316799, -0.017501019, -0.03006003, -0.2095696, 0.10134927, -0.3901916, -0.15335023, -0.11955071, 0.1337449, 0.101239376, -0.25044814, 0.2128469, 0.018979514) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.13392173, 0.052036732, 0.1682114, -0.026263753, 0.027221246, -0.15121374, 0.13723798, 0.08950682, -0.1182108, -0.07294226, 0.023392374, 0.052329235, -0.05632852, -0.07036173, 0.06872573, 0.05238042) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.18112028, 0.18242362, -0.06812871, 0.032463413, 0.124638766, -0.26765212, -0.07678663, 0.33806562, 0.09674393, 0.15574542, 0.23634006, -0.02873782, -0.1626769, -0.14760062, -0.007274849, 0.09866139) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.10726673, -0.10925056, 0.19967109, -0.19936769, 0.15942842, -0.14870064, 0.15493345, -0.08489036, -0.49053356, -0.17321263, 0.28426084, 0.18721215, -0.09898434, -0.2751838, -0.11833524, 0.028445128) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.11788817, -0.23724948, -0.046072144, 0.035621114, 0.04527003, -0.0073492974, 0.11097195, 0.06806836, 0.04814677, -0.1408476, -0.1325629, 0.00929532, -0.16699041, -0.03034791, 0.08320368, -0.15429299) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.2729515, 0.008244692, -0.17441982, -0.39026466, 0.17381759, 0.31194404, 0.055934936, 0.20744409, 0.20119062, 0.0734271, 0.0796807, 0.0031037466, -0.0016392237, 0.033733975, 0.07149338, 0.042083208) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.07985744, 0.10945015, 0.018472541, 0.1397503, 0.2005682, 0.42641, 0.23022486, -0.2916921, 0.028285174, -0.31885162, -0.27070364, -0.10390779, 0.0751492, 0.12752363, -0.2279459, 0.08998453) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.18450491, -0.140783, -0.008006845, 0.09029298, 0.12536179, 0.26949662, 0.09491545, 0.063907005, 0.11212244, 0.09778506, -0.1835966, -0.053119674, 0.0072294096, 0.25018227, 0.010868525, -0.22721334) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.028011927, -0.20073172, 0.5976166, -0.19494139, 0.17958745, -0.03838646, 0.058325976, -0.29409218, -0.12793432, 0.03245129, 0.35662368, -0.05048354, -0.13368197, -0.06151968, -0.012714591, -0.1763054) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.18468465, 0.31682113, 0.12818255, -0.117110476, 0.13709468, -0.10034022, -0.07994527, -0.1259309, 0.04067299, -0.1147398, 0.28361055, 0.27916273, 0.03696692, 0.16829546, 0.27819383, 0.08305029) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.28920117, -0.033877946, 0.01586206, 0.04681198, 0.024248574, -0.045777842, -0.03342128, 0.07525412, -0.063377544, -0.016737273, 0.11235511, -0.04325238, -0.24170023, -0.09993599, -0.03205371, 0.14339828) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.008357902, -0.11038377, 0.03709221, 0.26775306, 0.07963845, -0.25377446, -0.17630441, -0.10966474, 0.057311732, -0.083327, 0.044497233, 0.06903858, -0.26531395, -0.103399664, -0.14806591, 0.269314) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.05450808, -0.041993964, -0.07217651, 0.034468375, 0.2117634, 0.0075620585, 0.05825411, -0.2252478, -0.0527787, 0.049732126, -0.032040413, -0.09361454, 0.29585132, 0.018413153, 0.18384546, -0.024226356) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.031109914, 0.19351351, 0.07405522, -0.06313074, -0.09983541, -0.011495182, 0.11749038, -0.16775608, 0.2790974, -0.09338754, 0.07913264, 0.103792936, -0.18679164, -0.15639925, 0.112943865, 0.07930375) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.004106195, -0.036833283, 0.12908752, 0.12869535, -0.02472107, 0.17561707, -0.025890926, -0.18789047, 0.096218705, -0.16306408, -0.02198454, -0.010134957, -0.09710009, 0.002062143, -0.046785697, 0.0029441968) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.19648251, -0.015663045, -0.0730215, 0.028611008, 0.13529862, -0.015256192, -0.04119306, -0.24628192, 0.02601027, -0.21184283, -0.1962902, 0.09109358, -0.06792383, 0.092336476, 0.12215351, -0.08596062) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.17530201, -0.0351919, -0.31872514, -0.13933206, -0.07000922, -0.049807087, 0.0010997375, -0.033573963, 0.07442056, -0.33290103, -0.40381998, 0.09435, -0.3280128, -0.09953127, -0.11283648, 0.20685865) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.052573867, -0.035328753, -0.11132943, -0.17515652, 0.05021051, 0.058642425, -0.046640664, 0.0799107, -0.027398815, -0.33619994, -0.22135767, 0.07894002, -0.14941697, -0.0940996, -0.11655085, 0.049795926) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.039301276, 0.041062318, 0.20312686, -0.009338705, 0.013706282, -0.0245852, 0.03458311, 0.09601228, -0.18203016, -0.012260314, 0.17984508, -0.056576703, -0.102844186, 0.24047872, 0.05307189, 0.16066082) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.1478775, 0.0046362123, 0.05459521, 0.07162838, -0.01896149, 0.23700175, -0.14174299, 0.06988599, -0.32545477, -0.08065096, -0.061227743, -0.0010796773, 0.094327345, -0.20760082, -0.19523263, 0.19859222) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.049676366, -0.10381536, 0.02546116, -0.13127093, 0.10954914, 0.0048147943, 0.06962328, -0.30456528, -0.11956627, 0.0150488885, -0.10711722, 0.1684613, -0.1939089, -0.10577047, -0.11980919, -0.036988296) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.054795764, 0.09491116, -0.08494948, 0.059765853, 0.0131597435, 0.20786162, 0.11999637, 0.024381055, 0.22830428, 0.027053319, -0.011646274, -0.12145409, -0.07899559, -0.012688263, 0.10684157, 0.3824219) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.23994572, -0.0031532666, -0.0050638164, 0.14236279, 0.05690383, -0.06259682, 0.052624144, 0.20461404, -0.19230312, -0.11072268, 0.013023965, 0.08931543, -0.21997221, 0.11760443, -0.40943825, 0.28656834) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.06606179, 0.26007771, 0.033754125, 0.119690455, 0.024669139, -0.06752839, 0.12688096, -0.0063201943, -0.17123021, 0.07548857, -0.14213699, 0.034093797, -0.15632647, -0.123243414, -0.42634043, 0.1715022) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.046503466, 0.13876389, 0.17973013, -0.25938338, -0.18824704, -0.11876702, 0.31065792, -0.041042212, -0.061369427, 0.2057992, 0.17295738, 0.3836555, -0.21109799, -0.10167118, 0.16577047, 0.113483034) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.24534856, -0.014482421, 0.22515748, -0.12773542, 0.12794174, -0.02528619, 0.41710484, 0.09154934, -0.17805946, -0.25428918, 0.07294183, 0.047079418, -0.30949152, -0.08919157, 0.17888431, 0.17706038) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.1741826, 0.046225294, -0.10761791, 0.2619953, 0.007373745, 0.05104337, -0.22309966, 0.34529984, -0.034363825, -0.022187237, -0.08609555, 0.16842419, 0.28136057, 0.17843607, -0.11307746, -0.05668021) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.12310616, -0.29661375, -0.10581025, -0.049584012, 0.19651765, 0.08436489, -0.14533581, -0.029874112, -0.15422897, -0.062741704, -0.22694711, -0.15547274, -0.15181333, 0.0286061, 0.022438493, -0.062447168) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.3497046, -0.09455009, 0.060618952, -0.2134236, 0.054515295, 0.07451165, -0.09267233, -0.010513333, 0.13842636, 0.11563433, -0.054750167, 0.050432, 0.1514256, 0.04284002, -0.2095581, 0.07907657) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.11745651, -0.04717057, 0.085377194, -0.065956995, 0.07280491, 0.2730059, 0.11088276, 0.2437957, 0.14018989, 0.1164107, -0.09516929, 0.0022427947, 0.111544006, -0.0680495, 0.09324579, -0.12482022) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.07995795, -0.03387884, 0.019846136, 0.10231208, -0.07017192, 0.18659039, 0.035161644, 0.101182766, -0.14901665, 0.21307294, 0.063894205, -0.27546507, -0.24792959, -0.067731075, 0.13146006, -0.19333683) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.034206454, 0.1472648, -0.07406727, 0.014654025, 0.18703444, 0.1319857, -0.10610886, 0.08427947, -0.017536618, -0.06487879, -0.12095286, -0.050414838, 0.03260879, 0.1558894, -0.031887084, 0.11840288) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.114811294, -0.14574333, -0.09392587, 0.042283528, 0.08919092, 0.18259068, 0.0980717, 0.21024778, -0.1280008, -0.027260462, -0.1129027, 0.18722472, 0.13733985, 0.047153983, 0.030871978, 0.1998385) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.06783575, 0.004612595, 0.1153467, -0.11531557, -0.048889533, 0.07673577, -0.02041786, 0.22744459, -0.13092506, 0.13484807, 0.40003043, -0.053706612, -0.16985156, -0.04791236, -0.052443005, -0.08363625) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.18187882, 0.017893985, 0.17856054, 0.005413129, 0.014147176, 0.15102178, 0.12436294, -0.02176765, -0.16727823, -0.0364111, 0.17074408, 0.12899421, 0.31984514, -0.0072070034, 0.031895883, -0.1991405) * go_3(pixel.xy, 1, 1);
  result += vec4f(-0.011865144, 0.11717201, -0.13823777, -0.059450272);
  textureStore(conv2d_5_tf1_tex, pixel.xy, result);
}
