shader_set(global.Pal_Shader);
if (obj_player1.spotlight == false)
{
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
}

draw_sprite(sprite, -1, X, Y);
shader_reset();
