if (global.is_paused) {
	//do nothing while the game is paused
	exit;	
}

//Stop our movement if we are in dialogue
if(global.inDialogue)
{
	x_velocity = 0
}

if(!keyboard_check(vk_space))
{
	is_jumping = false	
}

if (!global.lantern_grabbed && place_meeting(x + 10, y + 5, obj_lantern)) { // x+10 to ensure inventroy interaction occurs before pickup
    with (obj_lantern) {
        instance_destroy(); // Remove lantern from the game world
    }
	global.lantern_grabbed = true;
	global.fisherDialogue=3;
    add_to_inventory(obj_lantern, spr_lantern); // Call inventory function
}

if (!global.car_grabbed && place_meeting(x + 10, y + 5, obj_racecar)) { // x+10 to ensure inventroy interaction occurs before pickup
    with (obj_racecar) {
        instance_destroy(); // Remove lantern from the game world
    }
	global.car_grabbed = true;
    add_to_inventory(obj_racecar, spr_racecar); // Call inventory function
}

if (!global.axe_grabbed && place_meeting(x + 10, y + 5, obj_axeItem)) { // x+10 to ensure inventroy interaction occurs before pickup
    with (obj_axeItem) {
        instance_destroy(); // Remove lantern from the game world
    }
	global.axe_grabbed = true;
    add_to_inventory(obj_axeItem,axe_inv); // Call inventory function
}

if (!global.ruby_grabbed && place_meeting(x + 10, y + 5, obj_ruby)) { // x+10 to ensure inventroy interaction occurs before pickup
    with (obj_ruby) {
        instance_destroy(); // Remove lantern from the game world
    }
	global.ruby_grabbed = true;
    add_to_inventory(obj_ruby,rubyInv); // Call inventory function
}


if (!global.trophy_grabbed && place_meeting(x + 10, y + 5, obj_trophy)) { // x+10 to ensure inventroy interaction occurs before pickup
    with (obj_trophy) {
        instance_destroy(); // Remove lantern from the game world
    }
	global.trophy_grabbed = true;
    add_to_inventory(obj_trophy,trophyInv); // Call inventory function
}

if(global.in_car){ // speed doubles while in racecar
	x_velocity *= 2	
	
}



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
		x_velocity = 0
		break;
		
		case 2: //one way platforms, player can rise through them but land on top and can move through them horizontaly
		x += x_velocity
		is_jumping = false
		break;
		
		case 3: //same as case 1, but different for key
		move_and_collide(x_velocity,0,obj_collidable_master)
		x_velocity = 0
		break;
		
		case 4: //move the player to another room
		room_goto(xcollison.targetRoomId)
		x = xcollison.targetXPosition
		y = xcollison.targetYPosition
		break;
		
		case 5:
		x += x_velocity;
		// Check if the up arrow is pressed and the door is unlocked
	    if (keyboard_check_pressed(vk_up)) {
	        // Teleport the player when the key is pressed
	        room_goto(xcollison.targetRoomId);
	        x = xcollison.targetXPosition;
	        y = xcollison.targetYPosition;
	    }
	    break;
		case 7: //water, ignore x factor
		x += x_velocity;
	    break;
		
		case 6: // portals
		x += x_velocity;
		// Check if the up arrow is pressed and the door is unlocked
	    if (keyboard_check_pressed(vk_up)) {
	        // Teleport the player when the key is pressed
	        room_goto(xcollison.targetRoomId);
	        x = xcollison.targetXPosition;
	        y = xcollison.targetYPosition;
	    }
		break;
		
		default: //incase, treat it like regular ground
		move_and_collide(x_velocity,0,obj_collidable_master)
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
		if(y_velocity > 0)
		{
		is_jumping = false
		in_air = false
		is_falling = false
		on_ground = true
		jump_frames = 0
		}
		y_velocity = 0
		break;
		
		case 2: //one way platforms, player can rise through them but land on top
		/*if(bbox_bottom -1 <= ycollison.bbox_top && !platform_passthrough) //if we are above the platform, set our y to the platform y
		{
			y = ycollison.y -80
			on_ground = true
			is_falling = false
			jump_frames = 0
			in_air = false
			y_velocity = 0
		}*/
		if(y_velocity > 0 && !platform_passthrough)
		{
			y = ycollison.y -80
			on_ground = true
			is_falling = false
			is_jumping = false
			jump_frames = 0
			in_air = false
			y_velocity = 0
		}
		else //else, pass through
		{
			y += y_velocity
		}
		break;
		
		case 3: //same as case 1, but different for key
		move_and_collide(0,y_velocity,obj_collidable_master)
		if(y_velocity > 0)
		{
		is_jumping = false
		in_air = false
		is_falling = false
		on_ground = true
		jump_frames = 0
		}
		y_velocity = 0
		break;
		
		case 4: //move the player to another room
		room_goto(ycollison.targetRoomId)
		x = ycollison.targetXPosition
		y = ycollison.targetYPosition
		break;
		
		case 5:
		// Allow the player to move freely past the door
		if(bbox_bottom >= ycollison.bbox_bottom && is_falling == true)
		{
			y = ycollison.bbox_bottom -40
			on_ground = true
			is_falling = false
			is_jumping = false
			in_air = false
			y_velocity = 0
		}
		else
		{
	        y += y_velocity; // Apply gravity only if the player is not grounded
		}
		// Check if the up arrow is pressed
	    if (keyboard_check_pressed(vk_up)) {
	        // Teleport the player when the key is pressed
	        room_goto(ycollison.targetRoomId);
	        x = ycollison.targetXPosition;
	        y = ycollison.targetYPosition;
	    }
	    break;
		
		case 7: //water, if going to make contact "float" in the water
		if(can_be_wet)
		{
		 y = ycollison.y-40
		 on_ground = true
		is_falling = false
		is_jumping = false
		jump_frames = 0
		in_air = false
		y_velocity = 0
		in_water = true
		}
		else
		{
			y+= y_velocity
		}
	    break;
		case 6: // portals
		// Allow the player to move freely past the portal
		if(bbox_bottom >= ycollison.bbox_bottom && is_falling == true)
		{
			y = ycollison.bbox_bottom -40
			on_ground = true
			is_falling = false
			is_jumping = false
			in_air = false
			y_velocity = 0
		}
		else
		{
	        y += y_velocity; // Apply gravity only if the player is not grounded
		}
		// Check if the up arrow is pressed and the door is unlocked
	    if (keyboard_check_pressed(vk_up)) {
	        // Teleport the player when the key is pressed
	        room_goto(xcollison.targetRoomId);
	        x = xcollison.targetXPosition;
	        y = xcollison.targetYPosition;
	    }
		break;
		
		default: //incase, treat it like regular ground
		move_and_collide(0,y_velocity,obj_collidable_master)
		if(y_velocity > 0)
		{
		is_jumping = false
		in_air = false
		is_falling = false
		on_ground = true
		jump_frames = 0
		}
		y_velocity = 0
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
image_speed = 1;
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

//global value to keep track of jumps
if(!in_air)
{
	global.jumping = false;
}
