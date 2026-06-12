if (sprite_index == spr_gerome_collected && ANIMATION_END)
{
	sprite_index = spr_gerome_keyidle;
}
if (room == rank_room || room == timesuproom)
{
	visible = false;
}
if (obj_player.spotlight == true)
{
	playerid = obj_player;
}
image_speed = 0.35;
depth = -6;
