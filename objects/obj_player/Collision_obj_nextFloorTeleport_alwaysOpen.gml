/// @description 

if (other.image_index == 1) {
    if (!audio_is_playing(snd_hatch)) {
        audio_play_sound(snd_hatch, 20, false);
    }
    
    // animate going into the trapdoor
    x = lerp(x, other.x + 3, 0.1);
    y = lerp(y, other.y, 0.1);
    
    scr_nextRoom();
}
