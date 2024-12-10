if(!global.inDialogue)
{
if(distance_to_object(global.player) < 20)
{
	if(global.woodsmanDialogue == 1)
	{
	instance_create_layer(0,0,"Instances",dia_woodsman1)
	}
	if(global.woodsmanDialogue == 2)
	{
	instance_create_layer(0,0,"Instances",dia_woodsman2)
	}
	if(global.woodsmanDialogue == 3)
	{
	instance_create_layer(0,0,"Instances",dia_woodsman3)
	}
}

}