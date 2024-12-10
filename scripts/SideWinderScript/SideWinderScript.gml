
function SideWinderScript(){
	
	global.colPath = mp_grid_create(0,0,20,10,80,80);

	
	with(obj_ground)
	{
		mp_grid_add_cell(global.colPath,floor(x/80),floor(y/80))
	}
	
	with(obj_collison_box)
	{
		mp_grid_add_cell(global.colPath,floor(x/80),floor(y/80))
	}
	
	global.segPath = mp_grid_create(0,0,20,10,80,80);

	
	with(obj_ground)
	{
		mp_grid_add_cell(global.segPath,floor(x/80),floor(y/80))
	}
	
	with(obj_collison_box)
	{
		mp_grid_add_cell(global.segPath,floor(x/80),floor(y/80))
	}
	
	
	


}

function UpdateColPath()
{
	global.colPath = mp_grid_create(0,0,20,10,80,80);

	
	with(obj_ground)
	{
		mp_grid_add_cell(global.colPath,floor(x/80),floor(y/80))
	}
	
	with(obj_collison_box)
	{
		mp_grid_add_cell(global.colPath,floor(x/80),floor(y/80))
	}
	
	
	with(obj_sideSegment)
	{
		//mp_grid_add_cell(global.colPath,floor(x/80),floor(y/80))
	}
	
}
function SideWinderUpdate(bodyPart)
{
if(!global.killSidewinder){
		global.pathPlayer = path_add();
		path_set_kind(global.pathPlayer, 0);
		
		if(!global.jumping)
	{	
		if(mp_grid_path(global.colPath, global.pathPlayer, bodyPart.x, bodyPart.y, global.player.x, global.player.y, false))
			{
			//RIGHT ANGLE CODE INCOMING
			var num = path_get_number(global.pathPlayer);

for(i = 0; i<num; i++)
{
	if(i==num-1)
	{
		break;
	}
	
	if(abs(path_get_point_x(global.pathPlayer,i)-path_get_point_x(global.pathPlayer,i+1)) > 0 && abs(path_get_point_y(global.pathPlayer,i)-path_get_point_y(global.pathPlayer,i+1)) > 0)
	{
		if(path_get_point_y(global.pathPlayer,i) > path_get_point_y(global.pathPlayer,i+1))
		{
			 yIndex = i;
			 xIndex = i+1;
		}
		else{ yIndex = i+1; xIndex = i;}
		
		path_insert_point(global.pathPlayer, i+1, path_get_point_x(global.pathPlayer, yIndex), path_get_point_y(global.pathPlayer, xIndex), 100);
	}
}
			//RIGHT ANGLE CODE END
			with(bodyPart)
				{
					path_start(global.pathPlayer,10, path_action_continue, false);
				}
			}
	}
	
	else
	{
		if(mp_grid_path(global.colPath, global.pathPlayer, bodyPart.x, bodyPart.y, global.janchorX, global.janchorY, false))
			{
			//RIGHT ANGLE CODE INCOMING
			var num = path_get_number(global.pathPlayer);

for(i = 0; i<num; i++)
{
	if(i==num-1)
	{
		break;
	}
	
	if(abs(path_get_point_x(global.pathPlayer,i)-path_get_point_x(global.pathPlayer,i+1)) > 0 && abs(path_get_point_y(global.pathPlayer,i)-path_get_point_y(global.pathPlayer,i+1)) > 0)
	{
		if(path_get_point_y(global.pathPlayer,i) > path_get_point_y(global.pathPlayer,i+1))
		{
			 yIndex = i;
			 xIndex = i+1;
		}
		else{ yIndex = i+1; xIndex = i;}
		
		path_insert_point(global.pathPlayer, i+1, path_get_point_x(global.pathPlayer, yIndex), path_get_point_y(global.pathPlayer, xIndex), 100);
	}
}
			//RIGHT ANGLE CODE END
			with(bodyPart)
				{
					path_start(global.pathPlayer,10, path_action_continue, false);
				}
			}
	}
}
}
		


function SideWinderMove(movePath,bodyPart)
{
	with(bodyPart)
	{
		path_start(movePath, 5, path_action_stop, 0);
	}
}










