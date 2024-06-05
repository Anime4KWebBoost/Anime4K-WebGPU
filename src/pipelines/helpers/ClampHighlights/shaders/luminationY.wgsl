@group(0) @binding(0) var tex_in: texture_2d<f32>; // lumination X
@group(0) @binding(1) var tex_out: texture_storage_2d<rgba16float, write>; // lumination Y

fn lumaAt(x: u32, y: u32) -> vec4f {
  return textureLoad(tex_in, vec2u(x, y), 0);
}

@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
  // OOB check
  let dim_in: vec2u = textureDimensions(tex_in);
  let dim_out: vec2u = textureDimensions(tex_out);
  if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
    return;
  }

  let KERNEL_SIZE: u32 = 5;
  let KERNEL_HALF: u32 = 2;

  var gmax: f32 = 0.0;
  for (var i: u32 = 0; i < KERNEL_SIZE; i = i + 1) {
    let g: f32 = lumaAt(pixel.x, pixel.y + i - KERNEL_HALF).x;
    gmax = max(gmax, g);
  }
  textureStore(tex_out, vec2u(pixel.x, pixel.y), vec4f(gmax, 0, 0, 1));
}
