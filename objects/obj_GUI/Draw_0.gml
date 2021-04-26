/// @description Draw GUI

draw_set_font(fnt_GUI);

// draw hearts
currentHP = obj_gameStats.hitpoints;
maxHP = obj_gameStats.maxHitpoints;

draw_set_halign(fa_left);
draw_text_color(20, 10, "LIFE", c_white, c_white, c_white, c_white, 1);

var i;
for (i = 0; i < ceil(maxHP / 2); i++) {
    heartIndex = (currentHP > i * 2) + (currentHP > i * 2 + 1);
    draw_sprite(spr_hearts, heartIndex, 16 + (i * 16) + 5, 32);
}

// draw floor
draw_set_halign(fa_right);

draw_text_color(room_width - 90, 10, "FLOOR: ", c_white, c_white, c_white, c_white, 1);
draw_text_color(room_width - 20, 10, string_format(obj_gameStats.currentFloor, 5, 0), c_white, c_white, c_white, c_white, 1);
draw_text_color(room_width - 90, 32, "GOLD: ", c_white, c_white, c_white, c_white, 1);
draw_text_color(room_width - 20, 32, string_format(obj_gameStats.gold, 7, 0), c_white, c_white, c_white, c_white, 1);

// draw objective
draw_set_halign(fa_center);
draw_text_color(room_width / 2 - 80, 10, obj_gameStats.objective, c_white, c_white, c_white, c_white, 1);