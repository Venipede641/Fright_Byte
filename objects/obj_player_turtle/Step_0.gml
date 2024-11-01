
if(is_falling) //if falling, increase the desent speed for a tighter jump
{
y_velocity += obj_gamecontroller.game_gravity //velocity gets modified
}
y_velocity += obj_gamecontroller.game_gravity //applies once if rising, twice if falling
var predicted_y = y + y_velocity //predicts the movement

if(!place_meeting(x,predicted_y,obj_box))
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
	while(!place_meeting(x,predicted_y,obj_box))
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
	on_ground = false
	is_falling = true
	in_air =true
}


var predicted_x = x + x_velocity

if(!place_meeting(predicted_x,y,obj_box))
{
	x += x_velocity
if((x-sprite_width/2) <= 0 )
{
	x = sprite_width/2
}
else if((x+sprite_width/2) >= room_width)
{
	x = room_width-sprite_width/2	
}
}
else //we are going to hit a platform
{
	predicted_x = x
	while(!place_meeting (predicted_x,y,obj_box))
	{
		predicted_x += sign(x_velocity)
	}
	x = predicted_x - sign(x_velocity)


}