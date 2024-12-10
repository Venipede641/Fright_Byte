/// @description Insert description here
// You can write your code in self editor
if(global.killSidewinder)
{
	instance_destroy()

instance_create_layer(x,y,"Instances",obj_poof) ;return
}
if(self.x != self.xprevious || self.y != self.yprevious)
{
var temp = [x,y]
array_push(positions,temp)
}

if(global.head.x == global.head.xprevious && global.head.y == global.head.yprevious)
{path_end();return;}
if(array_length(target.positions) != 0)
{
targetPosition = target.positions[0]
show_debug_message(target.positions[0])
array_delete(target.positions,0,1)
show_debug_message("Heres my target:")
show_debug_message(targetPosition)
show_debug_message("Heres my target object:")
//show_debug_message(target)
show_debug_message(target.x)
show_debug_message(target.y)
}
else{show_debug_message("Target had no positions logged.")}
//HERE COMES THE PATHFINDING CODE FROM SIDEWINDER

	
		path_set_kind(pathSegment, 0);
		
	
		if(mp_grid_path(global.segPath, pathSegment, self.x, self.y, targetPosition[0], targetPosition[1], false))
			{
			//RIGHT ANGLE CODE INCOMING
			var num = path_get_number(pathSegment);

for(i = 0; i<num; i++)
{
	if(i==num-1)
	{
		break;
	}
	
	if(abs(path_get_point_x(pathSegment,i)-path_get_point_x(pathSegment,i+1)) > 0 && abs(path_get_point_y(pathSegment,i)-path_get_point_y(pathSegment,i+1)) > 0)
	{
		if(path_get_point_y(pathSegment,i) > path_get_point_y(pathSegment,i+1))
		{
			 yIndex = i;
			 xIndex = i+1;
		}
		else{ yIndex = i+1; xIndex = i;}
		
		path_insert_point(pathSegment, i+1, path_get_point_x(pathSegment, yIndex), path_get_point_y(pathSegment, xIndex), 100);
	}
}
			//RIGHT ANGLE CODE END
			
					path_start(pathSegment,10, path_action_continue, false);
				
			}
	

	//CODE FOR SPRITE
	
if(sprite_index != swbodystraight && sprite_index != swbodystraightup && turntimer!=0)
{
	turntimer--
	return
}

if(y<yprevious)
{
	ystatus ="up"
}
if(y>yprevious)
{
	ystatus ="down"
}

if(x<xprevious)
{
	xstatus = "left"
}

if(x>xprevious)
{
	xstatus = "right"
}
	
if(targetPosition[0]<x && point_distance(0,targetPosition[1],0,y)<=5) // going left
{
	if(sprite_index == swbodystraightup)
	{
		if(ystatus=="up")
		{sprite_index = swelbowupleft}
		else{sprite_index=  swdownleft}
	}
	else{sprite_index = swbodystraight}
	
}

if(targetPosition[0]>x && point_distance(0,targetPosition[1],0,y)<=5) // goin right
{
	if(sprite_index == swbodystraightup)
	{
		if(ystatus=="up")
		{sprite_index = swelbowdupright}
		else{sprite_index= swdownright}
	}
	else{sprite_index = swbodystraight}
}

if(targetPosition[1]<y && point_distance(0,targetPosition[0],0,x)<=5) // going up
{
	if(sprite_index == swbodystraight)
	{
		if(xstatus=="left")
		{sprite_index = swdownright}
		else{sprite_index= swdownleft}
	}
	else{sprite_index = swbodystraightup}
}

if(targetPosition[1]>y && point_distance(0,targetPosition[0],0,x)<=5) // going down
{
	if(sprite_index == swbodystraight)
	{
		if(xstatus=="left")
		{sprite_index = swelbowdupright}
		else{sprite_index= swelbowupleft}
	}
	else{sprite_index = swbodystraightup}
}

if(turntimer==0){turntimer=turntimercap}

/*
if(x < xprevious) // going left
{
	if(sprite_index == swbodystraightup)
	{
		if(ystatus=="up")
		{sprite_index = swelbowupleft}
		else{sprite_index=  swdownleft}
	}
	else{sprite_index = swbodystraight}
	
}

if(x > xprevious) // goin right
{
	if(sprite_index == swbodystraightup)
	{
		if(ystatus=="up")
		{sprite_index = swelbowdupright}
		else{sprite_index= swdownright}
	}
	else{sprite_index = swbodystraight}
}

if(y < yprevious) // going up
{
	if(sprite_index == swbodystraight)
	{
		if(xstatus=="left")
		{sprite_index = swdownright}
		else{sprite_index= swdownleft}
	}
	else{sprite_index = swbodystraightup}
}

if(y > yprevious) // going down
{
	if(sprite_index == swbodystraight)
	{
		if(xstatus=="left")
		{sprite_index = swelbowdupright}
		else{sprite_index= swelbowupleft}
	}
	else{sprite_index = swbodystraightup}
}

if(turntimer==0){turntimer=turntimercap}*/

	