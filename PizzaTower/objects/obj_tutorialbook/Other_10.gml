compiled = true;
font = lang_get_font("tutorialfont");
draw_set_font(font);
text = scr_separate_text(text, noone, (text_sprite_width * text_xscale) - (text_contentpad * 2));
text_yscale = (string_height(text) + (text_contentpad * 2)) / text_sprite_height;
if (text_yscale < 1)
{
	text_yscale = 1;
}
if (change_y)
{
	text_y = -(text_yscale * text_sprite_height);
}
else
{
	change_y = true;
}
text_oldxscale = text_xscale;
draw_set_font(font);
text_arr = scr_compile_icon_text(text);
if (surface_exists(surfclip))
{
	surface_free(surfclip);
}
if (surface_exists(surffinal))
{
	surface_free(surffinal);
}
