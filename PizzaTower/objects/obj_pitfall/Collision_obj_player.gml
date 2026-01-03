with (other)
{
	x = other.x;
	y = other.y + (other.sprite_height - 46);
	if (!instance_exists(obj_fadeout))
	{
		obj_player1.targetDoor = other.targetDoor;
		obj_player1.targetRoom = other.targetRoom;
		other.visited = true;
		image_index = 0;
		if (state == states.machslide)
		{
			state = states.normal;
		}
		instance_create(x, y, obj_fadeout);
	}
}
