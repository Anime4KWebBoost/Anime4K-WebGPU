// Layer: Anime4K-v4.0-Restore-CNN-(UL)-Conv-4x3x3x24
// Name: conv2d2tf1
// Inputs: ['conv2d_1_tf', 'conv2d_1_tf1', 'conv2d_1_tf2']
// Output: conv2d_2_tf1
@group(0) @binding(0) var conv2d_1_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_1_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_1_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_2_tf1_tex: texture_storage_2d<rgba16float, write>;
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
  let dim_out: vec2u = textureDimensions(conv2d_2_tf1_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.0116784945, -0.25090152, -0.17868316, 0.036498535, 0.015182224, 0.2023079, 0.011117134, 0.15237965, -0.015316299, 0.088544175, -0.06572522, -0.08057326, -0.22271864, -0.30610234, -0.12208543, -0.22944431) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.11143165, -0.077543005, -0.061455075, -0.037597977, -0.0023224957, -0.10979736, -0.034990564, -0.008420816, -0.094636045, -0.030254573, -0.06455877, -0.020989688, 0.018324712, -0.3669934, -0.350233, 0.037510827) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.104956195, 0.015602951, -0.051957965, 0.13510315, 0.010418954, -0.054195777, 0.018231759, 0.045083612, 0.09856977, -0.10220956, -0.029939203, 0.01315078, -0.29208857, 0.0017958464, 0.08760539, -0.09646556) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.046938017, 0.08242743, 0.13486576, -0.087577604, 0.1157099, 0.101392664, 0.14847688, 0.037801757, 0.018798033, -0.25906846, 0.097656235, -0.009259822, 0.10044328, 0.33434513, -0.15681681, -0.07497045) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.113606565, 0.15215175, 0.056206945, 0.03135906, -0.06457102, 0.028175417, -0.06261949, -0.015601963, -0.048961632, 0.07163545, 0.0147160115, 0.037389677, 0.092339285, 0.26372424, 0.1122662, -0.058904216) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.21457312, 0.1408831, -0.08713026, -0.06950515, 0.006483218, 0.028784987, -0.02613041, -0.06227427, 0.024932534, -0.02103815, 0.080908604, 0.078669965, 0.19956729, -0.035375793, -0.046653055, 0.07523847) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.11979529, -0.15300119, -0.06692378, 0.0982862, -0.05148871, -0.16330053, -0.045053672, 0.022939514, -0.013373179, 0.38319084, 0.11172139, -0.07044107, 0.09208871, -0.07254955, -0.03284103, 0.05421524) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.09024579, 0.022398917, -0.084611446, 0.1254619, -0.0028836168, -0.092541836, -0.06697658, -0.09709128, 0.10234711, -0.1247404, 0.031691026, 0.0087786, -0.09046125, 0.059536055, 0.2076767, 0.15046969) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.18603326, 0.0022851937, -0.10218833, 0.18102962, 0.030617537, -0.005931309, -0.06299933, -0.13356128, -0.03377612, -0.009710565, -0.10352098, -0.20960933, 0.10586698, 0.018833099, 0.16208176, -0.048466753) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.004165509, -0.112526424, -0.1481008, -0.09386717, 0.017359056, -0.16117403, 0.065114655, 0.15273894, 0.0850914, -0.6033039, -0.102531776, -0.09553129, 0.06812466, -0.17199127, 0.009345428, -0.117129266) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.19360402, -0.2172338, -0.025270093, 0.041762922, -0.06813442, -0.1315374, -0.03864256, -0.083543435, -0.14600715, -0.10248121, -0.039856248, 0.034162194, -0.06736031, 0.07872902, -0.06577812, -0.07003804) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.2596632, -0.06779467, -0.061247632, 0.09280383, 0.15697475, -0.06379218, 0.117600165, 0.19564915, -0.043823496, 0.2113048, 0.1236739, 0.05126704, 0.0036669953, 0.059754487, -0.031676155, 0.07585315) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.2750924, 0.07154958, -0.043717247, 0.11531165, 0.07236982, 0.112787254, 0.024018776, -0.0073595895, 0.037517104, -0.06963889, -0.13254988, -0.1347438, 0.08744426, 0.036659624, -0.010376286, -0.0011054546) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.21909392, -0.15014122, -0.1724268, -0.11459151, 0.07886104, -0.039391857, -0.086656936, -0.18109863, 0.13549148, 0.24947289, -0.11073447, -0.012388639, -0.06299071, 0.094953805, -0.018513478, 0.11858225) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.14019133, 0.289657, -0.13005698, 0.08418524, -0.15852125, 0.2049765, -0.18946235, -0.03330375, 0.057983503, 0.17226145, -0.16830897, -0.047264732, 0.027640691, -0.010081246, 0.14454436, 0.081710726) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.1674246, 0.28778687, 0.19290589, 0.086525135, 0.09838388, 0.1437797, 0.18871532, -0.31380877, -0.13105413, -0.15920939, -0.049839422, 0.025027066, -0.042670842, -0.07288023, -0.03385935, 0.03853164) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.26396382, -0.09383774, 0.10738164, 0.058519054, 0.01883401, 0.023963995, -0.09510717, 0.25038752, 0.004994643, 0.26613802, 0.11163109, -0.09746982, -0.08012294, 0.092731714, 0.024274494, 0.040725235) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.024282128, 0.07086445, 0.04124535, -0.04565769, -0.043728314, -0.15438943, 0.06610379, 0.07666126, -0.046235953, 0.04901646, -0.045347054, -0.0908177, 0.03715751, -0.09512116, 0.024934331, 0.019330366) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.0610446, -0.00039494174, 0.11040924, 0.09711379, -0.033694427, 0.042628422, 0.04497454, -0.08639888, -0.006714255, -0.1956921, -0.07696048, -0.1440855, -0.036684107, 0.08872227, -0.014518533, -0.081829615) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.03242377, 0.2742694, 0.15646815, 0.12491848, -0.097658925, 0.04652564, -0.20971832, -0.22238888, -0.045453016, -0.10306553, -0.14868681, -0.03697577, 0.037367497, 0.106009305, 0.0006840817, -0.06331295) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.09252423, -0.260707, 0.060529877, 0.1422387, 0.13040084, 0.060533516, -0.15988415, 0.093058884, -0.063219644, 0.16596133, -0.0858158, 0.0010563346, -0.05912638, -0.14902595, -0.0055698613, -0.19287406) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.050616026, 0.027293183, 0.1349355, 0.06430556, -0.0017233352, 0.05913591, 0.111860454, 0.05829484, -0.036098555, 0.065207146, -0.049812254, -0.14549483, -0.12424656, 0.1472102, 0.031858474, 0.017159335) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.018377563, 0.13093959, 0.15379103, 0.12314944, 0.040771928, -0.066829674, -0.05734121, 0.105038896, 0.29102528, -0.015173645, -0.004220056, -0.13141808, -0.20211789, 0.16278313, 0.09339586, -0.06485214) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.000521399, -0.3693901, 0.17483166, 0.16742888, -0.06343791, 0.042411476, 0.13772172, 0.064281724, -0.034507953, 0.03691756, 0.13490774, 0.10946845, 0.12370677, -0.03205938, -0.02645649, -0.15375873) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.023370143, 0.11848177, 0.005112462, 0.026092546, 0.034971926, -0.08103188, -0.20400497, 0.06226299, -0.060475063, 0.035214186, -0.13627078, 0.045491677, -0.07321337, -0.10956125, 0.056908336, -0.0032308386) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.076967224, 0.117254384, 0.03186256, 0.2218116, 0.05217254, -0.13943173, 0.058474854, 0.13177274, -0.019476373, 0.14138101, -0.012791203, 0.12705484, -0.013589421, -0.10622012, -0.0021916716, 0.015177393) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.061352234, -0.032728117, -0.16315818, 0.08222588, 0.013996033, 0.057500184, -0.11674498, -0.10170402, -0.03012877, -0.14447689, 0.032117244, 0.11841102, -0.0070680035, -0.15353645, 0.14097273, -0.12609388) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.1366668, 0.022588843, -0.06960645, -0.019482136, 0.008831277, 0.005849642, -0.042811397, -0.10104664, -0.21647254, -0.055100426, 0.10582604, 0.091224626, 0.16348936, -0.04480947, -0.08394584, 0.14027816) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.05215042, -0.22153285, -0.07402603, -0.1395589, -0.26351386, 0.060670085, 0.12676051, 0.0018233472, 0.09564221, -0.14353068, 0.23205271, -0.026433198, -0.04914892, 0.09260728, 0.016136972, -0.037016835) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.09228144, 0.028619789, -0.011197684, 0.043782573, 0.061469227, 0.019487167, 0.046048775, -0.060745444, -0.24178508, -0.11117579, 0.1313642, -0.20273723, 0.081280276, -0.015113924, -0.008701512, 0.038079187) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.092076614, -0.14906341, -0.013150191, -0.1445046, 0.023577487, -0.088496424, -0.03039066, -0.028063597, 0.033408202, 0.105900854, -0.098281376, 0.09988187, -0.04934366, 0.1647861, 0.15974896, 0.0484809) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.043313354, -0.079856, -0.29574707, -0.23970212, -0.23463657, -0.061711017, -0.12481534, 0.21037807, -0.010700073, 0.14672308, 0.15071099, -0.03755617, 0.072450034, 0.083081506, -0.001196162, -0.055120632) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.20737736, 0.008907195, -0.11623631, -0.038137514, 0.037122898, -0.10322798, -0.065684326, -0.010471773, -0.12765402, -0.117699586, -0.012870391, 0.071912766, -0.03260932, 0.12864828, -0.035069928, -0.08712889) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.05578123, 0.056912176, 0.01512389, -0.14807466, -0.012101421, 0.10860546, 0.034598228, 0.07160875, 0.15761101, -0.4777804, -0.24159615, -0.006523453, -0.28167522, -0.14714232, -0.1693888, -0.111417554) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.25981572, 0.1301148, -0.01769167, -0.10818973, 0.16135831, 0.024396034, -0.06722463, -0.032221332, -0.12383674, 0.038760092, 0.052030306, 0.077312715, -0.007761604, -0.12031171, 0.018808518, -0.103885494) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.048577465, 0.025990447, -0.07106119, 0.15832591, 0.019197416, 0.044232063, -0.030652093, 0.011447957, 0.18041368, -0.28076535, 0.022676598, -0.15350787, -0.1514482, -0.2362105, 0.14161605, 0.030001758) * go_3(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.2541123, 0.050012548, 0.1707829, 0.025630053, 0.078972176, 0.17645672, -0.020095231, 0.03378738, -0.1328695, 0.04409738, -0.23381121, -0.013347802, -0.049448222, 0.07035769, 0.105488785, 0.08659344) * go_4(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.10455444, 0.28242826, 0.16516706, -0.046555575, 0.13230863, 0.07463435, -0.14748469, 0.11881527, 0.2279376, 0.14795774, 0.21520549, -0.05650647, 0.11728158, 0.048864357, 0.040869843, 0.1442246) * go_4(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.21203394, -0.06565692, 0.03824069, 0.011281014, -0.033808656, 0.12499576, -0.13186213, -0.043884885, 0.017813649, 0.18413112, 0.046354674, -0.05213395, -0.051737677, -0.07141214, 0.03402196, -0.06220277) * go_4(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.05735565, -0.12864622, 0.051514987, 0.03940558, -0.08701596, -0.1948226, 0.034218855, -0.03742723, 0.15607446, 0.0327541, 0.04040029, 0.0028771486, -0.08412264, -0.016660625, -0.058885157, 0.09373861) * go_4(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.069591254, 0.018901952, 0.008289076, 0.08653302, -0.009072406, -0.11095817, 0.20987292, 0.016384758, 0.05693833, -0.118542574, 0.11310585, 0.073924355, 0.10250452, -0.043420166, -0.07558694, -0.10898524) * go_4(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.030319573, -0.3339516, -0.0689396, 0.01270701, 0.2504168, -0.08088952, 0.048351087, 0.013527536, -0.04373888, -0.27049688, 0.052563794, 0.010002367, 0.038096514, 0.0740455, -0.17847466, -0.1106183) * go_4(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.041473575, 0.036192052, -0.20958827, 0.09255741, 0.043088675, -0.07332803, -0.1566315, 0.19757885, 0.04752265, 0.14642613, 0.021630943, -0.105035484, 0.015669389, 0.015701298, 0.124771506, 0.028875854) * go_4(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.0017878636, 0.06815434, 0.03952396, 0.0008930589, 0.10052908, -0.010179957, 0.090537265, 0.26063922, -0.027913721, -0.27610707, -0.0935186, 0.103001356, -0.013015698, -0.13290603, -0.036786307, -0.120041944) * go_4(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.008112194, 0.101246096, 0.10216113, 0.012162128, 0.16638301, 0.03442679, -0.013482703, 0.22639573, -0.106342115, 0.16007386, 0.1562559, 0.031520694, -0.04781568, 0.061812893, 0.063238494, -0.112484284) * go_4(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.07636386, 0.02620731, -0.04784259, -0.0068134456, -0.098476306, -0.25026417, -0.26229498, 0.07999187, 0.08054805, -0.13999973, 0.038135037, -0.017274393, -0.07507948, -0.19170132, -0.111937724, -0.07482982) * go_5(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.102867655, 0.041831665, -0.26580745, 0.072875075, 0.122495115, -0.24738726, 0.01103763, 0.010455935, 0.10415628, 0.071636476, 0.24413374, 0.036024485, -0.14325532, -0.028743692, 0.09872556, 0.019074876) * go_5(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.08356808, 0.031134086, -0.0018714333, 0.052166995, -0.050258227, 0.015659487, -0.010771479, -0.094513185, 0.120308846, -0.16520835, 0.24742663, 0.0097768335, -0.26430902, 0.00096495246, -0.010277926, -0.03203841) * go_5(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.08886612, 0.045868922, -0.23351108, -0.11945227, -0.08114231, 0.1866038, -0.014666174, 0.10560594, 0.23003237, -0.031111564, 0.08909732, -0.004926665, 0.14808343, 0.012070922, 0.26077467, -0.13846008) * go_5(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.02067818, 0.010505095, 0.1236986, 0.004310499, -0.23058774, 0.4539795, -0.1107521, 0.2687594, -0.088774115, 0.08556259, -0.28480148, 0.16472621, 0.22381066, 0.04922506, 0.03720699, -0.019955777) * go_5(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.02878623, 0.08478639, 0.2798358, 0.08889886, 0.094446555, 0.022878725, 0.04060367, 0.008747965, 0.074154414, -0.36745515, -0.22710432, -0.17041051, 0.16977836, 0.18033457, -0.1422643, -0.06097858) * go_5(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.1882957, 0.07039768, 0.012633585, 0.0782871, 0.03383675, -0.07504364, -0.006248557, -0.0551174, 0.075581536, 0.091343425, 0.07753647, -0.0019186279, -0.016886314, 0.16758795, -0.060557626, -0.16569303) * go_5(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.13320294, -0.055567943, 0.05735829, 0.12787667, 0.04922832, -0.012577599, -0.13878204, -0.014323274, 0.06648109, -0.026210563, 0.019616883, -0.27789673, 0.051355522, -0.13060455, 0.039109703, 0.036932684) * go_5(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.10139845, -0.22758122, 0.044597298, 0.07907936, -0.025654264, -0.10633203, 0.04071873, 0.22363085, 0.12398309, 0.36964926, 0.21903247, -0.3217227, 0.030226095, 0.07867376, 0.045920413, 0.102684624) * go_5(pixel.xy, 1, 1);
  result += vec4f(-0.06939391, 0.017302405, 0.023963664, -0.011060264);
  textureStore(conv2d_2_tf1_tex, pixel.xy, result);
}