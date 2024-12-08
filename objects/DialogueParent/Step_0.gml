/// @description Insert description here
// You can write your code in this editor

if(showing_dialogue == false)
{
	if(dialogue.count() <= 0)
	{
		instance_destroy();
		global.inDialogue = false;
		return;
	}

	current_dialogue = dialogue.pop();
	// show_debug_message("Added to current dialogue!")
	showing_dialogue = true;
}
else
{
	if(keyboard_check_pressed(key_next))
	{
		showing_dialogue=false;
	}
	
}