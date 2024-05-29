// Layer: Anime4K-v4.0-Restore-CNN-(UL)-Conv-4x3x3x24
// Name: conv2d2tf
// Inputs: ['conv2d_1_tf', 'conv2d_1_tf1', 'conv2d_1_tf2']
// Output: conv2d_2_tf
@group(0) @binding(0) var conv2d_1_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_1_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_1_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_2_tf_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_1_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_1(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_1_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_2(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_1_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_1_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_4(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_1_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_5(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_1_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
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
  result += mat4x4<f32>(0.15677336, 0.18937011, -0.15614599, 0.15203404, 0.098624565, 0.023782162, -0.045496363, -0.014783688, 0.07303875, -0.075132, -0.019847363, -0.088889055, -0.11558432, -0.08860719, 0.16452459, -0.018188732) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.026749048, -0.0376324, -0.0994071, -0.00093872234, 0.014682955, 0.008369919, -0.046362195, -0.21044572, -0.013911088, -0.117338374, 0.14585997, -0.11355687, 0.04094843, -0.11326298, 0.08555518, 0.076577775) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.04918652, 0.10098061, -0.097193845, 0.011482707, -0.015221698, -0.06306758, 0.09985586, -0.0011515089, -0.09592504, 0.11805872, -0.053774815, 0.093555175, 0.11237289, -0.20694147, 0.255737, 0.0149322525) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.06269537, -0.28116295, 0.1405942, 0.00218229, -0.012810465, 0.11574089, 0.060055815, -0.14248852, 0.03755387, 0.03748404, 0.04481931, 0.086039774, -0.0707909, -0.053917676, -0.009349141, -0.06623982) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.002837983, -0.0649247, -0.14890024, 0.0011222209, 0.12083026, -0.16136795, -0.04910086, 0.060653802, 0.020444075, 0.0024171378, 0.06839313, -0.21157807, -0.1678213, -0.27503422, 0.0063047423, 0.03292154) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.14229529, -0.002042125, -0.022892606, 0.08743759, 0.035437252, -0.12997083, -0.1851374, 0.33951423, -0.037205234, 0.03710803, 0.018455725, -0.052581675, -0.16795224, -0.14008522, 0.011014682, 0.07038518) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.105874196, -0.21320704, -0.08445409, 0.052140422, -0.13498448, -0.0737051, -0.027274717, -0.06932614, -0.017584193, -0.13111684, -0.049095873, 0.08269069, -0.017520722, -0.08716905, 0.25897968, -0.1412353) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.016677873, -0.024665434, -0.11711789, 0.16085778, 0.017375777, 0.15644072, 0.11040864, 0.23371918, 0.10210983, 0.0039968346, -0.007850634, -0.026810693, 0.08863099, 0.094195805, 0.10420045, -0.19671428) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.016842589, -0.15904509, -0.038347725, 0.1279937, -0.00045717083, 0.13132372, -0.13027431, -0.058826704, -0.0029436084, 0.008283112, 0.10262298, -0.05013397, -0.02922706, 0.14453132, 0.18946488, -0.0966266) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.00050655927, 0.2318558, 0.025141997, -0.058849655, 0.05127902, -0.056867033, -0.06191942, -0.028451841, 0.038166817, -0.14328304, 0.06050816, -0.12157533, 0.058556214, -0.13964172, 0.026282474, 0.03329027) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.06520211, 0.21877246, 0.017677024, -0.053116243, -0.018621214, -0.0063418522, -0.10306368, -0.07627847, -0.0035643768, -0.05579889, 0.07386847, -0.0084178485, 0.005625732, 0.10204069, -0.08501438, -0.013451101) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.067369066, 0.17327416, 0.062035594, -0.1340041, 0.10289677, -0.0868232, 0.023330351, -0.072417624, -0.12027732, 0.11592929, 0.05090798, -0.06895359, -0.04391116, 0.18919718, 0.064172365, -0.051173057) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.022913774, -0.021000199, -0.01890946, -0.079307556, -0.16522343, -0.3152304, -0.21007383, 0.01858985, 0.003152245, -0.009094366, -0.023845399, -0.06635666, 0.041294664, 0.12883614, -0.06389087, 0.005710572) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.032583844, 0.16247992, 0.06764235, -0.2240413, -0.15760922, 0.20196813, 0.13201368, 0.106440805, -0.070570394, -0.19261852, 0.28010008, -0.0048360736, -0.14080645, -0.02105434, 0.023814693, -0.13861166) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.071627796, 0.20605852, -0.2676727, -0.39509574, 0.22782667, 0.13424493, 0.08930976, 0.13314968, 0.045536704, -0.06271722, 0.01703984, 0.13352728, -0.07089344, 0.14776441, 0.11804898, -0.027061034) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.011638248, -0.016760292, 0.0593982, -0.100421235, 0.030956578, 0.13813019, 0.022237146, -0.091211095, 0.010232882, 0.0010010025, 0.16789608, -0.030847551, 0.027778173, -0.005418129, -0.16441783, 0.07580936) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.08137598, -0.008976606, 0.00023393384, -0.19671111, -0.0068668523, 0.097364455, -0.0026000517, -0.11201763, 0.047109667, -0.043774106, 0.12344897, -0.13232613, 0.026984906, -0.13614078, 0.06604853, 0.10752554) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.00047561026, 0.12248177, 0.05146918, -0.3956014, -0.12263068, 0.22729336, 0.03597535, 0.09500604, 0.06894016, 0.061162107, 0.13561803, -0.047466908, -0.0013999783, -0.068306796, -0.031758398, -0.046261873) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.12310386, -0.046108138, -0.08357388, 0.02034243, 0.0024922634, 0.029359696, -0.04329755, -0.034257423, 0.08229037, -0.11810178, -0.1079754, 0.13327998, -0.09608102, -0.26294786, -0.056677792, -0.1958781) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.007982684, 0.020604203, -0.12702446, -0.02264998, -0.034644246, -0.00025684707, 0.037761245, -0.0041598473, -0.047972955, 0.039201785, -0.016598722, -0.044081174, 0.11861525, 0.01239671, -0.12192053, 0.08865015) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.0018564354, -0.07618631, -0.09212719, 0.092056714, -0.16783315, 0.08645543, 0.24669226, -0.023520375, -0.04045034, -0.0023428998, -0.01612943, 0.014919031, 0.16028026, -0.020104371, -0.16949941, 0.18713622) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.19490379, -0.07592651, -0.200843, 0.07704469, -0.02736559, -0.054601975, -0.07240532, -0.03120134, -0.038438305, -0.12783389, -0.057655185, -0.009752765, 0.07110615, 0.033978693, -0.023724876, 0.11998657) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.18834178, 0.23053586, -0.14430945, 0.32287082, -0.32185385, -0.15306619, -0.1573794, 0.005030648, 0.06912159, 0.009656687, -0.20743106, 0.03814172, 0.104378454, -0.07221508, -0.11348173, -0.019581677) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.017694198, 0.028853144, 0.1263284, 0.1820403, -0.05317991, -0.057951134, -0.04575081, 0.05769411, -0.11807033, 0.06413361, 0.06063185, 0.19433405, 0.0032539407, 0.021501997, -0.14744627, -0.095206425) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.0463219, -0.13988416, 0.07200895, -0.13444373, -0.2447483, -0.024709478, -0.08591721, -0.09281996, -0.046719797, -0.11321926, -0.061532497, -0.0044461554, -0.03174407, -0.0056026108, 0.0056006387, 0.08828445) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.060374547, 0.062058832, -0.0390557, -0.047456663, -0.2227052, -0.03193117, -0.025358196, 0.08565629, 0.03657194, 0.13427348, -0.09266081, 0.23655434, 0.024580589, 0.01999063, -0.038653534, -0.023600115) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.0522313, 0.079263784, 0.10858985, -0.031472187, 0.072964184, -0.065342486, -0.03705779, 0.12809205, 0.09141905, 0.042783994, -0.028724866, -0.08221137, 0.13597457, 0.029334683, -0.12261823, -0.0052482346) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.018523648, -0.21706165, -0.14580801, 0.038885653, -0.030849187, -0.06640324, 0.0011639405, 0.097421385, -0.10876752, 0.14631185, 0.014579094, 0.13907033, 0.1310694, -0.1287285, 0.03553917, 0.025316685) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.22148734, 0.01278849, -0.1596892, 0.17187239, -0.04219283, -0.064526156, 0.011610614, -0.0094766095, 0.028804665, 0.16347663, -0.09309108, 0.07097134, -0.014338763, 0.051742412, 0.059907336, -0.17768253) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.06295463, -0.118564956, -0.016017804, 0.050398786, -0.07136999, 0.25657415, -0.035830878, -0.084443375, 0.12151532, -0.089734256, -0.064030536, 0.048108097, -0.01340212, -0.16572993, -0.093480445, 0.088874646) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.059600584, -0.0052702287, 0.029479535, 0.20121074, -0.07113247, 0.1561413, 0.25110185, -0.060266465, -0.34369025, 0.14528714, 0.060928173, 0.008688357, 0.034280702, -0.004796254, 0.15269074, 0.056567237) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.05273782, -0.10539872, -0.07192354, -0.083380386, 0.097994, -0.20134969, -0.5062206, 0.30952695, -0.041553877, -0.055801403, -0.037597038, -0.13394146, 0.027271803, 0.17738731, 0.3336375, -0.0035211574) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.009962762, 0.11503034, 0.027571376, -0.018972939, 0.057955634, -0.039739445, -0.0676937, 0.09477686, 0.17910802, -0.28064108, -0.12184129, -0.028407406, 0.056930028, 0.024252843, 0.08959171, -0.027298026) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.010729545, -0.048747167, 0.03880723, -0.006755044, -0.011909068, 0.008659933, 0.0800407, -0.040333465, -0.25750905, 0.29087406, 0.04864783, 0.118413374, -0.03514928, -0.17206238, 0.2095635, 0.039926212) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.0073815766, -0.030507097, 0.13367772, 0.04863103, -0.067190245, 0.039960794, -0.013012274, 0.15617093, -0.33983988, -0.05671963, 0.22061184, -0.03684452, 0.06304772, -0.08322253, 0.1117871, -0.2006011) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.119437724, -0.009319272, -0.07218167, -0.20269917, 0.10248017, -0.009564983, -0.016272334, -0.042979773, 0.11264571, -0.15697405, 0.015802475, 0.11154868, -0.073011585, -0.07225136, 0.15061282, 0.027214698) * go_3(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.03921657, -0.0154446345, -0.01855873, -0.15813923, 0.11489257, -0.10245685, 0.090572976, -0.072605945, -0.069270656, 0.05171411, 0.045471992, -0.028802622, -0.19419885, 0.18310049, 0.06882923, -0.0005851153) * go_4(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.04575681, -0.020910552, 0.051311508, -0.0004904971, 0.04239284, 0.024153773, 0.030940467, -0.107036866, -0.099398546, 0.30524835, 0.03902779, -0.05217122, 0.14969619, 0.084496036, -0.14226931, -0.07463564) * go_4(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.05297294, 0.15384737, -0.0069473814, 0.055046722, 0.11697162, 0.2424236, 0.021053674, -0.004738062, 0.014129249, -0.2909751, -0.048418947, 0.014277387, 0.053296436, -0.12475984, 0.07531274, -0.022512587) * go_4(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.04752641, 0.0006545224, -0.00589135, -0.026285272, -0.043745905, 0.24044664, 0.027723765, -0.023630425, 0.00869218, 0.028710615, -0.013863237, 0.0809765, 0.06708566, 0.013517718, 0.0012386752, -0.022743834) * go_4(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.12600644, 0.0116939265, 0.0491542, 0.06871389, -0.2096317, 0.050711762, -0.0455067, -0.11994795, -0.05030036, 0.20621927, 0.10951404, -0.05465143, 0.09614336, -0.22954291, 0.15239881, 0.04559428) * go_4(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.020940155, 0.16499193, 0.17525958, -0.051628407, -0.3068143, -0.14576466, 0.00672593, -0.1308778, 0.00072586804, -0.067010164, -0.093788825, 0.005219908, -0.020126363, -0.083521724, -0.0650657, 0.01836861) * go_4(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.072675996, 0.10010303, -0.1263988, -0.13888146, 0.13648619, 0.09535094, -0.0038582503, 0.10240531, -0.0014882578, -0.21053605, 0.16676606, -0.024605514, -0.06614438, 0.09575527, 0.116414934, -0.18538997) * go_4(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.013467567, 0.11274834, 0.07675635, -0.054812886, -0.024862224, 0.044424616, -0.12858495, -0.120611496, -0.1295857, -0.029304063, -0.06629468, -0.22211547, 0.12577437, -0.015624684, -0.10307795, 0.09404936) * go_4(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.11430831, 0.11486887, -0.06219608, -0.018371167, 0.091516815, 0.0041821343, -0.043150745, -0.11775014, 0.07794832, -0.01944774, -0.031383686, 0.077408955, -0.124252975, 0.062118705, 0.009199536, 0.06538969) * go_4(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.22154011, -0.098727904, -0.08378975, -0.04167056, 0.019208338, -0.02245709, 0.13298267, -0.104098395, 0.053671844, 0.12845491, -0.003814564, 0.0665341, -0.07084713, 0.26803628, 0.09472736, 0.16825765) * go_5(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.21349828, -0.14917591, 0.12592548, -0.12721801, 0.086323306, -0.15409322, 0.07365807, 0.00620922, -0.0280901, 0.0957864, 0.10711525, 0.1165179, -0.08383744, 0.14757137, 0.024865197, -0.17536579) * go_5(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.044920437, -0.00016428503, 0.035227478, -0.026525848, -0.17628764, 0.044141084, 0.025941433, 0.18698089, 0.0069334265, 0.097304195, -0.08945912, -0.007168394, -0.054236215, -0.2604089, -0.14738831, -0.074961744) * go_5(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.043119818, -0.012245711, 0.030121213, -0.0032237277, -0.033457555, 0.052158665, 0.046546284, -0.0047129868, -0.08133807, 0.037123546, 0.08634659, 0.120436855, -0.02609943, 0.11368193, -0.06750012, 0.0007624448) * go_5(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.20511842, 0.1999221, 0.099944666, -0.14691514, 0.012555328, -0.22190604, 0.12456348, 0.05391116, 0.031001683, -0.33920962, 0.13921735, 0.101068705, 0.28788915, 0.13809694, -0.10081831, -0.05679542) * go_5(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.019705083, 0.08693377, 0.06884471, 0.032386675, 0.10256849, 0.22142375, 0.07398588, 0.03336761, 0.19134827, 0.12654771, -0.39008364, -0.29602188, -0.04149512, 0.018968705, 0.080247656, 0.0480814) * go_5(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.09539717, -0.10946926, -0.048939522, 0.030059233, -0.17243776, 0.021580435, 0.15642153, -0.10282692, -0.020257011, 0.060849674, 0.040640093, 0.05628088, -0.11358645, -0.16440971, 0.1787329, -0.02685428) * go_5(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.14034219, 0.21827984, -0.16170599, 0.03681219, -0.051667843, 0.019152328, 0.033406716, -0.025032328, 0.13413768, -0.09349573, 0.10037219, -0.0105256345, -0.17372406, -0.07619186, 0.068273135, 0.088958755) * go_5(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.015460073, -0.04781314, -0.008159705, 0.117226824, -0.20293492, 0.019126927, 0.1074034, -0.10307512, 0.1356002, 0.108166546, -0.1275016, -0.023100886, -0.09334954, -0.14509954, 0.1668647, 0.13371155) * go_5(pixel.xy, 1, 1);
  result += vec4f(0.004647682, -0.04675001, -0.041206088, 0.07870823);
  textureStore(conv2d_2_tf_tex, pixel.xy, result);
}