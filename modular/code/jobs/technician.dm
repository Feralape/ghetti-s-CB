/// TECHNICIAN
/datum/job/frontier/technician
	title = "Technician"
	flag = ENGINEER
	department_flag = ENGINEERING
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Governor."
	description = "You are a technician, you perform maintenance, setup generator and construct things. Check your guidebook for more info."
	enforces = "Check your guidebook"
	selection_color = "#FF95FF"
	exp_requirements = 0

	outfit = /datum/outfit/job/technician
	access = list(ACCESS_OUTPOST, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP)
	minimal_access = list(ACCESS_OUTPOST, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP)


/datum/outfit/job/technician
	name =		"Outpost Technician"
	jobtype =	/datum/job/frontier/technician
	shoes =		/obj/item/clothing/shoes/f13/explorer
	belt = 		/obj/item/supplykit
	id =		/obj/item/card/id/dogtag/technician
	ears =		/obj/item/radio/headset/headset_outpost/technician
	uniform =	/obj/item/clothing/under/technician
	gloves = /obj/item/pda
	l_pocket = /obj/item/storage/wallet/stash/mid
	satchel =	/obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	backpack = 	/obj/item/storage/backpack/industrial

/datum/outfit/job/technician/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_EXPLOSIVE_CRAFTING, src)


