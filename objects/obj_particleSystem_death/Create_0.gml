/// @description Create particle system and load particles

system = part_system_create();
part_system_depth(system, 500);

emit = part_emitter_create(system);

particle = scr_particlesBGMist(300, 200, 200);

part_emitter_region(system, emit, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_invgaussian);
part_emitter_stream(system, emit, particle, 1);
