// In obj_game_controller Step Event
if (global.character_spawn_next_frame) {
    scr_choose_character();  // Call the script to spawn the character
    global.character_spawn_next_frame = false;  // Reset the flag to avoid it running every frame
}