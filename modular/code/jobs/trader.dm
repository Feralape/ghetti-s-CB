// DEPOT 	
/datum/job/frontier/trader
	title = "Trader"
	flag = QUARTERMASTER
	department_flag = CIVILIAN
	faction = FACTION_OUTPOST
	total_positions = 3
	spawn_positions = 3
	supervisors = "the CTN and the Governor."
	description = "You hold the charter to trade here so long you abide by CTN laws and the Governor. Check your guidebook for more info."
	enforces = "Check your guidebook"
	selection_color = "#dcba97"
	exp_requirements = 0

	outfit = /datum/outfit/job/trader
	access = list(ACCESS_OUTPOST, ACCESS_CARGO, ACCESS_MINING_OFFICE, ACCESS_MINING)
	minimal_access = list(ACCESS_OUTPOST, ACCESS_CARGO, ACCESS_MINING_OFFICE, ACCESS_MINING)

/datum/outfit/job/trader
	name =		"Trader"
	jobtype =	/datum/job/frontier/trader
	shoes =		/obj/item/clothing/shoes/f13/explorer
	belt = 		/obj/item/supplykit
	id =		/obj/item/card/id/dogtag/trader
	ears =		/obj/item/radio/headset/headset_outpost/depot
	uniform =	/obj/item/clothing/under/merchant
	gloves = /obj/item/pda
	l_pocket = 	/obj/item/storage/wallet/stash/high
	satchel =	/obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	backpack = 	/obj/item/storage/backpack
	backpack_contents = list(
		/obj/item/storage/wallet/stash/high = 1,
		)

/datum/outfit/job/trader/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalradio)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/durathread_vest)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/trail_carbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lever_action)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/a180)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/varmintrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingshotgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/thatgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/uzi)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/smg10mm)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/frag_shrapnel)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/concussion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/explosive/shrapnelmine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/pico_manip)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/super_matter_bin)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/phasic_scanning)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/super_capacitor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ultra_micro_laser)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/enhancedenergycell)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/enhancedmfcell)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/enhancedecp)

/datum/outfit/job/trader/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return


/datum/job/frontier/dock_worker
	title = "Dock Worker"
	flag = CARGOTECH
	department_flag = CIVILIAN
	faction = FACTION_OUTPOST
	total_positions = 2
	spawn_positions = 2
	supervisors = "the trader."
	description = "You work for the trader, help them load/unload the ship, sort the depot and man the counter, you are also the trader's personal guards."
	selection_color = "#dcba97"
	exp_requirements = 0

	outfit = /datum/outfit/job/frontier/dock_worker
	access = list(ACCESS_OUTPOST, ACCESS_CARGO, ACCESS_MINING_OFFICE, ACCESS_MINING)
	minimal_access = list(ACCESS_OUTPOST, ACCESS_CARGO, ACCESS_MINING_OFFICE, ACCESS_MINING)

/datum/outfit/job/frontier/dock_worker/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/datum/outfit/job/frontier/dock_worker
	name =		"Dock Worker"
	jobtype =	/datum/job/frontier/dock_worker
	shoes =		/obj/item/clothing/shoes/f13/explorer
	belt = 		/obj/item/gun/ballistic/automatic/pistol/ninemil/m3civ
	id =		/obj/item/card/id/dogtag/trader
	ears =		/obj/item/radio/headset/headset_outpost/depot
	uniform =	/obj/item/clothing/under/dockworker
	gloves = 	/obj/item/pda
	l_pocket = 	/obj/item/storage/wallet/stash/mid
	satchel =	/obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	backpack = 	/obj/item/storage/backpack
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m9mm = 2,
		)


