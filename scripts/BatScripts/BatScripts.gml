function scr_batInit() {

    maxSpeed = 2;
    
    knockbackForce = 20;
    knockBackX = 0;
    knockBackY = 0;
    
    batResetTimer = 120;
}

function scr_batUpdate() {
    // fly towards player
    
    if (!disabled) {
        motion_add(point_direction(x, y, obj_player.x, obj_player.y), 0.05);
        
        if (speed > maxSpeed) {
            speed = maxSpeed;
        }
    } else {
        speed = lerp(speed, 0, 0.1);
    }
}
