/// @description Insert description here
// You can write your code in this editor
if(being_held && sprite_index != Gem_Held)
{
	sprite_index = Gem_Held
	justHeld = true
}
else if(justHeld && !being_held && sprite_index != Gem_Thrown)
{
	sprite_index = Gem_Thrown; justHeld = false
	show_debug_message("SWITCHIN UP!")
	}
	
	if(x==xprevious&&y==yprevious && !being_held)
{
sprite_index = Gem_Resting
}
