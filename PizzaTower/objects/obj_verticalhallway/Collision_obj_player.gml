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
		var _x = x - other.x;
		var _percentage = _x / other.sprite_width;
		obj_player.vertical_x = _percentage;
		obj_player.verticalhall_vsp = vsp;
		obj_player.lastroom = room;
		obj_player.targetDoor = other.targetDoor;
		obj_player.targetRoom = other.targetRoom;
		obj_player.verticalhallway = true;
		obj_player.vhallwaydirection = sign(other.image_yscale);
		obj_player.hallway = false;
		other.visited = true;
		fmod_event_one_shot("event:/sfx/misc/door");
		with (instance_create(x, y, obj_fadeout))
		{
			offload_arr = hall.offload_arr;
			group_arr = hall.group_arr;
		}
	}
	if (state == states.climbwall)
	{
		trace("climbwall verticalhallway");
		verticalbuffer = 10;
		verticalstate = states.climbwall;
		var i = 0;
		x = floor(x);
		while (!scr_solid(x + xscale, y))
		{
			x += xscale;
			i++;
			if (i > room_width)
			{
				break;
			}
		}
	}
}
