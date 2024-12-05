// Initialize spacing between inventory slots
var spacing = 10; // Space between each slot

// Adjust the total inventory width to accommodate spacing
var total_width = (slot_width + spacing) * slots - spacing;

// Draw slots with individual backgrounds
for (var i = 0; i < slots; i++) {
    var slot_x = inv_x + (i * (slot_width + spacing)); // Position each slot
    var current_slot = global.inventory_slots[i]; // Access inventory slot data

    // Draw individual background for each slot (no gray between slots)
    draw_set_color(c_dkgray);
    draw_set_alpha(0.7);
    draw_rectangle(slot_x, inv_y + 10, slot_x + slot_width, inv_y + slot_height + 10, false); // Adjusted to slot only
    draw_set_alpha(1);

    // Draw slot outline
    draw_set_color(c_white);
    draw_rectangle(slot_x, inv_y + 10, slot_x + slot_width, inv_y + slot_height + 10, true); // Adjusted to slot only

    // Draw item sprite with conditional scaling
    var sprite_scale = 0.5; // Default scale
    // Draw item sprite (or spr_mystery if no item exists)
	if (current_slot.sprite != noone) { 
	    var sprite_scale = (current_slot.item == obj_racecar) ? 0.2 : 0.5; // Special scaling for racecar
	    draw_sprite_ext(
	        current_slot.sprite, 0, 
	        slot_x + (slot_width / 2), inv_y + (slot_height / 2) + 10, 
	        sprite_scale, sprite_scale, 0, c_white, 1
	    );
	} else {
	    // Fallback to draw mystery sprite
	    draw_sprite_ext(
	        spr_mystery, 0, 
	        slot_x + (slot_width / 2), inv_y + (slot_height / 2) + 10, 
	        0.5, 0.5, 0, c_white, 1
	    );
	}

    // Draw slot number (for clarity)
    draw_set_halign(fa_right);
    draw_set_valign(fa_bottom);
    draw_text(slot_x + slot_width / 2 - 12, inv_y + slot_height + 12, string(i + 1)); // Adjusted text position
}

// Reset drawing settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);