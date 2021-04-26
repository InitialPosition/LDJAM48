/// @description 

alarm[1] = 30;
sprite_index = spr_shooter_charging;

if (audio_is_playing(snd_shooterPowering)) {
	audio_stop_sound(snd_shooterPowering);
}

audio_play_sound(snd_shooterPowering, 20, false);
