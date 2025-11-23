EXECUTE_IN_ORDER;
var _campos = new Vector2(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
var lay_arr = layer_get_all();
for (var i = 0; i < array_length(lay_arr); i++)
{
	var lay = lay_arr[i];
	var lay_name = layer_get_name(lay);
	// process here
	if (struct_exists(layers, lay_name))
	{
		with (layers[$ lay_name])
			update(lay, _campos)
	}
		
}
