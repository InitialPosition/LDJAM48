/// @description Stuff to do at the start of each room

// bat spawning
if (currentFloor >= batRepellant) {     // only spawn on floor 5+ and if not repelled
    if (room != rm_garden6 && room != rm_win && room != rm_shop) {       // room exceptions
        if (random(1) > 0.66) {                         // 33% spawn chance
            instance_create_layer(-240, -240, "Instances", obj_bat);
        }
    }
}

// guaranteed spawn on random floor between 2 and first shop - 1
else if (currentFloor == guaranteedBatFloor) {
	instance_create_layer(-120, -120, "Instances", obj_bat);
}
