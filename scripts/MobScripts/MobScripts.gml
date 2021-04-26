function scr_mobInit() {
    knockBackX = 0;
    knockBackY = 0;
    
    knockbackForce = 4;
    
    deathReward = 0;
    
    knockBackDeadzone = 0.1;
    
    mobIgnoresWalls = false;
}

function scr_mobUpdate() {
    
    if (!mobIgnoresWalls) {
        if (!place_meeting(x + knockBackX, y, obj_wall)) {
            x += knockBackX;
        }
        if (!place_meeting(x, y + knockBackY, obj_wall)) {
            y += knockBackY;
        }
    } else {
        x += knockBackX;
        y += knockBackY;
    }
    
    knockBackX /= 1.1;
    knockBackY /= 1.1;
    
    if (abs(knockBackX) < knockBackDeadzone) {
        knockBackX = 0;
    }
    if (abs(knockBackY) < knockBackDeadzone) {
        knockBackY = 0;
    }
}

function scr_mobKnockback() {
    speed = 0;
    
    switch (obj_player.lastMovedDirection) {
        case 0:
            knockBackX = -knockbackForce;
            break;
        case 1:
            knockBackX = knockbackForce;
            break;
        case 2:
            knockBackY = -knockbackForce;
            break;
        case 3:
            knockBackY = knockbackForce;
            break;
    }
}
