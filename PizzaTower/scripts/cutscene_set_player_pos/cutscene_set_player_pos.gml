function cutscene_set_player_pos(_x, _y)
{
	with (obj_player)
	{
		x = _x;
		y = _y;
	}
	cutscene_end_action();
}
