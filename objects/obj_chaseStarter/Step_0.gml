/// @description Insert description here
// You can write your code in this editor
if(counter==0)
{
	if(irandom_range(1,60) == 30)
	{
		audio_play_sound(mus_chase,10,true)
		global.chaseStart = true
	}else{counter=countercap}
	
}
else{counter--}