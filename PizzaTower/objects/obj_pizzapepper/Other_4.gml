if (global.panic == true && room != freezer_secret1)
{
	instance_destroy();
}
if (!instance_exists(obj_randomsecret) && room == freezer_secret1 && global.noisejetpack && (obj_player.ispeppino || obj_player.noisepizzapepper))
{
	instance_destroy();
}
