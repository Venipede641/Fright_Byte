if(global.player.y>y && global.player.y<y+400 && !dropping && !receeding)
{
	if(global.player.x <= x+160 && global.player.x >= x)
	{
		dropping = true
	}
}


if(dropping)
{
	y+=dropspeed
	dropspeed+= 0.82
}
if(receeding)
{
	if(y<=anchorpoint[1])
	{
		receeding=false
		y=anchorpoint[1]
		return
	}
	y-=5
}