@group(0) @binding(0) var conv2d_last_tf_tex: texture_2d<f32>;
@group(0) @binding(1) var output_tex: texture_storage_2d<rgba16float, write>;

fn colorAt(texture: texture_2d<f32>, x: u32, y: u32) -> vec4<f32> {
    return textureLoad(texture, vec2u(x, y), 0);
}

@compute
@workgroup_size(8, 8)
fn computeMain(@builtin(global_invocation_id) pixel: vec3u) {
    let dim_out: vec2u = textureDimensions(tex_out);
    if (pixel.x >= dim_out.x || pixel.y >= dim_out.y) {
        return;
    }

    let loc: vec2u = pixel.xy / vec2u(2, 2);
    let sub_loc: vec2u = pixel.xy % vec2u(2, 2);
    let channel: u32 = sub_loc.y * 2 + sub_loc.x;
    let c0: f32 = colorAt(tex_0, loc.x, loc.y)[channel];
    let c1: f32 = c0;
    let c2: f32 = c1;
    let c3: f32 = c2;
    
    textureStore(tex_out, pixel.xy, vec4f(c0, c1, c2, c3));
}