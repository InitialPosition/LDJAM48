/// @description 

alarm[0] = shootingFrequency;
sprite_index = spr_shooter;
instance_create_layer(x + 16, y + 4, "Instances", obj_shooter_bullet);

audio_play_sound(snd_shooterShoot, 10, false);
