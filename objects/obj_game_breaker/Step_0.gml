// Array to store placed positions
var placed_positions = [];

 if (global.break_game) {	
	for (var i = 0; i < 10; i++) { // Randomly create 3 instances  
        var random_obj = irandom(2); // Random index n for the n-sized array
        var random_x, random_y, valid_position;

        repeat(100) { // Attempt to find a valid position (limit to 100 tries)
            valid_position = true;

            // Select a random edge
            var edge_type = irandom(3); // 0 = top, 1 = bottom, 2 = left, 3 = right

            switch (edge_type) {
                case 0: // Top edge
                    random_x = irandom_range(0, room_width - 80);
                    random_y = 0;
                    break;
                case 1: // Bottom edge
                    random_x = irandom_range(0, room_width - 80);
                    random_y = room_height; // Corrected to align with the bottom edge
                    break;
                case 2: // Left edge
                    random_x = 0;
                    random_y = irandom_range(0, room_height - 80);
                    break;
                case 3: // Right edge
                    random_x = room_width; // Corrected to align with the right edge
                    random_y = irandom_range(0, room_height - 80);
                    break;
            }

            // Check if the position is already used
            for (var j = 0; j < array_length(placed_positions); j++) {
                if (point_distance(random_x, random_y, placed_positions[j][0], placed_positions[j][1]) < 80) {
                    valid_position = false;
                    break;
                }
            }

            if (valid_position) {
                break;
            }
        }

        if (valid_position) {
            // Create the instance
            var obj_instance = instance_create_layer(random_x, random_y, "decor", arr[random_obj]);

            // Set depth to ensure it's in front of tiles
            obj_instance.depth = -10;

            // Store the position
            array_push(placed_positions, [random_x, random_y]);
        }
    }
}
global.break_game = false;