/// @description Start vibration

if (instance_number(obj_controllerVibration) > 1) {
	instance_destroy();
}

gamepad_set_vibration(0, 1, 1);
