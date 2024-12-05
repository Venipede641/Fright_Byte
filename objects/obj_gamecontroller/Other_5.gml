if (obj_inventory_data_manager.spawned_item != noone && !global.in_car && !obj_player_master.is_holding_item) {
    show_debug_message("Destroying item on room exit: " + string(obj_inventory_data_manager.spawned_item));
    instance_destroy(obj_inventory_data_manager.spawned_item);
    obj_inventory_data_manager.spawned_item = noone;
}
