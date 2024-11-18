function scr_choose_character(){
	// Spawn the character object in Room1
	// Get the bottom center of the room
	var spawn_x = room_width / 2;  // Center of the room horizontally
	var spawn_y = room_height - 150; // 50 pixels above the bottom (adjust as necessary based on sprite size)
	if (global.selected_character == 0) {
	    // Create the first character object in Room
		instance_create_layer(spawn_x, spawn_y, "Instances", obj_player_cat);
	} else if (global.selected_character == 1) {
	    // Create the second character object in Room1 
		instance_create_layer(spawn_x, spawn_y, "Instances", obj_player_turtle);
	}else if (global.selected_character == 2) {
	    // Create the second character object in Room1 
		instance_create_layer(spawn_x, spawn_y, "Instances", obj_player_cat);
	}
		// add more characters here
}