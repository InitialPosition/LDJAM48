/// @description Check and reset shopkeeper message

if (!descOverride) {
    if (place_empty(obj_player.x, obj_player.y, obj_purchaseableItem)) {
        itemDesc = "";
    }
}
