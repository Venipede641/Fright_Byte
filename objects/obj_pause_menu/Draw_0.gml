// Get the dimensions of the sprite
var pause_spritewidth = sprite_get_width(spr_pause_menu);
var pause_spriteheight = sprite_get_height(spr_pause_menu);

// Draw the menu background (adjusting position to center it in the room)
draw_sprite(spr_pause_menu, 0, room_width / 2, room_height / 2);

// Draw the menu options
for (var i = 0; i < array_length(menu_options); i++) {
    // Set color for the selected option
    if (i == selected_option) {
        draw_set_color(c_yellow); // Highlight selected option
    } else {
        draw_set_color(c_white); // Default color for unselected options
    }

    // Calculate the text position to ensure it's centered within the sprite
    var center_x = room_width / 2; // X-coordinate for centering (middle of the room)
    var center_y = room_height / 2 + pause_spriteheight / 2; // Y-coordinate below the sprite center
    
    var menu_text_x = center_x - (string_width(menu_options[i]) / 2); // Center text horizontally
    var menu_text_y = center_y - 90 + (i * 30); // Vertical spacing from the sprite's bottom

    // Draw text for each menu option
    draw_text(menu_text_x, menu_text_y, menu_options[i]);
}