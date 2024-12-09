/// @description Insert description here
// You can write your code in this editor
if(can_be_hurt)
{
	player_health--
	can_be_hurt = false
	alarm[4] = game_get_speed(gamespeed_fps) * 2
}
if(player_health = 0)
{
	room_goto(rm_game_over);	
	x = 650;
	y = -130;
}
