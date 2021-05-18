/// @description Elapse timer and quit if escape is held

if (timerRunning) {
    frames++;
}

if (keyboard_check(vk_escape)) {
	quitTimer++;
	if (quitTimer >= quitTimerThreshold) {
		room_goto(rm_mainMenu);
		instance_destroy();
	}
} else {
	quitTimer = 0;
}
