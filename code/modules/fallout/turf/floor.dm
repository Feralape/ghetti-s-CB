//Fallout 13 general destructible floor directory

/turf/open/floor/f13
	name = "floor"
	planetary_atmos = 1
	icon_state = "floor"
	icon_regular_floor = "floor"
	icon_plating = "plating"
	icon = 'icons/fallout/turfs/floors.dmi'
	footstep = FOOTSTEP_FLOOR//clonk
	barefootstep = FOOTSTEP_FLOOR
	clawfootstep = FOOTSTEP_RUST
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/f13/ReplaceWithLattice()
	ChangeTurf(baseturfs)

/turf/open/floor/f13/wood
	icon_state = "housewood1"
	icon = 'icons/fallout/turfs/ground.dmi'
	floor_tile = /obj/item/stack/tile/wood
	icon_plating = "housebase"
//	step_sounds = list("human" = "woodfootsteps")
	broken_states = list("housewood1-broken", "housewood2-broken", "housewood3-broken", "housewood4-broken")
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/f13/wood/New()
	..()
	if(prob(5))
		broken = 1
		icon_state = pick(broken_states)
	else
		icon_state = "housewood[rand(1,4)]"

/turf/open/floor/f13/wood/make_plating()
	return ChangeTurf(/turf/open/floor/plating/wooden)

/turf/open/floor/f13/wood/attackby(obj/item/C, mob/user, params)
	if(..())
		return
	if(istype(C, /obj/item/screwdriver))
		if(broken || burnt)
			new /obj/item/stack/sheet/mineral/wood(src)
		else
			new floor_tile(src)
		to_chat(user, span_danger("You unscrew the planks."))
		make_plating()
		playsound(src, C.usesound, 80, 1)
		return
