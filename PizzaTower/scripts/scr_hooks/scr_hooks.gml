
#macro draw_text_old draw_text
//#macro draw_text draw_text_hook

function draw_text_hook(x, y, _string)
{
	draw_text_old(x, y, _string);
}

function draw_text_ext_hook(x, y, string, sep = 0, w = 0)
{}
