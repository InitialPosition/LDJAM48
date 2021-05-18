
function scr_vibrateGamepadSeconds(s) {
	var controllerVibration = instance_create_layer(0, 0, "Instances", obj_controllerVibration);
	controllerVibration.alarm[0] = s * room_speed;
}
