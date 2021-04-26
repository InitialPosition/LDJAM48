/// @description Set to locked 

locked = false;
image_index = 1;
image_speed = 0;

// if there are no gamestats / GUI, create them
if (!instance_exists(obj_gameStats)) {
    instance_create_layer(0, 0, "Instances", obj_gameStats);
}

obj_gameStats.currentFloor++;

if (!instance_exists(obj_GUI)) {
    instance_create_layer(0, 0, "Instances_Foreground", obj_GUI);
}

obj_gameStats.objective = "SHOP";
