function scr_checkUpdateAvailable() {
    
    // if we have no local version saved, we force an available update
    if (!file_exists(working_directory + "version")) {
        //return true;
    }
    
    // load local version
    f = file_text_open_read(working_directory + "version");
    localVersion = file_text_read_real(f);
    file_text_close(f);
    
    show_debug_message("Starting version ping...");
    
    // load newest online version
    onlineVersionRequest = http_get("https://initialposition.net/LD/48/version.txt");
}

function scr_finishUpdateCheck() {
    if (ds_map_find_value(async_load, "id") == onlineVersionRequest) {
        
        global.UPDATE_CHECKED = true;
        
        if (ds_map_find_value(async_load, "status") == 0) {
            onlineVersion = ds_map_find_value(async_load, "result");
            
            show_debug_message("Ping returned version " + onlineVersion);
            
            if (onlineVersion > localVersion) {
                display = "UPDATE AVAILABLE!\nPRESS \"U\" TO DOWNLOAD!";
                enabled = true;
            }
        }
    }
}

function scr_updateLocalVersion(newLocalVersion) {
    f = file_text_open_write(working_directory + "version");
    file_text_write_real(f, newLocalVersion);
    file_text_close(f);
}
