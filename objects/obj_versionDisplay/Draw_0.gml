/// @description Draw main menu

draw_set_halign(fa_right);
draw_set_font(fnt_version);

// draw version
draw_text_color(room_width - 10, room_height - 30, global.VERSION, c_white, c_white, c_white, c_white, 1);


draw_set_halign(fa_left);
draw_text_color(140, 290, "T: Tutorial, O: Options, Q: Quit", c_white, c_white, c_white, c_white, 0.5);
