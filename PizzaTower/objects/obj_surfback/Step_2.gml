var target = obj_player.id;
image_speed = obj_player.image_speed;
if (global.swapmode && obj_player.ispeppino)
{
	target = obj_swapmodefollow.id;
}
x = target.x;
y = target.y;
if (target == obj_player.id)
{
	image_xscale = target.xscale * target.scale_xs;
	image_yscale = target.yscale * target.scale_ys;
}
else
{
	image_xscale = target.image_xscale;
	image_yscale = target.image_yscale;
}
visible = target.visible;
image_alpha = target.image_alpha;
image_blend = target.image_blend;
depth = 0;
if (obj_player.ispeppino && !global.swapmode)
{
	instance_destroy();
}
if ((target == obj_player.id && (obj_player.state == states.slipnslide || obj_player.state == states.trashjump)) || room == rank_room)
{
	visible = false;
}
visible = false;
