// Navigate menu options
if (keyboard_check_pressed(vk_left)) { // if right arrow pressed
    selected_option--; 
    if (selected_option < 0) {
        selected_option = array_length(options) - 1; // if going up from top option go to bottom option
    }
}

if (keyboard_check_pressed(vk_right)) { // if left arrow pressed
    selected_option++;
    if (selected_option >= array_length(options)) {
        selected_option = 0; // if going down from bottom option go to top option
    }
}

// Confirm selection
if (keyboard_check_pressed(vk_space)) {
    if (options[selected_option] == "New Game") {
        // Start the game in room 1
		audio_stop_sound(sfx_title_music);
        room_goto(char_selection_room);
	} else if (options[selected_option] == "Continue") {
		audio_stop_sound(sfx_title_music);
		// scr_load_game();
		room_goto(room);
		scr_choose_character();
    } else if (options[selected_option] == "Exit") {
        // Exit the game
		audio_stop_sound(sfx_title_music);
        game_end();
    }
}