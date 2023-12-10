// Layer: Anime4K-v3.2-Upscale-CNN-x2-(UL)-Conv-4x3x3x24
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
  result += mat4x4<f32>(0.07575434, -0.040653445, 0.007225497, -0.043918904, 0.119574465, 0.011380923, 0.16722572, -0.013146596, 0.024970967, -0.028010864, 0.007539211, 0.009367542, 0.0053172954, 0.003149008, -0.06781401, 0.022353206) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.24854389, -0.013649374, -0.17061508, 0.04292164, -0.005861008, 0.03951371, -0.0047152913, 0.015763909, 0.076025434, 0.0020614571, 0.035092413, -0.15013616, 0.07448282, -0.06402445, 0.2066371, -0.15285529) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.020919988, -0.023931077, -0.0026673493, 0.08726077, 0.08519901, 0.038367324, 0.012967744, -0.014597907, 0.03273228, 0.03425027, 0.11657879, -0.10561241, -0.10698567, 0.08750399, -0.029988581, 0.055827994) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.05367477, -0.078411445, 0.107682705, -0.05179454, -0.101149, -0.016185397, 0.2755446, -0.2408976, 0.015464319, 0.042289484, 0.1908763, -0.15750426, -0.06516995, 0.072354965, 0.06715771, 0.26282984) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.062333807, 0.06013844, -0.040104974, -0.33716065, 0.06652305, 0.3144661, -0.08150677, 0.17847258, 0.025293501, 0.085246235, 0.1500923, -0.028793348, -0.008922378, -0.023754073, -0.15999489, -0.10776248) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.013679765, -0.0068315254, -0.0063317283, 0.04092541, -0.024292475, -0.08490433, 0.052840695, -0.056294404, 0.1751175, -0.03373209, 0.031306665, -0.14522974, -0.1688535, 0.09737534, -0.06616412, 0.2202574) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.019336289, 0.054557003, -0.08372398, 0.013064762, 0.014936632, 0.031539556, 0.046100393, -0.14767817, -0.03333652, 0.020777406, 0.070448704, -0.009688919, -0.090416685, -0.025141802, 0.030440604, -0.11709335) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.019530639, -0.017071763, 0.16344751, -0.09003354, 0.049499974, 0.066197686, 0.17537111, -0.10965739, 0.027256027, -0.04720143, 0.03044248, -0.10484599, -0.051237702, 0.038487937, -0.072922744, 0.023582684) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.06786746, 0.08613347, 0.058307048, -0.02357511, 0.14101249, 0.05510837, 0.082233034, -0.011995293, 0.022474831, 0.010892606, -0.01492494, -0.11511058, 0.055903982, 0.02207162, -0.098973624, 0.040012434) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.064766414, -0.051125515, 0.03402284, 0.057396293, -0.117072344, -0.019163232, 0.037863698, -0.052369513, -0.0061165625, 0.061819155, 0.028041245, -0.09490486, 0.1093347, -0.00664147, -0.08768312, 0.0070511065) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.29905078, -0.09995567, -0.08120736, -0.03129106, -0.098326, 0.011130474, 0.036129285, 0.17871866, -0.084457494, -0.012659195, -0.02691152, 0.14104512, -0.21426772, -0.07243515, 0.11658849, -0.002852482) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.17713405, 0.06941797, -0.062077515, -0.030658305, 0.08999236, -0.06921259, -0.095924884, 0.07375469, 0.11921843, 0.03554809, 0.058501836, 0.061609276, 0.21009676, 0.0685857, 0.04634768, -0.011610212) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.23054165, -0.039558277, -0.08045203, 0.06898775, -0.029158285, -0.037750367, -0.24264999, 0.05567059, 0.033564106, 0.03715445, 0.21824217, -0.043530416, 0.14731471, -0.07235384, 0.089611664, 0.026031008) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.098505996, 0.076161414, -0.09749997, 0.08872072, -0.12537481, 0.004141966, -0.067040585, -0.39046898, 0.055973317, 0.042723298, -0.13534929, -0.04335705, -0.09676344, -0.030532371, -0.07493259, -0.204519) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.092057995, 0.56036115, 0.035873197, 0.057625197, -0.027210712, 0.06758173, 0.03869267, 0.058112122, -0.17431425, 0.06694562, -0.023299959, -0.036024995, -0.08311603, -0.13028675, 0.030961594, -0.09352405) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.04974338, -0.018803855, 0.10142671, -0.011776798, 0.06506589, -0.028476488, -0.019591449, -0.009582206, -0.039581254, 0.08912891, 0.15407297, -0.1111981, 0.018480325, -0.020779947, 0.031039927, -0.028463457) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.03755804, -0.03275704, 0.05746246, -0.20568763, -0.043458223, 0.101914786, 0.09678074, 0.020130953, 0.14230555, -0.059717167, 0.16945612, -0.037695907, 0.005530407, 0.03836577, -0.13570379, 0.07553547) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.1345541, -0.060120266, 0.053173084, -0.049932115, -0.064288326, -0.04958125, -0.0018103139, -0.006733389, 0.09001299, -0.04224858, -0.029498586, 0.18575308, -0.04561738, -0.07796082, -0.053623714, 0.10945586) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.038186714, -0.012922114, -0.019606752, 0.10890265, -0.026697423, -0.031865556, -0.15932839, -0.026640827, -0.04705261, 0.037437834, 0.10179085, -0.0104858745, 0.07226553, 0.086646274, 0.101131245, -0.013259711) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.023795605, -0.03550652, -0.107414104, 0.24193193, -0.14496972, -0.0053217285, 0.07148466, 0.12643136, -0.028414654, -0.022065196, 0.22527543, 0.03852106, -0.06697379, 0.022275146, -0.04764777, 0.120496206) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.23702599, 0.0025132557, -0.09258897, 0.19450943, 0.16891776, -0.13970126, -0.011847789, -0.11160886, -0.027799755, 0.044170912, -0.01895572, -0.031032356, 0.050352756, 0.021191083, 0.020041477, 0.043741606) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.009787904, -0.0031327195, 0.13239524, -0.02248145, 0.017299512, -0.081802346, -0.026019929, 0.18054922, -0.14968066, 0.008379352, -0.13506816, -0.39034408, -0.01510947, 0.050189696, 0.037722163, -0.0402762) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.009644101, -0.07043924, -0.21935566, -0.12265316, -0.10996126, 0.106311634, -0.23956922, -0.015151155, 0.305456, -0.012311232, 0.3604329, 0.042090364, -0.07823785, 0.0045187594, -0.14659731, -0.13044918) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.056163978, 0.08190758, -0.21001509, -0.033524346, 0.06273405, -0.2997634, 0.17979006, 0.056670144, 0.17271192, 0.18963227, 0.014150318, 0.06472095, 0.011062292, -0.18754636, -0.11784225, -0.03410013) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.0030782006, -0.039169632, -0.012148773, 0.007969146, 0.08711546, -0.037726182, 0.083651684, -0.08435948, -0.019397778, -0.0052067027, 0.08074589, -0.30207992, 0.047031336, 0.002789317, 0.15840194, -0.015054001) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.09078356, 0.12796444, -0.18432406, 0.16723672, -0.05772405, -0.030571923, 0.116594106, 0.06573904, 0.09887476, 0.09740928, 0.106751874, -0.00070329773, 0.010173095, -0.01197216, -0.06333568, 0.09718661) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.110290706, -0.005412752, 0.003918915, 0.0149365235, -0.12237922, -0.0941654, -0.034798037, 0.015760876, 0.04696292, -0.029291628, 0.045765277, -0.015127902, -0.09263057, 0.05402446, -0.0015908936, -0.033567302) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.1546162, -0.046554644, -0.0391521, -0.09454174, -0.0145587865, 0.07268975, -0.02036403, 0.015187209, 0.026502129, 0.032875117, 0.12548845, -0.19535835, 0.010370751, 0.030553613, -0.042921092, 0.11908) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.008709621, 0.12762955, 0.02271395, -0.031447556, 0.2041771, -0.029859964, -0.015839372, 0.10484876, 0.09285942, -0.020085273, 0.2329937, -0.29332286, 0.08294215, 0.011051319, -0.04993451, 0.042096935) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.18800123, -0.03135053, 0.039468758, -0.1393591, -0.055419687, -0.06350931, 0.017772222, 0.05357081, 0.10056033, 0.017571677, 0.05918185, -0.18371263, 0.0045149303, -0.077885784, -0.00043915678, -0.008647403) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.011838485, 0.07350019, 0.0420831, 0.16229297, 0.009401042, 0.063198246, 0.060701136, -0.24234499, -0.098218255, 0.0034951624, -0.010836201, -0.07096872, -0.066027485, -0.008603827, -0.0023365172, 0.036595766) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.007935683, -0.26162764, 0.04059723, -0.059729014, 0.13929102, -0.09995081, 0.26922408, -0.29116368, -0.091238625, -0.07413519, -0.08951079, -0.030239927, -0.1368917, -0.11178951, -0.028913764, 0.15466857) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.1720602, 0.049961366, -0.035956968, 0.01072738, 0.093655944, -0.028308686, -0.07628571, 0.09549064, -0.002988198, 0.06946468, 0.17164339, -0.16626763, 0.11002801, -0.13791496, -0.05334689, 0.050957866) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.067476556, 0.018401565, 0.02231447, 0.14312652, 0.14491569, 0.03304159, 0.2667232, -0.23096946, 0.011412218, -0.033295278, 0.006336338, 0.054895587, 0.031594772, -0.03772589, -0.08373306, 0.040909506) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.03497658, -0.025716685, -0.16338083, 0.028354604, 0.13035797, 0.0010428666, 0.13506557, -0.23274136, 0.016426807, 0.005891126, -0.030560384, 0.054110117, 0.012959187, -0.033846233, 0.079321414, -0.08366125) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.17821713, 0.0037684473, 0.057483234, 0.038107146, -0.10401292, 0.020576356, -0.012016484, 0.010923387, 0.028446645, -0.027637433, 0.11687413, -0.07261914, -0.049263023, -0.06475644, -0.024119789, -0.029610662) * go_3(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.022396808, -0.048420932, -0.02559588, 0.064104095, -0.2238012, -0.041249584, -0.09579613, 0.07697319, -0.058794957, -0.0134507725, -0.037161227, 0.08851301, -0.06766741, -0.036019377, 0.13610823, -0.063773625) * go_4(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.111936666, 0.0015700395, -0.18472138, -0.09797969, 0.010897245, 0.036488175, -0.08795422, -0.07408578, 0.1483729, -0.06495232, 0.080542035, -0.10570226, -0.01910507, 0.083303586, 0.15487678, 0.09761835) * go_4(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.013546343, 0.12007825, -0.08906977, -0.032903753, -0.07735022, 0.074112795, 0.019404477, 0.012522555, -0.23720813, 0.03610346, -0.011151242, -0.09428033, -0.04208847, 0.08472888, -0.0941527, 0.1656356) * go_4(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.25968832, 0.023167782, -0.03399193, -0.025605416, 0.101124994, -0.03928416, 0.046708047, 0.0940108, -0.25001726, 0.06509968, -0.13399917, 0.14300269, 0.020019464, 0.09823798, -0.2859548, 0.15752983) * go_4(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.06779552, -0.048957087, 0.14341845, 0.008796376, 0.30520636, 0.085243754, 0.09708159, 0.120880716, -0.082815446, -0.10173312, 0.21042523, -0.0104252035, 0.012946593, 0.048153225, -0.023779962, -0.22626428) * go_4(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.045614652, -0.1368418, -0.07421652, 0.010353576, 0.022773737, -0.034736004, -0.030603807, 0.0408453, 0.16829208, -0.028303532, 0.115394354, 0.0016284953, 0.06252144, 0.0025463477, -0.035674695, -0.09269994) * go_4(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.029739881, 0.010787098, 0.0037744232, -0.031569265, -0.040358283, 0.031814087, 0.018036583, -0.035894874, -0.063151926, -0.109803386, -0.07274231, 0.0032429527, 0.0074872132, 0.05725981, 0.060606975, 0.061117698) * go_4(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.090809055, -0.03279648, -0.039354723, 0.14036313, -0.013013246, -0.07712587, -0.05239944, 0.03066829, 0.10737496, 0.076186314, -0.19699359, -0.036594667, 0.21938333, -0.04839966, 0.1286612, 0.013338615) * go_4(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.1429745, -0.07955227, -0.115608715, 0.14228356, -0.05602207, 0.02558927, -0.11061171, 0.06673638, -0.049651172, -0.021392899, -0.06468659, 0.039141133, -0.039755132, -0.050199732, 0.011340825, -0.00960286) * go_4(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.065777004, 0.025236372, -0.098756045, -0.0066504143, -0.0832726, -0.040675264, 0.04911827, 0.033635136, -0.28793526, -0.10226347, 0.068537354, -0.2860185, -0.0550898, -0.033459336, -0.04448749, 0.11041132) * go_5(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.00013023219, 0.007373967, 0.04127884, -0.04456252, 0.06467729, -0.023159763, -0.098877944, 0.015409203, 0.15005386, 0.17018975, -0.047596633, -0.08832008, 0.261034, 0.14298894, 0.10107278, 0.0667279) * go_5(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.07939445, -0.08513146, -0.056983568, 0.040726192, 0.020092426, 0.18478346, 0.025876757, 0.030642727, -0.12265552, 0.002464858, -0.020372186, 0.070551656, -0.016353855, -0.11511243, -0.09484669, -0.08860525) * go_5(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.08422405, 0.022759112, -0.12475361, 0.15862978, 0.111085795, 0.07579316, -0.007671498, -0.2048156, 0.17000435, 0.05883048, 0.18549366, -0.228149, -0.14611648, -0.1293601, 0.12878643, -0.07917457) * go_5(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.08697763, 0.0049046283, 0.06277697, 0.25657007, -0.037057158, -0.13358995, 0.2738289, 0.23121043, 0.32146227, 0.9468732, -0.09779261, -0.009769717, 0.0027131666, 0.118656114, 0.0898452, 0.22487496) * go_5(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.009855616, -0.26240128, 0.0801256, 0.05871007, -0.21371177, 0.18926387, -0.23380044, -0.09474009, 0.06469363, -0.011632477, 0.025565358, 0.07108313, 0.10727917, -0.00026592708, 0.10903209, -0.03030383) * go_5(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.0053380155, 0.033946496, -0.06860304, 0.0837713, -0.19269274, 0.08148278, -0.024386114, 0.022558022, -0.10444353, -0.042082686, 0.1903784, -0.077984534, -0.0065324833, 0.014674045, -0.18835127, 0.0013458942) * go_5(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.003491147, -0.0619422, 0.038574003, 0.059497047, -0.15528834, -0.007080539, -0.16295113, -0.044733614, -0.0067163864, 0.08186305, 0.11124116, -0.12240357, 0.12911586, -0.020327786, 0.084354304, 0.0617812) * go_5(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.07007616, 0.011843434, -0.029149607, -0.0033018868, 0.027770158, 0.13727912, -0.12729046, 0.2015703, 0.096229255, 0.013653448, 0.053937647, -0.029171295, 0.034246232, -0.09088042, 0.080427885, -0.114031985) * go_5(pixel.xy, 1, 1);
  result += vec4f(-0.031869058, -0.049291052, -0.05604242, 0.01975563);
  textureStore(conv2d_2_tf1_tex, pixel.xy, result);
}