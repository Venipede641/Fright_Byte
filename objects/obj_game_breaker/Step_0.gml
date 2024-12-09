// Check if the player has died and if the event has not yet been triggered
if (global.player_died && !room_event_triggered) {
    // Trigger the desired event
    show_debug_message("Game breaker event triggered in this room!");
    break_game(); // Replace with your script
    
    // Mark the event as triggered for this room
    room_event_triggered = true;
}