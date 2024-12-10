draw_self();

// Draw text if player is nearby
if (show_text) {
	draw_set_color(c_black)
	draw_text(x - 60, y - 500, "Press z to speak with"); // Adjust `y - 32` as needed
	draw_set_color(c_white)
}
draw_set_color(c_white)