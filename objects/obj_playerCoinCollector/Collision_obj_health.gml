/// @description health up

if (other.collectable) {
	obj_gameStats.hitpoints = min(obj_gameStats.hitpoints + 1, obj_gameStats.maxHitpoints);
	
	if (audio_is_playing(snd_heartCollect)) {
		audio_stop_sound(snd_heartCollect);
	}
	audio_play_sound(snd_heartCollect, 20, false);
	
	with (other) {
	    instance_destroy();
	}
}
