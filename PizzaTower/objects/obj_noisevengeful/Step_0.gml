if (distance_to_object(obj_player) < 250)
{
	sprite_index = spr_noisevengeful1;
}
else
{
	sprite_index = spr_noisevengeful2;
}
if (!obj_player.ispeppino || global.swapmode)
{
	sprite_index = spr_bucket;
}
