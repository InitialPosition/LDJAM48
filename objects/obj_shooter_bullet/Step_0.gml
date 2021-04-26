/// @description 

if (x < -OOB || x > room_width + OOB || y > room_height + OOB || y < -OOB) {
    instance_destroy();
}
part_emitter_region(system, emit, x - 8, x + 8, y - 8, y + 8, ps_shape_ellipse, ps_distr_gaussian);
