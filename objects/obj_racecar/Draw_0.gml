draw_self();

if (show_text && !global.in_car) {
	draw_set_color(c_black)
	draw_text(x - 60, y - 100, "Press ^ to enter");
	draw_set_color(c_white)
}