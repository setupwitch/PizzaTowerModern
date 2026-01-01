if (room == rm_editor)
{
	visible = 0;
	exit;
}
visible = false;
x = -10000;
y = -10000;
scr_getinput2();
obj_player1.spotlight = true;
x = -1000;
y = -1000;
state = states.titlescreen;
if (!visible && state == states.comingoutdoor)
{
	coopdelay++;
	image_index = 0;
	if (coopdelay == 50)
	{
		visible = true;
		coopdelay = 0;
	}
}
