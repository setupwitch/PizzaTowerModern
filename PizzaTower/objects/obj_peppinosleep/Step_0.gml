if (sprite_index == spr_peppinoswitch2 && ANIMATION_END)
{
	image_index = image_number - 1;
}
if (sprite_index == spr_peppinoswitch1 && obj_player.grounded)
{
	alarm[0] = 1;
}
