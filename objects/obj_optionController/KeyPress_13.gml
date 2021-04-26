/// @description Handle selections

switch (selection) {
    case 0: 
        currentResolutionIndex++;
        if (currentResolutionIndex > 6) {
            currentResolutionIndex = 0;
        }
        
        newResolution = scr_windowModifier_getResolutionForIndex(currentResolutionIndex);
        
        global.WINDOW_WIDTH = newResolution[0];
        global.WINDOW_HEIGHT = newResolution[1];
        
        option[0] = "RESOLUTION: " + string(newResolution[0]) + "x" + string(newResolution[1]);
        
        break;
    
    case 1:
        if (global.IS_FULLSCREEN) {
            global.IS_FULLSCREEN = false;
        } else {
            global.IS_FULLSCREEN = true;
        }
        fullscreenAnswer = global.IS_FULLSCREEN ? "YES" : "NO";
        option[1] = "FULLSCREEN: " + fullscreenAnswer;
        
        break;
    
    case 4:
        window_set_fullscreen(global.IS_FULLSCREEN);
        scr_windowModifier_setWindowSize(global.WINDOW_WIDTH, global.WINDOW_HEIGHT);
        
        audio_group_set_gain(audiogroup_default, global.VOLUME_MUSIC, 0);
        audio_group_set_gain(audiogroup_sfx, global.VOLUME_SOUND, 0);
        
        scr_saveConfig();
        
        break;
}
