room_goto(rm_game_over);
global.chase = false;
x = 650;
y = -130;
audio_stop_all()
audio_play_sound(mus_ambienthorror,10,true)
global.chase =false
if (!global.player_died) {
    global.player_died = true; // Mark that the player has died
}
global.spawn_rifts=true