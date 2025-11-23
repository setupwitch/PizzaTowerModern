steam_update();
global.steam_api = (steam_initialised() && steam_stats_ready());

if (room != Loadiingroom && !global.steam_api && steam_is_screenshot_requested())
{
	var date = date_current_datetime();
	var name = concat("PizzaTower_", global.screenshotcount++, date_get_second(date), date_get_minute(date), date_get_month(date), date_get_year(date), ".png");
	name = concat("screenshots/", name);
	trace("Screenshot saved ", name);
	screen_save(name);
	steam_send_screenshot(name, window_get_width(), window_get_height());
}

if (loaded)
    exit;

var _complete = 0;
for (var i = 0; i < array_length(global.fmod_banks); i++)
{
    var _bank_handle = global.fmod_banks[i];
    var _state = fmod_studio_bank_get_loading_state(_bank_handle);
    
    if (_state == FMOD_STUDIO_LOADING_STATE.ERROR)
    {
        show_debug_message("Bank loading error:" + fmod_last_result());
        throw "Bank loading error! Check log for details.";
    }
    
    if (_state == FMOD_STUDIO_LOADING_STATE.LOADED)
        _complete++;

}
if (_complete == array_length(global.fmod_banks))
    loaded = true;