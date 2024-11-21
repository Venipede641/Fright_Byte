/// @description Insert description here
// You can write your code in this 

	if(global.showGrid)
	{
	mp_grid_draw(global.colPath);
	}
	
	if(global.showPath)
	{
		draw_path(global.pathPlayer, bodyPart.x, bodyPart.y, false);
	}
