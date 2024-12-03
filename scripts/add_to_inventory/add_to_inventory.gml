function add_to_inventory(item_object, item_sprite) {
    // Check if item is already in the inventory (based on object ID)
    

    // If no duplicate, add item to first empty slot
    for (var i = 0; i < array_length(global.inventory_slots); i++) {
        if (global.inventory_slots[i].item == noone) { // Find an empty slot
            global.inventory_slots[i].item = item_object; // Store object ID
            global.inventory_slots[i].sprite = item_sprite; // Assign sprite
            show_debug_message("Lantern added to slot " + string(i));
			global.lantern_grabbed = true;
			global.empty_inventory = false; // may want tomove this somewhere else
            return; // Exit after adding
        }
    }

    // Optional: Handle case where inventory is full
    show_debug_message("Inventory is full!");
}