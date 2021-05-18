// Resizes window to given size and recenters window on screen

function scr_windowModifier_setWindowSize(width, height) {
	window_set_size(width, height);
	window_set_position(display_get_width() / 2 - (width / 2), display_get_height() / 2 - (height / 2));
}

function scr_windowModifier_getResolutionForIndex(index) {
    // declare width/height array

    // 640x360
    resolution[0][0] = 640;
    resolution[0][1] = 360;

    // 1280x720
    resolution[1][0] = 1280;
    resolution[1][1] = 720;

    // 1920x1080
    resolution[2][0] = 1920;
    resolution[2][1] = 1080;

    // 2560x1440
    resolution[3][0] = 2560;
    resolution[3][1] = 1440;

    // 3840x2160
    resolution[4][0] = 3840;
    resolution[4][1] = 2160;

    requested_resolution[0] = resolution[index][0];
    requested_resolution[1] = resolution[index][1];
    return requested_resolution;
}

function scr_getCurrentResolutionAsString() {
	var w = window_get_width();
	var h = window_get_height();
	return string(w) + "x" + string(h);
}

function scr_getIndexForResolutionString(resString) {
	var i;
	for (i = 0; i < 4; i++) {
		currentResStr = scr_windowModifier_getResolutionForIndex(i);
		if (string(currentResStr[0]) + "x" + string(currentResStr[1]) == resString) {
			return i;
		}
	}
	
	return -1;
}
