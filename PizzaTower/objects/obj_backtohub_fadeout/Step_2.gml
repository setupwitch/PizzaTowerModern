if (fadein)
{
	fadealpha = Approach(fadealpha, 1, 0.03);
	if (fadealpha >= 1)
	{
		if (!instance_exists(obj_player))
		{
			instance_activate_object(obj_player);
		}
		else
		{
			fadein = false;
			pos_player = false;
			obj_player.targetRoom = obj_player.backtohubroom;
			room_goto(obj_player.backtohubroom);
		}
	}
}
else
{
	fadealpha = Approach(fadealpha, 0, 0.03);
	if (fadealpha <= 0)
	{
		instance_destroy();
	}
}
