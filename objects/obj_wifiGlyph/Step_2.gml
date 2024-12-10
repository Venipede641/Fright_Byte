if(animating)
{
	if(animationtimer==0)
	{
		index++
		if(index==4){animating=false; animated = true;}
		sprite_index = frames[index]
		animationtimer = animationtimercap
	}
	else{animationtimer--}
}