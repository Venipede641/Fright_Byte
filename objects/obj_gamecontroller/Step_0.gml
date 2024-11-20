// Check for pause toggle
if (keyboard_check_pressed(vk_escape)) {
    if (!global.is_paused) {
        // Pause the game
        global.is_paused = true;
        instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_pause_menu);
    } else {
        // Unpause the game
        global.is_paused = false;
    }

	if (global.is_paused) {
	    with (all) {
	        if (sprite_index != -1) image_speed = 0; // Freeze animation
	    }
	} else {
	    with (all) {
	        if (sprite_index != -1) image_speed = 1; // Resume animation
	    }
	}
}