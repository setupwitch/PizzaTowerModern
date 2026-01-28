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
    player_palettes = character_get_palettes(_char, true);
    
    paletteselect = 0;
    var _curr_pal = obj_player.player_paletteselect[obj_player.player_paletteindex];
    var _curr_pat = obj_player.player_patterntexture[obj_player.player_paletteindex];
    
    for (var i = 0; i < array_length(player_palettes); i++)
    {
        var _pal = player_palettes[i];
        if (_pal.index == _curr_pal)
        {
            var _match = (
                (!_pal.has_pattern && _curr_pat == noone) ||
                (_pal.has_pattern && _pal.pattern_sprite == _curr_pat)
            );
            
            if (_match)
            {
                paletteselect = i;
                break;
            }
        }
    }
}

set_char(obj_player1.character);
