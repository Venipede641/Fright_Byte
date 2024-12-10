if(keyboard_check_pressed(vk_anykey)){
	room_goto(global.spawnRoom) //rm_begin default x=800 y= 10
	global.player.x = global.spawnx
	global.player.y = global.spawny
	global.player_died = true
	obj_player_master.player_health = 3
	
}