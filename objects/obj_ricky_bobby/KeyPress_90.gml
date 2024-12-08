if(!global.inDialogue)
{
if(distance_to_object(global.player) < 15)
{
	if(global.tire_connected == 2){
		instance_create_layer(0,0,"Instances",dia_Ricky2)
	}
	else{
		instance_create_layer(0,0,"Instances",dia_Ricky1)
	}
	
	
}}