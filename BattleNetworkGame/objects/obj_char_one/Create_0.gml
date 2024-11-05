event_inherited()

max_life = 1000
life = max_life
char_spd = 0.5
charge_timer = 0

if p1 {
	hitbox = instance_create_depth(x, y, 5, obj_player_hitbox, 
	{
		player: id
	});
}
else if !p1 {
	hitbox = instance_create_depth(x, y, 5, obj_player_hitbox, 
	{
		player: id,
		p1 : false
	});
}

function bullet(_key){
	if keyboard_check_pressed(_key) {
		if p1 {
			var _bullet = instance_create_depth(x + 15, y - 35, 1, obj_proj_box_bullet,
			{
				box_x: box_x,
				box_y: box_y
			})
		}
		else if !p1 {
			var _bullet = instance_create_depth(x - 15, y - 35, 1, obj_proj_box_bullet,
			{
				p1 : false,
				box_x: box_x,
				box_y: box_y
			})
		}
	}
}

function laser(_key){
	if keyboard_check(_key) {
		charge_timer += 1
	} else {
		if charge_timer > 60 {
			if p1 {
				var _laser_pos = ds_grid_get(obj_grid_manager.grid, box_x, box_y)
				instance_create_depth(_laser_pos.x, _laser_pos.y - 35, 2, obj_initial_laser_beam, {
					box_x: box_x,
					box_y: box_y
				});
			} else if !p1 {
			}
		}
		charge_timer = 0
	}
}