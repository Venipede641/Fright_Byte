audio_stop_all()
audio_play_sound(mus_chase,10,true)
with(obj_mouseman)
{
	instance_destroy()
	instance_create_layer(0,0,"Instances",obj_poof)
}
global.cutChasex = 1340
global.cutChasey = 260
global.chaseStart = true