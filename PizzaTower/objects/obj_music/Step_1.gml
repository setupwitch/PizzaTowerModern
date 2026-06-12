if (instance_exists(obj_player))
{
	if (obj_player.ispeppino || room == Mainmenu)
	{
		fmod_set_parameter("isnoise", 0, true);
	}
	else
	{
		fmod_set_parameter("isnoise", 1, true);
	}
}
fmod_set_parameter("swapmode", global.swapmode ? 1 : 0, true);
