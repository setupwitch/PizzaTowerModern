if (locked)
{
	exit;
}
var _actor = false;
var door = id;
with (obj_player)
{
	if (state == states.actor)
	{
		_actor = true;
	}
}
if (_actor)
{
	exit;
}
if (global.horse)
{
	exit;
}
if (john && global.panic)
{
	exit;
}
if (!place_meeting(x, y, obj_doorblocked))
{
	with (other)
	{
		if (key_up && !instance_exists(obj_jumpscare) && grounded && (((state == states.ratmount || state == states.ratmountbounce || state == states.noisecrusher) && brick) || state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep) && y == (other.y + 50) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			if (room == tower_5 || other.object_index == obj_pumpkindoor)
			{
				if (other.object_index == obj_pumpkindoor)
				{
					notification_push(notifications.pumpkindoor_entered, [room]);
					global.levelreset = true;
				}
				obj_player.backtohubroom = room;
				obj_player.backtohubstartx = obj_player.x;
				obj_player.backtohubstarty = obj_player.y;
			}
			if (room == trickytreat_1)
			{
				notification_push(notifications.trickytreat_door_entered, [room]);
			}
			obj_player.lastroom = room;
			fmod_event_one_shot("event:/sfx/misc/door");
			obj_camera.chargecamera = 0;
			ds_list_add(global.saveroom, id);
			
			if (object_index == obj_player)
				obj_player.sprite_index = obj_player.isgustavo ? spr_ratmount_enterdoor : obj_player.spr_lookdoor;
				
			obj_player.targetDoor = other.targetDoor;
			obj_player.targetRoom = other.targetRoom;
			with (obj_player)
			{
				image_index = 0;
				if (state != states.gotoplayer)
				{
					state = states.door;
				}
				mach2 = 0;
			}
			other.visited = true;
			if (ds_list_find_index(global.saveroom, other.id) == -1)
			{
				ds_list_add(global.saveroom, other.id);
			}
			with (instance_create(x, y, obj_fadeout))
			{
				offload_arr = door.offload_arr;
				group_arr = door.group_arr;
			}
		}
	}
}
