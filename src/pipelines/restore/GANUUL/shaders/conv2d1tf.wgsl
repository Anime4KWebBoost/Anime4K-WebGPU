// Layer: Anime4K-v4.1-Restore-GAN-(UUL)-Conv-4x3x3x16
// Name: conv2d1tf
// Inputs: ['conv2d_tf', 'conv2d_tf1']
// Output: conv2d_1_tf
@group(0) @binding(0) var conv2d_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_tf1_tex: texture_2d<f32>;
@group(0) @binding(2) var conv2d_1_tf_tex: texture_storage_2d<rgba16float, write>;
fn max4(vector: vec4f, value: f32) -> vec4f {
  return max(vector, vec4f(value));
}

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_1(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(textureLoad(conv2d_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_2(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_tf_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}

fn go_3(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return max4(-textureLoad(conv2d_tf1_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0), 0.0);
}


@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_1_tf_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.023552546, -0.17976846, -0.032507695, 0.34888005, -0.10224707, 0.13343506, 0.06544117, 0.012628775, -0.14143938, -0.19284354, 0.21922144, -0.24267627, 0.60245264, -0.24113165, -0.22310556, -0.02382731) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.034701347, 0.07372663, 0.32609418, 0.11162037, -0.014141982, 0.07118311, -0.17728676, 0.11904929, -0.044187993, 0.10390664, -0.25206113, -0.27696803, -0.047686324, -0.1442619, 0.20605747, 0.06257326) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(-0.22148718, -0.01991937, 0.1064617, -0.040335968, 0.15501678, -0.23332876, 0.034576464, 0.0071954974, 0.29223567, -0.23055542, -0.2282997, -0.12242584, -0.37809116, -0.058991294, 0.39480785, 0.09886273) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.14810124, 0.016219528, -0.19418913, -0.007893501, -0.053713404, 0.049100377, -0.05975324, 0.18977694, -0.050193787, -0.21011077, 0.2016647, 0.14340237, 1.0558138, -0.33549616, 0.231785, -0.3162362) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.13609457, -0.08641219, -0.44855806, 0.3498321, 0.30400246, -0.03185214, -0.1854452, -0.010487082, -0.17215589, 0.03237537, 0.28143924, -0.08109354, 0.22742943, -1.2136713, -0.13101196, 0.25476894) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.13384807, 0.02634565, -0.0014585925, -0.119772, -0.22263676, 0.24358267, -0.29998726, 0.10864307, -0.025059542, 0.19892238, -0.48717195, -0.12713853, 0.0052565294, -0.06785795, -0.12660097, -0.2680154) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.050817262, -0.000118490156, 0.008932358, 0.12216974, 0.00651495, -0.045953527, -0.06928984, -0.059567403, -0.045261804, -0.09506907, -0.15795891, 0.40871626, 0.75113076, -0.2689173, 0.014691355, 0.17588368) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.098001294, 0.017431907, -0.129577, -0.5423294, 0.006492312, -0.3798156, -0.0912911, -0.4348394, -0.008890873, 0.056336716, 0.31541198, 0.2757727, 0.18999146, -0.4838279, -0.8643528, -0.23371552) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.12763253, 0.20787789, 0.014009273, -0.10351501, -0.10169546, 0.105827406, 0.08317957, 0.34155595, 0.09826027, 0.120087825, 0.00772547, -0.18460846, -0.057804313, -0.09804123, 0.23369344, -0.36933377) * go_0(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.016852003, -0.006062252, -0.12426935, 0.03895753, 0.015224101, 0.036187973, -0.12444835, 0.17155123, -0.21852624, -0.039858755, 0.030547414, -0.31835446, -0.1285454, 0.036886804, 0.120653056, 0.115938485) * go_1(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.0073105944, 0.0034892666, 0.16796911, 0.10596121, 0.053536925, -0.046282507, 0.04151762, 0.011876018, 0.038614176, -0.03580031, -0.119827464, -0.040998273, 0.07371248, 0.20536064, -0.11701863, 0.03227468) * go_1(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.060087442, -0.2968361, 0.13312283, -0.23400159, -0.23598443, -0.042868868, 0.18195826, 0.28549528, 0.34385213, 0.21937303, -0.29659066, -0.2519378, 0.086887576, -0.2174296, 0.105925284, -0.021433428) * go_1(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.13158737, 0.33106673, -0.17471395, -0.29580286, 0.06354943, 0.0942313, -0.0018473539, -0.036752637, -0.12811747, 0.17727722, -0.05052513, 0.02059626, 0.053381227, 0.051411, -0.040178068, 0.045549665) * go_1(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.08831061, -0.28157574, -0.1294387, -0.034455232, 0.23092915, 0.064474, -0.26692396, 0.12853913, 0.006096496, -0.17732559, -0.14009307, 0.21564251, 0.20883715, 0.10718936, -0.47879994, -0.5107674) * go_1(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.17679055, -0.03551305, 0.17372696, 0.25607085, -0.021303236, -0.116409995, 0.21391216, 0.1466252, 0.22911525, -0.11913164, 0.29034084, -0.08526714, -0.3873873, -0.21568687, 0.23877093, 0.42613512) * go_1(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.048116915, -0.08262296, -0.03324074, 0.13923667, -0.0062459446, -0.03517941, -0.009773409, -0.120674424, 0.15095374, -0.0005339233, 0.015473752, 0.14777213, 0.12814662, -0.05017428, -0.010744916, -0.23875938) * go_1(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.056450244, 0.11676627, -0.14198391, -0.045776248, 0.00897558, -0.058434367, 0.021832153, -0.52523935, -0.12343506, -0.11054828, 0.15865694, 0.09315367, -0.05297719, -0.10711813, 0.06007512, -0.08399776) * go_1(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.019619863, 0.20729768, 0.043339703, 0.025781998, 0.023497196, 0.028392693, -0.04190367, -0.04418058, -0.042211913, -0.15244623, 0.02924173, 0.21085598, -0.035596382, 0.2381614, -0.030051846, 0.13014893) * go_1(pixel.xy, 1, 1);
  result += mat4x4<f32>(-0.21234104, 0.041297037, -0.18101437, -0.2185761, 0.028981358, -0.081642486, -0.021145426, -0.009989747, 0.09318067, 0.16207193, -0.19826248, 0.16293178, -0.15917318, 0.06660727, 0.053039506, -0.1168678) * go_2(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.011286741, 0.14351663, -0.50032014, -0.026436124, -0.011840812, -0.07747942, 0.15334651, -0.14048274, -0.14003748, -0.047146395, -0.00042596797, 0.2566855, -0.03316183, 0.062969685, 0.043717206, -0.055696994) * go_2(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.30375633, -0.023652522, -0.007335798, 0.11816739, -0.0505561, 0.16002876, -0.10969625, 0.11233836, -0.19340275, 0.05881697, 0.3182961, -0.022817641, 0.42393655, -0.0420881, -0.22744067, -0.11468599) * go_2(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.19680668, -0.2718221, -0.109129034, -0.031820036, -0.014158195, 0.046111293, -0.14502439, -0.13337612, 0.09411394, 0.21357663, -0.20042713, -0.15176094, -0.0045771925, -0.031944096, 0.1550206, -0.03722588) * go_2(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.24317834, 0.18838319, 0.45047724, 0.18649562, -0.2095104, -0.0006020615, 0.08367084, -0.30320555, 0.07171591, -0.29137737, -0.049099058, 0.15327643, -0.24013925, 0.34259155, 0.115902506, 0.11450217) * go_2(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.016413163, 0.03915114, -0.015337155, 0.09729268, 0.29813018, -0.17131683, -0.2312706, 0.10482244, -0.2066783, -0.3365877, 0.2263724, 0.43815294, 0.036072776, 0.105696954, 0.077359736, 0.008051612) * go_2(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.12033027, 0.2112806, 0.017177183, -0.09654978, 0.07329572, 0.13259365, 0.011394168, 0.0069998833, -0.16171043, -0.02289922, 0.11146632, -0.33248207, -0.017027456, -0.10894563, -0.03257589, 0.021239217) * go_2(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.031499073, -0.27365288, -0.064902805, 0.124796495, -0.023522072, -0.02951537, 0.04670401, 0.27531293, 0.43533918, 0.0585005, -0.15084462, -0.40506473, -0.32984722, -0.15036964, 0.07660922, -0.0032199689) * go_2(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.115331754, -0.09803054, -0.024313536, 0.14555499, 0.23887083, -0.29849875, -0.26729763, 0.184482, 0.09255375, -0.10736947, -0.04150894, -0.0010320714, -0.051008355, -0.104129285, -0.08903581, 0.22098938) * go_2(pixel.xy, 1, 1);
  result += mat4x4<f32>(0.06769511, -0.03238206, -0.068165705, -0.14739762, -0.061350193, 0.004104931, 0.11618826, 0.010067987, 0.02997295, 0.09301918, -0.12241719, 0.24177656, 0.22807428, -0.02756493, -0.0748496, -0.047249116) * go_3(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.18760902, 0.18009059, -0.0020327838, -0.21866414, -0.031515904, -0.05650113, -0.12750417, 0.103761345, 0.06476017, -0.3304871, -0.07148537, 0.24832407, -0.13958152, -0.09241458, 0.22140716, 0.08166865) * go_3(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.26009315, -0.010701869, 0.023371957, -0.21740876, 0.17189556, 0.15437202, -0.14821805, -0.27689627, -0.2479749, -0.47549838, 0.32036334, 0.013038371, 0.14058238, 0.30515867, -0.26070523, 0.04663332) * go_3(pixel.xy, -1, 1);
  result += mat4x4<f32>(-0.020923758, -0.032509495, 0.12358641, 0.4433483, -0.06527426, -0.07173554, -0.11908415, -0.072907776, -0.0026322093, 0.045405984, 0.14449333, 0.18437918, 0.064828105, -0.151514, 0.091675825, 0.13046047) * go_3(pixel.xy, 0, -1);
  result += mat4x4<f32>(-0.026943995, -0.07820492, -0.103887096, -0.3451598, 0.047472734, 0.0033870118, 0.440715, -0.20901312, 0.20392485, 0.2621361, 0.12270217, -0.24512972, -0.049621828, -0.22698936, 0.2641905, 0.009628438) * go_3(pixel.xy, 0, 0);
  result += mat4x4<f32>(-0.20713174, 0.195439, 0.058581114, -0.10963195, 0.0812059, 0.011282248, -0.18487422, -0.016993608, 0.19099854, -0.3759483, -0.5897507, 0.14572738, 0.23315357, 0.10245343, 0.043103352, -0.46267846) * go_3(pixel.xy, 0, 1);
  result += mat4x4<f32>(0.022161806, -0.00090681383, 0.052800614, 0.18393794, -0.027101398, 0.0014004739, 0.05572843, 0.118573196, -0.19916826, -0.02380698, 0.116629034, -0.28870407, 0.008048728, 0.053172585, -0.021419706, 0.09050276) * go_3(pixel.xy, 1, -1);
  result += mat4x4<f32>(-0.016204836, 0.19174457, 0.2839895, 0.17540698, -0.123605736, -0.0061563863, 0.0028344695, 0.32647628, 0.057774115, 0.06937624, -0.13302265, -0.16724658, -0.12756115, 0.13584238, 0.078516625, 0.09640836) * go_3(pixel.xy, 1, 0);
  result += mat4x4<f32>(0.120685734, -0.21064857, -0.16614036, -0.26340094, -0.06945371, 0.04921331, -0.020397125, 0.074044324, 0.23755525, -0.003564956, -0.06143462, -0.1825731, -0.11152944, -0.30590633, -0.054638807, -0.27331424) * go_3(pixel.xy, 1, 1);
  result += vec4f(0.04903664, 0.055879604, 0.072665684, -0.063299604);
  textureStore(conv2d_1_tf_tex, pixel.xy, result);
}