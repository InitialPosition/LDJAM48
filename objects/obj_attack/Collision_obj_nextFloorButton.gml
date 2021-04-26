/// @description Hit button

if (other.image_index == 0) {
    
    if (!hasHitButton) {
        
        hasHitButton = true;
        
        with (other) {
            hp--;
            
            if (hp == 0) {
                image_index = 1;
                
                with (obj_nextFloorTeleport) {
                    enabledButtons++;
            
                    if (enabledButtons == objectiveCount) {
                        image_index = 1;
                        locked = false;
                    }
                }
            }
        }
    }
}
