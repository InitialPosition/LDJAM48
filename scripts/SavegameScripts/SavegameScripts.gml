
function scr_hasSavegame() {
    return file_exists(global.SAVEGAME_PATH);
}

function scr_saveGame() {
    f = file_text_open_write(global.SAVEGAME_PATH);

    // TODO saving here

    file_text_close(f);
}

function scr_loadGame() {
    f = file_text_open_read(global.SAVEGAME_PATH);

    // TODO loading here

    file_text_close(f);
}
