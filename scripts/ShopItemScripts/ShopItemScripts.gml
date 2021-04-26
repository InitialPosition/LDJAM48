
function scr_shopGetRandomItem(includeHP) {
    var itemCount = array_length(item);
    
    if (includeHP) {
        return irandom(itemCount - 1);
    } else {
        return irandom_range(1, itemCount - 1);
    }
}

function scr_shopLoadItems() {
    // price list
    if (obj_gameStats.currentFloor < global.CASTLE_LEVELS_BEGIN) {
        item[0][1] = 15;
        item[1][1] = 50;
        item[2][1] = 30;
        item[3][1] = 20;
        item[4][1] = 65;
    }
    else if (obj_gameStats.currentFloor < global.END_LEVELS_BEGIN) {
        item[0][1] = 25;
        item[1][1] = 70;
        item[2][1] = 50;
        item[3][1] = 50;
        item[4][1] = 80;
    }
    
    item[0][0] = "RESTORES 1 HP";
    item[0][2] = spr_item_hp;
    
    item[1][0] = "PERMANENTLY INCREASES HP";
    item[1][2] = spr_item_hp_perma;
    
    item[2][0] = "PERMANENTLY INCREASES SPEED";
    item[2][2] = spr_item_speed_perma;
    
    item[3][0] = "REPELLS THE BAT FOR 5 FLOORS";
    item[3][2] = spr_item_bat;
    
    item[4][0] = "LONGER ATTACK RANGE";
    item[4][2] = spr_item_range_up;
}

function scr_shopPurchaseItem(itemID) {
    switch (itemID) {
        case 0:
            if (obj_gameStats.hitpoints == obj_gameStats.maxHitpoints) {
                obj_shopController.textboxLenMod = 0.5;
                obj_shopController.itemDesc = "ALREADY FULL!";
                obj_shopController.descOverride = true;
                obj_shopController.alarm[0] = 60;
                
                return 1;
                exit;
            }
            
            obj_gameStats.gold -= other.price;
            obj_gameStats.hitpoints = min(obj_gameStats.hitpoints + 2, obj_gameStats.maxHitpoints);
            
            return 0;
            break;
        
        case 1:
            obj_gameStats.gold -= other.price;
            obj_gameStats.maxHitpoints += 2;
            obj_gameStats.hitpoints = obj_gameStats.maxHitpoints;
            
            return 0;
            break;
        
        case 2:
            obj_gameStats.gold -= other.price;
            obj_gameStats.playerSpeed += 0.1;
            
            with (obj_player) {
                scr_playerUpdateMoveSpeed();
            }
            
            return 0;
            break;
        
        case 3:
            obj_gameStats.gold -= other.price;
            obj_gameStats.batRepellant = obj_gameStats.currentFloor + 5;
            
            return 0;
            break;
        
        case 4:
            obj_gameStats.gold -= other.price;
            obj_gameStats.attackLength += 0.1;
            
            return 0;
            break;
    }
}
