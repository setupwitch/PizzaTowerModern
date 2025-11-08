scr_initenemy();

enemy_walk = function()
{
	if (state == states.pizzagoblinthrow)
	{
		return;
	}
	if (substate_buffer > 0)
	{
		substate_buffer--;
	}
	else
	{
		substate_buffer = substate_max;
		var old_substate = substate;
		while (substate == old_substate)
		{
			substate = choose(states.walk, states.idle, states.turn);
		}
		if (substate == states.turn && state == states.pizzagoblinthrow)
		{
			substate = states.walk;
		}
		if (substate == states.walk)
		{
			image_xscale = choose(-1, 1);
		}
		else if (substate == states.turn)
		{
			sprite_index = spr_pizzaslug_turn;
			image_index = 0;
			hsp = 0;
		}
	}
	switch (substate)
	{
		case states.walk:
			image_speed = 0.35;
			if (sprite_index != spr_pizzaslug_walk)
			{
				image_index = 0;
				sprite_index = spr_pizzaslug_walk;
			}
			if (place_meeting(x, y, obj_solid))
			{
				y--;
			}
			scr_enemy_walk();
			break;
		case states.idle:
			image_speed = 0.35;
			hsp = 0;
			sprite_index = spr_pizzaslug_idle;
			break;
		case states.turn:
			image_speed = 0.35;
			substate_buffer = 5;
			if (sprite_index != spr_pizzaslug_turn)
			{
				image_index = 0;
				sprite_index = spr_pizzaslug_turn;
			}
			if (sprite_index == spr_pizzaslug_turn && ANIMATION_END)
			{
				image_xscale *= -1;
				substate_buffer = substate_max;
				substate = states.idle;
				sprite_index = spr_pizzaslug_idle;
			}
			break;
		case states.pizzagoblinthrow:
			state = states.pizzagoblinthrow;
			substate_buffer = 0;
			image_index = 0;
			sprite_index = spr_pizzaslug_cough;
			break;
	}
}

enemy_states = [];
enemy_states[states.walk] = enemy_walk;
enemy_states[states.idle] = scr_enemy_idle;
enemy_states[states.turn] = scr_enemy_turn;
enemy_states[states.land] = scr_enemy_land;
enemy_states[states.hit] = scr_enemy_hit;
enemy_states[states.stun] = scr_enemy_stun;
enemy_states[states.pizzagoblinthrow] = scr_pizzagoblin_throw;
enemy_states[states.grabbed] = scr_enemy_grabbed;
enemy_states[states.rage] = scr_enemy_rage;

substate = states.walk;
substate_max = 3 * game_get_speed(gamespeed_fps);
substate_buffer = substate_max;
hitboxcreate = false;
shot = false;
grav = 0.5;
hsp = 0;
vsp = 0;
state = states.walk;
stunned = 0;
alarm[0] = 150;
roaming = true;
collectdrop = 5;
flying = false;
straightthrow = false;
cigar = false;
cigarcreate = false;
stomped = false;
shot = false;
reset = false;
flash = false;
landspr = spr_pizzaslug_walk;
idlespr = spr_pizzaslug_idle;
fallspr = spr_pizzaslug_walk;
stunfallspr = spr_pizzaslug_stun;
walkspr = spr_pizzaslug_walk;
turnspr = spr_pizzaslug_turn;
recoveryspr = spr_pizzaslug_stun;
grabbedspr = spr_pizzaslug_stun;
scaredspr = spr_pizzaslug_scared;
image_xscale = -1;
hp = 1;
slapped = false;
grounded = true;
birdcreated = false;
boundbox = false;
spr_dead = spr_pizzaslug_dead;
important = false;
heavy = false;
depth = 0;
paletteselect = 0;
spr_palette = spr_pizzaslug_palette;
grabbedby = 0;
stuntouchbuffer = 0;
scaredbuffer = 0;
