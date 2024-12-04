function add_to_inventory(item_object, item_sprite) {
	if(item_object == obj_racecar){//ensure racecar always goes in last slot... This may get deleted as its not super necessary
		global.inventory_slots[4].item = item_object; // Store object ID
        global.inventory_slots[4].sprite = item_sprite; // Assign sprite
		return;
	}
	
    // If no duplicate, add item to first empty slot
    for (var i = 0; i < array_length(global.inventory_slots); i++) {
        if (global.inventory_slots[i].item == noone) { // Find an empty slot
            global.inventory_slots[i].item = item_object; // Store object ID
            global.inventory_slots[i].sprite = item_sprite; // Assign sprite
			global.empty_inventory = false; // may want to move this somewhere else
            return; // Exit after adding
        }
    }

    // Optional: Handle case where inventory is full
    show_debug_message("Inventory is full!");
}