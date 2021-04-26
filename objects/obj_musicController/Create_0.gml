/// @description 

switch (room) {
    case rm_garden0:
    case rm_garden1:
    case rm_garden2:
    case rm_garden3:
    case rm_garden4:
    case rm_garden5:
    case rm_garden6:
    case rm_garden7:
    case rm_garden8:
        if (!audio_is_playing(mus_garden)) {
			audio_stop_all();
            audio_play_sound(mus_garden, 20, 1);
        }
        break;
	
	case rm_castle0:
	case rm_castle1:
	case rm_castle2:
	case rm_castle3:
	case rm_castle4:
	case rm_castle5:
	case rm_castle6:
	case rm_castle7:
	case rm_castle8:
		if (!audio_is_playing(mus_castle)) {
			audio_stop_all();
            audio_play_sound(mus_castle, 20, 1);
        }
        break;
	
	case rm_end0:
	case rm_end1:
	case rm_end2:
	case rm_end3:
	case rm_end4:
	case rm_end5:
	case rm_end6:
	case rm_end7:
	case rm_end8:
		if (!audio_is_playing(mus_final)) {
			audio_stop_all();
            audio_play_sound(mus_final, 20, 1);
        }
        break;
	
	case rm_shop:
		if (!audio_is_playing(mus_shop)) {
			audio_stop_all();
            audio_play_sound(mus_shop, 20, 1);
        }
        break;
	
	case rm_mainMenu:
		if (!audio_is_playing(mus_mainMenu)) {
			audio_stop_all();
            audio_play_sound(mus_mainMenu, 20, 1);
        }
        break;
}
