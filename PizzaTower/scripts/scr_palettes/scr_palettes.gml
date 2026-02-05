global.palettes = {};

global.palettes[$ CHAR_PEPPINO] = [];
global.palettes[$ CHAR_NOISE] = [];

function PaletteData() constructor
{
    character = undefined;
	name = undefined;
	index = undefined;
	palette_sprite = undefined;
	pattern_sprite = undefined;
	unlocked = false;
	has_pattern = false;
	is_global = false;
	finished = false;
	
	static IsUnlocked = function()
	{
		ini_open_from_string(obj_savesystem.ini_str_options);
		var _unlocked = ini_read_real("Palettes", name, false);
		ini_close();
		return _unlocked;
	}
	
	static SetCharacter = function(_character)
	{
		if (finished) throw "Palette modified after Add() was called!";
			
		character = _character;
		return self;
	}
	
	static SetName = function(_name)
	{
		if (finished) throw "Palette modified after Add() was called!";
		
		name = _name;
		return self;
	}
	
	static SetIndex = function(_index)
	{
		if (finished) throw "Palette modified after Add() was called!";
		
		index = _index;
		return self;
	}
	
	static SetPalette = function(_pal_spr)
	{
		if (finished) throw "Palette modified after Add() was called!";
		
		palette_sprite = _pal_spr;
		return self;
	}
	
	static SetPattern = function(_pat_spr)
	{
		if (finished) throw "Palette modified after Add() was called!";
		
		pattern_sprite = _pat_spr;
		return self;
	}
	
	static SetGlobal = function(_global)
	{
		if (finished) throw "Palette modified after Add() was called!";
		is_global = _global;
		return self;
	}
	
	static SetUnlocked = function(_unlocked)
	{
		// we dont check because its not a static value and can change.
		
		unlocked = _unlocked;
		quick_ini_write_real_options("Palettes", name, unlocked);
		return self;
	}
	
	static Add = function()
	{
		static default_pals =
		{
			P: spr_peppalette,
			N: spr_noisepalette
		};
		
		// necessary elements
		if (character == undefined && !is_global) throw "Character is undefined!";
		if (name == undefined) throw "Name is undefined!";
		if (index == undefined) throw "Index is undefined!";
		
		// set palette sprite to the default
		palette_sprite ??= default_pals[$ character];
		has_pattern = (pattern_sprite != undefined && sprite_exists(pattern_sprite));
		
		
		// push myself to the global array
		if (is_global)
		{
			var _names = struct_get_names(global.palettes);
		    var _len = array_length(_names);
    
		    for (var i = 0; i < _len; i++)
			{
				var _charname = _names[i];
				var _pal_is_undefined = (palette_sprite == undefined);
				if (_pal_is_undefined)
					SetPalette(default_pals[$ _charname]);
				
				// make a clone and set it to finished
				var _clone = variable_clone(self);
				_clone.finished = true;
			
				array_push(global.palettes[$ _charname], _clone);
				// go back to undefined so we can do it again next iteration
				if (_pal_is_undefined)
					SetPalette(undefined);
			}
		}
		else
		{
			finished = true;
			array_push(global.palettes[$ character], self);
		}
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
            if (_data.IsUnlocked())
				_data.unlocked = true;
        }
    }

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
		{
			continue;
		}
        
        array_push(_palettes, _pal);
    }
    
    return _palettes;
}

function palette_get_data_index(_character, _index)
{
	var _pals = global.palettes[$ _character];
	var i = 0;
	repeat (array_length(_pals))
	{
		var _current_pal = _pals[i];
		if (_current_pal.index == _index)
			return _current_pal;
		i++;
	}
}

function palette_get_data_name(_character, _name)
{
	var _pals = global.palettes[$ _character];
	var i = 0;
	repeat (array_length(_pals))
	{
		var _current_pal = _pals[i];
		if (_current_pal.name == _name)
			return _current_pal;
		i++;
	}
}



#region Peppino

new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("classic").SetIndex(1).SetUnlocked(true).Add();

new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("unfunny").SetIndex(3).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("money").SetIndex(4).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("sage").SetIndex(5).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("blood").SetIndex(6).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("tv").SetIndex(7).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("dark").SetIndex(8).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("shitty").SetIndex(9).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("golden").SetIndex(10).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("garish").SetIndex(11).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("mooney").SetIndex(15).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("funny").SetIndex(12).SetPattern(spr_peppattern1).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("itchy").SetIndex(12).SetPattern(spr_peppattern2).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("pizza").SetIndex(12).SetPattern(spr_peppattern3).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("stripes").SetIndex(12).SetPattern(spr_peppattern4).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("goldemanne").SetIndex(12).SetPattern(spr_peppattern5).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("bones").SetIndex(12).SetPattern(spr_peppattern6).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("pp").SetIndex(12).SetPattern(spr_peppattern7).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("war").SetIndex(12).SetPattern(spr_peppattern8).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("john").SetIndex(12).SetPattern(spr_peppattern9).Add();

// Final Round
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("rats").SetIndex(16).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("db").SetIndex(17).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("caff").SetIndex(18).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("unc").SetIndex(19).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("wakingupinthemorningwhenits6am").SetIndex(20).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("massacre").SetIndex(21).Add();

new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("cheesy").SetIndex(12).SetPattern(spr_peppattern16).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("patch").SetIndex(12).SetPattern(spr_peppattern17).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("metal").SetIndex(12).SetPattern(spr_peppattern18).Add();
new PaletteData().SetCharacter(CHAR_PEPPINO).SetName("sparkle").SetIndex(12).SetPattern(spr_peppattern19).Add();

#endregion

#region Noise

new PaletteData().SetCharacter(CHAR_NOISE).SetName("classicN").SetIndex(1).SetUnlocked(true).Add();

new PaletteData().SetCharacter(CHAR_NOISE).SetName("boise").SetIndex(3).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("roise").SetIndex(4).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("poise").SetIndex(5).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("reverse").SetIndex(6).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("critic").SetIndex(7).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("outlaw").SetIndex(8).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("antidoise").SetIndex(9).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("flesheater").SetIndex(10).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("super").SetIndex(11).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("porcupine").SetIndex(15).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("feminine").SetIndex(16).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("realdoise").SetIndex(17).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("forest").SetIndex(18).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("racer").SetIndex(28).SetPattern(spr_noisepattern1).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("comedian").SetIndex(27).SetPattern(spr_noisepattern2).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("banana").SetIndex(26).SetPattern(spr_noisepattern3).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("noiseTV").SetIndex(25).SetPattern(spr_noisepattern4).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("madman").SetIndex(24).SetPattern(spr_noisepattern5).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("bubbly").SetIndex(23).SetPattern(spr_noisepattern6).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("welldone").SetIndex(22).SetPattern(spr_noisepattern7).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("grannykisses").SetIndex(21).SetPattern(spr_noisepattern8).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("towerguy").SetIndex(20).SetPattern(spr_noisepattern9).Add();

// Final Round
new PaletteData().SetCharacter(CHAR_NOISE).SetName("goise").SetIndex(29).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("bro").SetIndex(30).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("hollyjolly").SetIndex(31).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("shady").SetIndex(32).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("Frienemy").SetIndex(33).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("retroself").SetIndex(34).Add();

new PaletteData().SetCharacter(CHAR_NOISE).SetName("hard").SetIndex(35).SetPattern(spr_noisepattern10).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("floppy").SetIndex(36).SetPattern(spr_noisepattern11).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("sludge").SetIndex(37).SetPattern(spr_noisepattern12).Add();
new PaletteData().SetCharacter(CHAR_NOISE).SetName("tte").SetIndex(38).SetPattern(spr_noisepattern13).Add();

#endregion

#region Global Palettes

new PaletteData().SetName("candy").SetIndex(12).SetPattern(spr_peppattern10).SetGlobal(true).Add();
new PaletteData().SetName("bloodstained").SetIndex(12).SetPattern(spr_peppattern11).SetGlobal(true).Add();
new PaletteData().SetName("bat").SetIndex(12).SetPattern(spr_peppattern12).SetGlobal(true).Add();
new PaletteData().SetName("pumpkin").SetIndex(12).SetPattern(spr_peppattern13).SetGlobal(true).Add();
new PaletteData().SetName("fur").SetIndex(12).SetPattern(spr_peppattern14).SetGlobal(true).Add();
new PaletteData().SetName("flesh").SetIndex(12).SetPattern(spr_peppattern15).SetGlobal(true).Add();

#endregion
