// Center the menu options
var screen_width = display_get_width();
var screen_height = display_get_height();

var scale_factor = 0.5;

var center_y = screen_height / 2 + 30; // Adjusted vertically lower
var box_width = 160; // Rectangle width
var box_height = 30; // Rectangle height
var box_spacing = 180; // Spacing between options
var total_width = array_length(options) * box_width + (array_length(options) - 1) * (box_spacing - box_width); // Total width of all boxes + spacing
var start_x = (screen_width - total_width) / 2 - 150; // Adjusted starting position for left alignment

var title_x = screen_width / 2 - 125; // Title x pos
var title_y = 475; // Title y pos

draw_sprite(spr_title, 0, title_x, title_y); // Draw the title

for (var i = 0; i < array_length(options); i++) {
    var option_text = options[i];
    var text_width = string_width(option_text); // Get width of the text
    var text_height = string_height(option_text); // Get height of the text

    // Adjust rectangle and text positions
    var box_x = start_x + i * box_spacing; // Position each box horizontally
    var box_y = center_y - box_height / 2; // Center vertically

    // Draw black box behind the text
    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);

    // Center the text within the box
    var text_x = box_x + (box_width - text_width) / 2;
    var text_y = center_y - text_height / 2;

    // Draw the text with a glow for the selected option
    if (i == selected_option) {
        draw_set_color(c_yellow);
        draw_text(text_x + 2, text_y + 2, option_text); // Glow effect
    } else {
        // Draw main option text in white, centered
        draw_set_color(c_white);
        draw_text(text_x, text_y, option_text);
    }
}