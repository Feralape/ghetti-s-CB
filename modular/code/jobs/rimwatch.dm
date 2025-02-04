//RIMWATCH

/datum/job/frontier/rimwatch_officer // Rimwatch Officer
	title = "Rimwatch Officer"
	flag = OFFICER
	total_positions = 6
	spawn_positions = 6
	description = "As a Rimwatch Officer, your main duty is to protect the outpost and its people, and to uphold the Laws of the Rim."
	supervisors = "Rimwatch Marshall"
	selection_color = "#551010"
	outfit = /datum/outfit/job/frontier/rimwatch_officer
	exp_requirements = 0


/datum/outfit/job/frontier/rimwatch_officer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	var/datum/martial_art/rangertakedown/RT = new
	RT.teach(H)


/datum/outfit/job/frontier/rimwatch_officer
	name = "Rimwatch Officer"
	jobtype	= /datum/job/frontier/rimwatch_officer
	suit = /obj/item/clothing/suit/armor/vest
	id = /obj/item/card/id/dogtag/rimwatch
	uniform	= /obj/item/clothing/under/rimwatch_uniform
	head = /obj/item/clothing/head/beret/rimwatch
	gloves = /obj/item/clothing/gloves/patrol/frontier
	shoes = /obj/item/clothing/shoes/jackboots
	glasses	= /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/radio/headset/headset_outpost/rimwatch
	neck = /obj/item/storage/belt/shoulderholster
	l_pocket = /obj/item/storage/wallet/stash/mid
	suit_store = /obj/item/melee/classic_baton/telescopic
	satchel =	/obj/item/storage/backpack/satchel/patrol
	duffelbag = /obj/item/storage/backpack/duffelbag/patrol
	backpack = 	/obj/item/storage/backpack/patrol
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/clothing/mask/gas/sechailer/rimwatch = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3,
		/obj/item/gun/ballistic/automatic/pistol/m1911,
		/obj/item/ammo_box/magazine/m45 = 2,
		)

/datum/job/frontier/rimwatch_ranger // Rimwatch Ranger
	title = "Rimwatch Ranger"
	flag = OFFICER
	total_positions = 4
	spawn_positions = 4
	description = "As a Rimwatch Ranger, your duty is also to protect the outpost as well as to uphold the Laws of the Rim. However, you are also tasked with scouting the surrounding area and dealing with threats outside the outpost."
	supervisors = "Rimwatch Marshall"
	selection_color = "#551010"
	outfit = /datum/outfit/job/frontier/rimwatch_ranger
	exp_requirements = 0

/datum/outfit/job/frontier/rimwatch_ranger/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	var/datum/martial_art/rangertakedown/RT = new
	RT.teach(H)

/datum/outfit/job/frontier/rimwatch_ranger
	name = "Rimwatch Ranger"
	suit = /obj/item/clothing/suit/armor/rimwatch_jacket
	belt = /obj/item/storage/belt/military/rimwatchbandolier
	id = /obj/item/card/id/dogtag/rimwatch
	head = /obj/item/clothing/head/beret/rimwatch
	neck = /obj/item/storage/belt/shoulderholster
	l_pocket = /obj/item/storage/wallet/stash/mid
	satchel =	/obj/item/storage/backpack/satchel/patrol
	duffelbag = /obj/item/storage/backpack/duffelbag/patrol
	backpack = 	/obj/item/storage/backpack/patrol
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper/sniperranger
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w3006 = 3,
		/obj/item/gun/ballistic/revolver/revolver45 = 1,
		/obj/item/ammo_box/c45rev = 2,
		)

/datum/job/frontier/rimwatch_marshall // Rimwatch Marshall
	title = "Rimwatch Marshall"
	flag = HOS	
	total_positions = 1
	spawn_positions = 1
	description = "As the Rimwatch Marshall, you are the leader of the Rimwatch. You are responsible for the safety of the outpost and its people, as well as the enforcement of the Laws of the Rim."
	supervisors = "the Governor"
	selection_color = "#551010"
	outfit = /datum/outfit/job/frontier/rimwatch_marshall
	exp_requirements = 0

/datum/outfit/job/frontier/rimwatch_marshall/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	var/datum/martial_art/rangertakedown/RT = new
	RT.teach(H)

/datum/outfit/job/frontier/rimwatch_marshall
	name = "Rimwatch Marshall"
	suit = /obj/item/clothing/suit/armor/rimwatch_marshall
	id = /obj/item/card/id/dogtag/rimwatch
	belt = /obj/item/storage/belt/tactical
	head = /obj/item/clothing/head/marshall
	neck = /obj/item/storage/belt/shoulderholster
	suit_store = /obj/item/melee/classic_baton/telescopic
	l_pocket = /obj/item/storage/wallet/stash/high
	satchel =	/obj/item/storage/backpack/satchel/patrol
	duffelbag = /obj/item/storage/backpack/duffelbag/patrol
	backpack = 	/obj/item/storage/backpack/patrol
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/m1911 = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/clothing/mask/gas/sechailer/rimwatch = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3,
		/obj/item/ammo_box/magazine/m45 = 2
		)
