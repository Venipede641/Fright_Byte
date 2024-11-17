// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_choose_character(){
	// Spawn the character object in Room1
	if (global.selected_character == 0) {
	    // Create the first character object in Room
		instance_create_layer(room_height / 2, room_width / 2, "Instances", obj_player_cat);
	} else if (global.selected_character == 1) {
	    // Create the second character object in Room1 
		instance_create_layer(room_height / 2, room_width / 2, "Instances", obj_player_turtle);
	}
		// add more characters here
}