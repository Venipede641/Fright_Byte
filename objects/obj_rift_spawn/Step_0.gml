if(global.spawn_rifts){
	// show_debug_message("Break game is true, creating obj_rift_fish...");
	instance_create_layer(1350, 350, "Instances", obj_rift_fish)
}
else {
    // show_debug_message("Break game is false, no instance created.");
}
