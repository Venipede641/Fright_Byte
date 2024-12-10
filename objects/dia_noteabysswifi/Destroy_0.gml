/// @description Insert description here
// You can write your code in this editor
global.chaseStart = true
with(obj_note_abyss)
{
	instance_destroy()
}
global.wifipass = true
audio_stop_all()
audio_play_sound(mus_chase,1,true)