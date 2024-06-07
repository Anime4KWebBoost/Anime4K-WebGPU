// Layer: Anime4K-v3.2-Upscale-CNN-x2-(VL)-Conv-4x3x3x16
// Name: conv2d4tf
// Inputs: ['conv2d_3_tf', 'conv2d_3_tf1']
// Output: conv2d_4_tf
@group(0) @binding(0) var conv2d_3_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_3_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_4_tf_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_3_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_1(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_3_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_2(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_4_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.004729794, -0.0124398535, -0.08538641, -0.058604605, 0.008671952, 0.25604513, 0.020800482, 0.24144122, -0.028920606, -0.04705229, 0.030192787, 0.0010597534, 0.017666103, 0.0041322373, 0.20027764, 0.08919112) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.0001626656, 0.05816014, -0.0060765734, 0.08811165, 0.35835367, -0.016291425, -0.56892496, 0.083845764, 0.15026698, -0.15916558, 0.08069463, -0.3931291, -0.0123534845, -0.111639686, -0.14637001, -0.08171439) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.114976816, 0.023376396, 0.13855027, 0.07438716, -0.069991484, 0.20377779, 0.23929878, -0.040769435, 0.018832395, 0.005638609, -0.091848075, 0.027843866, 0.023744943, -0.06620523, -0.11678267, 0.0844119) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.0035854098, -0.08432094, -0.17799544, -0.10041983, 0.25605857, 0.021009786, 0.030499447, -0.09928291, 0.052178737, -0.08286175, -0.057888374, 0.024606042, 0.046342995, 0.13875343, 0.11279266, 0.19826262) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.016232021, -0.21539623, 0.0936961, 0.021143785, 0.094262615, 0.049040064, 0.40978724, 0.15347758, 0.08884813, -0.24887115, -0.14756748, -0.5020875, 0.112477, 0.1466549, -0.33418837, 0.5769466) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.16832942, -0.07354198, -0.12081261, -0.055348314, 0.39716053, 0.25583258, 0.09870877, 0.2151021, -0.025700683, -0.1801462, -0.04616654, -0.02782245, -0.054461803, -0.00042802413, -0.00163228, -0.004240747) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.05193433, -0.0018198475, -0.17647028, -0.19462106, 0.1538165, 0.054894235, 0.12183955, 0.07340974, -0.0019901982, 0.0357373, -0.07597063, -0.06681543, -0.00090057997, -0.053894397, -0.010301875, -0.16553953) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.30873474, -0.2836045, 0.057037193, -0.5016378, 0.11952749, 0.102353275, 0.2351629, -0.14635189, -0.019398788, -0.08776502, 0.021669978, -0.089918956, -0.2187901, -0.1180891, -0.049789533, -0.16109149) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.078335494, -0.08867304, 0.03349591, -0.1000293, -0.20235832, 0.22917585, -0.09905303, 0.08381748, 0.014350217, -0.14478815, -0.027479894, -0.026432173, -0.10309177, -0.09860884, -0.019177807, -0.06963025) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.008169383, 0.12532842, -0.23369955, 0.077973194, 0.09076616, -0.021277165, 0.1721421, -0.26914293, -0.014729218, -0.023279984, -0.057670787, 0.003598546, -0.015225789, -0.0115396585, -0.26196182, -0.10724508) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.16542235, 0.06589374, 0.07410237, 0.26753154, -0.3356288, 0.3096256, 0.07112498, -0.0992165, 0.15020338, -0.11021673, 0.18803611, 0.12918204, 0.109007336, -0.031968266, 0.057093572, 0.035949256) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.065006174, 0.031055925, 0.0390232, -0.01678507, -0.21553491, 0.14171642, -0.19541772, -0.033691674, -0.06241631, 0.07497651, 0.024557155, 0.056778047, -0.060191352, -0.0261998, 0.07493729, -0.0699132) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.008541382, 0.020270415, -0.027760057, -0.040962905, -0.26732433, 0.34379438, -0.23012447, 0.0051356517, -0.04059567, 0.0972959, 0.039965224, -0.14796777, -0.0016924662, -0.116963714, -0.026353523, -0.29799464) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.03329303, -0.12663862, -0.0004959157, -0.11162377, 0.26238343, 0.43260252, -0.16504994, 0.10727678, -0.22505566, 0.43474057, 0.43304008, 0.05143919, 0.40494493, 0.08689636, -0.035733614, 0.25727916) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.12175736, -0.014467151, -0.17461288, -0.18480565, -0.26439998, 0.307935, -0.058916792, -0.014292711, -0.0569471, 0.10751278, -0.04134206, 0.1847734, -0.07519831, -0.033909313, -0.05001451, -0.136606) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.1424893, -0.026820501, 0.19645774, -0.0011315406, -0.14680974, 0.07662838, 0.21108222, 0.13260938, 0.17923595, -0.085527614, 0.08217639, 0.06579479, 0.05985784, -0.09016323, 0.11172888, 0.111903176) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.19842595, 0.0093640275, 0.10433465, 0.13341904, -0.082806975, 0.22555825, -0.1315717, 0.11907785, 0.24012424, 0.47776055, 0.1835734, 0.17483878, 0.079803735, 0.01155073, -0.21146573, -0.16484722) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.15064004, 0.021381427, 0.18301587, 0.21225913, 0.054995645, 0.03212186, 0.052798916, -0.048424408, 0.03609021, 0.0964704, -0.059469886, -0.05133066, -0.08157349, 0.051145166, -0.09107608, -0.1362262) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.090521574, -0.014747857, -0.081675015, -0.118686825, 0.04848682, -0.033071827, 0.008534588, 0.023765508, 0.16849907, -0.21797262, -0.17049783, -0.07824179, -0.033794608, 0.052612655, 0.095820345, -0.07262317) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.22816367, -0.13772108, -0.036353834, -0.47638395, -0.0530902, 0.14089061, 0.076203234, 0.18006112, 0.121814854, -0.20750527, 0.08266107, -0.28634354, 0.14301859, -0.13458411, 0.00501663, -0.039783802) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.103384845, -0.14389835, 0.08275834, -0.068423435, 0.22643796, -0.02966374, -0.2847584, 0.037081387, 0.02349005, -0.19353923, -0.00095957273, -0.13623689, -0.073120415, 0.03941467, 0.21864155, -0.014019576) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.082576886, 0.17085212, 0.08971252, -0.04213377, -0.032548156, 0.022137715, 0.08399252, -0.0011743539, -0.09410863, -0.41728264, -0.20709297, -0.18933547, 0.027059928, 0.09743364, 0.2504647, -0.041173562) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.20924084, 0.291118, 0.029851688, 0.16953468, 0.02936709, 0.12213576, 0.22944322, 0.108747594, 0.0001881129, -0.27398208, -0.009702691, 0.15449248, -0.9472944, -0.26114875, -0.28161275, -0.3495961) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.12994622, -0.2758638, -0.1091727, -0.0968308, -0.14323105, 0.035175014, -0.08023811, 0.006023802, -0.031529594, -0.1486306, -0.3398172, -0.23240276, -0.29163983, 0.173475, 0.18809283, 0.22197202) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.048254848, -0.083444916, -0.014334202, 0.060992356, -0.023099286, -0.09492961, 0.05592045, 0.0026059286, 0.08998117, -0.108810075, -0.053304546, 0.045926623, 0.068255246, 0.099023566, 0.01595483, 0.1336309) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.21916585, 0.2837387, 0.14624594, 0.18843961, -0.06747584, 0.054924384, -0.082568415, 0.05011459, 0.014297759, -0.3884833, -0.054417178, -0.18970548, 0.088336475, -0.030646667, -0.2980552, -0.030035203) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.02748568, -0.011897529, -0.2370837, -0.016740574, -0.0282112, 0.050353892, -0.10761107, -0.00036999505, 0.037646662, -0.17742962, 0.06489219, -0.158852, -0.08016933, 0.07808515, -0.105895035, 0.079869986) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.0058994526, -0.037170693, 0.2574696, 0.06199102, -0.04497728, -0.10667442, -0.15183865, 0.0212881, -0.030842574, 0.073473394, 0.010764398, -0.00084518327, -0.03893014, -0.009649613, 0.07443129, 0.15108284) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.11325495, -0.096435815, -0.097331434, -0.049700152, -0.17231967, 0.047090057, -0.019111065, 0.104790315, -0.15004838, 0.13950798, 0.055996202, -0.070548095, 0.047154237, -0.007650949, -0.053611025, -0.012242293) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.12787002, -0.04958212, 0.053988468, 0.0017896162, 0.049493514, -0.009475431, -0.0022641935, 0.03933694, -0.005174597, 0.043754533, -0.1432976, 0.037084177, -0.04601288, -0.032077815, -0.059897035, 0.12584484) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.019409029, 0.10492923, 0.268368, 0.12597778, -0.17733063, -0.0085961, -0.27136415, -0.049664587, 0.012515404, -0.21444482, -0.39275557, -0.12297177, 0.06800057, 0.19228315, 0.06245887, 0.35772634) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.16317715, 0.2288402, -0.23235172, 0.22230752, -0.1646375, 0.13366091, 0.16681044, -0.17399235, 0.33997267, -0.3179832, -0.34756508, 0.39843196, -0.10748536, 0.322923, 0.23339489, 0.08684083) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.02835275, 0.12314228, 0.24030593, 0.30856124, 0.055735108, -0.044914473, 0.0031432225, 0.07469899, 0.1778018, 0.107083894, -0.023706734, -0.15501897, 0.0943098, -0.034707237, -0.18622099, 0.05257965) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.042839274, 0.12597966, 0.08979042, -0.0647561, -0.050434645, 0.049438696, -0.20008127, -0.05572608, 0.046238814, 0.12622325, -0.019017145, -0.13960391, -0.040050175, 0.14298008, -0.20270552, 0.13391526) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.0073277587, 0.10606624, -0.08940439, -0.09656414, 0.12387374, -0.0013147948, 0.23607181, -0.00037969893, 0.050353236, -0.17266603, 0.27796733, -0.09877832, 0.02711225, 0.096394345, 0.07457944, 0.21541388) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.18612787, -0.00027517386, -0.17136407, -0.06413671, 0.025629476, -0.04570916, 0.0008431566, -0.03419168, 0.08123608, 0.09465922, 0.11975521, 0.1269741, 0.08413221, 0.12125001, 0.04727287, 0.072378494) * go_3(pixel.xy, 1, 1);
  result += vec4f(0.04244928, -0.014280219, 0.017129054, -0.08807801);
  textureStore(conv2d_4_tf_tex, pixel.xy, result);
}
