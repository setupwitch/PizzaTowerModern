depth = 100;
palette_check_unlocked();

scr_create_uparrowhitbox();

showtext = false;
alpha = 0;
palettetitle = "";
palettedesc = "";

active_character = undefined;
paletteselect = 1;
player_palettes = [];
set_char = function(_char)
{
    active_character = _char;
    paletteselect = obj_player.paletteselect;
    player_palettes = character_get_palettes(_char, true);
}

set_char(obj_player1.character);
