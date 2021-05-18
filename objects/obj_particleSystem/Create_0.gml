/// @description Create particle system and load particles

system = part_system_create();
part_system_depth(system, 100);

emit = part_emitter_create(system);

partAmount = 1;

if (instance_exists(obj_gameStats)) {
	if (obj_gameStats.currentFloor < global.CASTLE_LEVELS_BEGIN) {
		particle = scr_particlesBGMist(120, 200, 200);
	}
	else if (obj_gameStats.currentFloor < global.END_LEVELS_BEGIN) {
		particle = scr_particlesBGMist(300, 200, 200);
	}
	else {
		particle = scr_particlesBGMist(180, 225, 200);
		partAmount = 2;
	}
} else {
	particle = scr_particlesBGMist(0, 0, 200);
}
part_emitter_region(system, emit, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(system, emit, particle, partAmount);
