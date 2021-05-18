/// @description 

draw_set_halign(fa_center);
draw_set_font(fnt_version);

draw_text_color(room_width / 2, room_height / 2 - 120, title, c_white, c_white, c_white, c_white, 1);

var i;
for (i = 0; i < 6; i++) {
    if (selection != i) {
        draw_text_color(room_width / 2, room_height / 2 - 50 + (i * 30), option[i], c_white, c_white, c_white, c_white, 1);
    } else {
        draw_text_color(room_width / 2, room_height / 2 - 50 + (i * 30), selectionIcon + option[i], c_white, c_white, c_white, c_white, 1);
    }
}
