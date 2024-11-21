function scr_choose_character(){
	// Set the target room
	// Get the bottom center of the room
	var spawn_x = room_width / 2;  
	var spawn_y = room_height - 150; 
	if (global.selected_character == 0) {
	    // Create the first character object in Room
		instance_create_layer(spawn_x, spawn_y, "Instances", obj_player_cat);
	}
	else if (global.selected_character == 1) {
	    // Create the second character object in Room1 
		instance_create_layer(spawn_x, spawn_y, "Instances", obj_player_turtle);
	} 
	else if (global.selected_character == 2) {
	    // Create the second character object in Room1 
		instance_create_layer(spawn_x, spawn_y, "Instances", obj_player_slime);
	}
	else if (global.selected_character == 3) {
	    // Create the second character object in Room1 
		instance_create_layer(spawn_x, spawn_y, "Instances", obj_player_dragon);
	}
		// add more characters here
}