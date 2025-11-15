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
