/// @description Insert description here
// You can write your code in this editor

if(!surface_exists(maskSurface))
{
	maskSurface = surface_create(room_width,room_height)
}

surface_set_target(maskSurface)
draw_set_alpha(1)
draw_clear(c_black)
gpu_set_blendmode(bm_subtract)
draw_set_color(c_black)
//draw_circle(global.player.x,global.player.y, 90, false)
with(obj_lantern)
{draw_circle(x,y, 400, false)}
with(obj_DukeDusk)
{draw_circle(x,y, 400, false)}
with(obj_rift)
{draw_circle(x,y, 400, false)}
gpu_set_blendmode(bm_normal)
surface_reset_target()
draw_surface(maskSurface,0,0)





