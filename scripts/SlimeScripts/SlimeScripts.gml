function scr_slimeInit(minInactiveTime, maxInactive, slimeHopDistance, reward, hitpoints) {
    hopDistance = slimeHopDistance;
    hopSpeed = 0;
    hopSlowdown = 0.1;
    
    hp = hitpoints;
    
    chosenPointX = x;
    chosenPointY = y;
    
    deathReward = reward;
    
    tempHopStrength = 0;
    hopStrength = 0;
    
    hopFailsafe = 32;
    
    hopSmoothness = 0.1;
    
    hopTimer = irandom_range(minInactiveTime, maxInactive);
    hopTelegraphTime = 30;
    
    alarm[0] = hopTimer;
    
    ANIM_SPEED_IDLE = 1;
    ANIM_SPEED_ATTACK = 5;
    
    image_speed = ANIM_SPEED_IDLE;
}

function scr_slimeUpdate() {
    if (hopSpeed > 0) {
        hopSpeed -= hopSlowdown;
        sprite_index = spr_slime_jump;
    } else {
        hopSpeed = 0;
        sprite_index = spr_slime;
    }
    
    if (place_meeting(x, y, obj_spikes)) {
        image_alpha = 0.7;
    } else {
        image_alpha = 1;
    }
    
    if (hp <= 0) {
        scr_slimeSplit();
    }
    
    x = lerp(x, chosenPointX, hopSmoothness);
    y = lerp(y, chosenPointY, hopSmoothness);
}

function scr_smallSlimeUpdate() {
    if (hopSpeed > 0) {
        hopSpeed -= hopSlowdown;
        sprite_index = spr_slime_small_jump;
    } else {
        hopSpeed = 0;
        sprite_index = spr_slime_small;
    }
    
    if (place_meeting(x, y, obj_spikes)) {
        image_alpha = 0.7;
    } else {
        image_alpha = 1;
    }
    
    if (hp <= 0) {
        scr_smallSlimeDeath();
    }
    
    x = lerp(x, chosenPointX, hopSmoothness);
    y = lerp(y, chosenPointY, hopSmoothness);
}

function scr_slimeHop(firstHop, isSmall) {
    hopStrength = hopDistance;
    
    // choose a random point in level
    if (place_meeting(x, y, obj_spikes)) {
        hopStrength /= 1.5;
    }
    
    if (firstHop) {
        chosenPointX = clamp(random_range(x - hopStrength, x + hopStrength), 128, 480);
        chosenPointY = clamp(random_range(y - hopStrength, y + hopStrength), 128, 288);
		
		failsafeTimer = 64;
		do {
			chosenPointX = clamp(random_range(x - hopStrength, x + hopStrength), 128, 480);
			chosenPointY = clamp(random_range(y - hopStrength, y + hopStrength), 128, 288);
			
			failsafeTimer--;
		} until (!place_meeting(chosenPointX, chosenPointY, obj_wall) || failsafeTimer < 0)
		
		if (failsafeTimer < 0) {
			chosenPointX = x;
			chosenPointY = y;
		}
        
        exit;
    }
    
    if (distance_to_point(obj_player.x + 12, obj_player.y + 12) < 50) {
        chosenPointX = obj_player.x;
        chosenPointY = obj_player.y;
    } else {
        tempHopStrength = hopStrength;
        
        chosenPointX = clamp(random_range(x - tempHopStrength, x + tempHopStrength), 128, 480);
        chosenPointY = clamp(random_range(y - tempHopStrength, y + tempHopStrength), 128, 288);
        
        while (place_meeting(chosenPointX, chosenPointY, obj_wall) || collision_line(x, y, chosenPointX, chosenPointY, obj_player, false, true) || point_distance(x, y, chosenPointX, chosenPointY) < 32) {
        	
        	// failsafe trigger
        	if (tempHopStrength > hopStrength + hopFailsafe) {
        		failsafeDone = false;
        		hopFailsafeDistance = 64;
				
				show_debug_message("Failsafe");
        		
        		while (!failsafeDone) {
        			
        			// find free spots adjacent
        			var randomTest = irandom(3);
        			
        			switch (randomTest) {
        				case 0:
        					if (!place_meeting(x + hopFailsafeDistance, y, obj_wall)) {
        						chosenPointX = x + hopFailsafeDistance;
        						chosenPointY = y;
        						
        						failsafeDone = true;
        					}
        					break;
        					
        				case 1:
        					if (!place_meeting(x - hopFailsafeDistance, y, obj_wall)) {
        						chosenPointX = x - hopFailsafeDistance;
        						chosenPointY = y;
        						
        						failsafeDone = true;
        					}
        					break;
        					
        				case 2:
        					if (!place_meeting(x, y + hopFailsafeDistance, obj_wall)) {
        						chosenPointX = x;
        						chosenPointY = y + hopFailsafeDistance;
        						
        						failsafeDone = true;
        					}
        					break;
        					
        				case 3:
        					if (!place_meeting(x, y - hopFailsafeDistance, obj_wall)) {
        						chosenPointX = x;
        						chosenPointY = y - hopFailsafeDistance;
        						
        						failsafeDone = true;
        					}
        					break;
        			}
        			
        			hopFailsafeDistance--;
					
					if (hopFailsafeDistance <= 0) {
						chosenPointX = x;
						chosenPointY = y;
						
						show_debug_message("Failsafe failed, aborting jump");
						
						failsafeDone = true;
					}
					
        		}
				
				show_debug_message("Final failsafe hop length: " + string(hopFailsafeDistance));
        		
        		break;
        	}
        	
            chosenPointX = clamp(random_range(x - tempHopStrength, x + tempHopStrength), 128, 480);
            chosenPointY = clamp(random_range(y - tempHopStrength, y + tempHopStrength), 128, 288);
            
            tempHopStrength++;
        }

    }
    
    if (isSmall) {
        audio_play_sound(snd_smallSlimeJump, 20, false);
    } else {
        audio_play_sound(snd_slimeJump, 20, false);
    }
}

function scr_slimeSplit() {
    // spawn smaller slimes
    repeat 3 instance_create_layer(x + random_range(-3, 3), y + random_range(-3, 3), "Instances", obj_slime_small);
    
    // die
    instance_destroy();
}

function scr_smallSlimeDeath() {
    // spawn gold
    repeat irandom_range(1, 3) instance_create_layer(x, y, "Instances", obj_coin);
    
    // sometimes spawn health if player is not at full hp
    scr_dropHealth(0.05);
    
    // die
    instance_destroy();
}

function scr_smallSlimeInitDisable() {
	mobIgnoresWalls = false;
    alarm[1] = 60;
}
