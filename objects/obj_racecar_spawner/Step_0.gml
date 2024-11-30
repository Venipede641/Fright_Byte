// Step Event of obj_racecar_spawner
spawn_timer--;

if (spawn_timer <= 0 && !global.is_paused && !global.inDialogue) { // stop vehicle spawning if in dialogue or game is paused
    // Reset the spawn timer
    spawn_timer = irandom_range(60, 180); // Random interval between 1-3 seconds

    // Determine random spawn position: ground or above ground
    var spawn_y;
	var spawn_x = room_width;
    if (irandom(1) == 0) { 
        spawn_y = room_height - 120; // Ground level (adjust 50 to match your ground level sprite height)
    } else {
        spawn_y = room_height - 200; // Slightly above ground level
    }

    // Spawn obj_racecar
    instance_create_layer(spawn_x - 80, spawn_y, "Instances", obj_warning); //warn the player a car is about to spawn
	//show_debug_message("car y:" + string(spawn_y));
	//show_debug_message("car x:" + string(spawn_x));
	alarm[0] = 60; // 60 frames = 1 second
	y_pos = spawn_y;
}