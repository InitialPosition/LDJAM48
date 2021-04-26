// @description 

if (other.image_index == 1) {
    if (!audio_is_playing(snd_hatch)) {
        audio_play_sound(snd_hatch, 20, false);
    }
    scr_nextRoom();
}
