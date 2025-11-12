function scr_get_tutorial_key(_input)
{
	var spr = noone;
	var ix = 0;
	var txt = noone;
	switch (_input)
	{
		case ev_joystick2_button2:
			spr = global.gamepadbuttonsprite;
			ix = 16;
			break;
		case ev_joystick2_button4:
			spr = global.gamepadbuttonsprite;
			ix = 17;
			break;
		case ev_joystick2_button3:
			spr = global.gamepadbuttonsprite;
			ix = 4;
			break;
		case ev_joystick2_button5:
			spr = global.gamepadbuttonsprite;
			ix = 5;
			break;
		case vk_shift:
		case vk_lshift:
			spr = spr_tutorialkeyspecial;
			ix = 0;
			break;
		case vk_control:
		case vk_lcontrol:
			spr = spr_tutorialkeyspecial;
			ix = 1;
			break;
		case vk_space:
			spr = spr_tutorialkeyspecial;
			ix = 2;
			break;
		default:
			spr = spr_tutorialkey;
			ix = 0;
			txt = chr(_input);
			break;
	}
	return [spr, ix, txt];
}

function scr_string_width(_str)
{
	var _max_w = 0;
	var _lines = string_split(_str, "\n");
	var _len = array_length(_lines);
	
	for (var i = 0; i < _len; i++)
		_max_w = max(_max_w, string_width(_lines[i]));
	return _max_w;
}

function scr_is_separation(_seperator, _seperation)
{
	for (var i = 0; i < array_length(_seperation); i++)
	{
		if (_seperator == _seperation[i])
		 	return true;
	}
	return false;
}

function scr_separate_text(_str, _font = noone, _targetwidth = 0)
{
	if (_font != noone)
		draw_set_font(_font);
	
	// get separation characters
	var separation_string = lang_get_value("separation_map");
	var separation = string_split(separation_string, ",");
	
	var _max_width = _targetwidth - string_width("a");
	
	// if width is 0 or less, just return the original string to avoid infinite loops
	if (_max_width <= 0)
		return _str;
	
	var _start_pos = 1;
	var _len = string_length(_str);
	
	while (true) 
	{
		var _remaining_str = string_copy(_str, _start_pos, _len - _start_pos + 1);
		if (string_width(_remaining_str) <= _max_width)
		{
			break;
		}
		
		var _pos = _start_pos;
		
		var _prev_sep_pos = _start_pos; 
		var _found_break = false;
		
		while (_pos <= _len)
		{
			var _current_line_width = string_width(string_copy(_str, _start_pos, _pos - _start_pos + 1));
			
			if (_current_line_width > _max_width)
			{
				_found_break = true;
				break;
			}
			
			var _char = string_char_at(_str, _pos);
			if (scr_is_separation(_char, separation))
			{
				_prev_sep_pos = _pos;
			}
			
			if (_pos == _len)
			{
				_found_break = true;
				break;
			}
			
			_pos++;
		}
		
		if (!_found_break)
			break; 

		var _break_pos = 0;
		
		if (_prev_sep_pos > _start_pos)
		{
			_break_pos = _prev_sep_pos;
		}
		else
		{
			_break_pos = _pos - 1;
			
			if (_break_pos < _start_pos)
				_break_pos = _start_pos; 
		}
		
		// newline insertion
		if (string_char_at(_str, _break_pos) == " ")
		{
			// replace space with a newline
			_str = string_delete(_str, _break_pos, 1);
			_str = string_insert("\n", _str, _break_pos);
			_start_pos = _break_pos + 1;
		}
		else
		{
			_str = string_insert("\n", _str, _break_pos + 1);
			_start_pos = _break_pos + 2;
		}
		
		_len = string_length(_str);
	}
	
	return _str;
}

function scr_calculate_text(_str, _targetwidth)
{
	draw_set_font(font2);
	var str2 = scr_separate_text(_str, font2, _targetwidth);
	return str2;
}

function scr_calculate_height(_str, _targetwidth)
{
	var str2 = scr_calculate_text(_str, _targetwidth);
	return string_height(str2);
}
