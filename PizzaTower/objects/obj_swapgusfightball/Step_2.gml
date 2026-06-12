x = obj_player.x;
y = obj_player.y;
image_xscale = obj_player.xscale * obj_player.scale_xs;
image_yscale = obj_player.yscale * obj_player.scale_ys;
if (obj_player.sprite_index != obj_player.spr_fightball)
{
	instance_destroy();
}
