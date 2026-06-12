
if (obj_player.character != active_character)
{
    set_char(obj_player.character);
    
	palettetitle = lang_get_value(concat("dresser_", player_palettes[paletteselect].name, "title"));
	palettedesc = lang_get_value_newline(concat("dresser_", player_palettes[paletteselect].name));
}
showtext = (place_meeting(x, y, obj_player) && !instance_exists(obj_transfotip));
alpha = Approach(alpha, real(showtext), 0.1);
