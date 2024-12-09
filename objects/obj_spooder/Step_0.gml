if(!stunned)

{x += xvalue * speedValue; image_blend = c_white;}

else
{
	image_blend = c_blue;
	stuntimer--
	if(stuntimer==0)
	{
		stunned=false;
		stuntimer=stuncap;
	}
}
