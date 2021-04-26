/// @description 

// unlock main menu garden 
scr_unlockMainMenuGrass();

// calculate final time
if (instance_exists(obj_gameStats)) {
	seconds = floor(obj_gameStats.frames / 60);
	minutes = 0;
	hours = 0;
	while (seconds > 60) {
	    seconds -= 60;
	    minutes++;
	    
	    if (minutes > 60) {
			minutes -= 60;
			hours++;
		}
	}
} else {
	seconds = 0;
	minutes = 0;
	hours = 0;
}

text = "YOU WIN!\nCONGRATULATIONS!\nENTER THE TRAP DOOR TO ACCESS ENDLESS MODE\nOR PRESS B TO RETURN TO MAIN MENU\nYOUR GARDEN IS BLOOMING!\nCLEAR TIME " + string(hours) + "H " + string(minutes) + "M " + string(seconds) + "S";