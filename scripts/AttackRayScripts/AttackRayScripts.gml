function scr_handleEnemyCollision() {
    
    var current_enemy, i;
    var killCounter = 0;
    for (current_enemy = 0; current_enemy < instance_number(obj_mob); current_enemy++) {
        enemy = instance_find(obj_mob, current_enemy);
        
        if (place_meeting(x, y, enemy)) {
            killArray[killCounter] = enemy;
            killCounter++;
        }
    }
    
    // damage enemies that array collided with
    for (i = 0; i < array_length(killArray); i++) {
        with (killArray[i]) {
            if (image_speed != 3) {
                scr_mobKnockback();
            }
            hp--;
        }
    }
    
    instance_destroy();
}
