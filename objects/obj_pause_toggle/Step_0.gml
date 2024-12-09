// Check for pause toggle
if (keyboard_check_pressed(vk_escape)) {
global.is_paused = !global.is_paused
    if (global.is_paused) {
        // Pause the game
        instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_pause_menu);
		with (all) {
	        if (sprite_index != -1) image_speed = 0; // Freeze animation
	    }
	} else {
        // Unpause the game
		with (all) {
	        if (sprite_index != -1) image_speed = 1; // Resume animation
	    }
    }

}