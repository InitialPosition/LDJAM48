/// @description Choose new destination and start walking

pointArrivalDeadzone = 10;

if (    !collision_line(x + 16, y + 16, obj_player.x + 12, obj_player.y + 12, obj_wall, true, true) && 
        distance_to_object(obj_player) < 150    ) {
    // LOAD CHARGE
    chosenPointX = clamp(obj_player.x, 92, 515);
    chosenPointY = clamp(obj_player.y, 92, 287);
    
    drawExclamation = true;
    walkingSpeed = 0;
    
    audio_play_sound(snd_knightAlert, 10, 0);
    
    alarm[1] = 30;
    
} else {
    alarm[0] = irandom_range(240, 360);
    
    //Walk
    
    walkingSpeed = 1;
    attemptTimer = 32;
        
    do {
        chosenPointX = clamp(random_range(0, room_width), 95, 515);
        chosenPointY = clamp(random_range(0, room_height), 95, 287);
        
        attemptTimer--;
    } until (   (!place_meeting(chosenPointX, chosenPointY, obj_wall) &&
                !collision_line(x + 16, y + 16, chosenPointX, chosenPointY, obj_wall, true, true )) ||
                attemptTimer == 0);
    
    // failsafe
    if (attemptTimer == 0) {
        chosenPointX = x;
        chosenPointY = y;
    }
    
    image_speed = ANIM_SPEED_WALKING;
}

move_towards_point(chosenPointX, chosenPointY, walkingSpeed);
if (x > chosenPointX) {
    sprite_index = spr_knight_walk_l;
} else {
    sprite_index = spr_knight_walk_r;
}