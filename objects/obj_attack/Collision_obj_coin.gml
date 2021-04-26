/// @description Collect Coin

if (other.rayCollectable) {
    obj_gameStats.gold++;
    obj_gameStats.totalGold++;
	
	if (audio_is_playing(snd_coin)) {
		audio_stop_sound(snd_coin);
	}
	audio_play_sound(snd_coin, 20, false);
    
    with (other) {
        instance_destroy();
    }
}
