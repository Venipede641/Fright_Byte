/// @description Insert description here
// You can write your code in this editor
room_goto(rm_forest_start)
add_to_inventory(obj_lantern,spr_lantern)
with(obj_anchor)
{
	global.player.x = x
	global.player.y = y
}