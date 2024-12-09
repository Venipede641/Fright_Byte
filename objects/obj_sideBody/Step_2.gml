
if(x!=xprevious || y!=yprevious)
{
var temp = [x,y]
array_push(positions,temp)

show_debug_message("Array length of positions in head:")
show_debug_message(array_length(positions))
}
else{show_debug_message("===================STOPPED=========================")}


//CODE FOR SPRITE
if(x < xprevious)
{
	sprite_index = swheadleft
}

if(x > xprevious)
{
	sprite_index = swheadright
}

if(y < yprevious)
{
	sprite_index = swheadup
}

if(y > yprevious)
{
	sprite_index = swheaddown
}