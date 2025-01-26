/mob/dead/observer/up()
	set name = "Move Upwards"
	set category = "IC"

	if(zMove(UP))
		to_chat(src, span_notice("You move upwards."))


/mob/dead/observer/canZMove(direction, turf/target)
	return TRUE
