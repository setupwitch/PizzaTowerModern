with (obj_player)
{
	if (character != "V")
	{
		if ((place_meeting(x + hsp, y, other) || place_meeting(x + xscale, y, other)) && (obj_player.state == states.mach3 || obj_player.state == states.mach3 || (obj_player.ghostdash == true && obj_player.ghostpepper >= 3) || obj_player.ratmount_movespeed >= 12 || obj_player.state == states.rocket || obj_player.state == states.knightpepslopes || obj_player.state == states.shoulderbash))
		{
			playerindex = 0;
			instance_destroy(other);
		}
	}
}
if (place_meeting(x, y + 1, obj_player) || place_meeting(x, y - 1, obj_player) || place_meeting(x - 1, y, obj_player) || place_meeting(x + 1, y, obj_player))
{
	if (obj_player.ghostdash == true && obj_player.ghostpepper >= 3)
	{
		instance_destroy();
	}
	if (place_meeting(x, y - 1, obj_player) && ((obj_player.state == states.freefall || obj_player.state == states.superslam) && obj_player.freefallsmash >= 10))
	{
		with (instance_place(x, y - 1, obj_player))
		{
			if (character == "M")
			{
				state = states.jump;
				vsp = -7;
				sprite_index = spr_jump;
			}
		}
		playerindex = 0;
		instance_destroy();
	}
	if (place_meeting(x, y - 1, obj_player) && (((obj_player.state == states.ratmountbounce || obj_player.state == states.noisecrusher) && obj_player.vsp > 0) || obj_player.state == states.knightpep || obj_player.state == states.hookshot))
	{
		playerindex = 0;
		instance_destroy();
	}
}
