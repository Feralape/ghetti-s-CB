/mob/dead/observer/up()
	set name = "Move Upwards"
	set category = "IC"

	if(zMove(UP, z_move_flags = ZMOVE_FEEDBACK))
		to_chat(src, span_notice("You move upwards."))


/mob/dead/observer/canZMove(direction, turf/target)
	return TRUE
