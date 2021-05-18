/// @description Draw description

draw_set_font(fnt_GUI);
if (itemDesc != "") {
	draw_set_halign(fa_left);
	
	draw_sprite_ext(spr_shopkeeper_speechbubble, 0, 150, 60, ceil(string_length(itemDesc) * textboxLenMod), 2.5, 0, c_white, 1)
    draw_text(160, 75, itemDesc);
}
