// Draw the menu background
draw_sprite(spr_pause_menu, 0, x, y);

// Draw menu options
for (var i = 0; i < array_length(menu_options); i++) {
    if (i == selected_option) {
        draw_set_color(c_yellow); // Highlight selected option
    } else {
        draw_set_color(c_white);
    }
    draw_text(x - 50, y - 20 + (i * 20), menu_options[i]);
}