// Initialize spacing between inventory slots
var spacing = 10; // Set the space between each slot, adjust this value as needed

// Adjust the total inventory width to accommodate the extra spacing
var total_width = (slot_width + spacing) * slots - spacing; // Total width with spacing

// Draw inventory background (adjusted width and moved 20 pixels down)
draw_set_color(c_dkgray);
draw_set_alpha(0.7);
draw_rectangle(inv_x, inv_y + 10, inv_x + total_width, inv_y + inv_height + 10, false); // Moved down by 10 pixels
draw_set_alpha(1);

// Draw slots
for (var i = 0; i < slots; i++) {
    var slot_x = inv_x + (i * (slot_width + spacing)); // Increased space between slots
    var current_slot = global.inventory_slots[i]; // Access global inventory slots
    
    // Draw slot outline
    draw_set_color(c_white);
    draw_rectangle(slot_x, inv_y + 10, slot_x + slot_width, inv_y + slot_height + 10, true); // Moved down by 10 pixels
    
    // Highlight selected slot... might not use this
    /* if (current_slot.selected) {
        draw_set_color(highlight_color);
        draw_rectangle(slot_x, inv_y + 20, slot_x + slot_width, inv_y + slot_height + 20, true); // Moved down by 10 pixels
    } */
    
    // Draw smaller item sprite (scale it down)
    var sprite_scale = 0.5; // Scale down the sprite (adjust this value as needed)
    draw_sprite_ext(current_slot.sprite, 0, 
                    slot_x + (slot_width / 2), inv_y + (slot_height / 2) + 10,  // Moved down by 10 pixels
                    sprite_scale, sprite_scale, 0, c_white, 1);
    
    // Draw slot number
    draw_set_halign(fa_right);
    draw_set_valign(fa_bottom);
    draw_text(slot_x + (slot_width / 2) - 10, inv_y + slot_height - 5 + 10, string(i + 1)); // Moved down by 10 pixels
}

// Reset drawing settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);