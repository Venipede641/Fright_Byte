/// @description throw item
// You can write your code in this editor
if(is_holding_item == true)
{
	is_holding_item = false
	can_pick_up = false
	obj_item_test.being_thrown = true
	alarm[0] = game_get_speed(gamespeed_fps) * .25
	obj_item_test.x_velocity = (image_xscale) * 15
	obj_item_test.y_velocity = -30
}