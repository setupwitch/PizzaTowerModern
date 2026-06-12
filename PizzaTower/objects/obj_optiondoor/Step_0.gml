if (distance_to_object(obj_player) < 50)
{
	with (obj_tv)
	{
		showtext = true;
		alarm[0] = 2;
		message = "OPTION";
	}
}
