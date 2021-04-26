/// @description Stop if target reached

event_inherited();
if (speed == 0) {
    image_speed = ANIM_SPEED_IDLE;
    disabled = true;
}

if (distance_to_point(chosenPointX + 16, chosenPointY + 16) < pointArrivalDeadzone) {
    speed = 0;
}

// die if no more hp
if (hp <= 0) {
    repeat irandom_range(5, 8) instance_create_layer(x, y, "Instances", obj_coin);
    instance_destroy();
}