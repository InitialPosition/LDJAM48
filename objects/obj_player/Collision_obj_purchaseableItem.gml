/// @description Show shop item description

if (!obj_shopController.descOverride) {
    if (!other.soldout) {
        obj_shopController.textboxLenMod = 0.4;
        obj_shopController.itemDesc = other.desc + "\n" + string(other.price) + "G";
    } else {
        obj_shopController.textboxLenMod = 0.5;
        obj_shopController.itemDesc = "SOLD OUT!";
    }
}