
function scr_generateRoomGoal(buttonOverride) {
    
    if (!buttonOverride) {
        roomGoal = choose("BUTTONS", "MONSTERS");
    } else {
        roomGoal = "BUTTONS";
    }
    
    switch (roomGoal) {
        case "BUTTONS":
            enabledButtons = 0;
            objectiveCount = irandom_range(2, 3);
            
            repeat objectiveCount scr_generateDoorButton();
            show_debug_message("Setting text to button")
            obj_gameStats.objective = "ACTIVATE ALL BUTTONS!";
            break;
        case "MONSTERS":
            deathCount = 0;
            
            successfulMonsterObjective = true;
            scr_generateMonsterObjective();
            
            if (successfulMonsterObjective) {
                show_debug_message("Setting text to monster")
                if (objectiveCount > 1) {
                    obj_gameStats.objective = "DEFEAT " + string(objectiveCount) + " MONSTERS!";
                } else {
                    obj_gameStats.objective = "DEFEAT " + string(objectiveCount) + " MONSTER!";
                }
                
                if (objectiveCount == monsterCount) {
                    obj_gameStats.objective = "DEFEAT ALL MONSTERS!";
                }
                break;
            }
    }
}

function scr_generateDoorButton() {
    var button = instance_create_layer(random_range(128, 480), random_range(128, 288), "Instances_Background", obj_nextFloorButton);
}

function scr_generateMonsterObjective() {
    // count monsters (substracting bats since they are not killable)
    monsterCount = instance_number(obj_mob) - instance_number(obj_bat);
    objectiveCount = irandom_range(ceil(monsterCount / 2), monsterCount);
    
    if (objectiveCount == 0) {
        // no killable monsters spawned, hard switch to button challenge
        successfulMonsterObjective = false;
        
        show_debug_message("Hard switched objective")
        scr_generateRoomGoal(true);
    }
}

function scr_deathObjectiveUpdate(value) {
    with (obj_nextFloorTeleport) {
        if (!generating) {
            if (roomGoal == "MONSTERS") {
                deathCount += value;
                
                if (deathCount >= objectiveCount) {
                    image_index = 1;
                    locked = false;
                }
            }
        }
    }
}

function scr_getRandomRoomForFloor(floorNr) {
    if (floorNr < global.CASTLE_LEVELS_BEGIN) {
        return choose(rm_garden0, rm_garden1, rm_garden2, rm_garden3, rm_garden4, rm_garden5, rm_garden6, rm_garden7, rm_garden8);
    }
    else if (floorNr < global.END_LEVELS_BEGIN) {
        return choose(rm_castle0, rm_castle1, rm_castle2, rm_castle3, rm_castle4, rm_castle5, rm_castle6, rm_castle7, rm_castle8);
    }
    else {
        return choose(rm_end0, rm_end1, rm_end2, rm_end3, rm_end4, rm_end5, rm_end6, rm_end7, rm_end8);
    }
}

function scr_nextRoom() {
    global.PAUSE_TRANSITION = true;
    
    if (obj_gameStats.currentFloor == global.END_LEVELS_BEGIN) {
        obj_gameStats.nextShopFloor = obj_gameStats.currentFloor + irandom_range(5, 10);
        
        fade_initializeFade(rm_win, c_black, 2000);
        exit;
    }
    
    if (obj_gameStats.currentFloor == obj_gameStats.nextShopFloor) {
        obj_gameStats.nextShopFloor = obj_gameStats.currentFloor + irandom_range(5, 10);
        
        fade_initializeFade(rm_shop, c_black, 2000);
        exit;
    }
    
    var nextRoom = scr_getRandomRoomForFloor(obj_gameStats.currentFloor);
    
    while (nextRoom == room) {
        nextRoom = scr_getRandomRoomForFloor(obj_gameStats.currentFloor);
    }
    
    fade_initializeFade(nextRoom, c_black, 2000);
}
