/*
	this is meant to be a compatiblity layer for the old FMOD extension.
	I dont know if this is fully functional as there may be more differences with the extension.
*/

function fmod_event_create_instance(_event_path)
{
	return fmod_studio_event_description_create_instance(fmod_studio_system_get_event(_event_path));
}

function fmod_event_instance_play(_event_instance)
{
	fmod_studio_event_instance_start(_event_instance);
	// release the instance immediately, this will still play the sound.
	fmod_studio_event_instance_release(_event_instance);
}

function fmod_event_one_shot(_event_path)
{
	var _inst = fmod_event_create_instance(_event_path);
	fmod_studio_event_instance_start(_inst);
	// release the instance immediately, this will still play the sound.
	fmod_studio_event_instance_release(_inst);
}

function fmod_event_one_shot_3d(_event_path, _x, _y)
{
	var _inst = fmod_event_create_instance(_event_path);
	var _oldattributes = fmod_studio_system_get_listener_attributes(0);
	
	// set the attributes to new value
	fmod_set_listener_attributes(0, _x, _y);
	
	fmod_studio_event_instance_start(_inst);
	// release the instance immediately, this will still play the sound.
	fmod_studio_event_instance_release(_inst);
	
	// set the attributes back to original value
	fmod_studio_system_set_listener_attributes(0, _oldattributes);
}


function fmod_event_instance_release(_event_instance)
{
	return fmod_studio_event_instance_release(_event_instance);
}

function fmod_event_instance_stop(_event_instance)
{
	return fmod_studio_event_instance_stop(_event_instance);
}



function fmod_event_instance_set_3d_attributes(_event_instance, _x, _y)
{
	return fmod_studio_event_instance_set_3d_attributes(_event_instance,
	{
		position:
		{
			x: _x, 
			y: _y, 
			z: 0
		} 
	});
}

function fmod_set_listener_attributes(_listener_index, _x, _y)
{
	return fmod_studio_system_set_listener_attributes(_listener_index,
	{
		position:
		{
			x: _x, 
			y: _y, 
			z: 0
		} 
	});
}

function fmod_event_instance_is_playing(_event_instance)
{
	return fmod_studio_event_instance_get_playback_state(_event_instance) == FMOD_STUDIO_PLAYBACK_STATE.PLAYING;
}

function fmod_event_instance_get_timeline_pos(_event_instance)
{
	return fmod_studio_event_instance_get_timeline_position(_event_instance);
}

function fmod_event_instance_set_timeline_pos(_event_instance, _pos)
{
	return fmod_studio_event_instance_set_timeline_position(_event_instance, _pos);
}

function fmod_event_get_length(_event_instance)
{
	return fmod_studio_event_description_get_length(_event_instance);
}

function fmod_event_instance_set_parameter(_event_instance, _param, _value, _ignore_seek_speed)
{
	return fmod_studio_event_instance_set_parameter_by_name(_event_instance, _param, _value, _ignore_seek_speed);
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
	var _master_group = fmod_system_get_master_channel_group();

	// pause all sounds in the channel group
	return fmod_channel_control_set_paused(_master_group, _pause);
}