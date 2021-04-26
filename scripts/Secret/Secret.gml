function scr_unlockMainMenuGrass() {
	f = file_text_open_write(working_directory + "garden.tda");
	
	file_text_write_string(f, "c:");
	
	file_text_close(f);
}

function scr_hasMainMenuGrass() {
	return file_exists(working_directory + "garden.tda");
}