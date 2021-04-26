// gets run once on game startup

function scr_init() {
    // DECLARE SOME GLOBAL VARIABLES
    global.GAME_NAME = "Trapdoor in the Garden";
    global.AUTHOR = "InitialPosition";
    global.VERSION = string(GM_version);

    global.CONFIG_PATH = working_directory + "config.ini";
    global.SAVEGAME_PATH = working_directory + "save.ld";

    // define pause macros and variables
    global.PAUSE_GAME = false;
    #macro PAUSABLE_GAME if (global.PAUSE_GAME) {exit;}
    
    global.PAUSE_TRANSITION = false;
    #macro PAUSABLE_TRANSITION if (global.PAUSE_TRANSITION) {exit;}
    
    global.CASTLE_LEVELS_BEGIN = 25;
    global.END_LEVELS_BEGIN = 49;
    global.SHOOTER_LEVELS_BEGIN = 9;

    // if we have a config, load, otherwise initialize new one
    if (scr_hasConfig()) {
        scr_loadConfig();
    } else {
        scr_initConfig();
    }

    // after config loading, we can set some more window properties
    window_set_caption(global.GAME_NAME);

    window_set_min_width(426);
    window_set_min_height(240);
    window_set_max_width(3840);
    window_set_max_height(2160);

    window_set_fullscreen(global.IS_FULLSCREEN);
    scr_windowModifier_setWindowSize(global.WINDOW_WIDTH, global.WINDOW_HEIGHT);
    
    // audio
    if (!audio_group_is_loaded(audiogroup_sfx)) {
        audio_group_load(audiogroup_sfx);
    }
    
    audio_group_set_gain(audiogroup_default, global.VOLUME_MUSIC, 0);
    audio_group_set_gain(audiogroup_sfx, global.VOLUME_SOUND, 0);

    // start game
    randomize();
    room_goto(rm_mainMenu);
}
