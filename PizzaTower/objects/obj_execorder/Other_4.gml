/// @desc Execute room_start_order


for (var i = 0; i < len; i++)
{
	with (order[i])
		event_perform(ev_other, ev_room_start);
}