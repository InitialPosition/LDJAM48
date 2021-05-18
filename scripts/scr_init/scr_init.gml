// gets run once on game startup

function scr_init() {
	
    // disable mouse cursor
    window_set_cursor(cr_none);
    
    // DECLARE SOME GLOBAL VARIABLES
    global.GAME_NAME = "Trapdoor in the Garden";
    global.AUTHOR = "InitialPosition";
    global.VERSION = GM_version;

    global.CONFIG_PATH = working_directory + "config.ini";
    global.SAVEGAME_PATH = working_directory + "save.ld";

    // define pause macros and variables
    global.PAUSE_GAME = false;
    #macro PAUSABLE_GAME if (global.PAUSE_GAME) {exit;}
    
    global.PAUSE_TRANSITION = false;
    #macro PAUSABLE_TRANSITION if (global.PAUSE_TRANSITION) {exit;}
    
	global.FIRST_SHOP = 5;
    global.CASTLE_LEVELS_BEGIN = 25;
    global.END_LEVELS_BEGIN = 49;
    global.SHOOTER_LEVELS_BEGIN = 9;
    
    global.UPDATE_CHECKED = false;
    global.UPDATE_CHECK_RESULT = 0;
    
    scr_updateLocalVersion(120);
	
	// if config was created before control update, force delete
	oldConfigDeleted = false;
	
	ini_open(global.CONFIG_PATH);
	if (!ini_key_exists("Control", "AttackLeft")) {
		show_debug_message("Found outdated config! Force reinitializing controls...");
		
		// save everything but the controls
		global.VOLUME_MUSIC = ini_read_real("Volume", "Music", 0.5);
		global.VOLUME_SOUND = ini_read_real("Volume", "Sound", 0.5);

		global.IS_FULLSCREEN = ini_read_real("Display", "Fullscreen", 0);
		global.WINDOW_WIDTH = ini_read_real("Display", "Width", 1280);
		global.WINDOW_HEIGHT = ini_read_real("Display", "Height", 720);
		
		ini_close();
	
		file_delete(global.CONFIG_PATH);
		oldConfigDeleted = true;
	} else {
		ini_close();
	}	
		
    // if we have a config, load, otherwise initialize new one
    if (scr_hasConfig()) {		
        scr_loadConfig();
    } else {
        scr_initConfig(oldConfigDeleted);
    }

    // after config loading, we can set some more window properties
    window_set_caption(global.GAME_NAME);

    window_set_min_width(640);
    window_set_min_height(360);
    window_set_max_width(3840);
    window_set_max_height(2160);

    window_set_fullscreen(global.IS_FULLSCREEN);
    scr_windowModifier_setWindowSize(global.WINDOW_WIDTH, global.WINDOW_HEIGHT);
    
    // audio
    if (!audio_group_is_loaded(audiogroup_sfx)) {
        audio_group_load(audiogroup_sfx);
    }
    
    // controller options
    global.CONTROLLER_DEADZONE_MOVEMENT = 0.4;
    global.CONTROLLER_DEADZONE_ATTACK = 0.5;
    
    // volume set
    audio_group_set_gain(audiogroup_default, global.VOLUME_MUSIC, 0);
    audio_group_set_gain(audiogroup_sfx, global.VOLUME_SOUND, 0);

    // start game
    randomize();
    room_goto(rm_mainMenu);
}
