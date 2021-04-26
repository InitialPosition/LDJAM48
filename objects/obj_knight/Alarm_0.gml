/// @description Choose new destination and start walking

alarm[0] = irandom_range(240, 360);;

if (!collision_line(x + 16, y + 16, obj_player.x + 12, obj_player.y + 12, obj_wall, true, true) && distance_to_object(obj_player) < 150) {
    // CHARGE
    
    walkingSpeed = 3;
    chosenPointX = clamp(obj_player.x, 92, 515);
    chosenPointY = clamp(obj_player.y, 92, 287);
    
    disabled = false;
    
    image_speed = ANIM_SPEED_CHARGE;
} else {
    //Walk
    
    walkingSpeed = 1;
    chosenPointX = clamp(random_range(0, room_width), 95, 515);
    chosenPointY = clamp(random_range(0, room_height), 95, 287);
        
    while (place_meeting(chosenPointX, chosenPointY, obj_wall) || collision_line(x + 16, y + 16, chosenPointX, chosenPointY, obj_wall, true, true)) {
        chosenPointX = clamp(random_range(0, room_width), 95, 515);
        chosenPointY = clamp(random_range(0, room_height), 95, 287);
    }
    
    image_speed = ANIM_SPEED_WALKING;
}

move_towards_point(chosenPointX, chosenPointY, walkingSpeed);
if (x > chosenPointX) {
    sprite_index = spr_knight_walk_l;
} else {
    sprite_index = spr_knight_walk_r;
}