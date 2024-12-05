function use_selected_item(item_object) {
    // Check if the item is valid and not already spawned
    // Only spawn the item if there isn't one already spawned in the room
	if(global.spawned_item != noone){
		instance_destroy(global.spawned_item);
		global.spawned_item = noone;
	}
    if (item_object != noone && global.spawned_item == noone) {
        // Spawn the item in front of the player
		if(item_object == obj_racecar){  // race car spawns at a different position
			var spawn_x = obj_player_master.x ;  // Adjust X position if needed
			var spawn_y = obj_player_master.y;       // Y position in front of player
			global.spawned_item = instance_create_layer(spawn_x, spawn_y, "Instances", item_object);
			exit;
		}
        var spawn_x = obj_player_master.x ;  // Adjust X position if needed
        var spawn_y = obj_player_master.y - 80;       // Y position in front of player
        global.spawned_item = instance_create_layer(spawn_x, spawn_y, "Instances", item_object);
    }
}