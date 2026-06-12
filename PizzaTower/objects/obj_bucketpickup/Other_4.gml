if (ds_list_find_index(global.saveroom, id) != -1)
{
	instance_destroy();
}
if (obj_player.ispeppino && !global.swapmode)
{
	instance_destroy();
}
