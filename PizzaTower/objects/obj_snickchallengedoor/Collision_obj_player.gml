with (other)
{
	if (key_up && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3 || state == states.Sjumpprep) && y == (other.y + 50) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
	{
		lastroom_x = other.x;
		lastroom_y = other.y;
		lastroom = room;
		obj_camera.chargecamera = 0;
		ds_list_add(global.saveroom, id);
		obj_player.sprite_index = obj_player.spr_lookdoor;
		obj_player.targetDoor = other.targetDoor;
		obj_player.targetRoom = other.targetRoom;
		obj_player.image_index = 0;
		obj_player.state = states.door;
		obj_player.mach2 = 0;
		other.visited = true;
		instance_create(x, y, obj_fadeout);
	}
}
