// Draw the door sprite
draw_self();

// Draw text if player is nearby
if (show_text) {
    //draw_set_font(fnt_game); // Replace with your desired font
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y - 128, "Press ^ to enter"); // display text above object
}