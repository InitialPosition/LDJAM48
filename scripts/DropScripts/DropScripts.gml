
function scr_dropHealth(probability) {
    if (obj_gameStats.hitpoints < obj_gameStats.maxHitpoints) {
    	if (random(1) <= probability) {
	    	var healthPickup = instance_create_layer(x, y, "Instances", obj_health);
    	    	
	    	// make sure health is drawn in front of coins
	    	healthPickup.depth = layer_get_depth(layer_get_id("Instances")) - 1;
	    }
    }
}
