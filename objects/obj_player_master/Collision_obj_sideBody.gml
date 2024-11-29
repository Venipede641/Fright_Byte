room_goto(rm_game_over);
global.chase = false;
x = 650;
y = -130;
audio_stop_all()
audio_play_sound(mus_ambienthorror,10,true)
global.chase =false
global.break_game=true
global.spawn_rifts=true