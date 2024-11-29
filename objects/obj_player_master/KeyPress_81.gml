/// @description throw item
// You can write your code in this editor
if(global.inDialogue){return}
if(is_holding_item == true) 
{
	is_holding_item = false
	can_pick_up = false
	var item = instance_nearest(x,y,obj_item_master) //gets the item the player is holding for flag updating
	item.being_thrown = true
	alarm[0] = game_get_speed(gamespeed_fps) * .5 //after the alarm expires, the player can pick up items again, prevents weird edge cases
	item.x_velocity = (image_xscale) * 15 //l-l-l-launching!
	item.y_velocity = -27.5
	item.being_held = false
}