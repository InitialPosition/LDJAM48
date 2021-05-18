/// @description Wall Collision stolen from player

xx = hsp;
yy = vsp;
scr_playerCollisionChecks();

x += xx;
y += yy;

hsp /= coinSlowDown;
vsp /= coinSlowDown;
