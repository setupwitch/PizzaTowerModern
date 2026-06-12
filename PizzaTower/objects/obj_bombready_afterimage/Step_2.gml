x = obj_player.x;
y = obj_player.y;
visible = obj_player.visible;
if (obj_player.state == states.actor || obj_player.state == states.arenaintro || obj_player.state == states.phase1hurt)
{
	visible = false;
}
