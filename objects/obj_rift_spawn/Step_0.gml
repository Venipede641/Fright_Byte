if(global.break_game){
	show_debug_message("Break game is true, creating obj_rift_fish...");
	instance_create_layer(1250, 325, "Instances", obj_rift_fish)
}
else {
    show_debug_message("Break game is false, no instance created.");
}
