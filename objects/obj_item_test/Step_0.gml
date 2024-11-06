//when picked up we want the item to follow the player above their head
if(obj_player_master.is_holding_item== true)
{
	x = obj_player_master.x
	y = obj_player_master.y -80
}
else
{
y_velocity += obj_gamecontroller.game_gravity 
var predicted_y = y + y_velocity //predicts the movement

if(!place_meeting(x,predicted_y,obj_collison_box))
{
y += y_velocity//apply the velocity
if((y+sprite_height/2) >= room_height)
{
	y =room_height - sprite_height/2
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
	y_velocity = 0 //kill vertical velocity or start falling
	x_velocity = 0
}


var predicted_x = x + x_velocity

if(!place_meeting(predicted_x,y,obj_collison_box))
{
	x += x_velocity
if((x-sprite_width/2) <= 0 )
{
	x = sprite_width/2
	x_velocity = 0
}
else if((x+sprite_width/2) >= room_width)
{
	x = room_width-sprite_width/2	
	x_velocity = 0
}
}
else //we are going to hit a platform
{
	predicted_x = x
	while(!place_meeting (predicted_x,y,obj_collison_box))
	{
		predicted_x += sign(x_velocity)
	}
	x = predicted_x - sign(x_velocity)
	x_velocity = 0
}
}