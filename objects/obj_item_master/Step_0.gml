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
if(y_velocity > 0) //check if we're falling
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

var predicted_y = y + y_velocity //predicts the movement
var ycollison = instance_place(x,predicted_y,obj_collidable_master) //fetchs the object we are colliding with, if there is one
if(ycollison == noone)//checks to see if we are hitting a colliable
{
y += y_velocity//apply the velocity, no collisons will occur
}
else //we are going to hit a colliable
{
	switch(ycollison.terrian_type)
	{
		case 1: //solid ground from all directions
		predicted_y = y
		while(!place_meeting(x,predicted_y,ycollison))
		{
			predicted_y += sign(y_velocity)
		}
		y = predicted_y- sign(y_velocity)
		is_falling = false
		if(y_velocity > 0)
		{
			x_velocity = 0
			y_velocity = 0
		}
		else
		{
			being_thrown = false
		y_velocity = 0
		}
		break;
		
		case 2: //one way platforms, player can rise through them but land on top
		if(y_velocity < 0 ) //if we are not falling, ignore
		{
			y += y_velocity
		}
		else //else, collide as normal
		{
			predicted_y = y
			while(!place_meeting(x,predicted_y,ycollison))
			{
				predicted_y += sign(y_velocity)
			}
			y = predicted_y- sign(y_velocity)
			on_ground = true
			is_jumping = false
			in_air = false
			is_falling = false
			y_velocity = 0
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
		predicted_y = y
		while(!place_meeting(x,predicted_y,ycollison))
		{
			predicted_y += sign(y_velocity)
		}
		y = predicted_y- sign(y_velocity)
		is_falling = false
		if(y_velocity > 0)
		{
			x_velocity = 0
			y_velocity = 0
		}
		else
		{
			being_thrown = false
		y_velocity = 0
		}
		}
		break;
	}
}

var predicted_x = x + x_velocity
var xcollison = instance_place(predicted_x,y,obj_collidable_master)
if(xcollison == noone)
{
	x += x_velocity
}
else //we are going to hit a platform
{
	switch(xcollison.terrian_type)
	{
		case 1: // colliding with solid ground
		predicted_x = x
		while(!place_meeting (predicted_x,y,xcollison))
		{
			predicted_x += sign(x_velocity) //"nudge" the object in place
		}
		x = predicted_x - sign(x_velocity) //apply "nudge" to put player in correct position
		x_velocity = 0
		break;
		
		case 2: //colliding with platform
		x += x_velocity
		break;
		
		case 3: //colliding with solid ground
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
		predicted_x = x
		while(!place_meeting (predicted_x,y,xcollison))
		{
			predicted_x += sign(x_velocity) //"nudge" the object in place
		}
		x = predicted_x - sign(x_velocity) //apply "nudge" to put player in correct position
		x_velocity = 0
		}
		break;
	}
}
}