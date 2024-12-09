/// @description Insert description here
// You can write your code in this editor
if(obj_player_master.player_health >= 3)
{
	sprite_index = spr_health_3	
}
if(obj_player_master.player_health == 2)
{
	sprite_index = spr_health_2
}
if(obj_player_master.player_health == 1)
{
	sprite_index = spr_health_1
}
if(obj_player_master.player_health <= 0)
{
	sprite_index = spr_health_0	
}