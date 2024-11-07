/// @description runs game movement and animations

if(y_velocity > 0) //check if we're falling
{
	alarm[1] = game_get_speed(gamespeed_fps) *.25 // coyote time, allows player to jump a little after they fell of the platform
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
	switch(ycollison.terrian_type) //reads the terrain type and acts acordingly
	{
		case 1: //solid ground from all directions, noraml collison code
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
		break;
		
		case 2: //one way platforms, player can rise through them but land on top
		if(y_velocity < 0 || platform_passthrough == true) //if we are not falling, ignore
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
		
		case 3: //keydoor, same as solid ground for player, thus the same code for it
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
		break;
		
		case 2: //colliding with platform
		x += x_velocity
		break;
		
		case 3: // keydoor, same as solid ground for player
		predicted_x = x
		while(!place_meeting (predicted_x,y,xcollison))
		{
			predicted_x += sign(x_velocity) //"nudge" the object in place
		}
		x = predicted_x - sign(x_velocity) //apply "nudge" to put player in correct position
		break;
	}
}

//animation handling
//shortcut for what each number means
//0 = idle
//1 = walking 
//2 = jumping-rising
//3 = jumping-falling
//4 = idle-itemhold
//5 = walking-itemhold
//6 = jumping-rising-itemhold
//7 = jumping-falling-itemhold
// each other player derivative will have to have a anamation handler seperatly to implement their own sprites, see player turtle for example
if(x_velocity > 0)
	{ //this code flips the player depending on what way the player is moving, this used for item throwing and saves work for getting 2 different animations moving left and right
		image_xscale = 1 
	}
else if(x_velocity < 0)
	{
		image_xscale = -1
	}
if(x_velocity != 0&& on_ground)
{
	if(x_velocity != 0)
	{
		if(is_holding_item == true)
		{
			animation_state = 5 // walk with item
		}
		else
		{
			animation_state = 1 //walk no item
		}
	}
}
else if(is_falling == false && on_ground == false)
{
	if(is_holding_item == true)
		{
			animation_state = 6 // rising jump with item
		}
		else
		{
			animation_state = 2 //rising jump no item
		}
}
else if(is_falling == true)
{
	if(is_holding_item == true)
		{
			animation_state = 7 // falling jump with item
		}
		else
		{
			animation_state = 3 //falling jump no item
		}
}
else if(y_velocity == 0 && sprite_index == spr_player_turtle_jump_falling|| x_velocity == 0)
{ //this is a catch case for when the player lands, to return them to idle incase they are not moving
	if(is_holding_item == true) 
	{
		animation_state = 4 // idle with item
	}
	else
	{
		animation_state = 0 // idle no item
	}
}
else
{ // if no other flags are triggered... they must be idle
	if(is_holding_item == true)
	{
		animation_state = 4 // idle with item
	}
	else
	{
		animation_state = 0 // idle no item
	}
}