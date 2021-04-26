
function scr_initPlayer() {
    
    global.PAUSE_TRANSITION = false;
    
    // variables
    scr_playerUpdateMoveSpeed();
    acceleration = 1;
    groundFriction = 2;
    instantStopThreshold = 1;
    
    lastMovedDirection = 1;     // L R U D
    
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
    left_pressed = keyboard_check(global.KEY_LEFT);
    right_pressed = keyboard_check(global.KEY_RIGHT);
    up_pressed = keyboard_check(global.KEY_UP);
    down_pressed = keyboard_check(global.KEY_DOWN);
}

function scr_playerAttack() {
    if keyboard_check_pressed(global.KEY_ATTACK) {
    	// visual
    	var effect = instance_create_layer(x + sprite_width / 2, y + sprite_height / 2, "Instances", obj_attack_effect);
        var attackRay = instance_create_layer(x + sprite_width / 2, y + sprite_height / 2, "Instances", obj_attack);
        
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
        
        audio_play_sound(snd_lightning, 20, false);
    }
}

function scr_playerUpdateMovementVectors() {
    totalMoveSpeed = xx + yy;
    
    if (left_pressed) {
        lastMovedDirection = 0;
        sprite_index = spr_player_walk_l;
        image_speed = ANIM_SPEED_RUNNING;
        
        if (xx > -maxMoveSpeed) {
            xx -= acceleration;
        } else {
            xx = -maxMoveSpeed;
        }
    }
    if (right_pressed) {
        lastMovedDirection = 1;
        sprite_index = spr_player_walk_r;
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
        lastMovedDirection = 2;
        sprite_index = spr_player_walk_b;
        image_speed = ANIM_SPEED_RUNNING;
        
        if (yy > -maxMoveSpeed) {
            yy -= acceleration;
        } else {
            yy = -maxMoveSpeed;
        }
    }
    if (down_pressed) {
        lastMovedDirection = 3;
        sprite_index = spr_player_walk_f;
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
    show_debug_message("Corner");
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