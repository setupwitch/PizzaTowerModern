if (room == rm_editor)
{
	exit;
}
if (bombreset > 0)
{
	bombreset--;
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
var player = instance_nearest(x, y, obj_player);
if (state == states.walk && substate != states.turn)
{
	if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)) && ragecooldown == 0)
	{
		if (global.stylethreshold >= 3 || elite)
		{
			if (x != player.x)
			{
				image_xscale = -sign(x - player.x);
			}
			image_speed = 0.6;
			hsp = 0;
			shot = false;
			sprite_index = spr_pizzaslug_rage;
			image_index = 0;
			state = states.rage;
		}
		else
		{
			if (x != player.x)
			{
				image_xscale = -sign(x - player.x);
			}
			ragecooldown = 160;
			state = states.pizzagoblinthrow;
			substate_buffer = 0;
			image_index = 0;
			sprite_index = spr_pizzaslug_cough;
		}
	}
}
if (ragecooldown > 0)
{
	ragecooldown--;
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
