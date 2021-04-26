/// @description Set to locked 

locked = true;
generating = true;
image_index = 0;
image_speed = 0;

// if there are no gamestats / GUI, create them
if (!instance_exists(obj_gameStats)) {
    instance_create_layer(0, 0, "Instances", obj_gameStats);
}

obj_gameStats.currentFloor++;

if (!instance_exists(obj_GUI)) {
    instance_create_layer(0, 0, "Instances_Foreground", obj_GUI);
}

// if the next floor is a shop, change sprite
if (obj_gameStats.nextShopFloor == obj_gameStats.currentFloor) {
    sprite_index = spr_nextFloor_shop;
}

alarm[0] = 1;
