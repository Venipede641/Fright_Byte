if(global.player.y<y && !jumping && !receeding)
{
	if(global.player.x <= x+80 && global.player.x >= x)
	{
		jumping = true
	}
}

if(jumpspeed>1 && sprite_index!=Plant_flying)
{
	sprite_index = Plant_flying	
}

if(jumping)
{
	y-=jumpspeed
	if(jumpspeed<1){jumpspeed+=0.095}
	else{jumpspeed+= 5;}
	if(y<anchorpoint[1]-1500)
	{
		jumping = false
		receeding = true
		jumpspeed=0.2
	}
}
if(receeding)
{
	if(y>=anchorpoint[1])
	{
		receeding=false
		y=anchorpoint[1]
		sprite_index= Plant_idle
		return
	}
	y+=5
}