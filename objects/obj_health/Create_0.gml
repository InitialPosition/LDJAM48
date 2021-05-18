/// @description Set up timers

// unstuck coins
if (place_meeting(x, y, obj_wall)) {
    
    var leftDist, rightDist, upDist, downDist, smallestDist;
    leftDist = 0;
    rightDist = 0;
    upDist = 0;
    downDist = 0;
    while (place_meeting(x - leftDist, y, obj_wall)) {
        leftDist++;
    }
    while (place_meeting(x + rightDist, y, obj_wall)) {
        rightDist++;
    }
    while (place_meeting(x, y - upDist, obj_wall)) {
        upDist++;
    }
    while (place_meeting(x, y + downDist, obj_wall)) {
        downDist++;
    }
    
    smallestDist = min(leftDist, rightDist, upDist, downDist);
    if (smallestDist == leftDist) {
        move_outside_all(180, smallestDist + 1);
    }
    else if (smallestDist == rightDist) {
        move_outside_all(0, smallestDist + 1);
    }
    else if (smallestDist == upDist) {
        move_outside_all(90, smallestDist + 1);
    }
    else if (smallestDist == downDist) {
        move_outside_all(270, smallestDist + 1);
    } else {
        show_debug_message("Coin unstuck failed!");
        instance_destroy();
    }
}

alarm[0] = room_speed * 4;
alarm[1] = room_speed * 5;
alarm[2] = 20;

// set up movement
coinBaseSpeed = 5;
hsp = random_range(-coinBaseSpeed, coinBaseSpeed);
vsp = random_range(-coinBaseSpeed, coinBaseSpeed);

coinSlowDown = 1.1;

image_speed = random_range(0.9, 1.1);

collectable = false;
