if (escape)
{
	instance_deactivate_object(id);
	with (instance_create(x, y, obj_escapespawn))
	{
		baddieID = other.id;
	}
}
xs = image_xscale;
targetRoom = obj_player.lastroom;
targetDoor = obj_player.targetDoor;
if (ds_list_find_index(global.saveroom, room_get_name(room)) != -1)
{
	oktoberfest = true;
}
