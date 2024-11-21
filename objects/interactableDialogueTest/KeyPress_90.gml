
if(!global.inDialogue){
	if(distance_to_object(global.player) < 10){
		instance_create_layer(0,0,"Instances",DialogueTest)
	}
}