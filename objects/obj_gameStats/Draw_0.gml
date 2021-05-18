/// @description 

draw_set_font(fnt_GUI);
draw_set_halign(fa_left);

if (godMode) {
	
	draw_text_color(10, room_height - 30, "GODMODE", c_white, c_white, c_white, c_white, 1);
}

draw_set_font(fnt_version);
draw_set_halign(fa_center);

if (quitTimer != 0) {
	draw_set_alpha(0.7);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	draw_text_color(room_width / 2, room_height / 2, "QUITTING... " + string(quitTimerThreshold - quitTimer), c_white, c_white, c_white, c_white, 1);
}
