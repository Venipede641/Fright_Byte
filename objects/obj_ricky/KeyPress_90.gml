if(!global.inDialogue)
{
if(distance_to_object(global.player) < 20)
{
	if(global.rickyDialogue == 1)
	{
	instance_create_layer(0,0,"Instances",dia_ricky1)
	}
	if(global.rickyDialogue == 2)
	{
	instance_create_layer(0,0,"Instances",dia_ricky2)
	}
	if(global.rickyDialogue == 3)
	{
	instance_create_layer(0,0,"Instances",dia_ricky3)
	}
	if(global.rickyDialogue ==4)
	{
	instance_create_layer(0,0,"Instances",dia_ricky4)
	}
}

}