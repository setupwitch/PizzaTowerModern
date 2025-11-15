/*
	this is meant to be a compatiblity layer for the old FMOD extension.
	I dont know if this is fully functional as there may be more differences with the extension.
*/

function fmod_event_create_instance(_event_path)
{
	// wait for FMOD to load, just in case.
	while (!obj_fmod.loaded)
    {
        show_debug_message("Waiting for FMOD to load...");
        scr_sleep(5);
    }
	
	// create an EventInstance
	var _inst = fmod_studio_event_description_create_instance(fmod_studio_system_get_event(_event_path));
	
	// make sure its a valid instance.
	if (!fmod_studio_event_instance_is_valid(_inst))
	{
		show_debug_message(_event_path);
		throw "EventInstance not valid, check last output to log.";
	}
	
	// push it to active sounds, this is so it can be paused.
	array_push(global.active_sounds, _inst);
	
	return _inst;
}

function fmod_event_instance_play(_event_instance)
{
	// compatibility
	return fmod_studio_event_instance_start(_event_instance);
}

function fmod_event_one_shot(_event_path)
{
	// create an EventInstance
	var _inst = fmod_event_create_instance(_event_path);
	// start it
	fmod_studio_event_instance_start(_inst);
	// mark it for GC
	fmod_studio_event_instance_release(_inst);
}

function fmod_event_one_shot_3d(_event_path, _x, _y)
{
	// create an EventInstance
	var _inst = fmod_event_create_instance(_event_path);
	// set attributes
	fmod_event_instance_set_3d_attributes(_inst, _x, _y);
	// start it
	fmod_studio_event_instance_start(_inst);
	// mark it for GC
	fmod_studio_event_instance_release(_inst);
}


function fmod_event_instance_release(_event_instance)
{
	// compatibility
	return fmod_studio_event_instance_release(_event_instance);
}

function fmod_event_instance_stop(_event_instance, _immediate)
{
	// compatibility
	return fmod_studio_event_instance_stop(_event_instance, _immediate ? FMOD_STUDIO_STOP_MODE.IMMEDIATE : FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);
}

function fmod_event_instance_set_3d_attributes(_event_instance, _x, _y)
{
	// create and set 3d attributes.
	var _attr = new Fmod3DAttributes();
	with (_attr.position)
    {
        x = _x; 
        y = _y;
		z = 0;
    }
	with (_attr.forward)
    {
        x = 0;
        y = 0;
        z = 1;
    }
	with (_attr.up)
    {
        x = 0;
        y = 1;
        z = 0;
    }
	// set them in FMOD
	return fmod_studio_event_instance_set_3d_attributes(_event_instance, _attr);
}

function fmod_set_listener_attributes(_listener_index, _x, _y)
{
	// create and set 3d attributes.
	var _attr = new Fmod3DAttributes();
	with (_attr.position)
    {
        x = _x; 
        y = _y;
		z = -1;
    }
	with (_attr.forward)
    {
        x = 0;
        y = 0;
        z = 1;
    }
	with (_attr.up)
    {
        x = 0;
        y = 1;
        z = 0;
    }
	// set them in FMOD
	fmod_studio_system_set_listener_attributes(_listener_index, _attr);
}

function fmod_event_instance_is_playing(_event_instance)
{
	// compatibiliy
	return fmod_studio_event_instance_get_playback_state(_event_instance) == FMOD_STUDIO_PLAYBACK_STATE.PLAYING;
}

function fmod_event_instance_get_timeline_pos(_event_instance)
{
	// compatibility
	return fmod_studio_event_instance_get_timeline_position(_event_instance);
}

function fmod_event_instance_set_timeline_pos(_event_instance, _pos)
{
	// compatibility
	fmod_studio_event_instance_set_timeline_position(_event_instance, _pos);
}

function fmod_event_get_length(_event_path)
{
	// first get the event
	var _desc = fmod_studio_system_get_event(_event_path);
	
	// ensure validity and return the length
	if (fmod_studio_event_description_is_valid(_desc))
		return fmod_studio_event_description_get_length(_desc);
	
	throw "Invalid Event Description!";
}

function fmod_event_instance_set_parameter(_event_instance, _param, _value, _ignore_seek_speed)
{
	// compatibility
	fmod_studio_event_instance_set_parameter_by_name(_event_instance, _param, _value, _ignore_seek_speed);
}

function fmod_event_instance_get_parameter(_event_instance, _param, _value, _ignore_seek_speed)
{
	// compatibility
	return fmod_studio_event_instance_get_parameter_by_name(_event_instance, _param);
}

function fmod_set_parameter(_param, _value, _ignore_seek_speed)
{
	// compatibility
	fmod_studio_system_set_parameter_by_name(_param, _value, _ignore_seek_speed);
}

function fmod_get_parameter(_param)
{
	// compatibility
	return fmod_studio_system_get_parameter_by_name(_param);
}

function fmod_event_instance_set_paused(_event_instance, _pause)
{
	// compatibility
	fmod_studio_event_instance_set_paused(_event_instance, _pause);
}

function fmod_event_instance_get_paused(_event_instance)
{
	// compatibility
	return fmod_studio_event_instance_get_paused(_event_instance);
}

function fmod_event_instance_set_paused_all(_pause)
{
	static _paused_sounds = ds_list_create();
	
	if (_pause)
	{
		for (var i = 0; i < array_length(global.active_sounds); i++)
		{
			var _event = global.active_sounds[i];
			if (fmod_studio_event_instance_get_paused(_event))
				continue; // if paused already, dont.
			
			fmod_studio_event_instance_set_paused(global.active_sounds[i], true);
			// add to the list to unpause later
			ds_list_add(_paused_sounds, global.active_sounds[i]);
		}
	}
	else
	{
		// iterate through the list of paused sounds
		var _list_size = ds_list_size(_paused_sounds);
		for (var i = 0; i < _list_size; i++)
			fmod_studio_event_instance_set_paused(_paused_sounds[| i], false);
		
		// now that everything is unpaused, clear the list
		ds_list_clear(_paused_sounds);
	}
}