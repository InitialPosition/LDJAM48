/// @description Draw instructions

draw_set_font(fnt_version);
draw_set_halign(fa_center);

draw_set_alpha(0.8);
draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, 0);
draw_set_alpha(1);

draw_text(room_width / 2, room_height / 2, instruction[currentInstruction]);
