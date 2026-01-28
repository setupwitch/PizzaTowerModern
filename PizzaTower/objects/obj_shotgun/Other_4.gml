if (ds_list_find_index(global.saveroom, id) != -1)
{
	instance_destroy();
}
if (obj_player.character == CHAR_NOISE)
{
	sprite_index = spr_minigun;
}
