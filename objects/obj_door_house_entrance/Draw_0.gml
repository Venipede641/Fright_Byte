// Draw the door sprite
draw_self();

// Draw text if player is nearby
if (show_text) {
	draw_set_color(c_red)
	
	if (!is_locked){
	    draw_text(x - 60, y - 150, "Press ^ to enter"); // Adjust `y - 32` as needed
	}
	else{
	    draw_text(x - 60, y - 150, "Door is locked"); // Adjust `y - 32` as needed
	}
	draw_set_color(c_white)
}