//when picked up we want the item to follow the player above their head
if(being_held== true)
{
	x = obj_player_master.x
	y = obj_player_master.y -80
	persistent = true
}
else
{
	persistent = false
if(y_velocity >= 0) //check if we're falling
{
	is_falling = true
}
else
{
	is_falling = false	
}
//jumping and gravity bellow
if(is_falling) //if falling, increase the desent speed for a tighter jump
{
y_velocity += obj_gamecontroller.game_gravity //velocity gets modified
}
y_velocity += obj_gamecontroller.game_gravity //applies once if rising, twice if falling

var predicted_x = x + x_velocity
var xcollison = instance_place(predicted_x,y,obj_collidable_master) //fetchs the object we are colliding with, if there is one
if(xcollison == noone)
{
	x += x_velocity
}
else
{
	switch(xcollison.terrian_type)
	{
		case 1: //solid ground from all directions
		move_and_collide(x_velocity,0,obj_collidable_master)
		is_falling = false
		x_velocity = 0
		break;
		
		case 2: //one way platforms, player can rise through them but land on top
		x += x_velocity
		break;
		
		case 3: //same as case 1, but different for key
		if(item_property == 1) //if a key, unlock the door
		{
			if(!being_thrown)
			{
				instance_destroy(xcollison)
				obj_player_master.is_holding_item = false
				instance_destroy()
			}
			else
			{
				instance_destroy(xcollison)
				instance_destroy()
			}
		}
		else
		{
		move_and_collide(x_velocity,0,obj_collidable_master)
		is_falling = false
		x_velocity = 0
		}
		break;
		
		case 4: //move the player to another room
		move_and_collide(0,y_velocity,obj_collidable_master)
		break;
		
		default: //incase, treat it like regular ground
		move_and_collide(x_velocity,0,obj_collidable_master)
		is_falling = false
		x_velocity = 0
	}
}
	
	var predicted_y = y + y_velocity //predicts the movement
	var ycollison = instance_place(x,predicted_y,obj_collidable_master) //fetchs the object we are colliding with, if there is one
	if(ycollison == noone)
	{
		y += y_velocity
	}
	else
	{
	switch(ycollison.terrian_type)
	{
		case 1: //solid ground from all directions
		move_and_collide(0,y_velocity,obj_collidable_master)
		is_falling = false
		if(y_velocity > 0)
		{
		x_velocity =0
		}
		y_velocity = 0
		break;
		
		case 2: //one way platforms, player can rise through them but land on top
		if(bbox_bottom -1 <= ycollison.bbox_top) //if we are above the platform, set our y to the platform y
		{
			y = ycollison.y -80
			is_falling = false
			y_velocity = 0
			x_velocity = 0
			being_thrown = false
		}
		else //else, pass through
		{
			y += y_velocity
			is_falling = true
		}
		break;
		
		case 3: //same as case 1, but different for key
		if(item_property == 1) //if a key, unlock the door
		{
			if(!being_thrown)
			{
				instance_destroy(ycollison)
				obj_player_master.is_holding_item = false
				instance_destroy()
			}
			else
			{
				instance_destroy(ycollison)
				instance_destroy()
			}
		}
		else
		{
		move_and_collide(0,y_velocity,obj_collidable_master)
			is_falling = false
			y_velocity = 0
		}
		break;
		
		case 4: //move the player to another room, since it's an object, just collide
		move_and_collide(0,y_velocity,obj_collidable_master)
		y_velocity = 0
		break;
		
		default: //incase, treat it like regular ground
		move_and_collide(0,y_velocity,obj_collidable_master)
		is_falling = false
		y_velocity = 0
		
	}
	}
}