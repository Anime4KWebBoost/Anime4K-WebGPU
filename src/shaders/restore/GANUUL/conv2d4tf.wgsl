// Layer: Anime4K-v4.1-Restore-GAN-(UUL)-Conv-4x3x3x24
// Name: conv2d4tf
// Inputs: ['conv2d_3_tf', 'conv2d_3_tf1', 'conv2d_3_tf2']
// Output: conv2d_4_tf
@group(0) @binding(0) var conv2d_3_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_3_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_3_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_4_tf_tex: texture_storage_2d<rgba16float, write>;
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
  return max4(textureLoad(conv2d_3_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_4(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_5(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_3_tf2_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
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
  result += mat4x4<f32>(0.011262504, 0.031819463, -0.06957062, -0.043127634, 0.00583867, 0.09169646, -0.045924503, -0.03033917, 0.04295624, -0.0008524074, -0.10314193, 0.017878639, -0.026550706, -0.057304744, -0.093816355, 0.084548905) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.14785792, 0.27953532, 0.013030618, 0.088695146, 0.108306505, 0.09207513, 0.111750156, -0.053279888, -0.091059364, -0.06638048, 0.027781408, -0.16337578, 0.056285474, 0.11172556, 0.030077877, -0.017893653) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.17618006, -0.4502103, 0.07598669, -0.0009732414, 0.050383665, 0.17085455, -0.0031775923, 0.064862505, 0.11707715, 0.3526508, -0.01904134, -0.012807272, -0.116546296, -0.060822245, -0.1311729, 0.07212336) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.087797835, -0.06613155, 0.1483391, 0.013323468, -0.11146307, -0.015671762, -0.040200327, -0.10357134, 0.019073516, -0.06472526, 0.10602498, 0.1770319, -0.08521562, 0.12664832, 0.08947633, -0.05493576) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.33827654, 0.28221247, -0.18990488, 0.026941316, 0.1488764, -0.2931259, -0.076329395, -0.015431582, -0.099263206, 0.19168049, -0.026642313, 0.13576517, 0.038345568, 0.28094527, 0.009882045, -0.11360381) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.05157035, -0.07949976, -0.11442825, -0.10846249, 0.0041128546, -0.086069524, -0.08534606, 0.030012999, -0.02440029, 0.0032833228, 0.080156125, -0.09495428, -0.014791535, -0.3719053, -0.09000905, 0.0037281278) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.06803247, 0.07046111, 0.025906414, 0.04482326, -0.029433155, -0.053168926, 0.11433928, 0.09067554, 0.08303741, -0.17981903, -0.119454004, 0.18209296, -0.03772345, 0.025304617, -0.078271955, -0.091292545) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.22007126, -0.40249357, 0.09878526, 0.043460052, -0.037937324, 0.2775198, 0.08673017, -0.075257935, 0.14146972, -0.049743168, -0.09132197, 0.072746076, 0.029836698, -0.0047054323, 0.041883502, -0.0780989) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.054638218, 0.31379706, -0.015786655, -0.026390918, -0.11370519, -0.085995756, 0.08572533, -0.066644676, -0.052945357, -0.027882649, -0.030349009, -0.00074756425, -0.0034215925, 0.16293995, 0.0043956763, -0.013435695) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.004479172, 0.15894544, 0.014565352, -0.022123177, 0.036710665, 0.027838772, -0.03341635, -0.02814826, -0.0891137, -0.051923018, -0.058425512, 0.057913873, -0.058511104, 0.04785274, 0.047574837, 0.095560044) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.026339598, -0.21249251, 0.09641629, -0.1050302, -0.11599119, 0.16732395, -0.07735261, 0.10095655, -0.046776835, -0.1985677, -0.100405715, -0.0049418057, 0.08661461, 0.030991163, 0.058080763, -0.033386886) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.06275464, 0.12353212, 0.011660699, -0.0048974585, 0.03182892, -0.11731411, 0.058963027, 0.00076737226, -0.014992623, -0.075640306, 0.021105729, 0.054476924, 0.010348032, 0.018136699, -0.015781997, 0.011437102) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.13556376, -0.061953824, 0.05551936, 0.116930924, 0.06720336, 0.37149063, -0.020317249, 0.10018995, 0.03449863, 0.00254038, -0.12589492, -0.116539575, 0.02914628, -0.1132907, 0.059977263, -0.01013219) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.17061242, -0.11773073, -0.07108274, 0.0034582969, 0.037274398, -0.38318223, 0.10591709, 0.25803554, -0.07071293, 0.17214958, 0.34243912, -0.20444241, 0.16736552, 0.14189146, -0.15058914, 0.028070828) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.014832051, 0.38498318, 0.07763121, 0.0076594464, 0.1140444, 0.23477876, -0.06551489, 0.082364485, -0.072711125, -0.26173973, 0.10116861, 0.025223283, 0.0071469937, -0.08337561, -0.029252755, -0.040330622) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.065506235, -0.04470719, 0.09613445, 0.11135494, -0.038838383, -0.13319598, -0.030709865, -0.11286597, 0.02777684, 0.14582784, 0.10601686, 0.032446314, -0.101155646, 0.01797949, -0.060460012, -0.17628726) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.013238295, 0.23827216, -0.052030362, 0.056838796, 0.11169307, -0.0019896782, 0.04225852, -0.05080408, 0.041208353, -0.018402472, 0.0045357095, 0.14560573, -0.07002417, -0.14796354, 0.007762815, -0.10192629) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.041997515, -0.35881934, -0.021417812, 0.08649882, 0.09397181, -0.13445188, 0.06475497, -0.010673045, 0.12269194, 0.18738186, -0.042150542, 0.1256423, -0.008410485, 0.09158409, 0.041347865, -0.0074583124) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.062870465, -0.059856553, 0.091585, 0.092011355, 0.020937715, 0.010538825, 0.06692169, 0.0006046978, 0.1952068, 0.031263877, -0.106957935, 0.14423949, -0.014842083, -0.043564916, -0.019768178, 0.034922168) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.117032535, 0.18058799, 0.007915372, 0.020678058, 0.14933655, -0.051320497, -0.023838546, 0.06867943, -0.3355837, 0.0042644492, -0.12227475, -0.04008191, 0.024019344, -0.040317632, 0.025777748, 0.24088405) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.00010084207, -0.1289124, 0.031990424, -0.079577096, -0.0053844554, -0.02361255, 0.07049022, 0.039858952, -0.07922686, -0.06185779, -0.03044959, 0.079977244, -0.0893825, -0.106873706, 0.0044374927, -0.028308846) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.08895584, -0.042846404, -0.013092824, -0.13957329, -0.10497291, 0.10893366, -0.16962886, -0.002034427, -0.037901185, 0.064590566, 0.058201604, 0.14310947, 0.08995774, -0.05294167, 0.1631053, -0.012728631) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.07719386, 0.046034593, 0.04633185, 0.11177461, 0.012042811, 0.13169785, -0.11322429, 0.10102152, -0.23842178, 0.13413563, 0.07785035, -0.083747946, 0.10070529, -0.0900075, -0.17456235, -0.38653556) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.12692979, -0.047207076, 0.003124948, 0.0031179655, 0.028505344, -0.16842307, 0.018322583, -0.03406163, 0.04017119, -0.1724708, 0.039637722, 0.14817074, -0.015262273, 0.4343052, -0.028746288, -0.06529248) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.124842934, 0.13421857, -0.02313364, -0.11312006, -0.03259939, 0.06062406, -0.007419522, -0.04876289, -0.10012543, -0.25548926, -0.030651081, 0.034160238, -0.14513661, 0.036888786, 0.17565195, 0.11805049) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.19049145, -0.039175794, 0.018565621, 0.1548963, -0.051579755, 0.031628616, 0.0051352894, 0.11517133, -0.01610091, 0.051337674, -0.026527107, -0.019971197, 0.12971555, 0.07533016, -0.3041597, -0.06759981) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.12584706, -0.10033112, 0.035238206, 0.09898554, 0.050027825, 0.07308421, -0.01463469, -0.00082939945, -0.047252785, 0.08552882, 0.0019422411, -0.024661394, 0.11734384, -0.26585263, 0.07397762, 0.20346671) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.107849255, -0.11532747, 0.05027606, 0.10103512, 0.064907365, 0.010803471, 0.028275143, 0.14567783, -0.07167514, 0.08434946, 0.07393991, 0.0254499, 0.04305806, 0.04086671, 0.053802863, -0.06721381) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.09881202, -0.06978072, 0.04603433, 0.01741673, -0.15704031, -0.1793963, -0.038271505, -0.10161381, 0.04542897, 0.07914688, 0.046205457, 0.08958046, -0.0061665005, -0.03463733, 0.029120842, 0.043564152) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.012550157, 0.17462914, 0.06898175, -0.07152383, -0.03304833, -0.08832667, -0.016064065, -0.23278883, -0.13197964, -0.08672381, -0.05409716, -0.065082744, 0.06888385, 0.036308136, 0.11151006, -0.06965145) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.10415191, 0.17370042, -0.077190965, -0.008505009, 0.071427636, 0.021012051, 0.29375538, 0.20707655, 0.08539143, -0.21792713, -0.069910124, -0.13272718, 0.078085855, 0.020925732, -0.09766308, -0.014647463) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.1540831, -0.20195347, 0.12906608, -0.18597993, 0.02752237, 0.3436961, 0.12848559, 0.23174804, 0.09912136, 0.2955073, -0.0119524235, 0.07499343, -0.056999985, -0.13919996, -0.0442433, 0.09012822) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.03846984, -0.016049843, -0.04194403, 0.016142704, -0.14151782, -0.06796431, 0.004672686, -0.20027739, -0.100223176, -0.08138453, -0.09202174, 0.12008146, -0.009262179, 0.303418, 0.040116344, 0.032100268) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.02313964, -0.24428035, 0.038113195, -0.0045478963, -0.12524363, 0.0911982, -0.091526926, -0.10919195, -0.044670045, 0.08331864, 0.12612547, -0.103683256, -0.003986556, -0.034693778, 0.03215815, 0.06168313) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.024951402, 0.36099398, -0.08449376, -0.07497921, 0.09019578, -0.34781474, -0.038260702, 0.04863762, 0.017253455, -0.019677663, 0.12687095, 0.00063366926, 0.011710997, -0.10072319, -0.03315336, 0.07632106) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.07059056, -0.12018756, -0.09131319, -0.013561132, 0.24165273, 0.22274019, -0.017931685, 0.010056685, 0.12344425, 0.12156007, -0.026813593, 0.004195277, 0.04681439, -0.076013386, -0.031047279, 0.028654084) * go_3(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.07966141, -0.07519266, 0.08071786, -0.07381566, 0.016123658, -0.05854732, 0.037251532, 0.025495501, 0.105325036, -0.09021125, -0.0065127593, 0.20154859, -0.24500966, 0.16068383, -0.045858987, -0.013114567) * go_4(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.11490749, 0.2778325, -0.09342925, -0.059463568, 0.038029168, 0.010677079, 0.004088794, -0.0524926, 0.14234811, 0.26121226, 0.080162, 0.19559322, 0.19100796, 0.120853685, 0.14027278, -0.07141763) * go_4(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.07725682, -0.028726127, -0.011004939, -0.016452273, -0.004484741, 0.11287478, -0.090253375, -0.00962195, 0.067813195, 0.00653987, 0.11110691, 0.02533638, 0.047734473, 0.630844, -0.12703009, 0.0815481) * go_4(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.063518584, -0.068115965, 0.06567312, 0.005423953, -0.035477355, -0.36495018, 0.034740042, 0.10112081, -0.106252685, -0.27082387, 0.29244247, 0.12543291, -0.35771617, -0.106733896, 0.09776179, -0.041923277) * go_4(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.1582593, -0.19066747, 0.12785429, -0.06028763, 0.07165759, 0.29100847, -0.066886865, -0.026840167, 0.0149742095, 0.046114814, -0.16078624, -0.06096696, -0.15888374, 0.29948848, 0.011921788, -0.14737292) * go_4(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.023203196, -0.012949222, -0.10660274, -0.019064514, -0.01604895, -0.11042657, 0.014043448, -0.007858082, 0.034866568, 0.28908056, 0.044833034, -0.055372775, 0.05015458, 0.45589668, -0.059942003, -0.24177484) * go_4(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.010991107, 0.081413716, -0.022647902, 0.035956774, -0.01045697, -0.06317254, -0.048409183, 0.014224823, -0.041370537, -0.03167499, -0.08533798, -0.0033347958, -0.045379575, -0.1464327, 0.11794289, 0.12731233) * go_4(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.042375486, -0.26550424, -0.020939078, 0.048613142, -0.0064663864, -0.3438306, 0.01354813, 0.01667072, -0.078636885, -0.15991145, 0.07323537, 0.041297473, -0.088465534, -0.333333, -0.05659556, -0.2753555) * go_4(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.007157959, 0.16018897, 0.026304452, -0.04799124, -0.009590161, -0.05249338, -0.009172379, 0.0054461583, -0.05708218, -0.19263835, 0.11795639, -0.02212647, 0.056535985, -0.06511114, -0.013391156, -0.13783967) * go_4(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.05439675, -0.006444465, -0.009317183, -0.07307444, -0.00030038637, 0.18579505, -0.051370375, 0.059529413, -0.27623934, -0.013988184, -0.0048374305, -0.15984012, 0.039892353, -0.018393246, -0.046821754, 0.023543872) * go_5(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.13751456, -0.06096664, -0.025098158, 0.06613064, -0.08354669, -0.07604228, 0.008098726, 0.018510602, 0.14101581, 0.22782752, -0.0028741485, 0.041945882, -0.0810864, -0.020587375, -0.085017934, -0.025102144) * go_5(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.047001034, 0.15929686, -0.017429994, 0.11485433, 0.008108619, -0.039101716, -0.01298734, -0.04309558, 0.063283674, -0.006479532, 0.041943613, 0.020806335, 0.1637154, 0.08164767, -0.022789355, 0.23034051) * go_5(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.04580322, 0.035329618, -0.045944862, -0.11552284, 0.080185264, -0.054166514, 0.050542697, -0.026156206, -0.083026126, 0.07445656, 0.020240687, -0.095825456, -0.05638868, 0.061477177, -0.0053955787, -0.03098832) * go_5(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.0488631, 0.0048201405, -0.17982271, -0.19360444, 0.04280375, -0.06298201, 0.18850167, -0.1875722, -0.021133788, -0.4440641, -0.08967545, -0.020436049, -0.07340717, 0.15360972, 0.30010164, 0.13870142) * go_5(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.06518589, 0.05225434, 0.035718046, 0.09953873, -0.018187355, 0.2680586, -0.011366758, 0.16459163, -0.17236687, 0.271017, -0.044547327, -0.12611923, -0.17699997, -0.14207041, 0.029943895, -0.32613477) * go_5(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.043032415, -0.112493455, -0.0017059229, 0.030980088, -0.034748103, -0.034630474, -0.00086845557, -0.07122569, 0.0859297, 0.048253577, 0.1304124, -0.0067533916, 0.15792038, -0.051970366, -0.02041555, -0.022408634) * go_5(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.16435696, 0.1454917, -0.02320267, -0.07823869, 0.03715387, 0.001277761, 0.09719438, 0.015275015, -0.11739434, 0.06375923, 0.10178472, 0.0694389, 0.04614792, -0.38499647, 0.27365905, -0.20401697) * go_5(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.09289143, -0.059769634, -0.014427403, 0.07280103, 0.04857605, 0.04126391, 0.007707449, 0.016183812, -0.080374636, -0.24951005, 0.051764973, 0.01020587, -0.2992075, 0.04918275, 0.2093324, 0.14188328) * go_5(pixel.xy, 1, 1);
  result += vec4f(-0.034787357, -0.010484513, -0.13672084, 0.021112612);
  textureStore(conv2d_4_tf_tex, pixel.xy, result);
}
