/// @description runs game movement and animations


//jumping and gravity bellow
if(is_falling) //if falling, increase the desent speed for a tighter jump
{
y_velocity += obj_gamecontroller.game_gravity //velocity gets modified
}
y_velocity += obj_gamecontroller.game_gravity //applies once if rising, twice if falling
var predicted_y = y + y_velocity //predicts the movement

if(!place_meeting(x,predicted_y,obj_collison_box))
{
y += y_velocity//apply the velocity
if((y+sprite_height/2) >= room_height)
{
	y =room_height - sprite_height/2
	on_ground = true
	is_jumping = false
	in_air = false
	is_falling = false
	y_velocity = 0
}
}
else //we are going to hit a platform
{
	predicted_y = y
	while(!place_meeting(x,predicted_y,obj_collison_box))
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


if(y_velocity >0) //check if we're falling
{
	alarm[1] = game_get_speed(gamespeed_fps) *.25 // coyote time, allows player to jump a little after they fell of the platform
	in_air =true
	is_falling = true
}


var predicted_x = x + x_velocity

if(!place_meeting(predicted_x,y,obj_collison_box))
{
	x += x_velocity
/*	redundant code, if rooms are made right is uneeded
if((x-sprite_width/2) <= 0 )
{
	x = sprite_width/2
}
else if((x+sprite_width/2) >= room_width)
{
	x = room_width-sprite_width/2	
}
*/
}
else //we are going to hit a platform
{
	predicted_x = x
	while(!place_meeting (predicted_x,y,obj_collison_box))
	{
		predicted_x += sign(x_velocity) //"nudge" the object in place
	}
	x = predicted_x - sign(x_velocity) //apply "nudge" to put player in correct position
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
if(obj_player_master.x_velocity > 0)
	{ //this code flips the player depending on what way the player is moving, this used for item throwing and saves work for getting 2 different animations moving left and right
		image_xscale = 1 
	}
else if(obj_player_master.x_velocity < 0)
	{
		image_xscale = -1
	}
if(obj_player_master.x_velocity != 0&& obj_player_master.on_ground)
{
	if(obj_player_master.x_velocity != 0)
	{
		if(obj_player_master.is_holding_item == true)
		{
			animation_state = 5 // walk with item
		}
		else
		{
			animation_state = 1 //walk no item
		}
	}
}
else if(obj_player_master.is_jumping && obj_player_master.is_falling == false)
{
	if(obj_player_master.is_holding_item == true)
		{
			animation_state = 6 // rising jump with item
		}
		else
		{
			animation_state = 2 //rising jump no item
		}
}
else if(obj_player_master.is_falling == true)
{
	if(obj_player_master.is_holding_item == true)
		{
			animation_state = 7 // falling jump with item
		}
		else
		{
			animation_state = 3 //falling jump no item
		}
}
else if(obj_player_master.y_velocity == 0 && obj_player_master.sprite_index == spr_player_turtle_jump_falling|| obj_player_master.x_velocity == 0)
{ //this is a catch case for when the player lands, to return them to idle incase they are not moving
	if(obj_player_master.is_holding_item == true) 
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
	if(obj_player_master.is_holding_item == true)
	{
		animation_state = 4 // idle with item
	}
	else
	{
		animation_state = 0 // idle no item
	}
}