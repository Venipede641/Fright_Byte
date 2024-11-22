if (place_meeting(x, y, obj_player_master)) {
    // Show interaction text when the player is near
    show_text = true;

} else {
    // Hide interaction text when the player is not near
    show_text = false;
}
if (place_meeting(x, y, obj_player_master) && keyboard_check_pressed(vk_up)){
	instance_create_layer(x,y,"Instances", obj_mouse_npc_dialogue);
}