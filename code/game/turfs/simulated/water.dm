/turf/open/liquid //Basic liquid turf parent
	name = "liquid"
	///How high up on the mob water overlays sit
	var/mob_liquid_height = 11
	///How far down the mob visually drops down when in water
	var/mob_liquid_depth = -5

///Returns the number that represents how submerged an AM is by a turf and its contents
/turf/proc/get_submerge_height(turf_only = FALSE)
	. = 0
	if(turf_only)
		return
	var/list/submerge_list = list()
	SEND_SIGNAL(src, COMSIG_TURF_SUBMERGE_CHECK, submerge_list)
	for(var/i in submerge_list)
		. += i

///Returns the number that shows how far an AM is offset when submerged in this turf
/turf/proc/get_submerge_depth()
	return 0

/turf/open/liquid/Initialize(mapload)
	AddElement(/datum/element/submerge) //added first so it loads all the contents correctly
	return ..()

/turf/open/liquid/Destroy(force)
	if(!(get_submerge_height() - mob_liquid_height) && !(get_submerge_depth() - mob_liquid_depth))
		RemoveElement(/datum/element/submerge)
	return ..()

/turf/open/liquid/water
	gender = PLURAL
	name = "water"
	desc = "Shallow water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	baseturfs = /turf/open/indestructible/ground/inside/mountain
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	slowdown = 2
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.

	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

	//fortuna edit
	/// Higher numbers indicates deeper water.
	depth = 1

// Fortuna edit. Below is Largely ported from citadels HRP branch

/turf/open/liquid/water/Initialize()
	. = ..()
	update_icon()

/turf/open/liquid/water/examine(mob/user)
	. = ..()
	. += span_notice("Alt-Click \the [src] to wash yourself off.")

/turf/open/liquid/water/update_icon()
	. = ..()

/turf/open/liquid/water/Entered(atom/movable/AM, atom/oldloc)
	if(HAS_TRAIT(AM, TRAIT_NOSUBMERGE))
		return ..()
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(oldloc, /turf/open/liquid/water))
			to_chat(L, span_warning("You get drenched in water!"))
	AM.water_act(5)
	..()

/turf/open/liquid/get_submerge_height(turf_only = FALSE)
	. = ..()
	if(SEND_SIGNAL(src, COMSIG_TURF_CHECK_COVERED))
		return
	. += mob_liquid_height

/turf/open/liquid/get_submerge_depth()
	if(SEND_SIGNAL(src, COMSIG_TURF_CHECK_COVERED))
		return 0
	return mob_liquid_depth

/turf/open/liquid/water/Exited(atom/movable/AM, atom/newloc)
	. = ..()
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(newloc, /turf/open/liquid/water))
			to_chat(L, span_warning("You climb out of \the [src]."))

/turf/open/liquid/water/AltClick(mob/user)
	. = ..()
	if(isliving(user))
		var/mob/living/L = user
		L.DelayNextAction(CLICK_CD_RANGE)
		if(!user.incapacitated() && Adjacent(user))
			user.visible_message(span_notice("[L] starts washing in \the [src]."),
								span_notice("You start washing in \the [src]."),
								span_notice("You hear splashing water and scrubbing."))
			playsound(user,"water_wade",100,TRUE)
			if(do_after(user,5 SECONDS, TRUE, src, TRUE,allow_movement=FALSE,stay_close=TRUE))
				give_mob_washies(L)
				user.visible_message(span_notice("[L] finishes washing in \the [src]."),
									span_notice("You finish washing in \the [src]."),
									span_notice("The splashing and scrubbing stops."))
				playsound(user,"water_wade",100,TRUE)

/mob/living/proc/check_submerged()
	if(buckled)
		return 0
	if(locate(/obj/structure/lattice/catwalk) in loc)
		return 0
	loc = get_turf(src)
	if(istype(loc, /turf/open/indestructible/ground/outside/water) || istype(loc, /turf/open/liquid/water))
		var/turf/open/T = loc
		return T.depth
	return 0

// Use this to have things react to having water applied to them.
/atom/movable/proc/water_act(amount)
	return

/mob/living/water_act(amount)
	if(ishuman(src))
		var/mob/living/carbon/human/drownee = src
		if(!drownee || drownee.stat == DEAD)
			return
		if(drownee.resting && !drownee.internal)
			if(drownee.stat != CONSCIOUS)
				drownee.adjustOxyLoss(1)
			else
				drownee.adjustOxyLoss(1)
				if(prob(35))
					to_chat(drownee, span_danger("You're drowning!"))
	adjust_fire_stacks(-amount * 5)
	for(var/atom/movable/AM in contents)
		AM.water_act(amount)

///The alpha mask used on AM's submerged on turfs
#define AM_SUBMERGE_MASK "AM_SUBMERGE_MASK"
///The height of the MASK itself in the icon state (not icon height). NOTE: Changes to the icon requires a change to this define
#define AM_SUBMERGE_MASK_HEIGHT 32

//submerge mod 
//Allows an atom to contribute to the submerging effects of a turf
//Submerge height is additive, so best to avoid spamming multiple atoms on a turf with this component/very high values unless you want wack results.
/datum/component/submerge_modifier
	///Height in pixels a target is submerged by the parent of this component
	var/submerge_height

/datum/component/submerge_modifier/Initialize(_submerge_height = 10)
	if(!ismovable(parent))
		return COMPONENT_INCOMPATIBLE
	submerge_height = _submerge_height

/datum/component/submerge_modifier/RegisterWithParent()
	var/atom/movable/owner = parent
	RegisterSignal(owner, COMSIG_MOVABLE_MOVED, PROC_REF(move_submerge_element))
	for(var/atom/movable/AM as anything in owner.loc) //we remove the submerge and reapply after owner is connect
		if(HAS_TRAIT(AM, TRAIT_NOSUBMERGE))
			continue
		AM.set_submerge_level(null, owner.loc, duration = 0.1)
	add_connections(owner.loc)
	for(var/atom/movable/AM as anything in owner.loc)
		if(HAS_TRAIT(AM, TRAIT_NOSUBMERGE))
			continue
		AM.set_submerge_level(owner.loc, null, duration = 0.1)

/datum/component/submerge_modifier/UnregisterFromParent()
	var/atom/movable/owner = parent
	UnregisterSignal(owner, COMSIG_MOVABLE_MOVED)
	for(var/atom/movable/AM as anything in owner.loc) //we remove the submerge and reapply after owner is no longer connect
		if(HAS_TRAIT(AM, TRAIT_NOSUBMERGE))
			continue
		AM.set_submerge_level(null, owner.loc, duration = 0.1)
	remove_connections(owner.loc)
	for(var/atom/movable/AM as anything in owner.loc)
		if(HAS_TRAIT(AM, TRAIT_NOSUBMERGE))
			continue
		AM.set_submerge_level(owner.loc, null, duration = 0.1)

///Adds the submerge element to a turf and registers for the submerge signal
/datum/component/submerge_modifier/proc/add_connections(turf/new_turf)
	if(!istype(new_turf))
		return
	new_turf.AddElement(/datum/element/submerge)
	RegisterSignal(new_turf, COMSIG_TURF_SUBMERGE_CHECK, PROC_REF(get_submerge_height_mod))

///Removes the submerge element from a turf if it can no longer submerge things
/datum/component/submerge_modifier/proc/remove_connections(turf/old_turf)
	if(!istype(old_turf))
		return
	UnregisterSignal(old_turf, COMSIG_TURF_SUBMERGE_CHECK)
	if(old_turf.get_submerge_height() || old_turf.get_submerge_depth())
		return
	old_turf.RemoveElement(/datum/element/submerge)

///Removes and adds connections on move
/datum/component/submerge_modifier/proc/move_submerge_element(atom/movable/source, atom/old_loc, movement_dir, forced, list/old_locs)
	SIGNAL_HANDLER
	remove_connections(old_loc)
	add_connections(source.loc)

///How high up an AM's is covered by an alpha mask when submerged. This amount is additive
/datum/component/submerge_modifier/proc/get_submerge_height_mod(turf/source, list/submerge_list)
	SIGNAL_HANDLER
	submerge_list += submerge_height

/*
	*Submerge element for turfs that apply submerge effects
	*Element is required for a turf if the turf OR its contents (i.e. tallgrass) apply submerge.
	*This means any new turfs that add submerge must add and remove this element on init/destroy
	*Similarly, any atom that modifies submerge like tall grass, must appropriately set and unset the element on it's turf, and connect_loc to maintain the right connection
**/
/datum/element/submerge/Attach(datum/target)
	. = ..()
	if(!isturf(target))
		return ELEMENT_INCOMPATIBLE
	//override true as we don't look up if the turf already has the element
	RegisterSignals(target, list(COMSIG_ATOM_ENTERED, COMSIG_ATOM_CREATED), PROC_REF(atom_entered), TRUE)
	RegisterSignal(target, COMSIG_ATOM_EXITED, PROC_REF(atom_exited), TRUE)

/datum/element/submerge/Detach(datum/source, force)
	. = ..()
	UnregisterSignal(source, list(COMSIG_ATOM_ENTERED, COMSIG_ATOM_CREATED, COMSIG_ATOM_EXITED))
	for(var/atom/movable/AM as anything in source)
		if(HAS_TRAIT(AM, TRAIT_NOSUBMERGE))
			continue
		AM.set_submerge_level(null, source, duration = 0.1)

///Applies or modifies submerge effects on entering AMs
/datum/element/submerge/proc/atom_entered(turf/source, atom/movable/mover, atom/old_loc, list/old_locs)
	SIGNAL_HANDLER
	if(HAS_TRAIT(mover, TRAIT_NOSUBMERGE))
		return
	if(!source.get_submerge_height() && !source.get_submerge_depth())
		return
	mover.set_submerge_level(mover.loc, old_loc)

///Removes submerge effects if the new loc does not submerge the AM
/datum/element/submerge/proc/atom_exited(turf/source, atom/movable/mover, direction)
	SIGNAL_HANDLER
	if(HAS_TRAIT(mover, TRAIT_NOSUBMERGE))
		return
	//this is slightly stinky since the submerge effects are not tied to the element itself, and because we can't check if the turf actually has the element or not,
	//we have to hope that no one has shitcoded and forgot to give something the element when it's supposed to have it.
	var/turf/new_loc = mover.loc
	if(isturf(mover.loc) && (new_loc.get_submerge_height() || new_loc.get_submerge_depth()))
		return //If the new loc submerges, we let it handle that on enter
	mover.set_submerge_level(mover.loc, source)


///List of all filter removal timers. Glob to avoid an AM level var
GLOBAL_LIST_EMPTY(submerge_filter_timer_list)

///Sets the submerged level of an AM based on its turf
/atom/movable/proc/set_submerge_level(turf/new_loc, turf/old_loc, submerge_icon, submerge_icon_state, duration = 0)
	if(!submerge_icon) //catch all in case so people don't need to make child types just to specify a return
		return
	var/old_height = istype(old_loc) ? old_loc.get_submerge_height() : 0
	var/new_height = istype(new_loc) ? new_loc.get_submerge_height() : 0
	var/height_diff = new_height - old_height

	var/old_depth = istype(old_loc) ? old_loc.get_submerge_depth() : 0
	var/new_depth = istype(new_loc) ? new_loc.get_submerge_depth() : 0
	var/depth_diff = new_depth - old_depth

	if(!height_diff && !depth_diff)
		return

	var/icon/AM_icon = icon(icon)
	var/height_to_use = (64 - AM_icon.Height()) * 0.5 //gives us the right height based on AM's icon height relative to the 64 high alpha mask

	if(!new_height && !new_depth)
		GLOB.submerge_filter_timer_list[ref(src)] = addtimer(CALLBACK(src, TYPE_PROC_REF(/datum, remove_filter), AM_SUBMERGE_MASK), duration, TIMER_STOPPABLE)
		REMOVE_TRAIT(src, TRAIT_SUBMERGED, SUBMERGED_TRAIT)
	else if(!HAS_TRAIT(src, TRAIT_SUBMERGED)) //we use a trait to avoid some edge cases if things are moving fast or unusually
		if(GLOB.submerge_filter_timer_list[ref(src)])
			deltimer(GLOB.submerge_filter_timer_list[ref(src)])
		//The mask is spawned below the AM, then the animate() raises it up, giving the illusion of dropping into water, combining with the animate to actual drop the pixel_y into the water
		add_filter(AM_SUBMERGE_MASK, 1, alpha_mask_filter(0, height_to_use - AM_SUBMERGE_MASK_HEIGHT, icon(submerge_icon, submerge_icon_state), null, MASK_INVERSE))
		ADD_TRAIT(src, TRAIT_SUBMERGED, SUBMERGED_TRAIT)

	transition_filter(AM_SUBMERGE_MASK, list(y = height_to_use - (AM_SUBMERGE_MASK_HEIGHT - new_height)), duration)
	animate(src, pixel_y = depth_diff, time = duration, flags = ANIMATION_PARALLEL|ANIMATION_RELATIVE)

/mob/living/set_submerge_level(turf/new_loc, turf/old_loc, submerge_icon = 'icons/turf/alpha_64.dmi', submerge_icon_state = "liquid_alpha", duration)
	return ..()

///Mult on submerge height for changing the alpha of submerged items
#define ITEM_LIQUID_TURF_ALPHA_MULT 11

/obj/item/set_submerge_level(turf/new_loc, turf/old_loc, submerge_icon, submerge_icon_state, duration = 2)
	var/old_alpha_mod = istype(old_loc) ? old_loc.get_submerge_height(TRUE) : 0
	var/new_alpha_mod = istype(new_loc) ? new_loc.get_submerge_height(TRUE) : 0

	alpha -= (new_alpha_mod - old_alpha_mod) * ITEM_LIQUID_TURF_ALPHA_MULT
