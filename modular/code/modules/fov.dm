// Smooth HUD updates, but low priority
SUBSYSTEM_DEF(incone)
	name = "incone"
	wait = 1
	flags = SS_NO_INIT
	priority = FIRE_PRIORITY_VORE
	var/list/processing = list()
	var/list/currentrun = list()

/datum/controller/subsystem/incone/fire(resumed = 0)
	if (!resumed)
		src.currentrun = processing.Copy()

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun

	while (currentrun.len)
		var/client/thing = currentrun[currentrun.len]
		currentrun.len--
		if (!thing || QDELETED(thing))
			processing -= thing
			if (MC_TICK_CHECK)
				return
			continue
		thing.update_cone()
		STOP_PROCESSING(SSincone, thing)
		if (MC_TICK_CHECK)
			return

/obj/item
	var/block2add

/datum/hud
	var/atom/movable/screen/fov
	var/atom/movable/screen/fov_blocker

/datum/hud/human/New(mob/living/carbon/human/owner)
	.=..()
	fov = new /atom/movable/screen/fov()
	fov.hud = src
	static_inventory += fov

	fov_blocker = new /atom/movable/screen/fov_blocker()
	fov_blocker.hud = src
	static_inventory += fov_blocker


/atom/movable/screen/plane_master/game_world_fov_hidden
	name = "game world fov hidden plane master"
	plane = GAME_PLANE_FOV_HIDDEN
	appearance_flags = PLANE_MASTER
	blend_mode = BLEND_OVERLAY

//Filters
#define GAUSSIAN_BLUR(filter_size) filter(type="blur", size=filter_size)

/atom/movable/screen/plane_master/game_world_fov_hidden/backdrop(mob/mymob)
	filters = list()
	if(istype(mymob) && mymob.client && mymob.client.prefs && mymob.client.prefs.ambientocclusion)
		filters += filter(type="drop_shadow", x=0, y=-0, size=1, offset = 0, color="#04080FAA") //ambient occlusion
	if(istype(mymob) && mymob.eye_blurry)
		filters += GAUSSIAN_BLUR(CLAMP(mymob.eye_blurry*0.1,0.6,3))
	filters += filter(type = "alpha", render_source = FIELD_OF_VISION_BLOCKER_RENDER_TARGET, flags = MASK_INVERSE)

/client
	var/list/hidden_atoms = list()
	var/list/hidden_mobs = list()
	var/list/hidden_images = list()

/mob
	var/fovangle

/mob/living/carbon/human
	fovangle = FOV_DEFAULT

//Procs
/atom/proc/InCone(atom/center = usr, dir = NORTH)
	if(get_dist(center, src) == 0 || src == center) return 0
	var/d = get_dir(center, src)
	if(!d || d == dir) return 1
	if(dir & (dir-1))
		return (d & ~dir) ? 0 : 1
	if(!(d & dir)) return 0
	var/dx = abs(x - center.x)
	var/dy = abs(y - center.y)
	if(dx == dy) return 1
	if(dy > dx)
		return (dir & (NORTH|SOUTH)) ? 1 : 0
	return (dir & (EAST|WEST)) ? 1 : 0

/mob/dead/InCone(mob/center = usr, dir = NORTH)//So ghosts aren't calculated.
	return

/proc/cone(atom/center = usr, dirs, list/list = oview(center))
	for(var/atom/A in list)
		var/fou
		for(var/D in dirs)
			if(A.InCone(center, D))
				fou = TRUE
				break
		if(!fou)
			list -= A
	return list

/proc/get_cone_turfs(turf/starter_turf, dir_to_use, cone_levels = 3)
	var/list/turfs_to_return = list()
	var/turf/turf_to_use = starter_turf
	var/turf/left_turf
	var/turf/right_turf
	var/right_dir
	var/left_dir
	switch(dir_to_use)
		if(NORTH)
			left_dir = WEST
			right_dir = EAST
		if(SOUTH)
			left_dir = EAST
			right_dir = WEST
		if(EAST)
			left_dir = NORTH
			right_dir = SOUTH
		if(WEST)
			left_dir = SOUTH
			right_dir = NORTH

	// Go though every level of the cone levels and generate the cone.
	for(var/level in 1 to cone_levels)
		var/list/level_turfs = list()
		// Our center turf always exists, it's straight ahead of the caster.
		turf_to_use = get_step(turf_to_use, dir_to_use)
		level_turfs += turf_to_use
		// Level 1 only ever has 1 turf, it's a cone.
		if(level != 1)
			var/level_width_in_each_direction = round((calculate_cone_shape(level) - 1) / 2)
			left_turf = turf_to_use
			right_turf = turf_to_use
			// Check turfs to the left...
			for(var/left_of_center in 1 to level_width_in_each_direction)
				if(left_turf.density)
					break
				left_turf = get_step(left_turf, left_dir)
				level_turfs += left_turf
			// And turfs to the right.
			for(var/right_of_enter in 1 to level_width_in_each_direction)
				if(right_turf.density)
					break
				right_turf = get_step(right_turf, right_dir)
				level_turfs += right_turf
		// Add the list of all turfs on this level to the turfs to return
		turfs_to_return += list(level_turfs)

		// If we're at the last level, we're done
		if(level == cone_levels)
			break
		// But if we're not at the last level, we should check that we can keep going
		if(turf_to_use.density)
			break
	return turfs_to_return

/proc/calculate_cone_shape(current_level)
	// Default formula: (1 (innate) -> 3 -> 5 -> 5 -> 7 -> 7 -> 9 -> 9 -> ...)
	return current_level + (current_level % 2) + 1

/mob/dead/BehindAtom(mob/center = usr, dir = NORTH)//So ghosts aren't calculated.
	return

/atom/proc/BehindAtom(atom/center = usr, dir = NORTH)
	switch(dir)
		if(NORTH)
			if(y > center.y)
				return 1
		if(SOUTH)
			if(y < center.y)
				return 1
		if(EAST)
			if(x > center.x)
				return 1
		if(WEST)
			if(x < center.x)
				return 1

/proc/behind(atom/center = usr, dirs, list/list = oview(center))
	for(var/atom/A in list)
		var/fou
		for(var/D in dirs)
			if(A.BehindAtom(center, D))
				fou = TRUE
				break
		if(!fou)
			list -= A
	return list

/mob/proc/update_vision_cone()
	return

/mob/proc/update_cone()
	return

/mob/living/update_vision_cone()
	if(client)
		if(hud_used && hud_used.fov)
			hud_used.fov.dir = src.dir
			hud_used.fov_blocker.dir = src.dir
		START_PROCESSING(SSincone, client)

/client/proc/update_cone()
	if(mob)
		mob.update_cone()

/mob/living/update_cone()
	for(var/hidden_hud in client.hidden_images)
		client.images -= hidden_hud
		client.hidden_images -= hidden_hud
	if(hud_used?.fov)
		if(hud_used.fov.alpha == 0)
			return
	var/image/I = image(src, src)
	I.override = 1
	I.plane = GAME_PLANE_UPPER
	I.layer = layer
	I.pixel_x = 0
	I.pixel_y = 0
	client.images += I
	client.hidden_images += I
	I.appearance_flags = RESET_TRANSFORM|KEEP_TOGETHER
	if(buckled)
		var/image/IB = image(buckled, buckled)
		IB.override = 1
		IB.plane = GAME_PLANE_UPPER
		IB.layer = IB.layer
		IB.pixel_x = 0
		IB.pixel_y = 0
		IB.appearance_flags = RESET_TRANSFORM|KEEP_TOGETHER
		client.hidden_images += IB
		client.images += IB
	if(pulling)
		var/image/IB = image(pulling, pulling)
		IB.override = 1
		IB.plane = GAME_PLANE_UPPER
		IB.layer = IB.layer
		IB.pixel_x = 0
		IB.pixel_y = 0
		IB.appearance_flags = RESET_TRANSFORM|KEEP_TOGETHER
		client.hidden_images += IB
		client.images += IB

/mob/proc/can_see_cone(mob/L)
	if(!isliving(src) || !isliving(L))
		return
	if(!client)
		return TRUE
	if(hud_used && hud_used.fov)
		if(hud_used.fov.alpha != 0)
			var/list/mobs2hide = list()

			if(fovangle & FOV_RIGHT)
				if(fovangle & FOV_LEFT)
					var/dirlist = list(turn(src.dir, 180),turn(src.dir, -90),turn(src.dir, 90))
					mobs2hide |= cone(src, dirlist, list(L))
				else
					if(fovangle & FOV_BEHIND)
						var/dirlist = list(turn(src.dir, -90))
						mobs2hide |= behind(src, list(turn(src.dir, 180)), list(L))
						mobs2hide |= cone(src, dirlist, list(L))
					else
						var/dirlist = list(turn(src.dir, 180),turn(src.dir, -90))
						mobs2hide |= cone(src, dirlist, list(L))
			else
				if(fovangle & FOV_LEFT)
					if(fovangle & FOV_BEHIND)
						var/dirlist = list(turn(src.dir, 90))
						mobs2hide |= behind(src, list(turn(src.dir, 180)), list(L))
						mobs2hide |= cone(src, dirlist, list(L))
					else
						var/dirlist = list(turn(src.dir, 180),turn(src.dir, 90))
						mobs2hide |= cone(src, dirlist, list(L))
				else
					if(fovangle & FOV_BEHIND)
						mobs2hide |= behind(src, list(turn(src.dir, 180)), list(L))
					else//default
						mobs2hide |= cone(src, list(turn(src.dir, 180)), list(L))

			if(L in mobs2hide)
				return FALSE
	return TRUE

/mob/living/set_resting(new_resting, silent, updating)
	. = ..()
	update_cone_show()

/mob/living/lookup()
	. = ..()
	update_cone_show()

/mob/living/stop_looking_up()
	. = ..()
	update_cone_show()

/mob/proc/update_cone_show()
	if(!client)
		return
	if(client.perspective != MOB_PERSPECTIVE)
		return hide_cone()
	if(client.eye != src)
		return hide_cone()
	if(client.pixel_x || client.pixel_y)
		return hide_cone()
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		if(!(H.mobility_flags & MOBILITY_STAND))
			return hide_cone()
		if(!H.client)
			return hide_cone()
	return show_cone()

#define TRAIT_ONEEYE_LEFT "trait_oneeye_left"
#define TRAIT_ONEEYE_RIGHT "trait_oneeye_right"

/mob/proc/update_fov_angles()
	fovangle = initial(fovangle)
	if(ishuman(src) && fovangle)
		var/mob/living/carbon/human/H = src
		if(H.head)
			if(H.head.block2add)
				fovangle |= H.head.block2add
		if(H.wear_mask)
			if(H.wear_mask.block2add)
				fovangle |= H.wear_mask.block2add
		else
			if(HAS_TRAIT(src, TRAIT_ONEEYE_LEFT))
				fovangle |= FOV_LEFT
			if(HAS_TRAIT(src, TRAIT_ONEEYE_RIGHT))
				fovangle |= FOV_RIGHT

	if(!hud_used)
		return
	if(!hud_used.fov)
		return
	if(!hud_used.fov_blocker)
		return
	if(fovangle & FOV_DEFAULT)
		if(fovangle & FOV_RIGHT)
			if(fovangle & FOV_LEFT)
				hud_used.fov.icon_state = "both"
				hud_used.fov_blocker.icon_state = "both_v"
				return
			hud_used.fov.icon_state = "right"
			hud_used.fov_blocker.icon_state = "right_v"
			if(fovangle & FOV_BEHIND)
				hud_used.fov.icon_state = "behind_r"
				hud_used.fov_blocker.icon_state = "behind_r_v"
			return
		else if(fovangle & FOV_LEFT)
			hud_used.fov.icon_state = "left"
			hud_used.fov_blocker.icon_state = "left_v"
			if(fovangle & FOV_BEHIND)
				hud_used.fov.icon_state = "behind_l"
				hud_used.fov_blocker.icon_state = "behind_l_v"
			return
		if(fovangle & FOV_BEHIND)
			hud_used.fov.icon_state = "behind"
			hud_used.fov_blocker.icon_state = "behind_v"
		else
			hud_used.fov.icon_state = "combat"
			hud_used.fov_blocker.icon_state = "combat_v"
	else
		hud_used.fov.icon_state = null
		hud_used.fov_blocker.icon_state = null
		return

//Making these generic procs so you can call them anywhere.
/mob/proc/show_cone()
	if(!client)
		return
	if(hud_used?.fov)
		hud_used.fov.alpha = 255
		hud_used.fov_blocker.alpha = 255
	var/atom/movable/screen/plane_master/game_world_fov_hidden/PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in client.screen
	PM.backdrop(src)

/mob/proc/hide_cone()
	if(!client)
		return
	if(hud_used?.fov)
		hud_used.fov.alpha = 0
		hud_used.fov_blocker.alpha = 0
	var/atom/movable/screen/plane_master/game_world_fov_hidden/PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in client.screen
	PM.backdrop(src)

/atom/movable/screen/fov_blocker
	icon = 'modular/icons/mob/vision_cone.dmi'
	icon_state = "combat_v"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FIELD_OF_VISION_BLOCKER_PLANE
	screen_loc = "1,1"

/atom/movable/screen/fov
	icon = 'modular/icons/mob/vision_cone.dmi'
	icon_state = "combat"
	name = " "
	screen_loc = "1,1"
	mouse_opacity = 0
	layer = HUD_LAYER
	plane = HUD_PLANE-2

/datum/mind/transfer_to(mob/new_character, force_key_move)
	. = ..()
	new_character.update_fov_angles()


/obj/item/clothing/head/equipped(mob/user, slot)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/head/dropped(mob/user)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/mask/equipped(mob/user, slot)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/mask/dropped(mob/user)
	. = ..()
	user.update_fov_angles()

/mob/living/setDir(newdir, ismousemovement)
	. = ..()
	if(client)
		update_vision_cone()

/mob/living/add_overlay(list/overlays)
	. = ..()
	update_vision_cone()

/mob/living/cut_overlay(list/overlays)
	. = ..()
	update_vision_cone()

/mob/living/update_transform()
	. = ..()
	update_vision_cone()

/mob/living/surrender()
	. = ..()
	update_vision_cone()
