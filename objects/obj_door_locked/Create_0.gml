depth = 10; // ensures the door goes behind the player
global.door_unlocked = false; //all doors will start as locked
//specific create instances in rooms overide these values
targetRoomId = -1;
targetXPosition = -1;
targetYPosition = -1;
terrian_type = 5;

// Text properties
show_text = false;    // Only show text when the player is nearby
text_offset = -32;    // Vertical offset for text above the door