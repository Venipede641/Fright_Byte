// Handle item selection (keys 1-5)
for (var i = 0; i < slots; i++) {
    if (keyboard_check_pressed(ord("1") + i)) {
        // Deselect all slots
        for (var j = 0; j < slots; j++) {
            global.inventory_slots[j].selected = false;
        }
        // Select the chosen slot
        global.inventory_slots[i].selected = true;
        
        // Use the selected item
        use_selected_item(global.inventory_slots[i].item);
        break; // Exit after selecting item
    }
}

// Deselect item when 'Q' is pressed
if (keyboard_check_pressed(ord("Q"))) {
    for (var i = 0; i < slots; i++) {
        global.inventory_slots[i].selected = false;
    }
}

