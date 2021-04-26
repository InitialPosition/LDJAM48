/// @description Take damage

if (!other.disabled && !global.PAUSE_TRANSITION && !global.PAUSE_GAME) {
	with (obj_player) {
		scr_playerTakeDamage();
	}
}
