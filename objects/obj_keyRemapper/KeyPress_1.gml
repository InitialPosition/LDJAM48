/// @description 

switch (currentInstruction) {
    
    case 0:
        global.KEY_LEFT = keyboard_lastkey;
        break;
    case 1:
        global.KEY_RIGHT = keyboard_lastkey;
        break;
    case 2:
        global.KEY_UP = keyboard_lastkey;
        break;
    case 3:
        global.KEY_DOWN = keyboard_lastkey;
        break;
    case 4:
        global.KEY_ATTACK_LEFT = keyboard_lastkey;
        break;
    case 5:
        global.KEY_ATTACK_RIGHT = keyboard_lastkey;
        break;
    case 6:
        global.KEY_ATTACK_UP = keyboard_lastkey;
        break;
    case 7:
        global.KEY_ATTACK_DOWN = keyboard_lastkey;
        break;
}

currentInstruction++;
if (currentInstruction == 8) {
    scr_saveConfig();
    
    obj_optionController.lock = false;
    instance_destroy();
}