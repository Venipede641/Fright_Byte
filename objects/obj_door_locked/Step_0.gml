if (place_meeting(x, y, obj_player_master)) {
    // Show interaction text when the player is near
    show_text = true;
	
	if(global.player_died){
	global.is_locked = false;
	}
	else{
		global.is_locked = true;
	}
	

} else {
    // Hide interaction text when the player is not near
    show_text = false;
}