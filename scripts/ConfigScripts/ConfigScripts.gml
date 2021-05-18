// all scripts needed for config files

function scr_hasConfig() {
    return file_exists(global.CONFIG_PATH);
}

function scr_initConfig(onlyInitKeys) {
    // default values
	
	if (!onlyInitKeys) {
		global.VOLUME_MUSIC = 0.2;
		global.VOLUME_SOUND = 0.2;
	
	    global.IS_FULLSCREEN = false;
	    global.WINDOW_WIDTH = 1280;
	    global.WINDOW_HEIGHT = 720;
	}
	
	global.KEY_LEFT = ord("A");
    global.KEY_RIGHT = ord("D");
    global.KEY_UP = ord("W");
    global.KEY_DOWN = ord("S");
    
    global.KEY_ATTACK_LEFT = vk_left;
    global.KEY_ATTACK_RIGHT = vk_right;
    global.KEY_ATTACK_UP = vk_up;
    global.KEY_ATTACK_DOWN = vk_down;

    scr_saveConfig();
}

function scr_saveConfig() {
    ini_open(global.CONFIG_PATH);

    ini_write_real("Volume", "Music", global.VOLUME_MUSIC);
    ini_write_real("Volume", "Sound", global.VOLUME_SOUND);

    ini_write_real("Display", "Fullscreen", global.IS_FULLSCREEN);
    ini_write_real("Display", "Width", global.WINDOW_WIDTH);
    ini_write_real("Display", "Height", global.WINDOW_HEIGHT);
    
    ini_write_real("Control", "Left", global.KEY_LEFT);
    ini_write_real("Control", "Right", global.KEY_RIGHT);
    ini_write_real("Control", "Up", global.KEY_UP);
    ini_write_real("Control", "Down", global.KEY_DOWN);
    
    ini_write_real("Control", "AttackLeft", global.KEY_ATTACK_LEFT);
    ini_write_real("Control", "AttackRight", global.KEY_ATTACK_RIGHT);
    ini_write_real("Control", "AttackUp", global.KEY_ATTACK_UP);
    ini_write_real("Control", "AttackDown", global.KEY_ATTACK_DOWN);

    ini_close();
}

function scr_loadConfig() {
    ini_open(global.CONFIG_PATH);

    global.VOLUME_MUSIC = ini_read_real("Volume", "Music", 0.5);
    global.VOLUME_SOUND = ini_read_real("Volume", "Sound", 0.5);

    global.IS_FULLSCREEN = ini_read_real("Display", "Fullscreen", 0);
    global.WINDOW_WIDTH = ini_read_real("Display", "Width", 1280);
    global.WINDOW_HEIGHT = ini_read_real("Display", "Height", 720);
    
    global.KEY_LEFT = ini_read_real("Control", "Left", ord("A"));
    global.KEY_RIGHT = ini_read_real("Control", "Right", ord("D"));
    global.KEY_UP = ini_read_real("Control", "Up", ord("W"));
    global.KEY_DOWN = ini_read_real("Control", "Down", ord("S"));
    
    global.KEY_ATTACK_LEFT = ini_read_real("Control", "AttackLeft", vk_left);
    global.KEY_ATTACK_RIGHT = ini_read_real("Control", "AttackRight", vk_right);
    global.KEY_ATTACK_UP = ini_read_real("Control", "AttackUp", vk_up);
    global.KEY_ATTACK_DOWN = ini_read_real("Control", "AttackDown", vk_down);

    ini_close();
}
