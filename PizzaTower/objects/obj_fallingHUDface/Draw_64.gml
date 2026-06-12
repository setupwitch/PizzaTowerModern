shader_set(global.Pal_Shader);
if (obj_player.spotlight == false)
{
	pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, false);
}

draw_sprite(sprite, -1, X, Y);
shader_reset();
