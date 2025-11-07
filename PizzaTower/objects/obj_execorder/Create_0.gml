/// @desc Declare order

/*

	on newer runtimes, the order of execution gets changed,
	this causes some events to run before or after when they are intended.
	this object attempts to fix that.

*/


// thanks to whoever gave me this
order =
[
	obj_player,
	obj_followcharacter,
	obj_pizzaface,
	obj_doornexthub,
	obj_monstertrackingrooms
];
len = array_length(order);
// if not running from this object, exit.
#macro EXECUTE_IN_ORDER if (other.object_index != obj_execorder) exit

event_execute = function(_inst, _event_type, _event_num)
{
	with (_inst)
		event_perform(_event_type, _event_num);
}