if (!active)
{
	if (global.panic && distance_to_pos(x, ystart, obj_player.x, obj_player.y, 300, 200))
	{
		active = true;
	}
}
else
{
	y = Approach(y, ystart, 4);
}
visible = active;
