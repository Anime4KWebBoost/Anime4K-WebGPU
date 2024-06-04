// Layer: Anime4K-v3.2-Upscale-Denoise-CNN-x2-(VL)-Conv-4x3x3x16
// Name: conv2d5tf
// Inputs: ['conv2d_4_tf', 'conv2d_4_tf1']
// Output: conv2d_5_tf
@group(0) @binding(0) var conv2d_4_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_4_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_5_tf_tex: texture_storage_2d<rgba16float, write>;
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
  let dim_out: vec2u = textureDimensions(conv2d_5_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.13425097, -0.23487093, 0.2480183, -0.2806276, -0.041303713, 0.100773126, -0.110890545, 0.036205858, -0.331331, -0.12929262, 0.16300063, 0.3776673, -0.20316373, -0.011239426, 0.10650887, -0.027857736) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.09517376, -0.3004956, 0.05033304, -0.07464521, 0.009204248, -0.23034886, 0.30492118, -0.1215848, 0.15728685, -0.10430078, 0.04038878, 0.08034804, 0.04320418, -0.2929594, -0.018968396, 0.02542387) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.10651935, -0.2736715, 0.19267319, -0.033337504, -0.06697293, 0.028424729, 0.047814637, 0.44929537, 0.02565344, -0.253426, -0.040931404, -0.05018104, 0.032979824, -0.035349697, -0.039578713, -0.3116414) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.09176126, 0.031713437, 0.24861507, 0.31351718, 0.36284143, 0.3622709, 0.16165464, 0.07319267, -0.6303202, -0.21209712, -0.02169929, 0.037275597, -0.1295319, 0.033090707, -0.029330662, 0.054679472) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.15021572, -0.15177831, 0.1318225, 0.46864823, 0.059443284, 0.07404233, 0.22612074, 0.21105285, 0.319694, 0.09397257, 0.14277866, -0.0235649, -0.037205156, -0.40715128, -0.18572816, 0.058741573) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.122751735, -0.20926422, 0.2099333, -0.11627138, 0.04171681, 0.0669586, -0.03831368, 0.27334675, 0.0492008, 0.12854317, 0.03308622, 0.45236585, 0.03122829, 0.13853219, 0.05084764, -0.3965012) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.0019293908, -0.15562099, 0.12418126, 0.0045440597, 0.05442391, -0.15613738, 0.14828286, -0.17687118, -0.053517755, -0.33350968, -0.062314924, -0.31358472, -0.09670371, 0.043190923, 0.008150662, 0.09928506) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.06698031, -0.099411525, 0.24259582, -0.1073659, 0.06762824, 0.059605874, -0.20944163, -0.1598055, 0.32746908, -0.17759447, 0.2859796, -0.1274256, 0.30796206, -0.00791448, 0.114059694, 0.14775705) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.16291203, -0.14958477, 0.14716864, 0.2056065, -0.019337546, 0.032286238, 0.0030445335, -0.08208513, -0.14208078, 0.13601872, -0.23367858, -0.19092909, -0.20207883, -0.016950991, 0.009309007, 0.1376546) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.11093091, -0.32362202, -0.041845415, 0.029758021, -0.07261404, -0.048653398, 0.19167832, 0.09343212, 0.030472826, -0.15078579, -0.0056376588, 0.0045257527, -0.24521805, -0.10473077, 0.11163019, -0.1724187) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.08601668, 0.16612485, -0.07751539, 0.07261594, -0.19028407, 0.23896623, -0.10416726, 0.23500614, 0.1955228, 0.08699591, -0.049277775, 0.13447775, 0.19434914, -0.11481196, 0.088043146, 0.13352895) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.013221233, 0.07521129, 0.042819552, -0.11163175, 0.066080205, -0.25043094, -0.010348969, -0.013258202, 0.09444396, 0.29623637, 0.025016114, 0.050744686, -0.12219596, -0.0735393, -0.024817836, -0.06897588) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.25720942, 0.19861753, -0.18535058, 0.12190362, -0.33756095, -0.0038898317, 0.09739055, 0.41227046, -0.10030796, 0.025445882, -0.23542109, 0.08677691, 0.08140194, -0.22716106, 0.14016968, -0.0927231) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.58745646, -0.12533307, 0.30129984, 0.08898194, -0.07972344, -0.37581098, 0.06863413, -0.13185541, 0.21801205, 0.31779078, -0.3804784, -0.3200699, 0.14534226, 0.05912262, 0.07938948, -0.34869507) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.024675166, -0.067802526, 0.030065436, 0.06509131, 0.14367498, 0.022554757, 0.014991865, -0.029914752, 0.5123549, -0.012557206, -0.13014166, -0.34184244, -0.09080884, 0.13782553, -0.018931886, -0.35642785) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.37336427, -0.02705006, 0.14392053, 0.024049882, -0.024705589, 0.14556128, -0.12120506, -0.06275598, -0.1284325, 0.11409197, -0.08397436, -0.075944416, 0.056465942, 0.04016099, 0.096723564, -0.08359723) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.20243345, -0.09287934, -0.11676041, 0.005206654, -0.2879361, 0.41677123, -0.16924824, 0.22429213, 0.082279116, -0.1780833, 0.20209241, 0.12970525, -0.030272234, -0.19200714, 0.0015769673, -0.1389732) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.04211243, 0.07331798, -0.055724114, 0.04086206, -0.04635456, 0.027212424, 0.021861525, 0.12424812, 0.43009162, 0.021664696, 0.20828371, 0.11859106, 0.07390811, -0.1861182, 0.034559406, 0.18561925) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.22596797, 0.025346763, -0.056839246, 0.09137385, 0.07363095, -0.12382036, 0.08911783, -0.012355983, -0.07869761, 0.051298574, 0.00816572, -0.044984274, 0.07962154, -0.2254524, -0.007821531, -0.04936664) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.06265961, -0.17783198, 0.11678783, -0.12965304, 0.014506855, -0.17513473, -0.23593299, 0.14054537, 0.1580306, 0.31872272, -0.0042505316, -0.070422255, -0.01316396, 0.0058355615, 0.062464185, -0.06086727) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.079526044, 0.23932967, -0.1139716, 0.15888569, 0.06526993, -0.06958436, -0.04070066, -0.12081254, 0.026716579, 0.014887845, 0.0061467467, 0.127956, 0.040913627, -0.0032820841, 0.086145625, 0.22520025) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.25577608, 0.02553098, -0.14822578, -0.11907723, -0.09787419, -0.03544863, -0.08098151, -0.01305555, 0.20404844, 0.11294246, 0.10096346, 0.15795162, 0.2554626, 0.09361069, 0.001985862, -0.0051444587) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.24454486, -0.014714279, -0.2954907, -0.39995646, -0.15907967, 0.30107877, -0.34781745, 0.095281735, -0.12492393, -0.28375402, -0.16872306, 0.2531788, -0.52085644, 0.35986066, 0.07716912, 0.09565738) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.2493129, 0.06395661, -0.09491958, 0.19702488, 0.109871864, -0.051376317, 0.15404263, -0.21282886, 0.1188967, 0.07824094, -0.016752928, -0.14027214, 0.10949832, -0.27629098, 0.081909016, 0.1354018) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.18950915, -0.034574565, -0.10378051, -0.15800652, -0.06835184, -0.06987467, 0.035007782, 0.04686656, 0.054061133, 0.014833506, -0.0035361175, 0.016156103, 0.120767444, -0.10196722, 0.10668838, -0.09058739) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.032248627, 0.056413256, 0.042716432, 0.06681831, 0.047605485, -0.07629479, 0.14311917, -0.06909803, 0.10640394, 0.10701861, -0.0051839007, -0.15133362, -0.32146424, -0.039978918, -0.12280021, 0.0048507582) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.1954503, -0.09257865, 0.11023244, -0.01817947, -0.0035485283, -0.015536726, 0.0071826433, 0.042538714, -0.015454641, 0.079593316, -0.07242554, 0.031178504, 0.2319168, -0.10519467, 0.013837495, -0.040088437) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.12625901, 0.04531166, 0.038758352, -0.05790713, -0.10029771, -0.118265375, -0.23944628, 0.11955388, 0.070732996, 0.19404806, -0.019913414, 0.04609079, 0.06262817, 0.022330387, -0.029681094, 0.03719176) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.07737922, 0.0024623116, -0.037666153, -0.19271135, -0.015002153, -0.0059966356, 0.0024538909, -0.0401021, -0.18540399, -0.11140236, -0.11102473, -0.06390247, 0.016754225, 0.35000673, -0.19139731, 0.07363001) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.02150171, -0.2311761, -0.025124706, 0.16819553, -0.0013348719, 0.32091036, -0.061826598, 0.12579474, -0.036611024, -0.018266583, -0.11280143, 0.11073158, 0.050171874, -0.14706045, 0.029553955, 0.0052631944) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.19249865, -0.22854832, 0.09472751, 0.014705341, 0.059496958, 0.13427268, -0.06309558, -0.07153743, -0.31890163, -0.0657967, -0.040345218, 0.09544393, 0.07359761, 0.11245483, 0.00033233972, 0.031550154) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.24668917, -0.37181908, -0.50614715, -0.101197146, -0.1569055, 0.27734125, 0.17144768, -0.04336267, 0.03658949, 0.06747124, 0.30720958, 0.56301194, -0.11314631, -0.29258573, 0.16256689, 0.5221001) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.022761503, 0.13063031, 0.002526217, -0.03466151, -0.15225072, 0.40217137, -0.089131154, 0.19195192, -0.1379853, -0.04640692, 0.104670234, 0.12268618, -0.012009209, -0.20534724, 0.028777445, 0.22195113) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.23697586, 0.08793654, -0.10565018, 0.013993297, -0.025932996, -0.13859354, 0.14333159, -0.099132575, -0.049601994, -0.0917448, -0.0021633878, -0.009032609, -0.034750953, -0.30761167, 0.058994945, -0.19427797) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.26944515, 0.30523893, -0.17787015, 0.10827742, 0.06457236, -0.12202401, 0.15371302, 0.011699893, -0.06253491, -0.10976804, -0.37283847, -0.23996784, -0.2750512, -0.024101513, -0.094127975, -0.17462716) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.026286924, 0.06250577, 0.095423855, -0.02849258, -0.12916361, -0.10954709, -0.05825132, -0.102924265, -0.19550376, -0.11730307, 0.032346163, -0.17682706, 0.16651174, 0.031927045, -0.004800601, -0.06323844) * go_3(pixel.xy, 1, 1);
  result += vec4f(0.0095873345, 0.04959374, -0.15246227, 0.0044831373);
  textureStore(conv2d_5_tf_tex, pixel.xy, result);
}