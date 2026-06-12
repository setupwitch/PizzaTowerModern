if (obj_player.spotlight == true)
{
	playerid = obj_player;
}
if (playerid.mort == false)
{
	visible = true;
}
else
{
	visible = false;
}
if (room == rank_room)
{
	visible = false;
}
image_speed = 0.35;
if (obj_player.hsp != 0)
{
	sprite_index = spr_mortwalk;
}
else
{
	sprite_index = spr_mortidle;
}
depth = -6;
if (global.mort == false)
{
	instance_destroy();
}
