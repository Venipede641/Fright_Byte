/// @description Insert description here
// You can write your code in this editor
if(other.y > other.yprevious && other.name != "axe")
{
show_debug_message(other)
stunned = true
}
else if(other.y>other.yprevious && other.name == "axe")
{
	instance_create_layer(x,y,"Instances",obj_poof)
	instance_destroy()
}