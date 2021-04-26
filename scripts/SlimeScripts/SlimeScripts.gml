function scr_slimeInit(minInactiveTime, maxInactive, slimeHopDistance, reward, hitpoints) {
    hopDistance = slimeHopDistance;
    hopSpeed = 0;
    hopSlowdown = 0.1;
    
    hp = hitpoints;
    
    chosenPointX = x;
    chosenPointY = y;
    
    deathReward = reward;
    
    hopTimer = irandom_range(minInactiveTime, maxInactive);
    alarm[0] = hopTimer;
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
    
    if (hp == 0) {
        scr_slimeSplit();
    }
    
    x = lerp(x, chosenPointX, 0.1);
    y = lerp(y, chosenPointY, 0.1);
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
    
    if (hp == 0) {
        scr_smallSlimeDeath();
    }
    
    x = lerp(x, chosenPointX, 0.1);
    y = lerp(y, chosenPointY, 0.1);
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
        
        exit;
    }
    
    if (distance_to_object(obj_player) < 50) {
        chosenPointX = obj_player.x;
        chosenPointY = obj_player.y;
    } else {
        tempHopStrength = hopStrength;
        
        chosenPointX = clamp(random_range(x - tempHopStrength, x + tempHopStrength), 128, 480);
        chosenPointY = clamp(random_range(y - tempHopStrength, y + tempHopStrength), 128, 288);
        
        while (place_meeting(chosenPointX, chosenPointY, obj_wall)) {
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
    // spawn two smaller slimes
    repeat 3 instance_create_layer(x + random_range(-3, 3), y + random_range(-3, 3), "Instances", obj_slime_small);
    
    // die
    instance_destroy();
}

function scr_smallSlimeDeath() {
    // spawn gold
    repeat irandom_range(1, 3) instance_create_layer(x, y, "Instances", obj_coin);
    
    // die
    instance_destroy();
}

function scr_smallSlimeInitDisable() {
    alarm[1] = 30;
}
