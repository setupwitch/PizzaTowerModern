if (y > 750)
{
	with (obj_camera)
	{
		shake_mag = 20;
		shake_mag_acc = 40 / game_get_speed(gamespeed_fps);
	}
	instance_destroy();
}
