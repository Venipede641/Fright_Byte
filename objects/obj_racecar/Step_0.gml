// In obj_racecar Step Event
if (global.is_paused || global.inDialogue) {
	if (is_being_driven) {
        x = obj_player_master.x + (50 * obj_player_master.image_xscale); //adjust as needed
        y = obj_player_master.y;
    }
    exit;
}

// Check if player is near and interact key is pressed
if (place_meeting(x + 10, y +5, obj_player_master) && keyboard_check_pressed(vk_up))
{
    // Toggle driving state
    if (!variable_instance_exists(id, "is_being_driven")) {
        is_being_driven = false;
    }
    
    is_being_driven = !is_being_driven;
    
    if (is_being_driven)
    {
		persistent = true;
		global.in_car = true;
        // Store original player state
        with (obj_player_master) {
            // Position player behind the car
            x = other.x;  // Adjust as needed
            y = other.y;
        }
	}
    else
    {
		persistent = false;
		global.in_car = false;
        // Restore player state
    }
}
// Keep car positioned with player when driving
if (is_being_driven)
{
    // Determine positioning and orientation based on player's facing direction
    if (obj_player_master.image_xscale > 0)
    {
        // Facing right
        x = obj_player_master.x + 50; // adjust as needed
        image_xscale = 1;
    }
    else
    {
        // Facing left
        x = obj_player_master.x - 50; // adjust as needed
        image_xscale = -1;
    }
    
    y = obj_player_master.y;
}
