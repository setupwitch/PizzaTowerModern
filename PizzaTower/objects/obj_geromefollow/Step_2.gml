yoffset = 0;
if (state != states.backbreaker)
{
	if (sprite_index != spr_gerome_collected && sprite_index != spr_gerome_taunt)
	{
		event_inherited();
		if (!do_end)
		{
			visible = obj_player.visible;
		}
		sprite_index = (x != xprevious) ? spr_gerome_keymove : spr_gerome_keyidle;
		if ((xprevious - x) != 0)
		{
			image_xscale = -sign(xprevious - x);
		}
		else if (playerid.hsp == 0)
		{
			image_xscale = playerid.xscale;
		}
		if (obj_player.state == states.backbreaker)
		{
			sprite_index = spr_gerome_taunt;
			image_index = irandom(sprite_get_number(sprite_index) - 1);
			state = states.backbreaker;
			tauntID = instance_create(x, y, obj_baddietaunteffect);
		}
	}
}
else
{
	if (sprite_index != spr_gerome_collected)
	{
		var s = obj_player.sprite_index;
		if (s == obj_player.spr_supertaunt1 || s == obj_player.spr_supertaunt2 || s == obj_player.spr_supertaunt3 || s == obj_player.spr_supertaunt4 || s == spr_player_ratmountsupertaunt)
		{
			sprite_index = spr_gerome_collected;
			image_index = 0;
		}
	}
	if (obj_player.state != states.backbreaker || (sprite_index == spr_gerome_collected && ANIMATION_END))
	{
		sprite_index = spr_gerome_keyidle;
		instance_destroy(tauntID);
		state = states.normal;
	}
}
if (room == rank_room || room == timesuproom)
{
	visible = false;
}
