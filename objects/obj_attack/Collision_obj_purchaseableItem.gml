/// @description Purchase item

// abort if item is sold out
if (other.soldout) {
    exit;
}

// gold check
if (obj_gameStats.gold >= other.price) {
    obj_shopController.textboxLenMod = 0.5;
    obj_shopController.itemDesc = "THANK YOU!";
    obj_shopController.descOverride = true;
    obj_shopController.alarm[0] = 60;
    
    purchaseResult = scr_shopPurchaseItem(other.itemID);
    
    if (purchaseResult == 0 && other.sprite_index != spr_item_hp) {
        with (other) {
            soldout = true;
            sprite_index = spr_item_soldout;
        }
        
        audio_play_sound(snd_shopPurchase, 20, false);
    }
    
    instance_destroy();
    
    exit;
} else {
    obj_shopController.textboxLenMod = 0.5;
    obj_shopController.itemDesc = "NOT ENOUGH GOLD!";
    obj_shopController.descOverride = true;
    obj_shopController.alarm[0] = 60;
    
    instance_destroy();
}
