function use_selected_item(item_object) {
    // Check if the item is valid and not already spawned
    // Only spawn the item if there isn't one already spawned in the room
	// Destroy the existing item if it exists
	//show_debug_message("Spawned item: " + string(spawned_item));
    if (obj_inventory_data_manager.spawned_item != noone && instance_exists(obj_inventory_data_manager.spawned_item)) {
		 obj_player_master.is_holding_item = false;
            var destroy_x = obj_inventory_data_manager.spawned_item.x;
            var destroy_y = obj_inventory_data_manager.spawned_item.y;
            instance_destroy(obj_inventory_data_manager.spawned_item);
            instance_create_layer(destroy_x, destroy_y, "Instances", obj_item_destroyed);   
    }
	if(!instance_exists(obj_inventory_data_manager.spawned_item))
	{
		obj_inventory_data_manager.spawned_item = noone
	}
    // Spawn the new item
    if (item_object != noone) {
        var spawn_x, spawn_y;

        if (item_object == obj_racecar) {  // Race car spawns in front of player instead of above them
            spawn_x = obj_player_master.x;
            spawn_y = obj_player_master.y;
        } else {
            spawn_x = obj_player_master.x;
            spawn_y = obj_player_master.y - 80;
        }
        instance_create_layer(spawn_x, spawn_y, "Instances", item_object);
		obj_inventory_data_manager.spawned_item = item_object;
    }
}