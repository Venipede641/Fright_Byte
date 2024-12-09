/// @description Insert description here
// You can write your code in this editor
var colliable = instance_nearest(x,y,obj_health_pickup)
if (player_health <= 2)
{
	player_health++
}
instance_destroy(colliable)
