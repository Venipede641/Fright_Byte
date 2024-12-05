// Step Event of obj_racecar
if(!global.is_paused){ // only move if game is not paused
	x -= 15; // Move to the left (adjust for speed)
}

// Destroy when off-screen
if (x < 0) {
    instance_destroy();
	show_debug_message("car doesnt exist");
}