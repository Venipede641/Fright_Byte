// Draw the door sprite
draw_self();

// Draw text if player is nearby
if (show_text) {
	draw_set_color(c_black)
    //draw_set_font(fnt_game); // Replace with your desired font
	if (global.door_unlocked){
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);
	    draw_text(x, y - 128, "Press ^ to enter"); // Adjust `y - 32` as needed
	}
	else{
		draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);
	    draw_text(x, y - 128, "Door is locked"); // Adjust `y - 32` as needed
	}
}