ParallaxLayer = function(_depth, _update) constructor
{
	depth = _depth;
	offset = new Vector2(0, 0);
	pos = new Vector2(0, 0);
	update = _update;
	speed = new Vector2(0, 0);
}

layers = {}; // <layername, ParallaxLayer>

add_layer = function(_layer_name, _depth, _update)
{
	var _inst = new ParallaxLayer(_depth, _update);
	
	_inst.update = method(_inst, _update);
	
	struct_set(layers, _layer_name, _inst);
	return _inst;
}

add_layer("Assets_BG2", 202, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x * 0.1);
	layer_y(_layerid, _campos.y * 0.1);
});
add_layer("Assets_BG1", 201, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x * 0.05);
	layer_y(_layerid, _campos.y * 0.05);
});
add_layer("Assets_BG", 201, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x * 0.1);
	layer_y(_layerid, _campos.y * 0.1);
});
add_layer("Assets_stillBG", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x * 0.1);
});
add_layer("Backgrounds_1", undefined, function(_layerid, _campos)
{
	if (room == tower_entrancehall || room == tower_johngutterhall || room == tower_1)
	{
		layer_x(_layerid, floor(offset.x + (_campos.x * 0.25)));
		layer_y(_layerid, floor(offset.y + (_campos.y * 0.25)));
	}
	else
	{
		layer_x(_layerid, offset.x + (_campos.x * 0.25));
		layer_y(_layerid, offset.y + (_campos.y * 0.25));
	}
});
add_layer("Backgrounds_2", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, offset.x + (_campos.x * 0.2));
	layer_y(_layerid, offset.y + (_campos.y * 0.2));
});
add_layer("Backgrounds_3", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, offset.x + (_campos.x * 0.15));
	layer_y(_layerid, offset.y + (_campos.y * 0.15));
});
add_layer("Backgrounds_Ground1", 250, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x * 0.2);
});
add_layer("Backgrounds_Ground2", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x * 0.18);
});
add_layer("Backgrounds_Ground3", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x * 0.16);
});
add_layer("Backgrounds_H1", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x * 0.11);
	layer_y(_layerid, _campos.y);
});
add_layer("Backgrounds_sky", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x * 0.25);
	layer_y(_layerid, _campos.y * 0.25);
});
add_layer("Backgrounds_sky2", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x);
	layer_y(_layerid, _campos.y);
});
add_layer("Backgrounds_still1", undefined, function(_layerid, _campos)
{
	var per = 0.3;
	var xof = offset.x;
	var yof = offset.y;
	var per_x = _campos.x / (room_width - SCREEN_WIDTH);
	var per_y = _campos.y / (room_height - SCREEN_HEIGHT);
	var bg_x = calculate_parrallax_still_x(_layerid, per);
	var bg_y = calculate_parrallax_still_y(_layerid, per);
	layer_x(_layerid, (xof + _campos.x) - bg_x);
	layer_y(_layerid, (yof + _campos.y) - bg_y);
});
add_layer("Backgrounds_still2", undefined, function(_layerid, _campos)
{
	var per = 0.25;
	var xof = offset.x;
	var yof = offset.y;
	var per_x = _campos.x / (room_width - SCREEN_WIDTH);
	var per_y = _campos.y / (room_height - SCREEN_HEIGHT);
	var bg_x = calculate_parrallax_still_x(_layerid, per);
	var bg_y = calculate_parrallax_still_y(_layerid, per);
	layer_x(_layerid, (xof + _campos.x) - bg_x);
	layer_y(_layerid, (yof + _campos.y) - bg_y);
});
add_layer("Backgrounds_stillscroll", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, (offset.x + pos.x + _campos.x) - calculate_parrallax_still_x(_layerid, 0.25));
	layer_y(_layerid, (offset.x + pos.y + _campos.y) - calculate_parrallax_still_y(_layerid, 0.25));
	pos.x += layer_get_hspeed(_layerid);
	pos.y += layer_get_vspeed(_layerid);
});
add_layer("Backgrounds_stillH1", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, offset.x + (_campos.x * 0.3));
	layer_y(_layerid, offset.x + (_campos.y - calculate_parrallax_still_y(_layerid, 0.3)));
	offset.x += layer_get_hspeed(_layerid);
	offset.y += layer_get_vspeed(_layerid);
});
add_layer("Backgrounds_stillH2", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, offset.x + (_campos.x * 0.25));
	layer_y(_layerid, offset.x + (_campos.y - calculate_parrallax_still_y(_layerid, 0.25)));
	offset.x += layer_get_hspeed(_layerid);
	offset.y += layer_get_vspeed(_layerid);
});
add_layer("Backgrounds_stillH3", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, offset.x + (_campos.x * 0.2));
	layer_y(_layerid, offset.x + (_campos.y - calculate_parrallax_still_y(_layerid, 0.2)));
	offset.x += layer_get_hspeed(_layerid);
	offset.y += layer_get_vspeed(_layerid);
});
add_layer("Backgrounds_stillH4", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, offset.x + (_campos.x * 0.15));
	layer_y(_layerid, offset.x + (_campos.y - calculate_parrallax_still_y(_layerid, 0.15)));
	offset.x += layer_get_hspeed(_layerid);
	offset.y += layer_get_vspeed(_layerid);
});
add_layer("Backgrounds_scroll", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, (_campos.x * 0.3) + pos.x + offset.x);
	layer_y(_layerid, (_campos.y * 0.3) + pos.y + offset.y);
	pos.x += layer_get_hspeed(_layerid);
	pos.y += layer_get_vspeed(_layerid);
});
add_layer("Backgrounds_scroll2", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, (_campos.x * 0.25) + pos.x + offset.x);
	layer_y(_layerid, (_campos.y * 0.25) + pos.y + offset.y);
	pos.x += layer_get_hspeed(_layerid);
	pos.y += layer_get_vspeed(_layerid);
});
add_layer("Backgrounds_scroll3", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, (_campos.x * 0.2) + pos.x + offset.x);
	layer_y(_layerid, (_campos.y * 0.2) + pos.y + offset.y);
	pos.x += layer_get_hspeed(_layerid);
	pos.y += layer_get_vspeed(_layerid);
});
add_layer("Backgrounds_scroll4", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, (_campos.x * 0.15) + pos.x + offset.x);
	layer_y(_layerid, (_campos.y * 0.15) + pos.y + offset.y);
	pos.x += layer_get_hspeed(_layerid);
	pos.y += layer_get_vspeed(_layerid);
});
add_layer("Backgrounds_zigzag1", undefined, function(_layerid, _campos)
{
	pos.x += speed.x;
	pos.y = Wave(-offset.x, offset.x, 4, 10);
	layer_x(_layerid, (_campos.x * 0.35) + pos.x + offset.x);
	layer_y(_layerid, (_campos.x * 0.35) + pos.y + offset.y);
});
add_layer("Backgrounds_zigzag2", undefined, function(_layerid, _campos)
{
	pos.x += speed.x;
	pos.y = Wave(-speed.y, speed.y, 4, 10);
	layer_x(_layerid, (_campos.x * 0.35) + pos.x + offset.x);
	layer_y(_layerid, (_campos.y * 0.35) + pos.y + offset.y);
});
add_layer("Backgrounds_stillZH1", undefined, function(_layerid, _campos)
{
	pos.x += speed.x;
	pos.y = Wave(-speed.y, speed.y, 4, 10);
	layer_x(_layerid, (_campos.x * 0.35) + pos.x + offset.x);
	layer_y(_layerid, (_campos.y - calculate_parrallax_still_y(_layerid, 0.35)) + pos.y + offset.y);
});
add_layer("Backgrounds_stillZH2", undefined, function(_layerid, _campos)
{
	pos.x += speed.x;
	pos.y = Wave(-speed.y, speed.y, 4, 10);
	layer_x(_layerid, (_campos.x * 0.35) + bg_ZH2_x + offset.x);
	layer_y(_layerid, (_campos.y - calculate_parrallax_still_y(_layerid, 0.35)) + bg_ZH2_y + offset.y);
});
add_layer("Foreground_1", -400, function(_layerid, _campos)
{
	layer_x(_layerid, (_campos.x * -0.15) + offset.x);
	layer_y(_layerid, (_campos.y * -0.15) + speed.y + offset.y);
	speed.y += layer_get_vspeed(_layerid);
});
add_layer("Foreground_2", undefined, function(_layerid, _campos)
{
	layer_x(_layerid, (_campos.x * -0.25) + offset.x);
	layer_y(_layerid, (_campos.y * -0.25) + offset.y);
});
add_layer("Foreground_Ground1", -401, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x * -0.15);
	layer_y(_layerid, room_height - sprite_get_height(layer_background_get_sprite(layer_background_get_id(_layerid))));
});
add_layer("Assets_FG2", -351, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x * -0.1);
	layer_y(_layerid, _campos.y * -0.1);
});
add_layer("Assets_FG1", -350, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x * -0.05);
	layer_y(_layerid, _campos.y * -0.05);
});
add_layer("Assets_FG", -350, function(_layerid, _campos)
{
	layer_x(_layerid, _campos.x * -0.1);
	layer_y(_layerid, _campos.y * -0.1);
});
