if(keyboard_check_pressed(vk_enter)){
	room_goto(global.spawnRoom) //rm_begin default x=800 y= 10
	global.player.x = global.spawnx
	global.player.y = global.spawny
	obj_player_master.player_health = 3
	audio_stop_sound(mus_ambienthorror);
}