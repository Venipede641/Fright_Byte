

// Navigate menu
if (keyboard_check_pressed(vk_up)) {
    selected_option = (selected_option - 1 + array_length(menu_options)) mod array_length(menu_options);
}
if (keyboard_check_pressed(vk_down)) {
    selected_option = (selected_option + 1) mod array_length(menu_options);
}

// Select menu option
if (keyboard_check_pressed(vk_enter)) {
    if (selected_option == 0) {
        // Resume
        global.is_paused = false;
        instance_destroy();
    } else if (selected_option == 1) {
        // Save and Quit
        // Add save functionality here
        game_end();
    }
}
if(!global.is_paused){
	instance_destroy();
}

