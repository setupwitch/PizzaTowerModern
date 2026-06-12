event_inherited();
image_speed = 0.1;
yoffset = 0;
if (obj_player.spotlight == true)
{
	playerid = obj_player;
}
toppinwarrior = 1;
set = false;
global.toppinwarriorattackcountdown = 0;
space = 0;
dir = obj_player.xscale;
steppy = 20;
mask_index = spr_player_mask;
depth = -5;
repeat (6)
{
	with (instance_create(x + random_range(-50, 50), y + random_range(-50, 50), obj_cloudeffect))
	{
		sprite_index = spr_baddiespawn;
	}
}
