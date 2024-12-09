/// Inventory slots
    slots = 5;
    
    // Inventory rectangle properties
    inv_width = 250;
    inv_height = 60;
    inv_x = (room_width - inv_width) / 2;
    inv_y = room_height - inv_height - 20;
    
    // Slot properties
    slot_width = inv_width / slots;
    slot_height = inv_height;
    
    // Color definitions might not use this
    // highlight_color = make_color_rgb(0, 255, 0);  // Green highlight
    
    // Inventory management
    // Initialize all slots with mystery sprite and no item
	if (global.empty_inventory){ 
	    global.inventory_slots = [];
	
		for (var i = 0; i < slots; i++) {
		    global.inventory_slots[i] = {
		        item: noone,
		        sprite: spr_mystery,
		        selected: false
		    };
		}
	}