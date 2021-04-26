/// @description 
// show garden if unlocked

if (scr_hasMainMenuGrass()) {
	layer1 = layer_get_id("TilesEE1");
	layer2 = layer_get_id("TilesEE2");
	
	layer_set_visible(layer1, true);
	layer_set_visible(layer2, true);
}