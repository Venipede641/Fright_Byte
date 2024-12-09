/// @description Insert description here
// You can write your code in this editor
if(being_held && sprite_index != Axe_carry)
{
	sprite_index = Axe_carry
	justHeld = true
}
else if(justHeld && !being_held && sprite_index != Axe_throw)
{
	sprite_index = Axe_throw; justHeld = false
	show_debug_message("SWITCHIN UP!")
	}
	
	if(x==xprevious&&y==yprevious && !being_held)
{
sprite_index = Axe_Idle
}
