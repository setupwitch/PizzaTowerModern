if (ds_list_find_index(global.baddieroom, id) == -1 && important == false)
{
	if (global.golfhit < 10)
	{
		repeat (10)
		{
			with (instance_create(x, y, obj_pizzaslice))
			{
				vsp = random_range(-1, -10);
			}
		}
		global.golfhit = 0;
	}
	else if (global.golfhit < 20)
	{
		repeat (5)
		{
			with (instance_create(x, y, obj_pizzaslice))
			{
				vsp = random_range(-1, -10);
			}
		}
		global.golfhit = 0;
	}
	else if (global.golfhit < 30)
	{
		repeat (1)
		{
			with (instance_create(x, y, obj_pizzaslice))
			{
				vsp = random_range(-1, -10);
			}
		}
		global.golfhit = 0;
	}
	else
	{
		global.golfhit = 0;
	}
	ds_list_add(global.baddieroom, id);
	obj_tv.image_index = random_range(0, 4);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 3 / game_get_speed(gamespeed_fps);
	}
	instance_create(x, y + 30, obj_bangeffect);
	with (obj_camera)
	{
		shake_mag = 5;
		shake_mag_acc = 20 / game_get_speed(gamespeed_fps);
	}
	hsp = 0;
	vsp = 0;
}
