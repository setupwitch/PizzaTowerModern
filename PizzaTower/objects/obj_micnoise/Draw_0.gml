if (!obj_player.ispeppino)
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_noiseboss_palette, 1, false);
	draw_self();
	shader_reset();
}
else
{
	draw_self();
}
