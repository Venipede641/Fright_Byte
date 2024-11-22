for(var i = 0; i < 3; i++){
	if (global.break_game){
		var random_x = irandom_range(0, room_width); // Random x-coordinate within the room
		var random_y = irandom_range(0, room_height); // Random y-coordinate within the room
		instance_create_layer(random_x, random_y, "decor", obj_crack);
	}
}
global.break_game = false;

