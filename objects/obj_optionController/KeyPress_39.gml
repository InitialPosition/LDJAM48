/// @description Volume Controls

switch (selection) {
    case 2:
        if (global.VOLUME_MUSIC < 1) {
            global.VOLUME_MUSIC += 0.05;
        }
        option[2] = "MUSIC: " + string(round(global.VOLUME_MUSIC * 100)) + "%";
        break;
        
    case 3:
        if (global.VOLUME_SOUND < 1) {
            global.VOLUME_SOUND += 0.05;
        }
        option[3] = "SOUND EFFECTS: " + string(round(global.VOLUME_SOUND * 100)) + "%";
        break;
}
