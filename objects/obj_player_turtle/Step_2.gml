/// @description take in the animation state and plays apropriate animation
//shortcut for what each number means
//0 = idle
//1 = walking 
//2 = jumping-rising
//3 = jumping-falling
//4 = idle-itemhold
//5 = walking-itemhold
//6 = jumping-rising-itemhold
//7 = jumping-falling-itemhold
switch(animation_state)
{
	case 0: //idle no item
	sprite_index = spr_player_turtle_idle
	break;
	
	case 1: //walking no item
	sprite_index = spr_player_turtle_walk
	break;
	
	case 2: //jumping rising no item
	sprite_index = spr_player_turtle_jump_rising
	break;
	
	case 3: //jumping falling no item
	sprite_index = spr_player_turtle_jump_falling
	break;
	
	case 4: //idle with item
	sprite_index = spr_player_turtle_idle_itemhold
	break;
	
	case 5: //walking with item
	sprite_index = spr_player_turtle_walk_itemhold
	break;
	
	case 6: //jumping rising with item
	sprite_index = spr_player_turtle_jump_rising
	break;
	
	case 7: //jumping falling with item
	sprite_index = spr_player_turtle_jump_falling
	break;	
}
