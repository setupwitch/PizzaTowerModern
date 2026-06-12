if (global.swapmode)
{
	instance_create_unique(obj_player.x, obj_player.y, obj_swapmodefollow);
}
scr_start_game(global.currentsavefile, selected == 0);
