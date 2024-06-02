// Layer: Anime4K-v4.0-Restore-CNN-Soft-(VL)-Conv-4x3x3x3
// Name: conv2dtf1
// Inputs: ['MAIN']
// Output: conv2d_tf1
@group(0) @binding(0) var MAIN_tex: texture_2d<f32>;
@group(0) @binding(1) var conv2d_tf1_tex: texture_storage_2d<rgba16float, write>;

fn go_0(pos: vec2u, x_off: i32, y_off: i32) -> vec4f {
  return textureLoad(MAIN_tex, vec2i(i32(pos.x) + x_off, i32(pos.y) + y_off), 0);
}

@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_out: vec2u = textureDimensions(conv2d_tf1_tex);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }
  
  var result: vec4f = vec4f(0.0);
  result += mat4x4<f32>(-0.16406488, -0.2506693, -0.15592022, -0.05529256, -0.3997277, -0.229681, -0.07762124, 0.1843808, 0.07895815, 0.14437248, 0.219114, -0.048090722, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, -1);
  result += mat4x4<f32>(-0.2150676, 0.09080163, 0.19598733, -0.40578827, -0.33846557, -0.02518622, 0.037079208, 0.20188439, -0.013777575, -0.2369007, -0.30985412, 0.0411912, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 0);
  result += mat4x4<f32>(0.119948365, 0.23014452, -0.14962277, -0.096262485, 0.09625151, 0.2025487, 0.03933539, 0.12268028, -0.24373281, 0.19730613, 0.11634144, 0.12293635, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, -1, 1);
  result += mat4x4<f32>(0.08030697, -0.40114692, 0.21532272, 0.20222071, 0.073098, -0.004463858, 0.02820587, -0.18861918, -0.20994501, -0.12444653, -0.23178193, -0.13965288, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, -1);
  result += mat4x4<f32>(0.14150894, 0.14563078, 0.697704, 0.20918849, 0.26776335, -0.34291518, 0.06394055, 0.17925078, 0.4165139, -0.042595536, 0.105312675, 0.231854, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 0);
  result += mat4x4<f32>(0.024318576, 0.16668217, 0.0729521, -0.7071404, 0.3121693, 0.37295797, -0.015632952, 0.33763757, 0.00706697, 0.10836652, -0.11132417, 0.292844, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 0, 1);
  result += mat4x4<f32>(-0.14489831, 0.0027769986, -0.24509215, 0.5557927, -0.1104541, 0.005070684, -0.020032275, -0.5642205, 0.16048644, 0.07248175, 0.20387374, -0.38145426, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, -1);
  result += mat4x4<f32>(0.33140838, -0.007438425, 0.26074782, 0.15947102, 0.219755, -0.14690271, -0.07412696, -0.24176367, -0.2230114, 0.027256912, -0.11255796, -0.05882673, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 0);
  result += mat4x4<f32>(-0.19712369, 0.003842208, -0.10893768, 0.09047115, -0.10260409, 0.18662766, 0.009733428, 0.0039940844, -0.006444674, -0.15196493, 0.06641555, -0.06169452, 0.0, 0.0, 0.0, 0.0) * go_0(pixel.xy, 1, 1);
  result += vec4f(-0.029148052, -0.03215124, -0.6175828, 0.057135154);
  textureStore(conv2d_tf1_tex, pixel.xy, result);
}
