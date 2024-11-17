// Screen dimensions
var screen_width = display_get_width();
var screen_height = display_get_height();

// Draw the title text at the top center
draw_set_color(c_black);
var text = "Choose Your Character:";
var text_width = string_width(text);
// Draw the text with scaling
draw_text_transformed((screen_width / 2) - (text_width * 3), 250, text, 4, 4, 0);

// Position the characters side-by-side
var character_spacing = 200;
var start_x = (screen_width / 2) - (array_length(global.characters) * character_spacing) / 2;
var y_position = screen_height / 2;

// Loop through characters and draw each with a selection box around the chosen one
for (var i = 0; i < array_length(global.characters); i++) {
    var x_position = start_x + i * character_spacing;
    
    // Draw glowing yellow box if this character is selected
    if (i == global.selected_character) {
        draw_set_color(c_yellow);
        draw_rectangle(x_position - 60, y_position - 60, x_position + 60, y_position + 60, false); // Larger glowing box
        draw_set_color(c_black);
        draw_rectangle(x_position - 50, y_position - 50, x_position + 50, y_position + 50, false); // Smaller inner box
    } else {
        // Draw a regular black box for non-selected characters
        draw_set_color(c_black);
        draw_rectangle(x_position - 50, y_position - 50, x_position + 50, y_position + 50, false);
    }
    
    // Draw character sprite centered within the box
    draw_sprite_ext(global.characters[i], 0, x_position, y_position, 1, 1, 0, c_white, 1);
}