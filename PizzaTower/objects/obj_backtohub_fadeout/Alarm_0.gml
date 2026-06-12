if (!instance_exists(obj_player))
{
	alarm[0] = 1;
	instance_activate_object(obj_player);
}
else
{
	if (reset)
	{
		global.levelreset = false;
		scr_playerreset(false);
		with (obj_music)
		{
			event_perform(ev_other, ev_room_start);
		}
	}
	pos_player = true;
	obj_player.x = obj_player.backtohubstartx;
	obj_player.y = obj_player.backtohubstarty - (SCREEN_HEIGHT * 2);
	obj_player.state = states.backtohub;
	obj_player.sprite_index = obj_player.spr_slipbanan1;
	obj_player.image_index = 10;
}
