if (obj_player.ispeppino)
{
	if (!obj_player.isgustavo)
	{
		sprite_index = spr_gustavosign;
	}
	else
	{
		with (obj_gustavoswitch)
		{
			sprite_index = spr_pepsign;
		}
	}
}
else if (!obj_player.noisecrusher)
{
	sprite_index = spr_noisesign;
}
else
{
	with (obj_gustavoswitch)
	{
		sprite_index = spr_noisesign;
	}
}
