// Layer: Anime4K-v3.2-Upscale-CNN-x2-(M)-Conv-4x3x3x8
// Name: conv2d2tf
// Inputs: ['conv2d_1_tf']
// Output: conv2d_2_tf
@group(0) @binding(0) var conv2d_1_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_2_tf_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_1_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_1(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_1_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
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
  result += mat4x4<f32>(-0.06963679, -0.07560548, -0.069522075, 0.0038078027, -0.08002613, 0.13671301, 0.084461786, -0.039376218, 0.19136548, -0.123174496, 0.26566333, -0.16583005, -0.18664864, -0.023539122, -0.21928434, -0.026818147) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(0.16660932, -0.18558703, 0.37230486, 0.118128106, -0.14098641, 0.14659132, -0.22217897, 0.12952235, -0.4139033, -0.04308319, 0.12885277, -0.17986743, -0.23556231, -0.08351981, -0.43240538, 0.019033253) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.18008037, -0.04448665, 0.011906908, -0.023056917, 0.18136618, -0.04723555, -0.0050158803, -0.14823224, -0.2105281, 0.023047728, -0.14040631, -0.03178526, -0.13477588, -0.01820428, 0.058358394, 0.23792502) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.07363309, -0.061728477, 0.03573137, -0.0050971056, -0.012813505, -0.17236637, 0.1697835, 0.055788577, -0.22263195, 0.10324512, 0.58971673, -0.4872246, -0.1555681, 0.032747746, -0.096495196, 0.070196226) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.14174286, 0.099460006, -0.088765986, 0.58350676, -0.025177564, -0.46004987, 0.37007022, -0.11437029, -0.5164534, -0.60465246, 0.38859612, -0.32846406, 0.050266482, -0.20334712, 0.18316261, -0.19327633) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.09377763, -0.0012762006, -0.028991895, -0.26523829, 0.20173682, 0.037923716, -0.03174243, 0.07103378, -0.10764164, -0.30752546, 0.20556998, -0.1892279, 0.08115748, -0.023550175, -0.07627362, 0.11746628) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.06998859, -0.017997518, 0.069938794, -0.14943017, -0.14179112, 0.16643842, -0.110231474, 0.08895815, -0.24074875, 0.3277253, -0.07435203, -0.23452802, 0.039962552, -0.07145652, -0.022511544, -0.04571222) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.059785757, -0.23771374, -0.030571314, 0.25222278, 0.106601834, 0.34398326, 0.14511436, -0.03867526, -0.38982397, -0.11944689, 0.12997924, -0.13079585, 0.005729482, 0.012653905, -0.063693404, 0.09632285) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.04933823, 0.0547175, 0.050636575, -0.10060694, 0.1344485, 0.19752938, -0.100068115, -0.028829506, -0.14096203, -0.079092234, 0.092109434, 0.011606209, -0.04052607, -0.008347507, 0.06956573, -0.028109524) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.21918017, -0.11115073, 0.2262453, -0.06889667, -0.11256312, -0.07438075, -0.088454485, 0.13672407, -0.06905764, 0.08128395, 0.016103368, 0.050190717, 0.09691516, 0.05845721, 0.4886816, 0.041121427) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.3449472, 0.09711974, -0.13881907, -0.018265123, 0.27855873, -0.07030004, 0.29545054, 0.37216932, 0.08657718, 0.099066615, -0.10574013, -0.17667885, -0.14855732, -0.11351448, 0.66945946, 0.11312157) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.2526151, -0.04594331, -0.06606611, 0.09104881, 0.06857995, -0.075284235, -0.17664689, 0.21578754, 0.0696524, 0.09142951, 0.080997564, -0.0682772, -0.0011445724, -0.11736295, 0.2519232, -0.101926275) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.12913518, 0.058357026, 0.195421, -0.15651494, 0.2877076, 0.0033844314, -0.07831594, 0.052855384, -0.031295884, 0.03301088, -0.18408822, 0.06732994, 0.23742151, -0.12568143, 0.22810535, -0.11545694) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.49203303, -0.22656603, 0.1723193, -0.51250046, -0.09742038, 0.758559, -0.3387505, -0.6193586, 0.14136684, 0.27679884, -0.050113205, 0.31041816, -0.36475047, -0.48746544, 0.3233227, 0.4579754) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.46636763, 0.1507748, -0.2581362, 0.15413165, -0.17160143, 0.14256273, -0.074575804, -0.099299066, -0.0017214464, 0.13778336, -0.07378213, -0.15489665, -0.10533715, -0.0011083825, 0.39584312, 0.0023906573) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.026959421, -0.06391859, 0.0034752619, 0.14521928, -0.0010877338, -0.032619733, 0.005375293, -0.018952755, 0.03381545, -0.007652831, 0.034141563, 0.046016496, 0.11219674, 0.030913852, 0.077403754, 0.17192438) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.040326044, 0.17290725, -0.1220239, -0.09594783, -0.025229257, 0.17913155, -0.26623353, -0.033396784, -0.03075146, 0.009143897, -0.0136083895, -0.13886899, 0.075683735, -0.11584183, 0.22182357, 0.19350322) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.15726025, -0.10215694, -0.060057458, 0.26487043, -0.04075552, -0.016496127, 0.0015382086, 0.108562306, 0.026795091, 0.0441233, -0.08754318, -0.0460157, 0.048422016, 0.14107347, 0.07986661, 0.1047697) * go_1(pixel.xy, 1, 1);
  result += vec4f(0.0766796, 0.08115133, -0.05703058, 0.14025708);
  textureStore(conv2d_2_tf_tex, pixel.xy, result);
}
