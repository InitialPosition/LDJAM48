/// @description Volume controls

switch (selection) {
    case 3:
        if (global.VOLUME_MUSIC > 0) {
            global.VOLUME_MUSIC -= 0.05;
        }
        option[3] = "MUSIC: " + string(round(global.VOLUME_MUSIC * 100)) + "%";
		
		audio_group_set_gain(audiogroup_default, global.VOLUME_MUSIC, 0);
		
        break;
        
    case 4:
        if (global.VOLUME_SOUND > 0) {
            global.VOLUME_SOUND -= 0.05;
        }
        option[4] = "SOUND EFFECTS: " + string(round(global.VOLUME_SOUND * 100)) + "%";
		
		audio_group_set_gain(audiogroup_sfx, global.VOLUME_SOUND, 0);
		audio_play_sound(snd_lightning, 1, false);
		
        break;
}
