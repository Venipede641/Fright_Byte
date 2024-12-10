/// @description Insert description here
// You can write your code in this editor
//show_debug_message(global.chase)
if(active)
{
	if(!global.killSidewinder)
{SideWinderUpdate(bodyPart);}
}
//show_debug_message(string(global.player.x) + "," + string(global.player.y));









//START CHASE
if(global.chaseStart)
{
var assigned = false
var currentNode
with(obj_SideNode)
{
	
	if(!assigned)
	{
		show_debug_message("Setting initial node")
		currentNode = self
		show_debug_message("Node set!")
		assigned = true
	}
	
	else
	{
		if(point_distance(self.x,self.y,global.player.x,global.player.y) < point_distance(currentNode.x,currentNode.y,global.player.x,global.player.y))
		{
			currentNode = self
		}
	}
	
}

if(global.cutChasex != 0 || global.cutChasey != 0)
{
	bodyPart = instance_create_layer(global.cutChasex, global.cutChasey, "Instances", obj_sideBody);
	firstNodeX = global.cutChasex
	firstNodeY = global.cutChasey
	
	
}
else{bodyPart = instance_create_layer(currentNode.x, currentNode.y, "Instances", obj_sideBody);}
spawned = true
//bodyPart = instance_create_layer(1000, 520, "Instances", obj_sideBody);
global.chaseStart = false
global.chase = true
//might be bad code?
firstNodeX = currentNode.x
firstNodeY = currentNode.y
active = true;
}

//if active, tick down a timer on update to spawn the next segment, then the next, and -- the number until we hit zero. then on scene change, reset number
if(active && length !=0)
{
	show_debug_message("Heres the freaking spawn timer");
	show_debug_message(spawntimer);
	if(spawntimer == 0)
	{
		spawntimer = spawncap;
		show_debug_message(firstNodeX);
		show_debug_message(firstNodeY);
		if(global.cutChasex != 0 || global.cutChasey !=0){firstNodex = global.cutChasex;firstNodey = global.cutChasey;}
		instance_create_layer(firstNodeX, firstNodeY, "Instances", obj_sideSegment);
		length--
	}
	else{spawntimer--}
}

//CONTINUE CHASE
if(global.chase && !active)
{
	//Count down wait timer
	if(waitTimer!=0)
	{
	if(frameTimer==0)
	{
		frameTimer = 60
		waitTimer--;
		show_debug_message("COUNTING DOWN")
		show_debug_message(waitTimer)
	}
	else{frameTimer--}
	}
	
	//Spawn
	if(waitTimer==0)
	{
	bodyPart = instance_create_layer(firstNodeX, firstNodeY, "Instances", obj_sideBody);
	active = true
	waitTimer = waitTimerCap
	frameTimer = 60
	}
	
	
}