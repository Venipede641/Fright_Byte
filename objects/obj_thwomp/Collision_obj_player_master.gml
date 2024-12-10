if(global.player.y+80>y+80)
{
	show_debug_message("OFF YOU GO!")
	show_debug_message(global.player.y)
	show_debug_message(y)
	room_goto(global.spawnRoom)
global.player.x = global.spawnx
global.player.y = global.spawny}
else if(receeding)
{
	show_debug_message("UP YOU GO!")
	show_debug_message(global.player.y)
	show_debug_message(y)
	global.player.y-=5.5
}