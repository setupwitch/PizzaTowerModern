with (other)
{
	if (character == CHAR_PEPPINO)
	{
		character = CHAR_NOISE;
	}
	else
	{
		character = CHAR_PEPPINO;
	}
	respawn = 200;
	scr_characterspr();
	instance_destroy(other);
}
