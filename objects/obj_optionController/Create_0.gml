/// @description 

lock = false;

title = "OPTIONS\n(Arrow Keys: Move, ENTER: Select, B: Back to menu)";

resolutionStr = scr_getCurrentResolutionAsString();
option[0] = "RESOLUTION: " + resolutionStr;
currentResolutionIndex = scr_getIndexForResolutionString(resolutionStr);

fullscreenAnswer = global.IS_FULLSCREEN ? "YES" : "NO";
option[1] = "FULLSCREEN: " + fullscreenAnswer;
option[2] = "CONFIRM RESOLUTION CHANGES";

option[3] = "MUSIC: " + string(round(global.VOLUME_MUSIC * 100)) + "%";
option[4] = "SOUND EFFECTS: " + string(round(global.VOLUME_SOUND * 100)) + "%";

option[5] = "CHANGE KEY MAPPING";

selection = 0;

selectionIcon = "> ";
