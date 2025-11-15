fmod_set_listener_attributes(0, camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2), camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2));

for (var i = 0; i < array_length(global.active_sounds); i++)
{
	var _sound = global.active_sounds[i];
	if (fmod_studio_event_instance_get_playback_state(_sound) == FMOD_STUDIO_PLAYBACK_STATE.STOPPED)
	{
		fmod_event_instance_release(_sound);
		array_delete(global.active_sounds, i, 1);
		i--;
	}	
}

fmod_studio_system_update(); 