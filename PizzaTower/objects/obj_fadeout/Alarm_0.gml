if (instance_exists(obj_player))
{
	if (custom_level == false)
	{
		with (obj_player)
		{
			if (place_meeting(x, y, obj_goldendoor))
			{
				game_restart();
			}
		}
		if (room != obj_player.targetRoom || roomreset)
		{
			var r = room;
			scr_room_goto(obj_player.targetRoom);
			if (r == tower_peppinohouse)
			{
				scr_unlock_swap();
			}
			with (obj_player)
			{
				if (state == states.ejected || state == states.taxi2)
				{
					visible = true;
					state = states.normal;
				}
			}
		}
	}
}
