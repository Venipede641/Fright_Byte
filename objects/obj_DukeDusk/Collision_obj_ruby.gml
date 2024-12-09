/// @description Insert description here
// You can write your code in this editor
remove_from_inventory(obj_ruby)
with(obj_ruby){instance_destroy()}
global.inventory_data.spawned_item = noone
sprite_index=spr_cave_face_eat_npc