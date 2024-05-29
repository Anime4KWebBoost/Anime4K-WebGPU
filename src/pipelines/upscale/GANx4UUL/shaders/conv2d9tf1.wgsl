// Layer: Anime4K-v4.1-Upscale-GAN-x4-(UUL)-Conv-4x1x1x80
// Name: conv2d9tf1
// Inputs: ['conv2d_6_tf', 'conv2d_6_tf1', 'conv2d_6_tf2', 'conv2d_6_tf3', 'conv2d_6_tf4', 'conv2d_6_tf5', 'conv2d_8_tf', 'conv2d_1_tf', 'conv2d_4_tf', 'conv2d_7_tf']
// Output: conv2d_9_tf1
@group(0) @binding(0) var conv2d_6_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_6_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_6_tf2_tex: texture_2d<f32>;
@group(0) @binding(3) var conv2d_6_tf3_tex: texture_2d<f32>;
@group(0) @binding(4) var conv2d_6_tf4_tex: texture_2d<f32>;
@group(0) @binding(5) var conv2d_6_tf5_tex: texture_2d<f32>;
@group(0) @binding(6) var conv2d_8_tf_tex: texture_2d<f32>;
@group(0) @binding(7) var conv2d_1_tf_tex: texture_2d<f32>;
@group(0) @binding(8) var conv2d_4_tf_tex: texture_2d<f32>;
@group(0) @binding(9) var conv2d_7_tf_tex: texture_2d<f32>;
@group(0) @binding(10) var conv2d_9_tf1_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn g_0(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_6_tf_tex, pos, 0), 0.0);
}

fn g_1(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_6_tf1_tex, pos, 0), 0.0);
}

fn g_2(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_6_tf2_tex, pos, 0), 0.0);
}

fn g_3(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_6_tf3_tex, pos, 0), 0.0);
}

fn g_4(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_6_tf4_tex, pos, 0), 0.0);
}

fn g_5(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_6_tf5_tex, pos, 0), 0.0);
}

fn g_6(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf_tex, pos, 0), 0.0);
}

fn g_7(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf1_tex, pos, 0), 0.0);
}

fn g_8(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf2_tex, pos, 0), 0.0);
}

fn g_9(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf3_tex, pos, 0), 0.0);
}

fn g_10(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf4_tex, pos, 0), 0.0);
}

fn g_11(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_6_tf5_tex, pos, 0), 0.0);
}

fn g_12(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_8_tf_tex, pos, 0), 0.0);
}

fn g_13(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_8_tf_tex, pos, 0), 0.0);
}

fn g_14(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_1_tf_tex, pos, 0), 0.0);
}

fn g_15(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_1_tf_tex, pos, 0), 0.0);
}

fn g_16(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_4_tf_tex, pos, 0), 0.0);
}

fn g_17(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_4_tf_tex, pos, 0), 0.0);
}

fn g_18(pos: vec2u) -> vec4f {
  return max4(textureLoad(conv2d_7_tf_tex, pos, 0), 0.0);
}

fn g_19(pos: vec2u) -> vec4f {
  return max4(-textureLoad(conv2d_7_tf_tex, pos, 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_9_tf1_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(0.029247807, 0.43012354, -0.07769897, 0.15838203, -0.13324478, 0.017804278, 0.21924987, -0.024039736, -0.20728067, 0.044956654, 0.03079796, -0.23534241, -0.0500509, -0.18794334, 0.27260718, 0.24131943) * g_0(pixel.xy);
  result += mat4x4<f32>(0.1303224, -0.32837823, -0.09135343, 0.05029881, 0.29270905, -0.042230245, 0.13552578, -0.022074893, -0.22813024, 0.16917036, -0.19837584, -0.025336651, -0.017484624, -0.07434934, -0.022696782, 0.14180793) * g_1(pixel.xy);
  result += mat4x4<f32>(-0.17257185, 0.016180463, -0.16395493, -0.12969042, -0.17320508, -0.17256051, 0.124869406, -0.041106623, -0.29951182, -0.062248964, 0.14418627, 0.113648884, 0.19480251, -0.14825127, -0.30102882, 0.2543297) * g_2(pixel.xy);
  result += mat4x4<f32>(-0.17920358, -0.056560468, -0.05815734, -0.094284005, 0.074466944, -0.1708937, 0.05045378, 0.22309071, 0.07125439, 0.1243207, 0.0996307, 0.11177492, -0.20849244, -0.016035903, 0.066763505, -0.03865284) * g_3(pixel.xy);
  result += mat4x4<f32>(0.10919598, -0.05991637, 0.22679056, 0.07574283, 0.11607126, -0.12619832, -0.11305337, 0.09875149, -0.093926236, -0.31168574, 0.12892371, 0.03084246, -0.025373377, -0.18546598, -0.10146844, -0.06607364) * g_4(pixel.xy);
  result += mat4x4<f32>(-0.0284226, -0.13437645, -0.01047342, -0.0643442, -0.112065926, 0.28130296, -0.028859612, 0.20614125, -0.104703404, -0.25221863, 0.06305746, 0.008987997, -0.06367191, -0.039423067, 0.55190355, 0.1131621) * g_5(pixel.xy);
  result += mat4x4<f32>(0.017900897, 0.19151299, -0.012729769, -0.3720392, -0.043568056, 0.021792412, -0.14938483, -0.04563565, 0.13666408, 0.15488137, -0.058843106, 0.026964363, 0.2275412, -0.051935695, -0.3025488, 0.032634325) * g_6(pixel.xy);
  result += mat4x4<f32>(0.080183186, 0.49439004, 0.09187155, 0.058713455, -0.14579555, -0.16108377, -0.074885435, 0.16271885, -0.02726071, 0.3746404, -0.07175874, 0.12927002, 0.048367534, 0.0068023684, -0.01004529, -0.10857275) * g_7(pixel.xy);
  result += mat4x4<f32>(0.30240306, -0.05872737, 0.09092156, -0.044823427, 0.13460608, 0.27104214, -0.21677399, -0.078722954, 0.21395817, -0.27020204, 0.03407373, -0.27704158, -0.14948608, 0.045992948, 0.5086244, -0.14568712) * g_8(pixel.xy);
  result += mat4x4<f32>(0.04736869, -0.012021483, -0.23633002, -0.09218725, 0.049316257, 0.031919852, 0.109669484, 0.028117038, -0.05681596, -0.19797502, 0.066302285, -0.16133904, -0.11359791, 0.047595903, -0.15282372, 0.14841823) * g_9(pixel.xy);
  result += mat4x4<f32>(0.025813673, 0.18983132, -0.32590774, -0.017710522, 0.20602965, -0.06116333, 0.2023164, -0.38438424, 0.06915477, 0.077189915, 0.14604315, 0.21469697, 0.2905641, 0.099070854, -0.15827921, 0.09761589) * g_10(pixel.xy);
  result += mat4x4<f32>(-0.045127008, 0.18940306, -0.08118834, 0.02602074, 0.0945136, -0.07572827, 0.058015335, -0.054117456, 0.13638207, -0.06921914, -0.018934516, -0.21474637, 0.072837576, 0.38855672, -0.2214727, -0.07032989) * g_11(pixel.xy);
  result += mat4x4<f32>(-0.14499478, -0.103144266, -0.06795675, 0.097279154, -0.15780063, -0.00092860113, -0.06560443, 0.046918143, 0.116832, -0.041867204, -0.04294921, -0.16297981, 0.0017979478, -0.14739467, 0.06300005, -0.018958041) * g_12(pixel.xy);
  result += mat4x4<f32>(-0.023155538, 0.013861143, 0.10273995, -0.23301847, -0.06355406, 0.23065268, 0.0100112315, 0.12967634, -0.015230428, 0.00040594305, 0.09417989, 0.24173634, 0.055267353, 0.0818368, -0.07358038, 0.11633795) * g_13(pixel.xy);
  result += mat4x4<f32>(-0.033157397, -0.060810838, 6.0726292e-05, -0.07492996, -0.08209274, 0.036523078, 0.037038907, -0.0371525, 0.008616722, -0.25722533, 0.11118201, 0.00083808816, -0.16973083, -0.049985297, 0.016049283, 0.04555759) * g_14(pixel.xy);
  result += mat4x4<f32>(-0.02391044, -0.12006143, -0.0040827403, -0.045583934, 0.005460344, 0.0015913033, -0.0840245, 0.06921067, 0.13523246, 0.25881252, 0.06931116, 0.12808272, -0.08047311, -0.0036380326, 0.029610094, -0.1336764) * g_15(pixel.xy);
  result += mat4x4<f32>(0.07438417, 0.057508536, 0.34985167, 0.11944369, -0.21246617, -0.16596083, -0.31279483, -0.24151649, -0.090715386, -0.007790705, -0.10482516, 0.10915042, -0.08405226, 0.09904896, -0.08101267, -0.36275923) * g_16(pixel.xy);
  result += mat4x4<f32>(0.032126356, 0.011326541, -0.2710429, -0.018045785, -0.024174925, 0.10995586, 0.32196537, -0.16372478, 0.005468728, -0.1943689, -0.111603215, -0.08804184, 0.039886538, 0.15763853, -0.011543824, -0.32507792) * g_17(pixel.xy);
  result += mat4x4<f32>(0.02271385, 0.06408109, 0.02209524, 0.061272632, -0.12502407, -0.21633519, -0.34524658, 0.018734034, -0.2399288, 0.08478751, 0.1332156, -0.15286094, -0.10991463, -0.41120422, -0.3367541, -0.015484429) * g_18(pixel.xy);
  result += mat4x4<f32>(0.109604605, -0.13112773, 0.034937084, -0.3441579, -0.22917384, 0.13396077, 0.13513319, 0.013879127, 0.09909886, -0.2781385, 0.10821879, 0.0012182732, 0.141571, -0.039386883, 0.2155932, -0.039853897) * g_19(pixel.xy);
  result += vec4f(0.011448396, 0.020379832, -0.0022957225, 0.013202214);
  textureStore(conv2d_9_tf1_tex, pixel.xy, result);
}