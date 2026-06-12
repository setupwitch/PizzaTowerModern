if (global.gerome || image_index != 0)
{
	if (!uparrow)
	{
		uparrow = true;
		uparrowID = scr_create_uparrowhitbox();
	}
}
else if (uparrow)
{
	uparrow = false;
	instance_destroy(uparrowID);
}
if (!global.horse && (obj_player.state == states.normal || obj_player.state == states.mach1 || obj_player.state == states.pogo || obj_player.state == states.mach2 || obj_player.state == states.mach3 || obj_player.state == states.Sjumpprep) && obj_player.key_up && obj_player.grounded && (global.gerome == true || image_index == 1) && place_meeting(x, y, obj_player))
{
	ds_list_add(global.saveroom, id);
	fmod_event_one_shot_3d("event:/sfx/misc/keyunlock", x, y);
	fmod_event_one_shot("event:/sfx/misc/cheers");
	with (obj_player)
	{
		targetRoom = other.targetRoom;
		targetDoor = other.targetDoor;
	}
	if (global.gerome)
	{
		obj_geromefollow.visible = false;
		obj_geromefollow.do_end = true;
		with (instance_create(obj_player.x - 30, obj_player.y, obj_geromeanim))
		{
			sprite_index = spr_gerome_opendoor;
			image_index = 0;
			image_speed = 0.35;
		}
		obj_player.state = states.victory;
		obj_player.image_index = 0;
		global.gerome = false;
	}
	else
	{
	}
	image_index = 1;
}
if (place_meeting(x, y, obj_player) && floor(obj_player.image_index) == (obj_player.image_number - 1) && (obj_player.state == states.victory || obj_player.state == states.door))
{
	with (obj_player)
	{
		obj_player.targetDoor = other.targetDoor;
		obj_player.targetRoom = other.targetRoom;
		if (!instance_exists(obj_fadeout))
		{
			instance_create(x, y, obj_fadeout);
		}
	}
}
if (place_meeting(x, y, obj_doorA))
{
	targetDoor = "A";
}
if (place_meeting(x, y, obj_doorB))
{
	targetDoor = "B";
}
if (place_meeting(x, y, obj_doorC))
{
	targetDoor = "C";
}
if (place_meeting(x, y, obj_doorD))
{
	targetDoor = "D";
}
if (place_meeting(x, y, obj_doorE))
{
	targetDoor = "E";
}
if (place_meeting(x, y, obj_doorF))
{
	targetDoor = "F";
}
if (place_meeting(x, y, obj_doorG))
{
	targetDoor = "G";
}
