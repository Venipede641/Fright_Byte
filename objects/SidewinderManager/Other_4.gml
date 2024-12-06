SideWinderScript()

length = 10
if(global.chase)
{
active = false
show_debug_message(firstNodeX)
show_debug_message(firstNodeY)
var assigned = false
var currentNode
with(obj_SideNode)
{
	
	if(!assigned)
	{
		
		other.firstNodeX = self.x
		other.firstNodeY = self.y
		show_debug_message("Node set in room start!")
		show_debug_message(other.firstNodeX)
		show_debug_message(other.firstNodeY)
		assigned = true
	}
	
	else
	{
		if(point_distance(self.x,self.y,global.player.x,global.player.y) < point_distance(other.firstNodeX,other.firstNodeY,global.player.x,global.player.y))
		{
			other.firstNodeX = self.x
			other.firstNodeY = self.y
		}
	}
	
}

//bodyPart = instance_create_layer(currentNode.x, currentNode.y, "Instances", obj_sideBody);
//bodyPart = instance_create_layer(1000, 520, "Instances", obj_sideBody);
}