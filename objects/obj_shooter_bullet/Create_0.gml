/// @description 

event_inherited();
move_towards_point(obj_player.x + 12, obj_player.y + 12, 2);

reflected = false;

system = part_system_create();
emit = part_emitter_create(system);

OOB = 100;

particle = scr_particlesShooterBullet();

part_emitter_region(system, emit, x - 8, x + 8, y - 8, y + 8, ps_shape_ellipse, ps_distr_gaussian);

burstSpeed = 3;
part_emitter_burst(system, emit, particle, 1);
alarm[0] = burstSpeed;
