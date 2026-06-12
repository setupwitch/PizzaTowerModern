with (obj_trapghost)
{
	if (point_distance(obj_player.x, obj_player.y, other.x, other.y) < other.ghost_distance_threshold && (state == states.normal || trapid == noone || ((point_distance(obj_player.x, obj_player.y, trapid.x, trapid.y) > point_distance(obj_player.x, obj_player.y, other.x, other.y) || (other.object_index == obj_anchortrap && state == states.normal && trapid.object_index == obj_anchortrap)) && trapid.object_index != obj_tvtrap)))
	{
		state = states.transitioncutscene;
		trapid = other.id;
		fmod_event_instance_play(snd_move);
	}
}
