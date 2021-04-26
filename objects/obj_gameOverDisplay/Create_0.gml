/// @description Set up variables

audio_stop_all();
audio_play_sound(snd_death, 10, false);

obj_gameStats.timerRunning = false;

// calculate final time
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

title = "GAME OVER!"
stats1 = "YOU REACHED FLOOR " + string(obj_gameStats.currentFloor);
stats2 = "YOU COLLECTED " + string(obj_gameStats.totalGold) + " GOLD";
stats3 = "YOU PLAYED FOR " + string(hours) + "H " + string(minutes) + "M " + string(seconds) + "S";
returnText = "PRESS SPACE TO TRY AGAIN";

with (obj_gameStats) {
    instance_destroy();
}
