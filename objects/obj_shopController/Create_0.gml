/// @description Load shop data

scr_shopLoadItems();

descOverride = false;

shopHasHeart = false;

// generate three random items
var i;
for (i = 0; i < 3; i++) {
    newItemIndex = scr_shopGetRandomItem(!shopHasHeart);
    
    // update shophasheart
    if (newItemIndex == 0) {
    	shopHasHeart = 1;
    }
    
    var shopItem = instance_create_layer(352 + (i * 64), 128, "Instances_Background", obj_purchaseableItem);
    
    shopItem.desc = item[newItemIndex][0];
    shopItem.price = item[newItemIndex][1];
    shopItem.sprite_index = item[newItemIndex][2];
    shopItem.itemID = newItemIndex;
}

// set display to empty
itemDesc = "";

// textbox length modifier
textboxLenMod = 0.4;