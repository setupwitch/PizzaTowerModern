if (elite)
{
	if (turn)
	{
		if (alarm[0] <= 0)
		{
			alarm[0] = game_get_speed(gamespeed_fps) * 2;
		}
		direction = angle_rotate(direction, point_direction(x, y, player.x, player.y), 1.5);
	}
	image_angle = direction;
}
