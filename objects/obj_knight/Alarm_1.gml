/// @description Execute actual charge

drawExclamation = false;
disabled = false;
walkingSpeed = 3;
pointArrivalDeadzone = 2;

image_speed = ANIM_SPEED_CHARGE;
move_towards_point(chosenPointX, chosenPointY, walkingSpeed);

alarm[0] = irandom_range(240, 360);
