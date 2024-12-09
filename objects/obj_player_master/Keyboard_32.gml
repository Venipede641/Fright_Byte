/// @description jump
// You can write your code in this editor
if(global.inDialogue){return}
if(global.in_car){return}
if(jump_frames <= 6)
{
	if((on_ground || is_jumping) && !platform_passthrough)
	{
		if(instance_place(x,y+10,obj_platform) && keyboard_check(vk_down)) //if the player is on a platform and holding down, passthrough it
		{
			platform_passthrough = true //passing through a platform, prevents undesired interactions
			alarm[2] = game_get_speed(gamespeed_fps) * .2
			y_velocity = .1 // starts the fast falling imediatly
			is_jumping = false
		}
		else
		{
		global.jumping = true;
		global.janchorX = x;
		global.janchorY = y;
		jump_frames++
		if(in_water)
			{
			if(jump_frames <= 4)
				{
					y_velocity += jump_power/6
				}
			in_water = false
			can_be_wet = false
			alarm[3] = .25 * game_get_speed(gamespeed_fps)
			}
		else
		{
			if(jump_frames <= 4)
				{
					y_velocity += jump_power/4
				}
		}	
		on_ground =false
		is_jumping = true
		in_air = true
		is_falling =false
		}
	}
}