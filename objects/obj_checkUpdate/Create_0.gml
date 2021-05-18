/// @description Start update check

enabled = false;

if (global.UPDATE_CHECKED) {
    
    if (global.UPDATE_CHECK_RESULT == 1) {
        display = "UPDATE AVAILABLE!\nPRESS \"U\" TO DOWNLOAD!";
        enabled = true;
    } else {
        instance_destroy();
    }
} else {
    display = "CHECKING FOR UPDATES...";
    scr_checkUpdateAvailable();
}
