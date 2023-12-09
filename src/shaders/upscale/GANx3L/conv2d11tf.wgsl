// Layer: Anime4K-v4.1-Upscale-GAN-x3-(L)-Conv-4x3x3x24
// Name: conv2d11tf
// Inputs: ['conv2d_9_tf', 'conv2d_9_tf1', 'conv2d_9_tf2']
// Output: conv2d_11_tf
@group(0) @binding(0) var conv2d_9_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_9_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_9_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_11_tf_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_9_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_1(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_9_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_2(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_9_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_9_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_4(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_9_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_5(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_9_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_11_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.47819614, -0.0145807015, -0.14235033, -0.06459091, 0.051679384, -0.24727756, 0.16531977, 0.23668537, -0.044610042, -0.03163047, -0.024059737, 0.21251118, -0.02900184, -0.11218355, 0.085020125, -0.08413842) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.083133794, 0.08406656, 0.20940667, 0.21155417, -0.12855776, -0.061865382, 0.2486309, 0.13191856, -0.028019775, 0.11366226, 0.13459402, 0.18391807, -0.09688631, 0.011591497, -0.2466206, -0.02237942) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.0037495645, 0.019915475, 0.07625364, 0.07119373, 0.18423386, 0.07686032, -0.013689673, -0.11513128, -0.12845139, 0.273121, 0.077030145, 0.13114497, 0.04543684, 0.09308563, 0.19357756, 0.24509594) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.03458686, -0.42040396, -0.104271114, 0.1918791, -0.25708342, 0.03583752, 0.2589993, -0.050576445, 0.0043004244, 0.19324894, 0.080590524, 0.14723596, 0.041485116, 0.13033897, 0.28028202, -0.058933) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.09480703, -0.13742156, -0.30406207, -0.03582789, 0.12367775, 0.064455606, -0.061555192, 0.06453598, 0.0917327, 0.04270991, 0.21958654, 0.13570474, -0.12048236, -0.024039079, 0.11226094, 0.050419748) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.02062305, -0.10862912, 0.12883052, 0.18951532, -0.03850205, 0.11498875, 0.16137509, 0.009759631, -0.09211893, 0.0708826, 0.15651149, 0.19246778, 0.056577608, -0.0871854, 0.090261444, -0.019027064) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.2780629, -0.054287303, -0.13351089, 0.021154758, -0.12753387, 0.031183334, 0.29430825, -0.06750467, -0.044209514, -0.042159047, -0.12532234, 0.006239919, -0.1961551, 0.099502094, 0.11470277, 0.10832906) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.2063426, -0.24898255, -0.28594568, 0.15958025, 0.03609107, 0.06394462, 0.022269696, -0.058725126, -0.104284525, 0.16744058, -0.14197277, -0.0051877275, -0.14164501, 0.021519974, -0.12835859, -0.12090698) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.45966595, 0.015630098, -0.3182287, 0.10282032, 0.14680836, -0.23460387, 0.15356645, 0.017346757, 0.05120857, -0.035891768, -0.092325106, 0.005394217, -0.09328155, -0.012819384, 0.14028293, 0.012717323) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.06736054, -0.0044496846, -0.061849196, -0.04067691, -0.06897966, 0.12449442, -0.2508966, -0.090206414, -0.0938398, 0.013633642, 0.1409954, -0.08719504, -0.06788997, 0.098299906, 0.06095718, -0.071988545) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.036788728, 0.0037640312, 0.0037646547, -0.021026969, 0.09899778, -0.054118365, 0.08308994, 0.10520542, -0.2592658, 0.113168575, -0.15985844, -0.15588784, -0.114530176, 0.0118468655, -0.08904175, -0.106764145) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.027948795, 0.004584627, -0.03517112, -0.0007581547, -0.025537577, -0.035759352, 0.0973176, 0.03644148, -0.16327894, -0.12705119, -0.028998915, 0.123633325, -0.19453679, 0.113648765, 0.012692621, 0.057508085) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.010877041, -0.03980561, 0.013339347, 0.061969575, 0.2810196, 0.058558464, -0.1776418, 0.16630451, 0.05817873, 0.07262613, -0.03700459, -0.04399585, -0.16587572, 0.08260915, -0.009857085, 0.04391152) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.13224548, -0.074267186, 0.03054752, -0.07024831, 0.074185595, -0.02313642, 0.065747924, -0.004960654, 0.14500527, 0.04731656, -0.117002204, -0.08217113, -0.07336124, -0.084052, 0.12326484, 0.09011222) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.16047195, 0.076803066, -0.2786948, 0.1176941, -0.0131406775, 0.009936233, 0.1374073, -0.09565009, 0.10070214, 0.11528786, -0.0730813, -0.13431457, -0.21621323, -0.013119195, -0.18385343, -0.058667593) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.0040132185, 0.134705, -0.011815555, -0.094924495, -0.05727005, 0.0950522, 0.04084158, 0.016365912, -0.02917897, -0.03862751, 0.012003192, 0.03835569, -0.096041076, 0.004406702, -0.10389978, -0.0009610953) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.10157398, -0.10319637, -0.012073916, -0.19039184, -0.02369365, -0.021698838, 0.015538155, -0.051231697, 0.041044284, -0.02691978, -0.1713024, -0.12904704, -0.03471921, 0.037977315, 0.064845525, 0.1264632) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.08406344, 0.044064984, 0.056877784, -0.13283873, -0.0058603142, 0.075482026, -0.09246969, -0.065718174, -0.025745329, 0.015633717, -0.06059284, 0.08149079, -0.022848418, 0.061127402, 0.047879003, 0.04544503) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.21875143, 0.053516608, 0.04243476, -0.08509983, 0.406294, -0.060116358, -0.13793904, -0.1559247, -0.017128536, 0.021633752, 0.08865264, -0.032922007, 0.08250139, -0.17353764, -0.16137601, 0.12943612) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.27127337, -0.057137657, 0.005031509, 0.10027777, 0.20500132, 0.0073007634, -0.09760265, -0.2428409, -0.16160156, 0.32289484, -0.096351616, -0.15562637, -0.24892123, 0.13368145, 0.31498823, 0.09549184) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.01444343, 0.07115736, -0.17920075, -0.024846312, 0.057884447, 0.14358939, 0.043788955, -0.013016863, 0.087220736, -0.0060180086, 0.19609165, -0.025888423, -0.06294847, 0.03406598, -0.04250465, -0.04808649) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.02662509, 0.24295834, -0.07612864, -0.20615683, 0.16377121, -0.05186765, -0.1750536, -0.04726876, 0.29443663, 0.0983683, -0.18610948, -0.1949004, -0.1446201, 0.11045659, 0.013536009, 0.18919495) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.080005094, -0.29404542, 0.14548069, 0.013500291, -0.011395713, -0.048017073, -0.053436857, -0.13627477, 0.041908856, -0.30820572, 0.17044339, 0.22999896, -0.32405153, 0.12114645, -0.080108374, -0.06520369) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.062350888, 0.170049, 0.04211445, 0.12288375, 0.010835714, -0.17722476, -0.18930283, 0.11607083, -0.054421842, -0.004191082, 0.14655825, -0.1229237, -0.058039404, 0.09008831, -0.017603457, 0.027497675) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.24208143, 0.04073837, -0.014191606, -0.069054805, 0.33024073, 0.25458166, -0.062864356, 0.028975246, 0.17692459, 0.22093695, -0.17666881, -0.03709188, -0.2001521, -0.06491504, 0.199202, 0.08666711) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.053933676, -0.058177974, 0.006558046, -0.018798346, -0.05610966, 0.21288905, -0.06513558, -0.012686734, 0.11635233, -0.039428618, 0.21562201, -0.07206132, 0.065123, -0.056875434, 0.08877115, -0.10216625) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.03294463, 0.011720216, 0.056083966, -0.05530083, -0.16838011, -0.0026962461, -0.17402422, -0.009680605, -0.0064969915, 0.14410603, 0.090527765, 0.048180934, -0.06482277, -0.17573984, 0.36281663, 0.14240478) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.026252843, 0.01621395, -0.03018171, 0.20843759, -0.05987382, -0.13891932, 0.008612968, -0.03674587, 0.055803657, -0.020272622, -0.12338887, -0.21429133, -0.026188683, -0.08283737, -0.07952566, 0.11333926) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.03251504, -0.04554576, 0.012727539, 0.06115098, -0.23113467, -0.21784578, 0.10390341, -0.028863542, 0.1405748, -0.092941806, 0.04094931, 0.26037696, 0.014778488, -0.0012763811, 0.120576814, 0.017626097) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.18005073, 0.08914073, -0.19792715, 0.07666369, -0.040389247, 0.06043132, -0.068735644, 0.006061951, -0.09742132, -0.015570641, -0.05810036, -0.06305046, 0.06286483, -0.1669205, -0.15426171, 0.046022687) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.045976873, 0.028456753, 0.037186757, 0.05231241, -0.12909305, -0.16277504, -0.0035813665, -0.06294949, -0.04205357, -0.15816367, -0.021810539, -0.108161986, -0.08399507, -0.12965044, -0.00611913, -0.029711436) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.2537032, -0.018604688, 0.16584206, -0.20883793, -0.10245589, -0.06570063, -0.16321684, 0.02899805, -0.1427425, 0.20915249, -0.1761724, -0.09594, -0.10995607, -0.11155546, 0.037878104, 0.028106442) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.1628865, -0.17466225, -0.14372015, 0.05667306, 0.10472602, -0.018716356, 0.087850116, -0.056246866, 0.083403885, -0.082255535, -0.10299376, -0.1840543, -0.35220358, -0.059505656, -0.21391232, 0.16591822) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.040541083, -0.1146205, -0.021495365, -0.033008795, 0.007970957, 0.007984478, 0.02606323, 0.012668774, 0.12771203, -0.09947922, -0.14149466, -0.1890857, -0.14682727, 0.033072542, -0.11833484, -0.038956877) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.14274059, 0.08827524, 0.011712704, 0.10902492, 0.060481314, 0.003578728, 0.029129535, 0.08889746, -0.09685511, -0.095264345, -0.13920794, -0.11014531, -0.05436568, 0.060371455, 0.07251505, 0.20626338) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.07604635, -0.035359483, 0.010230144, 0.030468917, -0.008423673, 0.0273416, -0.10538517, 0.10806335, 0.03605524, -0.082360476, -0.06390322, -0.19094782, -0.10980772, 0.13070256, -0.009116851, 0.094997086) * go_3(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.06696349, 0.02884076, -0.21400648, 0.10645195, -0.15960447, 0.07844191, 0.09057932, -0.022310507, -0.20641366, -0.20897295, 0.05159085, -0.042257026, 0.16398512, -0.22846761, -0.033591952, 0.3359712) * go_4(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.024236226, -0.13937415, 0.29392216, 0.075087205, 0.07763272, 0.27571923, -0.28625518, -0.37574485, -0.0041614594, 0.051519327, -0.1727601, -0.002199689, -0.32436445, 0.059740037, 0.006543187, 0.11488307) * go_4(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.025740145, 0.10688955, 0.3432225, 0.04467087, 0.033870216, 0.16714002, 0.20819634, -0.11762629, 0.19059974, 0.0661928, 0.022394795, -0.14459209, -0.16684553, 0.08020461, -0.37147745, 0.04065124) * go_4(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.006134667, -0.0031798254, -0.101459935, 0.15463492, 0.039860703, 0.077067874, 0.17671694, -0.06597644, -0.12203232, -0.058787927, 0.008942991, 0.0570718, -0.043793175, -0.06388724, 0.0247615, -0.09814649) * go_4(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.009333359, -0.10666345, 0.19417302, -0.08021104, 0.071850464, 0.18651992, 0.1487532, 0.03132098, -0.21202543, 0.02972519, 0.028346745, 0.17178747, -0.24139602, -0.18386513, -0.03009887, -0.17363264) * go_4(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.006349671, -0.0199598, 0.14889078, -0.14921328, -0.08713048, 0.14722322, 0.041971955, -0.019181551, 0.07069949, -0.12362262, 0.08554868, 0.16224997, -0.11218193, 0.3132043, -0.18114331, -0.104602315) * go_4(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.047690846, -0.26872492, 0.2183612, 0.19340567, -0.06084255, 0.04798949, 0.19492827, 0.14699973, -0.07016259, 0.14654481, -0.06714773, 0.07936776, 0.073397264, -0.10646918, -0.13238135, 0.07208961) * go_4(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.07382223, -0.044347115, -0.032497067, -0.02002406, 0.18200569, -0.09839878, -0.0027670355, -0.032592446, -0.05297432, 0.11200702, -0.019955616, 0.112369545, -0.2748285, -0.139697, -0.26332188, -0.303972) * go_4(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.23713836, -0.003925555, 0.16436225, 0.15221255, 0.1077621, -0.027760457, 0.0059113647, -0.11066059, -0.0980858, 0.011830199, 0.040253483, 0.06447465, -0.0827841, 0.04048125, 0.04551489, -0.12471252) * go_4(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.010833946, -0.058524415, -0.19618602, -0.11400699, -0.088038966, -0.08249501, 0.025192872, -0.04508469, -0.017629553, 0.10654934, 0.007814974, 0.041299284, 0.054442752, 0.14059617, 0.09760092, -0.060198124) * go_5(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.16173755, 0.14454803, -0.036523324, 0.016083395, -0.04597214, 0.019925527, 0.10551423, 0.07915449, -0.09191786, 0.040694106, 0.079085656, 0.04860138, -0.00920608, 0.015785221, 0.08149557, -0.070038155) * go_5(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.09396598, -0.27780503, 0.057351794, 0.17856738, 0.06403465, -0.019479418, 0.13132542, 0.09766009, -0.13038878, 0.106342256, 0.19923963, -0.107940085, -0.11207263, 0.07427199, 0.122141175, -0.17083314) * go_5(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.0129763335, 0.029884486, -0.1591489, 0.05743726, -0.10154112, -0.05951815, 0.038755298, 0.31987077, 0.041023176, 0.15760195, 0.020455543, 0.117823385, 0.008611401, 0.10392111, -0.029049959, -0.00561999) * go_5(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.11115114, 0.13910228, -0.15370879, 0.14353245, -0.106912665, 0.16457058, -0.0007093892, -0.16065751, 0.12172275, -0.0071658283, -0.13790236, -0.05790294, 0.0258849, 0.047155324, 0.028826248, 0.077854194) * go_5(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.04222945, 0.016645031, -0.22052032, -0.108474314, -0.037527397, 0.1508435, 0.13960642, 0.051745985, 0.17182018, -0.0071819094, 0.13896792, 0.12522686, 0.1307583, 0.09315921, 0.031736225, -0.24318463) * go_5(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.12233872, 0.16193391, -0.045825243, -0.021991767, -0.06857775, 0.019997157, 0.26207915, 0.017674582, 0.14816906, -0.011254348, 0.11932189, -0.06385669, -0.08113471, 0.13287768, -0.008416972, -0.039866585) * go_5(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.15459004, -0.029546147, -0.20761466, -0.12011381, -0.09814943, -0.12983616, 0.0019625768, 0.086729765, 0.22380745, 0.112912305, -0.073421806, -0.061414655, -0.00015528004, -0.10514693, 0.0449276, 0.1197672) * go_5(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.031599533, -0.0699447, 0.10802751, -0.011152619, 0.08078543, 0.10828058, 0.10941837, -0.07911565, 0.16324246, -0.034676578, 0.04017893, 0.01809475, -0.0054880627, 0.027349245, -0.041267768, 0.041391887) * go_5(pixel.xy, 1, 1);
  result += vec4f(-0.022754392, 0.009821446, 0.06426939, -0.052443504);
  textureStore(conv2d_11_tf_tex, pixel.xy, result);
}
