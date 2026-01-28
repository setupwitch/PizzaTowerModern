
if (obj_player.character != active_character)
{
    set_char(obj_player.character);
    
    /*
	with (obj_player1)
	{
		if (paletteselect > 2)
		{
			for (var i = 0; i < array_length(other.palettes); i++)
			{
				var pal = other.palettes[i][2];
				var info = character == CHAR_PEPPINO ? get_pep_palette_info() : get_noise_palette_info();
				if (pal == info.paletteselect && (array_length(other.palettes[i]) <= 3 || (array_length(other.palettes[i]) > 3 && other.palettes[i][3] == info.patterntexture)))
				{
					other.paletteselect = i;
					break;
				}
			}
		}
	}
    */
	palettetitle = lang_get_value(concat("dresser_", player_palettes[paletteselect].name, "title"));
	palettedesc = lang_get_value_newline(concat("dresser_", player_palettes[paletteselect].name));
}
showtext = (place_meeting(x, y, obj_player) && !instance_exists(obj_transfotip));
alpha = Approach(alpha, real(showtext), 0.1);
