// all scripts needed for config files

function scr_hasConfig() {
    return file_exists(global.CONFIG_PATH);
}

function scr_initConfig() {
    // default values
    // TODO set default controls
    global.VOLUME_MUSIC = 0.2;
    global.VOLUME_SOUND = 0.2;

    global.IS_FULLSCREEN = false;
    global.WINDOW_WIDTH = 1280;
    global.WINDOW_HEIGHT = 720;
    
    global.KEY_LEFT = vk_left;
    global.KEY_RIGHT = vk_right;
    global.KEY_UP = vk_up;
    global.KEY_DOWN = vk_down;
    
    global.KEY_ATTACK = ord("X");
    global.KEY_INTERACT = ord("E");

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
    ini_write_real("Control", "Attack", global.KEY_ATTACK);
    ini_write_real("Control", "Interact", global.KEY_INTERACT);

    ini_close();
}

function scr_loadConfig() {
    ini_open(global.CONFIG_PATH);

    global.VOLUME_MUSIC = ini_read_real("Volume", "Music", 0.5);
    global.VOLUME_SOUND = ini_read_real("Volume", "Sound", 0.5);

    global.IS_FULLSCREEN = ini_read_real("Display", "Fullscreen", 0);
    global.WINDOW_WIDTH = ini_read_real("Display", "Width", 1280);
    global.WINDOW_HEIGHT = ini_read_real("Display", "Height", 720);
    
    global.KEY_LEFT = ini_read_real("Control", "Left", vk_left);
    global.KEY_RIGHT = ini_read_real("Control", "Right", vk_right);
    global.KEY_UP = ini_read_real("Control", "Up", vk_up);
    global.KEY_DOWN = ini_read_real("Control", "Down", vk_down);
    global.KEY_ATTACK = ini_read_real("Control", "Attack", ord("X"));
    global.KEY_INTERACT = ini_read_real("Control", "Interact", ord("E"));

    ini_close();
}
