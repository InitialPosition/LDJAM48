
function scr_initPlayer() {
    
    global.PAUSE_TRANSITION = false;
    
    // set correct depth
    depth = layer_get_depth(layer_get_id("Instances")) - 2;
    
    // variables
    scr_playerUpdateMoveSpeed();
    acceleration = 1;
    groundFriction = 2;
    instantStopThreshold = 1;
    
    attackCooldown = obj_gameStats.attackSpeed;
    canAttack = true;
    lastAttackedDirection = 1;     // L R U D
    
    walkAnimationOverride = false;
    walkAnimationOverrideDuration = attackCooldown;
    
    invulnerableTimer = 0;
    iFrameCount = 90;
    
    damageKnockback = 3;
    
    // movement vectors
    xx = 0;
    yy = 0;
    
    // input
    scr_playerGetInput();
	
	instance_create_layer(x, y, "Instances", obj_playerCoinCollector);
	
	ANIM_SPEED_IDLE = 2;
	ANIM_SPEED_RUNNING = 5;
}

function scr_playerUpdateMoveSpeed() {
	maxMoveSpeed = obj_gameStats.playerSpeed;
}

function scr_playerUpdate() {
    
    PAUSABLE_GAME
    PAUSABLE_TRANSITION
    
    // process invul counter
    if (invulnerableTimer > 0) {
        
        if (alarm[0] == -1) {
            alarm[0] = 3;
        }
        
        invulnerableTimer--;
    } else {
        visible = true;
    }
    
    scr_playerGetInput();
    scr_playerAttack();
    scr_playerUpdateMovementVectors();
    scr_playerCollisionChecks();
    scr_playerApplyMovement();
}

function scr_playerGetInput() {
    left_pressed = keyboard_check(global.KEY_LEFT) || 
    gamepad_axis_value(0, gp_axislh) < -global.CONTROLLER_DEADZONE_MOVEMENT ||
    gamepad_button_check(0, gp_padl);
    
    right_pressed = keyboard_check(global.KEY_RIGHT) || 
    gamepad_axis_value(0, gp_axislh) > global.CONTROLLER_DEADZONE_MOVEMENT ||
    gamepad_button_check(0, gp_padr);
    
    up_pressed = keyboard_check(global.KEY_UP) || 
    gamepad_axis_value(0, gp_axislv) < -global.CONTROLLER_DEADZONE_MOVEMENT ||
    gamepad_button_check(0, gp_padu);
    
    down_pressed = keyboard_check(global.KEY_DOWN) || 
    gamepad_axis_value(0, gp_axislv) > global.CONTROLLER_DEADZONE_MOVEMENT ||
    gamepad_button_check(0, gp_padd);
    
    
    left_attack_pressed = keyboard_check(global.KEY_ATTACK_LEFT) || 
    gamepad_axis_value(0, gp_axisrh) < -global.CONTROLLER_DEADZONE_ATTACK ||
    gamepad_button_check(0, gp_face3);
    
    right_attack_pressed = keyboard_check(global.KEY_ATTACK_RIGHT) || 
    gamepad_axis_value(0, gp_axisrh) > global.CONTROLLER_DEADZONE_ATTACK ||
    gamepad_button_check(0, gp_face2);
    
    up_attack_pressed = keyboard_check(global.KEY_ATTACK_UP) || 
    gamepad_axis_value(0, gp_axisrv) < -global.CONTROLLER_DEADZONE_ATTACK ||
    gamepad_button_check(0, gp_face4);
    
    down_attack_pressed = keyboard_check(global.KEY_ATTACK_DOWN) || 
    gamepad_axis_value(0, gp_axisrv) > global.CONTROLLER_DEADZONE_ATTACK ||
    gamepad_button_check(0, gp_face1);
}

function scr_playerIsAttacking() {
	return	keyboard_check(global.KEY_ATTACK_LEFT) ||
			keyboard_check(global.KEY_ATTACK_RIGHT) ||
			keyboard_check(global.KEY_ATTACK_UP) || 
			keyboard_check(global.KEY_ATTACK_DOWN) ||
			gamepad_axis_value(0, gp_axisrh) < -global.CONTROLLER_DEADZONE_ATTACK ||
			gamepad_axis_value(0, gp_axisrh) > global.CONTROLLER_DEADZONE_ATTACK ||
			gamepad_axis_value(0, gp_axisrv) < -global.CONTROLLER_DEADZONE_ATTACK ||
			gamepad_axis_value(0, gp_axisrv) > global.CONTROLLER_DEADZONE_ATTACK ||
			gamepad_button_check(0, gp_face3) ||
			gamepad_button_check(0, gp_face2) ||
			gamepad_button_check(0, gp_face4) ||
			gamepad_button_check(0, gp_face1);
}

function scr_playerAttack() {
    if (scr_playerIsAttacking() && canAttack) {
    	
    	// start cooldown
    	canAttack = false;
    	alarm[2] = attackCooldown;
    	
    	// visual
    	var effect = instance_create_layer(x + sprite_width / 2, y + sprite_height / 2, "Instances", obj_attack_effect);
        var attackRay = instance_create_layer(x + sprite_width / 2, y + sprite_height / 2, "Instances", obj_attack);
        
        /**
        switch (lastMovedDirection) {
            case 0:
                attackRay.image_angle = 270;
                effect.image_angle = 270;
                break;
            case 1:
                attackRay.image_angle = 90;
                effect.image_angle = 90;
                break;
            case 2:
                attackRay.image_angle = 180;
                effect.image_angle = 180;
                break;
            case 3:
                attackRay.image_angle = 0;
                effect.image_angle = 0;
                break;
        }
        **/
        
        walkAnimationOverride = true;
        alarm[1] = walkAnimationOverrideDuration;
        
        if (left_attack_pressed) {
        	sprite_index = spr_player_walk_l;
        	lastAttackedDirection = 0;
        	
            attackRay.image_angle = 270;
            effect.image_angle = 270;
        }
        
        else if (right_attack_pressed) {
        	sprite_index = spr_player_walk_r;
        	lastAttackedDirection = 1;
        	
            attackRay.image_angle = 90;
            effect.image_angle = 90;
        }
        
        else if (up_attack_pressed) {
        	sprite_index = spr_player_walk_b;
        	lastAttackedDirection = 2;
        	
            attackRay.image_angle = 180;
            effect.image_angle = 180;
        }
        
        else if (down_attack_pressed) {
        	sprite_index = spr_player_walk_f;
        	lastAttackedDirection = 3;
        	
            attackRay.image_angle = 0;
            effect.image_angle = 0;
        }
        
        audio_play_sound(snd_lightning, 20, false);
    }
}

function scr_playerUpdateMovementVectors() {
    if (left_pressed) {
    	if (!walkAnimationOverride) {
        	sprite_index = spr_player_walk_l;
    	}
    	
        image_speed = ANIM_SPEED_RUNNING;
        
        if (xx > -maxMoveSpeed) {
            xx -= acceleration;
        } else {
            xx = -maxMoveSpeed;
        }
    }
    if (right_pressed) {
    	if (!walkAnimationOverride) {
        	sprite_index = spr_player_walk_r;
    	}
    	
        image_speed = ANIM_SPEED_RUNNING;
        
        if (xx < maxMoveSpeed) {
            xx += acceleration;
        } else {
            xx = maxMoveSpeed;
        }
    }
    
    if ((left_pressed && right_pressed) || (!left_pressed && !right_pressed)) {
    	image_speed = ANIM_SPEED_IDLE;
    	
        xx /= groundFriction;
        if (abs(xx) < instantStopThreshold) {
            xx = 0;
        }
    }
    
    if (up_pressed) {
    	if (!walkAnimationOverride) {
        	sprite_index = spr_player_walk_b;
    	}
    	
        image_speed = ANIM_SPEED_RUNNING;
        
        if (yy > -maxMoveSpeed) {
            yy -= acceleration;
        } else {
            yy = -maxMoveSpeed;
        }
    }
    if (down_pressed) {
    	if (!walkAnimationOverride) {
        	sprite_index = spr_player_walk_f;
    	}
    	
        image_speed = ANIM_SPEED_RUNNING;
        
        if (yy < maxMoveSpeed) {
            yy += acceleration;
        } else {
            yy = maxMoveSpeed;
        }
    }
    
    if ((up_pressed && down_pressed) || (!up_pressed && !down_pressed)) {
    	
    	if (!left_pressed && !right_pressed) {
    		image_speed = ANIM_SPEED_IDLE;
    	}
    	
        yy /= groundFriction;
        if (abs(yy) < instantStopThreshold) {
            yy = 0;
        }
    }
}

function scr_playerCollisionChecks() {
    if (place_meeting(x + xx, y, obj_wall)) {
        xx = 0;
    }
    if (place_meeting(x, y + yy, obj_wall)) {
        yy = 0;
    }
}

function scr_playerUnstuck() {
    x -= xx;
}

function scr_playerApplyMovement() {
    x += xx;
    y += yy;
}

function scr_playerIsInvulnerable() {
    return invulnerableTimer > 0;
}

function scr_playerTakeDamage() {
    if (!scr_playerIsInvulnerable()) {
        invulnerableTimer = iFrameCount;
        
        audio_play_sound(snd_hurt, 10, false);
		scr_vibrateGamepadSeconds(0.2);
        
        if (xx != 0) {
            xx *= -damageKnockback;
        }
        
        if (yy != 0) {
            yy *= -damageKnockback;
        }
        
        with (obj_gameStats) {
            hitpoints--;
            
            if (hitpoints == 0) {
                room_goto(rm_gameOver);
            }
        }
    }
}