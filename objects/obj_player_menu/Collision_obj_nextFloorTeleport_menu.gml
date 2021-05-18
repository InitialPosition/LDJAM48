/// @description 

if (other.image_index == 1) {
	if (!playedSound) {
		playedSound = true;
		
		global.PAUSE_TRANSITION = true;
		
		audio_stop_all();
		audio_play_sound(snd_hatch, 1, false);
		
		instance_create_layer(0, 0, "Instances", obj_gameStats);
		
		var nextRoom = scr_getRandomRoomForFloor(0);
		
		fade_initializeFade(nextRoom, c_black, 2000);
	}
	
	// animate going into the trapdoor
    x = lerp(x, other.x + 3, 0.1);
    y = lerp(y, other.y, 0.1);
}
