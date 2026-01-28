global.palettes = {};

global.palettes[$ CHAR_PEPPINO] = [];
global.palettes[$ CHAR_NOISE] = [];


#macro PALETTE_DEFAULT undefined
function PaletteData(_name, _palette_index = undefined, _palette_sprite, _pattern_sprite = undefined, _unlocked = false) constructor
{
    static default_pals = { CHAR_PEPPINO: spr_peppalette, CHAR_NOISE: spr_noisepalette };
    
    character = CHAR_PEPPINO;
	name = _name;
	index = _palette_index;
	palette_sprite = _palette_sprite ?? default_pals[$ character];
	pattern_sprite = _pattern_sprite;
	unlocked = _unlocked;
	has_pattern = (pattern_sprite != undefined);
	
	static is_unlocked = function()
	{
		ini_open_from_string(obj_savesystem.ini_str_options);
		var _unlocked = ini_read_real("Palettes", name, false);
		ini_close();
		return _unlocked;
	}
}



function palette_check_unlocked()
{
	var _char_names = struct_get_names(global.palettes);
	for (var c = 0; c < array_length(_char_names); c++)
    {
        var _char = _char_names[c];
        var _pal_data = global.palettes[$ _char];
        
        var _len = array_length(_pal_data)
        for (var i = 0; i < _len; i++)
        {
            var _data = _pal_data[i];
            _data.unlocked = _data.is_unlocked();
        }
    }

}

function add_palette(_character, _paldata)
{
    with (_paldata)
        character = _character;
    array_push(global.palettes[$ _character], _paldata);
}

function add_palette_global(_paldata)
{
	var _names = struct_get_names(global.palettes);
    var _len = array_length(_names);
    
    for (var i = 0; i < _len; i++)
        add_palette(_names[i], _paldata);
}

function character_get_palettes(_character, _check_unlocked = false)
{
    var _data = global.palettes[$ _character];
    
    var _len = array_length(_data);
    var _palettes = [];
    for (var i = 0; i < _len; i++)
    {
        var _pal = _data[i];
        if (_check_unlocked && !_pal.unlocked)
            continue;
        
        array_push(_palettes, _pal);
    }
    
    return _palettes;
}

function palette_get_data(_character, _paletteselect)
{
	return global.palettes[$ _character][_paletteselect];
}

#region Peppino

add_palette(CHAR_PEPPINO, new PaletteData("classic", 1, PALETTE_DEFAULT, undefined, true));

add_palette(CHAR_PEPPINO, new PaletteData("unfunny", 3, PALETTE_DEFAULT));
add_palette(CHAR_PEPPINO, new PaletteData("money", 4, PALETTE_DEFAULT));
add_palette(CHAR_PEPPINO, new PaletteData("sage", 5, PALETTE_DEFAULT));
add_palette(CHAR_PEPPINO, new PaletteData("blood", 6, PALETTE_DEFAULT));
add_palette(CHAR_PEPPINO, new PaletteData("tv", 7, PALETTE_DEFAULT));
add_palette(CHAR_PEPPINO, new PaletteData("dark", 8, PALETTE_DEFAULT));
add_palette(CHAR_PEPPINO, new PaletteData("shitty", 9, PALETTE_DEFAULT));
add_palette(CHAR_PEPPINO, new PaletteData("golden", 10, PALETTE_DEFAULT));
add_palette(CHAR_PEPPINO, new PaletteData("garish", 11, PALETTE_DEFAULT));
add_palette(CHAR_PEPPINO, new PaletteData("mooney", 15, PALETTE_DEFAULT));
add_palette(CHAR_PEPPINO, new PaletteData("funny", 12, PALETTE_DEFAULT, spr_peppattern1));
add_palette(CHAR_PEPPINO, new PaletteData("itchy", 12, PALETTE_DEFAULT, spr_peppattern2));
add_palette(CHAR_PEPPINO, new PaletteData("pizza", 12, PALETTE_DEFAULT, spr_peppattern3));
add_palette(CHAR_PEPPINO, new PaletteData("stripes", 12, PALETTE_DEFAULT, spr_peppattern4));
add_palette(CHAR_PEPPINO, new PaletteData("goldemanne", 12, PALETTE_DEFAULT, spr_peppattern5));
add_palette(CHAR_PEPPINO, new PaletteData("bones", 12, PALETTE_DEFAULT, spr_peppattern6));
add_palette(CHAR_PEPPINO, new PaletteData("pp", 12, PALETTE_DEFAULT, spr_peppattern7));
add_palette(CHAR_PEPPINO, new PaletteData("war", 12, PALETTE_DEFAULT, spr_peppattern8));
add_palette(CHAR_PEPPINO, new PaletteData("john", 12, PALETTE_DEFAULT, spr_peppattern9));

#endregion

#region Noise

add_palette(CHAR_NOISE, new PaletteData("classicN", 1, PALETTE_DEFAULT, undefined, true));

add_palette(CHAR_NOISE, new PaletteData("boise", 3, PALETTE_DEFAULT));
add_palette(CHAR_NOISE, new PaletteData("roise", 4, PALETTE_DEFAULT));
add_palette(CHAR_NOISE, new PaletteData("poise", 5, PALETTE_DEFAULT));
add_palette(CHAR_NOISE, new PaletteData("reverse", 6, PALETTE_DEFAULT));
add_palette(CHAR_NOISE, new PaletteData("critic", 7, PALETTE_DEFAULT));
add_palette(CHAR_NOISE, new PaletteData("outlaw", 8, PALETTE_DEFAULT));
add_palette(CHAR_NOISE, new PaletteData("antidoise", 9, PALETTE_DEFAULT));
add_palette(CHAR_NOISE, new PaletteData("flesheater", 10, PALETTE_DEFAULT));
add_palette(CHAR_NOISE, new PaletteData("super", 11, PALETTE_DEFAULT));
add_palette(CHAR_NOISE, new PaletteData("porcupine", 15, PALETTE_DEFAULT));
add_palette(CHAR_NOISE, new PaletteData("feminine", 16, PALETTE_DEFAULT));
add_palette(CHAR_NOISE, new PaletteData("realdoise", 17, PALETTE_DEFAULT));
add_palette(CHAR_NOISE, new PaletteData("forest", 18, PALETTE_DEFAULT));
add_palette(CHAR_NOISE, new PaletteData("racer", 28, PALETTE_DEFAULT, spr_noisepattern1));
add_palette(CHAR_NOISE, new PaletteData("comedian", 27, PALETTE_DEFAULT, spr_noisepattern2));
add_palette(CHAR_NOISE, new PaletteData("banana", 26, PALETTE_DEFAULT, spr_noisepattern3));
add_palette(CHAR_NOISE, new PaletteData("noiseTV", 25, PALETTE_DEFAULT, spr_noisepattern4));
add_palette(CHAR_NOISE, new PaletteData("madman", 24, PALETTE_DEFAULT, spr_noisepattern5));
add_palette(CHAR_NOISE, new PaletteData("bubbly", 23, PALETTE_DEFAULT, spr_noisepattern6));
add_palette(CHAR_NOISE, new PaletteData("welldone", 22, PALETTE_DEFAULT, spr_noisepattern7));
add_palette(CHAR_NOISE, new PaletteData("grannykisses", 21, PALETTE_DEFAULT, spr_noisepattern8));
add_palette(CHAR_NOISE, new PaletteData("towerguy", 20, PALETTE_DEFAULT, spr_noisepattern9));

#endregion

#region Global Palettes

add_palette_global(new PaletteData("candy", 12, PALETTE_DEFAULT, spr_peppattern10))
add_palette_global(new PaletteData("bloodstained", 12, PALETTE_DEFAULT, spr_peppattern11))
add_palette_global(new PaletteData("bat", 12, PALETTE_DEFAULT, spr_peppattern12))
add_palette_global(new PaletteData("pumpkin", 12, PALETTE_DEFAULT, spr_peppattern13))
add_palette_global(new PaletteData("fur", 12, PALETTE_DEFAULT, spr_peppattern14))
add_palette_global(new PaletteData("flesh", 12, PALETTE_DEFAULT, spr_peppattern15))

#endregion
