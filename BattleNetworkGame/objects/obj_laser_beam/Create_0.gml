lifetime = 30
damage = 20

pos = ds_grid_get(obj_grid_manager.grid, box_x, box_y)
hitbox = instance_create_depth(pos.x, pos.y, 4, obj_proj_hitbox)
hitbox.damage = damage