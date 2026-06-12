with (obj_player)
{
	if (hsp != 0 && grounded && (floor(image_index) % 10) == 0)
	{
		create_debris(x, y + 43, spr_snowparticle);
	}
}
