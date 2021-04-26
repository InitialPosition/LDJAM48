function scr_batInit() {
    
    // delete if less than three rooms in
    if (obj_gameStats.currentFloor < obj_gameStats.batRepellant) {
        instance_destroy();
    }
    
    // destroy in 66% of levels
    if (random(1) < 0.66) {
        instance_destroy();
    }
    
    maxSpeed = 2;
    knockbackForce = 30;
}

function scr_batUpdate() {
    // fly towards player
    
    motion_add(point_direction(x, y, obj_player.x, obj_player.y), 0.05);
    
    if (speed > maxSpeed) {
        speed = maxSpeed;
    }
}
