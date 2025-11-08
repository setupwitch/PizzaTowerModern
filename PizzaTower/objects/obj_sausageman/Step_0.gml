if (room == rm_editor)
{
	exit;
}

var _state = enemy_states[state];
_state ??= function() { throw "State missing!"; };
_state();


if (state == states.stun && stunned > 100 && birdcreated == false)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
	{
		ID = other.id;
	}
}
if (state != states.stun)
{
	birdcreated = false;
}
if (flash == true && alarm[2] <= 0)
{
	alarm[2] = 0.15 * game_get_speed(gamespeed_fps);
}
scr_scareenemy();
if (state != states.grabbed)
{
	depth = 0;
}
if (state != states.stun)
{
	thrown = false;
}
if (boundbox == false)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
