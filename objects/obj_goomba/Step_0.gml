if(!stunned)

{x += xvalue * speedValue}

else
{
	stuntimer--
	if(stuntimer==0)
	{
		stunned=false;
		stuntimer=stuncap;
	}
}
