
	draw_self();


	// Draw text if player is nearby
	if (show_text) {
		draw_set_color(c_black)
	    draw_text(x - 60, y - 150, "Press ^ to enter");
		draw_set_color(c_white)
	}
