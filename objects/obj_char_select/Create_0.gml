// Character selection variables
global.characters = [spr_cat_idle, spr_player_turtle_idle, spr_slime_idle, spr_dragon_idle]; // dont forget to add other characters here
global.selected_character = 0; // Start with the first character
global.current_room = rm_begin; // default starting room
box_color = c_yellow;   // Color for the selection box
global.character_spawning = false; 