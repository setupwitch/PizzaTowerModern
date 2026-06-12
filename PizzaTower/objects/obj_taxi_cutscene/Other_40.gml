if (sprite_index == spr_taximove && pickedup)
{
	with (obj_player)
	{
		obj_player.lastroom = room;
		obj_camera.chargecamera = 0;
		ds_list_add(global.saveroom, id);
		obj_player.targetDoor = other.targetDoor;
		obj_player.targetRoom = other.targetRoom;
		obj_player.image_index = 0;
		obj_player.mach2 = 0;
		if (!instance_exists(obj_fadeout))
		{
			instance_create(x, y, obj_fadeout);
		}
	}
}
