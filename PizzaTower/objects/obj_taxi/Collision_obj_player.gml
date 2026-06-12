with (other)
{
	if (key_up && grounded && ((state == states.ratmount && brick) || state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_taxidud) && !instance_exists(obj_fadeout) && state != states.taxi && (obj_player.spotlight == true && object_index == obj_player))
	{
		with (other)
		{
			instance_create(x, y, obj_genericpoofeffect);
			obj_player.visible = false;
			obj_player.sprite_index = obj_player.spr_idle;
			obj_player.hsp = 0;
			obj_player.movespeed = 0;
			obj_player.ratmount_movespeed = 0;
			obj_player.vsp = 0;
			obj_player.state = states.taxi;
			fmod_event_one_shot("event:/sfx/misc/taximove");
			playerid = obj_player;
			move = true;
			sprite_index = spr_taximove;
			hsp = 10;
			obj_player.cutscene = true;
			depth = -100;
			with (obj_hamkuffattack)
			{
				if (state == 0)
				{
					instance_destroy();
				}
			}
			if (police)
			{
				with (instance_create(x, y, obj_taxicardboard))
				{
					depth = -101;
				}
				fmod_event_one_shot("event:/sfx/misc/policesiren");
				police_buffer = 50;
				obj_player.policetaxi = true;
				sprite_index = spr_taxicop;
			}
		}
	}
}
