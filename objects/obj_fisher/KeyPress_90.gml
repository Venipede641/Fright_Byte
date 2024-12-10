if(!global.inDialogue)
{
if(distance_to_object(global.player) < 20)
{
	if(global.fisherDialogue == 1)
	{
	instance_create_layer(0,0,"Instances",dia_fisher1)
	}
	if(global.fisherDialogue == 2)
	{
	instance_create_layer(0,0,"Instances",dia_fisher2)
	}
	if(global.fisherDialogue == 3)
	{
	instance_create_layer(0,0,"Instances",dia_fisher3)
	}
}

}