if (!collisioned)
{
	if (obj_player.x != other.x)
	{
		obj_player.xscale = sign(other.x - obj_player.x);
	}
	else
	{
		obj_player.xscale = -other.image_xscale;
	}
	event_user(0);
}
