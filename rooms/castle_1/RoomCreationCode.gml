global.player.x = 120
global.player.y = 640
audio_stop_all()
if(!audio_is_playing(RPGTest)){
audio_play_sound(RPGTest,1,true)
}