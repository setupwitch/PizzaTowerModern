/*
	this is meant to be a compatiblity layer for the old FMOD extension.
	I dont know if this is fully functional as there may be more differences with the extension.
*/

function fmod_event_create_instance(_event_path)
{
	if (!obj_fmod.loaded)
	{
		scr_sleep(5);
		// keep running until fmod is loaded
		return fmod_event_create_instance(_event_path);
	}
		
	var _inst = fmod_studio_event_description_create_instance(fmod_studio_system_get_event(_event_path));
	
	if (!fmod_studio_event_instance_is_valid(_inst))
	{
		show_debug_message(_event_path);
		throw "event instance not valid.";
	}
		
	return _inst;
}

function fmod_event_instance_play(_event_instance)
{
	return fmod_studio_event_instance_start(_event_instance);
}

function fmod_event_one_shot(_event_path)
{
	var _inst = fmod_event_create_instance(_event_path);
	fmod_studio_event_instance_start(_inst);
	
	array_push(global.active_sounds, _inst);
}

function fmod_event_one_shot_3d(_event_path, _x, _y)
{
	var _attr = new Fmod3DAttributes();
	with (_attr.position)
	{
		x = _x; 
		y = _y;
		z = 0;	
	}
	var _inst = fmod_event_create_instance(_event_path);
	
	fmod_studio_event_instance_set_3d_attributes(_inst, _attr);
	
	fmod_studio_event_instance_start(_inst);
	
	array_push(global.active_sounds, _inst);
}


function fmod_event_instance_release(_event_instance)
{
	return fmod_studio_event_instance_release(_event_instance);
}

function fmod_event_instance_stop(_event_instance, _immediate)
{
	return fmod_studio_event_instance_stop(_event_instance, _immediate ? FMOD_STUDIO_STOP_MODE.IMMEDIATE : FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);
}

function fmod_event_instance_set_3d_attributes(_event_instance, _x, _y)
{
	var _attr = new Fmod3DAttributes();
	with (_attr.position)
	{
		x = _x; 
		y = _y;
		z = 0;	
	}
	return fmod_studio_event_instance_set_3d_attributes(_event_instance, _attr);
}

function fmod_set_listener_attributes(_listener_index, _x, _y)
{
	var _attr = new Fmod3DAttributes();
	with (_attr.position)
	{
		x = _x; 
		y = _y;
	}
	with (_attr.forward)
	{
		z = 1;
	}
	
	return fmod_studio_system_set_listener_attributes(_listener_index, _attr);
}

function fmod_event_instance_is_playing(_event_instance)
{
	return fmod_studio_event_instance_is_valid(_event_instance) && fmod_studio_event_instance_get_playback_state(_event_instance) == FMOD_STUDIO_PLAYBACK_STATE.PLAYING;
}

function fmod_event_instance_get_timeline_pos(_event_instance)
{
	if (fmod_studio_event_instance_is_valid(_event_instance))
		return fmod_studio_event_instance_get_timeline_position(_event_instance);
	
	return -1;
}

function fmod_event_instance_set_timeline_pos(_event_instance, _pos)
{
	if (fmod_studio_event_instance_is_valid(_event_instance))
		fmod_studio_event_instance_set_timeline_position(_event_instance, _pos);
}

function fmod_event_get_length(_event_path)
{
	var _desc = fmod_studio_system_get_event(_event_path);
	if (fmod_studio_event_description_is_valid(_desc))
		return fmod_studio_event_description_get_length(_desc);
	
	throw "Invalid Event Description!";
}

function fmod_event_instance_set_parameter(_event_instance, _param, _value, _ignore_seek_speed)
{
	if (fmod_studio_event_instance_is_valid(_event_instance))
		fmod_studio_event_instance_set_parameter_by_name(_event_instance, _param, _value, _ignore_seek_speed);
}

function fmod_event_instance_get_parameter(_event_instance, _param, _value, _ignore_seek_speed)
{
	return fmod_studio_event_instance_get_parameter_by_name(_event_instance, _param);
}

function fmod_set_parameter(_param, _value, _ignore_seek_speed)
{
	return fmod_studio_system_set_parameter_by_name(_param, _value, _ignore_seek_speed);
}

function fmod_get_parameter(_param)
{
	return fmod_studio_system_get_parameter_by_name(_param);
}

function fmod_event_instance_set_paused(_event_instance, _pause)
{
	return fmod_studio_event_instance_set_paused(_event_instance, _pause);
}

function fmod_event_instance_get_paused(_event_instance)
{
	return fmod_studio_event_instance_get_paused(_event_instance);
}

function fmod_event_instance_set_paused_all(_pause)
{
	static _paused_sounds = ds_list_create();
	if (_pause)
	{
		var _master_group = fmod_system_get_master_channel_group();
		var _num_channels = fmod_channel_group_get_num_channels(_master_group);
		
		for (var i = 0; i < array_length(global.active_sounds); i++)
			fmod_studio_event_instance_set_paused(global.active_sounds[i], true);
		
		// iterate through all active channels
		for (var i = 0; i < _num_channels; i++)
		{
			var _channel = fmod_channel_group_get_channel(_master_group, i);
			
			// check if not already paused
			if (!fmod_channel_control_get_paused(_channel))
			{
				// set it to paused
				fmod_channel_control_set_paused(_channel, true);
				
				// add it to the list for unpausing later
				ds_list_add(_paused_sounds, _channel);
			}
		}
	}
	else
	{	
		for (var i = 0; i < array_length(global.active_sounds); i++)
			fmod_studio_event_instance_set_paused(global.active_sounds[i], false);
		
		// iterate through the list of paused sounds
		var _list_size = ds_list_size(_paused_sounds);
		
		for (var i = 0; i < _list_size; i++)
			fmod_channel_control_set_paused(_paused_sounds[| i], false);
		
		// now that everything is unpaused, clear the list
		ds_list_clear(_paused_sounds);
	}
}