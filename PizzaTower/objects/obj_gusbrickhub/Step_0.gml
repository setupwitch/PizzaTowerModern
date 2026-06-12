sprite_index = spr_gusbrickscared;
if (distance_to_object(obj_player) <= 100)
{
	if ((obj_player.x >= x && obj_player.xscale == -1) || (obj_player.x <= x && obj_player.xscale == 1))
	{
		if (obj_player.xscale == 1)
		{
			sprite_index = spr_gusbricknotscaredL;
		}
		else
		{
			sprite_index = spr_gusbricknotscared;
		}
	}
}
