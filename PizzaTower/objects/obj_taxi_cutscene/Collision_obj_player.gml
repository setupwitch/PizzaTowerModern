if (targetplayer.id != other.id)
{
	exit;
}
obj_player.visible = false;
obj_player.sprite_index = obj_player.spr_idle;
obj_player.hsp = 0;
obj_player.vsp = 0;
obj_player.state = states.taxi;
playerid = obj_player;
sprite_index = spr_taximove;
hsp = 10;
obj_player.cutscene = true;
if (pickedup == false)
{
	instance_create(x, y, obj_genericpoofeffect);
}
pickedup = true;
