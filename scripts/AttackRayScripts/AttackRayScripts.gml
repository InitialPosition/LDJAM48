function scr_handleEnemyCollision() {
    
    var killArray = array_create(0);
    
    var current_enemy, i;
    var killCounter = 0;
    for (current_enemy = 0; current_enemy < instance_number(obj_mob); current_enemy++) {
        enemy = instance_find(obj_mob, current_enemy);
        
        if (place_meeting(x, y, enemy)) {
            killArray[killCounter] = enemy;
            killCounter++;
        }
    }
    
    // damage enemies that array collided with
    for (i = 0; i < array_length(killArray); i++) {
        with (killArray[i]) {
            if (image_speed != 3) {
                scr_mobKnockback();
            }
            hp--;
        }
    }
    
    instance_destroy();
}

function scr_attackButtons() {
    if (other.image_index == 0) {
    
        if (!hasHitButton) {
            
            hasHitButton = true;
            
            with (other) {
                hp--;
                
                if (hp == 0) {
                    image_index = 1;
                    
                    with (obj_nextFloorTeleport) {
                        enabledButtons++;
                
                        if (enabledButtons == objectiveCount) {
                        	if (locked) {
                    		    obj_gameStats.objective = "OBJECTIVE COMPLETE!";
                    		
                			    audio_play_sound(snd_goalComplete, 10, false);
                			    locked = false;
                		    }
                        }
                    }
                }
            }
        }
    }
}

function scr_attackCollectCoins() {
    if (other.collectable) {
        obj_gameStats.gold++;
        obj_gameStats.totalGold++;
	    
	    if (audio_is_playing(snd_coin)) {
	    	audio_stop_sound(snd_coin);
	    }
	    audio_play_sound(snd_coin, 20, false);
        
        with (other) {
            instance_destroy();
        }
    }
}

function scr_attackBat() {
    with (other) {
	
	    sprite_index = spr_bat_disabled;
	    
	    disabled = true;
	    alarm[0] = batResetTimer;
	    
	    knockBackX = 0;
	    knockBackY = 0;
    
	    switch (obj_player.lastAttackedDirection) {
                case 0:
                    knockBackX = -knockbackForce;
                    break;
                case 1:
                    knockBackX = knockbackForce;
                    break;
                case 2:
                    knockBackY = -knockbackForce;
                    break;
                case 3:
                    knockBackY = knockbackForce;
                    break;
        }
           
        image_speed = 0;
        
        speed = knockbackForce;
        direction = point_direction(x, y, x + knockBackX, y + knockBackY);
        
    }
}

function scr_attackDoor() {
    with (other) {
	    if (!locked) {
	    	image_index = 1;
	    }
    }
}

function scr_attackHealth() {
    if (other.collectable) {
	    obj_gameStats.hitpoints = min(obj_gameStats.hitpoints + 1, obj_gameStats.maxHitpoints);
	    
	    if (audio_is_playing(snd_heartCollect)) {
	    	audio_stop_sound(snd_heartCollect);
	    }
	    audio_play_sound(snd_heartCollect, 20, false);
	    
	    with (other) {
	        instance_destroy();
	    }
    }
}