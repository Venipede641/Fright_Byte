/// @description Insert description here
// WORK IN PROGRESS

if(obj_player_turtle.x_velocity > 0)
	{
		image_xscale = 1
	}
else if(obj_player_turtle.x_velocity < 0)
	{
		image_xscale = -1
	}
if(obj_player_turtle.x_velocity != 0&& obj_player_turtle.on_ground)
{
	if(obj_player_turtle.x_velocity > 0)
	{
		if(obj_player_turtle.is_holding_item == true)
		{
			obj_player_turtle.sprite_index = spr_player_turtle_walk_itemhold
		}
		else
		{
			obj_player_turtle.sprite_index = spr_player_turtle_walk
		}
	}
	else if(obj_player_turtle.x_velocity < 0)
	{
			if(obj_player_turtle.is_holding_item == true)
		{
			obj_player_turtle.sprite_index = spr_player_turtle_walk_itemhold
		}
		else
		{
			obj_player_turtle.sprite_index = spr_player_turtle_walk
		}
	}
}
else if(obj_player_turtle.is_jumping && obj_player_turtle.is_falling == false)
{
	obj_player_turtle.sprite_index = spr_player_turtle_jump_rising
}
else if(obj_player_turtle.is_falling == true)
{
	obj_player_turtle.sprite_index = spr_player_turtle_jump_falling
}
else if(obj_player_turtle.y_velocity == 0 && obj_player_turtle.sprite_index == spr_player_turtle_jump_falling|| obj_player_turtle.x_velocity == 0)
{
	if(obj_player_turtle.is_holding_item == true)
	{
		obj_player_turtle.sprite_index = spr_player_turtle_idle_itemhold
	}
	else
	{
	obj_player_turtle.sprite_index = spr_player_turtle_idle
	}
}
else
{
	if(obj_player_turtle.is_holding_item == true)
	{
		obj_player_turtle.sprite_index = spr_player_turtle_idle_itemhold
	}
	else
	{
	obj_player_turtle.sprite_index = spr_player_turtle_idle
	}
}
