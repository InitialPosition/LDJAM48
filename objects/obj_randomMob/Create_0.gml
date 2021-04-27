/// @description Create random mob and destroy

if (obj_gameStats.currentFloor < global.SHOOTER_LEVELS_BEGIN) {
    mobToSpawn = obj_slime;
}
else if (obj_gameStats.currentFloor <= global.CASTLE_LEVELS_BEGIN) {
    mobToSpawn = choose(obj_slime, obj_shooter);
}
else if (obj_gameStats.currentFloor < global.END_LEVELS_BEGIN) {
    mobToSpawn = choose(obj_slime, obj_knight);
}
else {
    mobToSpawn = choose(obj_slime, obj_knight, obj_shooter);
}

instance_create_layer(x, y, "Instances", mobToSpawn);

instance_destroy();
