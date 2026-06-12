alarm[3] = 7;
with (instance_create(obj_player.x + random_range(-20, 20), obj_player.y + random_range(-30, 30), obj_parryeffect))
{
	sprite_index = spr_crossshine;
	image_speed = 1;
}
