if (object_index == obj_halloweenfollow && state == states.ghostcaught)
{
	with (obj_player)
	{
		state = states.normal;
		landAnim = false;
		facehurt = true;
	}
}
destroy_sounds([snd]);
