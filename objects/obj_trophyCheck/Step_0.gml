/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_trophy))
{
	with(obj_trophy)
	{
		if(self.being_held)
		{
			show_debug_message("Holding trophy!")
			global.holdingTrophy = true
			show_debug_message(global.holdingTrophy)
			show_debug_message("In being held")
		}
		else{global.holdingTrophy = false; show_debug_message("Trophy not being held")}
		show_debug_message(global.holdingTrophy)
		show_debug_message("In end of if!")
	}
}
	else
	{global.holdingTrophy = false;show_debug_message("No trophy.")}
show_debug_message(global.holdingTrophy)
show_debug_message("Just before check")
if(global.holdingTrophy)
{
	show_debug_message("DEAR LORD IM IN")
	with(obj_floating_pet_food)
	{
		show_debug_message("Checking your position player.")
		if(y-global.player.y> 0 && y-global.player.y < 140)
		{
			if(global.player.x > x-40 && global.player.y < x+40)
			{
				instance_create_layer(0,0,"Instances",obj_fadeout);
				room_goto(abyss_1)
				global.player.x = 240
				global.player.y = 90
			}
			else{show_debug_message("wrong x position")}
		}
		else{show_debug_message("wrong y position")}
	}
}
else{show_debug_message("Watch your feet private.")}
debugtick++
show_debug_message(debugtick)