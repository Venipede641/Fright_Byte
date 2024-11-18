// Switch character selection
if (keyboard_check_pressed(vk_left)) {
    global.selected_character = (global.selected_character - 1 + array_length(global.characters)) mod array_length(global.characters);
} else if (keyboard_check_pressed(vk_right)) {
    global.selected_character = (global.selected_character + 1) mod array_length(global.characters);
}

// If the player selects a character go to the first room
if (keyboard_check_pressed(vk_space)) {
    // Transition to Room1
    room_goto(Room1); 

    // Spawn the character object in designated room
     scr_choose_character();
}