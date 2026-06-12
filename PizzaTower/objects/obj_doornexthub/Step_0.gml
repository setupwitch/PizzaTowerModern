var _save = false;
if (key && (obj_player.state == states.normal || obj_player.state == states.mach1 || obj_player.state == states.pogo || obj_player.state == states.mach2 || obj_player.state == states.mach3 || obj_player.state == states.Sjumpprep) && sprite_index == spr_elevatorlocked && obj_player.key_up && obj_player.grounded && place_meeting(x, y, obj_player))
{
	_save = true;
	ds_list_add(global.saveroom, id);
	obj_player.state = states.victory;
	obj_player.image_index = 0;
	image_index = 0;
	sprite_index = spr_elevatoropening;
	fmod_event_one_shot_3d("event:/sfx/misc/elevatorstart", x, y);
	fmod_event_one_shot_3d("event:/sfx/misc/keyunlock", x, y);
	image_speed = 0.35;
	obj_player.sprite_index = obj_player.spr_victory;
	with (instance_create(x + 50, y + 50, obj_lock))
	{
		sprite_index = spr_elevatorlock;
	}
	global.key_inv = false;
	instance_destroy(obj_giantkeyfollow);
}
if (ANIMATION_END)
{
	image_index = image_number - 1;
}
if (_save)
{
	unlocked = true;
	ini_open_from_string(obj_savesystem.ini_str);
	ini_write_real(save, "door", true);
	obj_savesystem.ini_str = ini_close();
	gamesave_async_save();
}
if (sprite_index == spr_elevatoropening && ANIMATION_END && place_meeting(x, y, obj_player) && !instance_exists(obj_jumpscare) && floor(obj_player.image_index) == (obj_player.image_number - 1) && obj_player.state == states.victory)
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
