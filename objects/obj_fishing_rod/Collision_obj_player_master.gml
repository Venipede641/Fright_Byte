/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(ord("Q")) && other.is_holding_item == false
{
	instance_create_layer(x, y, "Instances", obj_fish)
}