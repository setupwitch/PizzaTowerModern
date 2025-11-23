
if (layer_exists("Tiles_BG")) layer_depth("Tiles_BG", 200);
if (layer_exists("Tiles_BG2")) layer_depth("Tiles_BG2", 199);
if (layer_exists("Tiles_BG3")) layer_depth("Tiles_BG3", 198);
if (layer_exists("Tiles_1")) layer_depth("Tiles_1", 100);
if (layer_exists("Tiles_2")) layer_depth("Tiles_2", 98);
if (layer_exists("Tiles_3")) layer_depth("Tiles_3", 97);
if (layer_exists("Tiles_4")) layer_depth("Tiles_4", 96);
if (layer_exists("Tiles_Foreground1")) layer_depth("Tiles_Foreground1", 99);
if (layer_exists("Tiles_Foreground2")) layer_depth("Tiles_Foreground2", 98);
if (layer_exists("Tiles_Foreground3")) layer_depth("Tiles_Foreground3", 97);


var asset_layers = ["Assets_BG", "Assets_BG1", "Assets_BG2", "Assets_stillBG1", "Assets_FG", "Assets_FG1", "Assets_FG2"];
var asset_parallax = [[0.1, 0.1], [0.05, 0.05], [0.1, 0.1], [0.05, 0], [-0.1, -0.1], [-0.05, -0.05], [-0.1, -0.1]];
for (var i = 0; i < array_length(asset_layers); i++)
{
	var b = asset_layers[i];
	var p = asset_parallax[i];
	
	if (!layer_exists(b))
		continue;
		
	b = layer_get_id(b);
	var q = layer_get_all_elements(b);
	for (var j = 0; j < array_length(q); j++)
	{
		var _asset = q[j];
		var _x = layer_sprite_get_x(_asset);
		var _y = layer_sprite_get_y(_asset);
		var spr = layer_sprite_get_sprite(_asset);
		if (p[0] != 0)
		{
			layer_sprite_x(_asset, (_x - (_x * p[0])) + ((SCREEN_WIDTH / 4) * p[0]));
		}
		if (p[1] != 0 && spr != spr_industrialpipe && spr != bg_farmdirtwall)
		{
			layer_sprite_y(_asset, (_y - (_y * p[1])) + ((SCREEN_HEIGHT / 4) * p[1]));
		}
	}
}

if (global.hidetiles)
{
	if (layer_exists("Tiles_BG")) layer_set_visible("Tiles_BG", false);
	if (layer_exists("Tiles_BG2")) layer_set_visible("Tiles_BG2", false);
	if (layer_exists("Tiles_BG3")) layer_set_visible("Tiles_BG3", false);
	if (layer_exists("Tiles_1")) layer_set_visible("Tiles_1", false);
	if (layer_exists("Tiles_2")) layer_set_visible("Tiles_2", false);
	if (layer_exists("Tiles_3")) layer_set_visible("Tiles_3", false);
	if (layer_exists("Tiles_4")) layer_set_visible("Tiles_4", false);
	if (layer_exists("Tiles_Foreground1")) layer_set_visible("Tiles_Foreground1", false);
	if (layer_exists("Tiles_Foreground2")) layer_set_visible("Tiles_Foreground2", false);
	if (layer_exists("Tiles_Foreground3")) layer_set_visible("Tiles_Foreground3", false);
}
layers[$ "Backgrounds_scroll"].pos = new Vector2(0, 0);
layers[$ "Backgrounds_scroll"].offset = new Vector2(layer_get_x("Backgrounds_scroll"), layer_get_y("Backgrounds_scroll"));

layers[$ "Backgrounds_scroll2"].pos = new Vector2(0, 0);
layers[$ "Backgrounds_scroll2"].offset = new Vector2(layer_get_x("Backgrounds_scroll2"), layer_get_y("Backgrounds_scroll2"));

layers[$ "Backgrounds_scroll3"].pos = new Vector2(0, 0);
layers[$ "Backgrounds_scroll3"].offset = new Vector2(layer_get_x("Backgrounds_scroll3"), layer_get_y("Backgrounds_scroll3"));

layers[$ "Backgrounds_scroll4"].pos = new Vector2(0, 0);
layers[$ "Backgrounds_scroll4"].offset = new Vector2(layer_get_x("Backgrounds_scroll4"), layer_get_y("Backgrounds_scroll4"));

layers[$ "Backgrounds_still1"].offset = new Vector2(layer_get_x("Backgrounds_still1"), layer_get_y("Backgrounds_still1"));

layers[$ "Backgrounds_still2"].offset = new Vector2(layer_get_x("Backgrounds_still2"), layer_get_y("Backgrounds_still2"));

layers[$ "Backgrounds_stillH1"].offset = new Vector2(layer_get_x("Backgrounds_stillH1"), layer_get_y("Backgrounds_stillH1"));

layers[$ "Backgrounds_stillH2"].offset = new Vector2(layer_get_x("Backgrounds_stillH2"), layer_get_y("Backgrounds_stillH2"));

layers[$ "Backgrounds_stillH3"].offset = new Vector2(layer_get_x("Backgrounds_stillH3"), layer_get_y("Backgrounds_stillH3"));

layers[$ "Backgrounds_stillH4"].offset = new Vector2(layer_get_x("Backgrounds_stillH4"), layer_get_y("Backgrounds_stillH4"));

layers[$ "Backgrounds_1"].offset = new Vector2(layer_get_x("Backgrounds_1"), layer_get_y("Backgrounds_1"));

layers[$ "Backgrounds_2"].offset = new Vector2(layer_get_x("Backgrounds_2"), layer_get_y("Backgrounds_2"));

layers[$ "Backgrounds_3"].offset = new Vector2(layer_get_x("Backgrounds_3"), layer_get_y("Backgrounds_3"));

layers[$ "Backgrounds_zigzag1"].offset = new Vector2(layer_get_x("Backgrounds_zigzag1"), layer_get_y("Backgrounds_zigzag1"));
layers[$ "Backgrounds_zigzag1"].pos = new Vector2(0, 0);
layers[$ "Backgrounds_zigzag1"].speed.x = layer_get_hspeed("Backgrounds_zigzag1");

layers[$ "Backgrounds_zigzag2"].offset = new Vector2(layer_get_x("Backgrounds_zigzag2"), layer_get_y("Backgrounds_zigzag2"));
layers[$ "Backgrounds_zigzag2"].pos = new Vector2(0, 0);
layers[$ "Backgrounds_zigzag2"].speed = new Vector2(layer_get_hspeed("Backgrounds_zigzag2"), layer_get_vspeed("Backgrounds_zigzag2"));

layers[$ "Backgrounds_stillZH1"].offset = new Vector2(layer_get_x("Backgrounds_stillZH1"), layer_get_y("Backgrounds_stillZH1"));
layers[$ "Backgrounds_stillZH1"].pos = new Vector2(0, 0);
layers[$ "Backgrounds_stillZH1"].speed = new Vector2(layer_get_hspeed("Backgrounds_stillZH1"), layer_get_vspeed("Backgrounds_stillZH1"));

layers[$ "Backgrounds_stillZH2"].offset = new Vector2(layer_get_x("Backgrounds_stillZH2"), layer_get_y("Backgrounds_stillZH2"));
layers[$ "Backgrounds_stillZH2"].pos = new Vector2(0, 0);
layers[$ "Backgrounds_stillZH2"].speed = new Vector2(layer_get_hspeed("Backgrounds_stillZH2"), layer_get_vspeed("Backgrounds_stillZH2"));

layers[$ "Foreground_1"].offset = new Vector2(layer_get_x("Foreground_1"), layer_get_y("Foreground_1"));
layers[$ "Foreground_1"].speed = new Vector2(0, layer_get_vspeed("Foreground_1"));

layers[$ "Foreground_2"].offset = new Vector2(layer_get_x("Foreground_2"), layer_get_y("Foreground_2"));

struct_foreach(layers, function(_name, _value)
{
	if (_value.depth != undefined && layer_exists(_name))
		layer_depth(_name, _value.depth);
});
