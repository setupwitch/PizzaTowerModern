if (obj_player.state == states.debugstate)
{
	exit;
}
if (obj_player.state == states.backtohub)
{
	exit;
}
if (obj_player.state == states.titlescreen)
{
	exit;
}
if (instance_exists(obj_jumpscare))
{
	exit;
}
var hall = id;
with (other)
{
	if (!other.savedposition)
	{
		other.savedposition = true;
		other.savedx = x;
		other.savedy = y;
	}
	x = other.savedx;
	y = other.savedy;
	if (!instance_exists(obj_fadeout))
	{
		obj_player.lastroom = room;
		obj_player.targetDoor = other.targetDoor;
		obj_player.targetRoom = other.targetRoom;
		obj_player.hallway = true;
		obj_player.hallwaydirection = other.image_xscale;
		other.visited = true;
		fmod_event_one_shot("event:/sfx/misc/door");
		with (instance_create(x, y, obj_fadeout))
		{
			offload_arr = hall.offload_arr;
			group_arr = hall.group_arr;
		}
	}
}
