with (other)
{
	if (!parried)
	{
		if (dir != 0)
		{
			var _dir = dir;
			_dir = -dir;
			obj_player.xscale = _dir;
			dir = _dir;
			parried = true;
		}
		else
		{
			dir = obj_player.xscale;
			if (x != obj_player.x)
			{
				dir = sign(obj_player.x - x);
			}
			obj_player.xscale = dir;
			parried = true;
			vsp = -3;
		}
	}
}
if (!collisioned)
{
	event_user(0);
}
