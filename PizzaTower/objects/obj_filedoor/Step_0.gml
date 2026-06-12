if (distance_to_object(obj_player) < 50)
{
	var str = "";
	if (obj_player.state == states.bombdelete)
	{
		str = "DELETE ";
	}
	with (obj_tv)
	{
		showtext = true;
		alarm[0] = 2;
		message = concat(str, "FILE ", other.file);
	}
}
