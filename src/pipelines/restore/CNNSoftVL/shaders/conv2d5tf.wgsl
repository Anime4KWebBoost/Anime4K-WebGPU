// Layer: Anime4K-v4.0-Restore-CNN-Soft-(VL)-Conv-4x3x3x16
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
  result += mat4x4<f32>(0.10883355, -0.14958352, 0.026701333, 0.090302855, 0.033934478, 0.120340124, 0.027125617, -0.16792692, -0.075757094, 0.28692973, 0.013230067, -0.040618937, 0.087148145, -0.05985753, -0.06352023, -0.05775848) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.18206549, -0.10363482, 0.097648725, -0.08801144, 0.31633568, 0.058347676, -0.009121898, 0.02594872, 0.14757825, 0.4730546, -0.008518203, -0.3090668, -0.004052835, -0.14166127, -0.010156037, 0.21191326) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.05735183, 0.039180398, -0.12357178, 0.04830351, 0.120369986, -0.052775342, 0.005902798, 0.07695394, 0.00602021, 0.16758691, 0.10287989, -0.1718468, -0.1319741, 0.16932078, -0.2055026, -0.31820264) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.05427556, -0.28392607, 0.08579091, -0.0015861926, 0.062348455, -0.27778792, -0.07450379, 0.01616914, -0.012357131, -0.056992117, -0.1896176, 0.018156245, 0.06499259, -0.076558664, 0.10341699, -0.08993959) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.05741742, -0.05414434, 0.18006511, 0.09840777, -0.11849741, 0.40419933, 0.21349974, 0.40268886, 0.23218039, -0.0680356, -0.3130592, -0.21271054, 0.13776754, 0.19114101, 0.17373541, 0.43457666) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.060757063, 0.11339545, -0.042958036, -0.06483378, -0.06681766, -0.056395415, 0.037868995, 0.033861663, -0.1041215, 0.0046828864, 0.14360638, 0.087886184, -0.26808187, 0.19876598, -0.05276215, -0.07073776) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.24029991, -0.14217372, -0.011767948, 0.011623913, 0.33820602, -0.24501325, -0.11444902, 0.14536968, 0.16780593, 0.0065867775, -0.074971735, 0.021472024, -0.10853042, 0.09527126, 0.009436061, -0.09688826) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.31893802, -0.0016892607, -0.105592966, -0.116694786, -0.007851739, 0.1429722, 0.0741952, 0.050125953, 0.07185179, 0.1900389, 0.030889044, 0.15422693, 0.12550323, 0.3556344, 0.108276874, -0.099125646) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.33620578, -0.11113713, -0.15881014, 0.028243937, -0.12028756, -0.028566968, -0.002682634, -0.15635195, -0.06869284, -0.03309234, 0.03086361, 0.050773233, -0.08939835, 0.15237434, -0.024076303, -0.13092752) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.31200737, 0.32207087, -0.068700634, -0.39202076, 0.0676771, 0.083766654, -0.05696634, 0.03088338, 0.046761762, 0.09732023, 0.030844063, -0.03369749, -0.12664944, -0.029924957, 0.10551989, 0.086157694) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.1919761, 0.17179352, -0.025805056, -0.05570367, -0.16736336, 0.07430868, -0.13228212, 0.10702857, -0.09723214, 0.1884809, 0.09422538, -0.16902041, -0.1964137, 0.17877853, 0.17453954, -0.11339361) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.11865004, 0.013131073, 0.17317963, -0.2077911, -0.1116894, 0.09672745, -0.023348883, -0.1176519, 0.15893579, 0.22941695, 0.18798698, 0.059098385, 0.09498779, 0.10118143, 0.08737761, -0.016268898) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.025380889, 0.17163627, -0.014800655, 0.12669696, 0.050048903, -0.06513837, 0.020915661, 0.2144372, -0.17799327, 0.0068409992, 0.06751171, -0.16618991, 0.14637277, 0.010591964, -0.15909241, 0.02660789) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.3178319, 0.15036377, -0.03386948, 0.13883169, -0.33842105, 0.061425313, -0.04195804, 0.22558802, 0.2250625, 0.060225345, -0.08467863, 0.0014776831, 0.080328, 0.03221249, 0.20838667, 0.11489719) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.0013924981, 0.28233197, -0.17997956, -0.10959627, -0.16253087, 0.016549526, -0.1571556, 0.017017027, -0.14697123, 0.0869202, 0.2104898, -0.15658243, 0.13424201, -0.022636503, -0.09512045, 0.0927298) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.038486905, -0.19215351, -0.2446516, -0.02958912, 0.06899297, 0.028667469, -0.05537665, 0.066711955, -0.0017354499, -0.07466053, 0.028587297, -0.042017035, 0.023596823, 0.0067433366, -0.14685915, 0.13400853) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.0573442, 0.1424536, 0.19606829, 0.07141616, -0.032276712, 0.20030099, 0.16644277, 0.10393295, 0.27240822, 0.0071844175, -0.023368603, -0.14067268, -0.20310283, 0.039528254, 0.103837095, 0.08236034) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.15616669, 0.3495403, -0.05678421, -0.069600284, -0.07361787, 0.079501756, 0.009530261, -0.032385882, 0.029831208, -0.095407076, 0.010261287, 0.15250465, -0.04868275, 0.058579214, 0.03779718, -0.10810775) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.06492073, 0.018667994, -0.004712761, -0.032692235, 0.04027288, -0.114499666, -0.04327484, 0.13778907, -0.09373396, -0.08822919, 0.04796151, -0.057756703, -0.26161298, 0.07182931, 0.12998815, -0.14389744) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.19001032, 0.13091461, -0.2551175, 0.013365716, -0.031779066, 0.002531366, -0.13807543, -0.14165778, -0.2701911, -0.0890182, 0.34704998, -0.008494185, 0.16179956, -0.060182545, 0.060827415, -0.17249492) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.10665868, 0.15999752, -0.042796712, -0.14010513, -0.014244899, 0.017433831, 0.053657144, -0.0965679, 0.23623326, 0.0690172, 0.1290121, -0.025523739, 0.122357905, -0.18172716, 0.02829383, 0.10042929) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.09273112, 0.09466892, -0.009225705, 0.16772579, 0.0813042, -0.16461512, 0.038097944, 0.19834967, -0.033650465, -0.12888893, 0.1414859, -0.021587005, -0.0047441716, 0.08880282, 0.020621201, 0.065779164) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.0051817205, 0.20322648, -0.077459775, 0.07461627, 0.1817634, -0.5371515, -0.29336745, -0.57652086, 0.035826538, 0.41058993, 0.21512514, -0.041881148, -0.2490056, -0.07172767, 0.20821427, -0.69866294) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.18961228, 0.027452804, -0.0075194626, -0.029665018, 0.28770384, -0.099777386, -0.12160496, 0.07690297, 0.30273837, 0.026466522, 0.18100439, -0.09078488, 0.2035407, -0.062081084, 0.06744994, -0.07512911) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.008473044, 0.07501521, -0.11242355, -0.039451122, -0.21818535, -0.07779562, 0.13194147, 0.084983595, 0.0770609, -0.034488454, 0.08823556, -0.07168295, 0.041894365, 0.0789253, 0.06191209, 0.013991105) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.10582237, 0.1514222, 0.10751824, 0.08231926, 0.23913008, -0.2673503, 0.036170945, 0.31463087, 0.026397424, -0.26629624, -0.07428361, -0.077513516, 0.0768238, -0.026638538, 0.12589583, -0.11521212) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.30389515, 0.18963532, 0.023015842, -0.10240883, 0.045651495, -0.036785256, -0.13346411, 0.16431254, -0.030950911, -0.03381929, 0.09413111, 0.03924852, 0.11044091, -0.10149653, 0.14114548, 0.07801978) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.029622428, 0.14528686, -0.034057826, 0.010664312, 0.059213262, -0.29354423, -0.08448559, 0.10569036, -0.02988314, -0.016480735, 0.042203777, -0.028342744, 0.36807576, 0.09301971, 0.123721026, 0.07806503) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.04849538, -0.09201287, 0.10069803, -0.031749677, 0.18774022, -0.27789372, 0.05288653, 0.08097265, 0.006918896, -0.060978457, -0.113319606, 0.008844536, 0.021804892, -0.0011744015, -0.35720357, -0.24996938) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.07147501, -0.09339197, 0.16154395, 0.3372506, -0.0004858638, -0.056553435, -0.12463908, -0.0047342298, -0.009141984, -0.13796125, -0.14035304, -0.104403175, -0.07054226, 0.12142519, -0.24971877, -0.1914648) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.008194284, -0.027617034, 0.004994261, -0.07672895, 0.25697777, -0.18313397, 0.03266311, -0.029157834, 0.010476624, 0.12394092, -0.059660904, 0.08561672, -0.0008583816, -0.044442356, 0.28336492, 0.065344445) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.3570137, -0.06802815, -0.10298613, -0.21256869, 0.3025278, -0.263425, 0.13547331, 0.038517762, 0.14951234, -0.16869017, 0.03293678, 0.21897063, -0.14688788, 0.21619378, -0.27550143, 0.048003722) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.15607022, -0.111073844, 0.2733694, 0.05423378, 0.25116092, -0.17350473, 0.13460433, 0.09602139, 0.17372625, -0.0024815476, -0.30154657, 0.0062206364, -0.0051755225, 0.04985103, -0.06310478, -0.30450678) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.057571005, -0.019051064, 0.054884393, 0.03993782, 2.6782007e-05, -0.05726912, 0.067192145, -0.08955987, -0.11937056, 0.15837386, -0.011670469, -0.06299701, -0.014917928, 0.23921679, 0.0054613873, -0.23099245) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.035849575, -0.06785954, -0.15053692, 0.011964653, 0.1975448, -0.1633047, -0.024539666, 0.03170174, -0.12585635, -0.021171011, 0.15862562, 0.10296358, 0.3114039, 0.10010659, -0.09519227, -0.12945092) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.044433746, -0.058466546, -0.13258536, -0.033972915, 0.0037206819, -0.057343487, 0.13798106, 0.044445634, -0.22623023, 0.2408462, 0.048287082, -0.30717465, -0.13402344, 0.20024839, -0.026932377, -0.034217034) * go_3(pixel.xy, 1, 1);
  result += vec4f(-0.05988374, -0.23198523, -0.058251306, -0.038808554);
  textureStore(conv2d_5_tf_tex, pixel.xy, result);
}