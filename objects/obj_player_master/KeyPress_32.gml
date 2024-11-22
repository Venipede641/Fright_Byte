/// @description jump
// You can write your code in this editor
if(global.inDialogue){return}
if(on_ground)
{
	if(instance_place(x,y+10,obj_platform) && keyboard_check(vk_down)) //if the player is on a platform and holding down, passthrough it
	{
		platform_passthrough = true //passing through a platform, prevents undesired interactions
		alarm[2] = game_get_speed(gamespeed_fps) * .2
		y_velocity = .1 // starts the fast falling imediatly
	}
	else
	{
	global.jumping = true;
	global.janchorX = x;
	global.janchorY = y;
	y_velocity = jump_power
	on_ground =false
	is_jumping = true
	in_air = true
	is_falling =false
	}
}