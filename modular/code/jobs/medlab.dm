
/// MEDLAB

/datum/job/frontier/doctor
	title = "Medical Doctor"
	flag = DOCTOR
	department_flag = MEDSCI
	faction = FACTION_OUTPOST
	total_positions = 3
	spawn_positions = 3
	supervisors = "Generally speaking your only actual supervisor is your own judgement."
	description = "You are a doctor, whether you're licensed or not doesn't matter. You may treat injuries for money, or for free if you feel it, but remember, your medical supplies cost money."
	enforces = "Assist and provide medical services to those in need and try to make money while you're at it."
	selection_color = "#FF95FF"
	exp_requirements = 0

	outfit = /datum/outfit/job/followers/f13leadpractitioner


	access = list(ACCESS_OUTPOST, ACCESS_MEDICAL)
	minimal_access = list(ACCESS_OUTPOST, ACCESS_MEDICAL)

/datum/outfit/job/doctor
	name =		"Medical Doctor"
	jobtype =	/datum/job/frontier/doctor
	shoes =		/obj/item/clothing/shoes/sneakers/white
	belt = 		/obj/item/supplykit
	id =		/obj/item/card/id/dogtag/medlab
	ears =		/obj/item/radio/headset/headset_outpost/medlab
	uniform =	/obj/item/clothing/under/medlab_uniform
	suit =	/obj/item/clothing/suit/toggle/labcoat
	gloves = /obj/item/pda
	l_pocket = /obj/item/storage/wallet/stash/mid
	duffelbag =	/obj/item/storage/backpack/duffelbag/med
	backpack =	/obj/item/storage/backpack/science
	satchel =	/obj/item/storage/backpack/satchel/tox

/datum/outfit/job/followers/f13leadpractitioner/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalradio)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/durathread_vest)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/jet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/turbo)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/psycho)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx/chemistry)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak/chemistry)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak5)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak5/chemistry)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/superstimpak)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/superstimpak5)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/buffout)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steady)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/rechargerpistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/pico_manip)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/super_matter_bin)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/phasic_scanning)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/super_capacitor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ultra_micro_laser)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_UNETHICAL_PRACTITIONER, src)

/datum/job/frontier/roboticist
	title = "Roboticist"
	flag = ROBOTICIST
	department_flag = MEDSCI
	faction = FACTION_OUTPOST
	total_positions = 1
	spawn_positions = 1
	supervisors = "Generally speaking your only actual supervisor is your own judgement."
	description = "You are a roboticist, you may construct and sell mechsuits, perform cybernetic augmentation surgery or make robots for money."
	enforces = "Construct mech suits, perform cybernetic augmentation surgery or make robots for money."
	selection_color = "#FF95FF"
	exp_requirements = 0

	outfit = /datum/outfit/job/frontier/roboticist

	access = list(ACCESS_OUTPOST, ACCESS_SCIENCE)
	minimal_access = list(ACCESS_OUTPOST, ACCESS_SCIENCE)

/datum/outfit/job/frontier/roboticist
	name =		"Roboticist"
	jobtype =	/datum/job/frontier/roboticist
	shoes =		/obj/item/clothing/shoes/f13/explorer
	belt = 		/obj/item/supplykit
	id =		/obj/item/card/id/dogtag/medlab
	ears =		/obj/item/radio/headset/headset_outpost/medlab
	uniform =	/obj/item/clothing/under/technician
	suit =		/obj/item/clothing/suit/toggle/labcoat
	gloves = /obj/item/pda
	l_pocket = /obj/item/storage/wallet/stash/mid
	duffelbag =	/obj/item/storage/backpack/duffelbag/med
	backpack =	/obj/item/storage/backpack/science
	satchel =	/obj/item/storage/backpack/satchel/tox

/datum/outfit/job/frontier/roboticist/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALGRADUATE, src)
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, src)


/datum/job/frontier/researcher
	title = "Researcher"
	flag = SCIENTIST
	department_flag = MEDSCI
	faction = FACTION_OUTPOST
	total_positions = 1
	spawn_positions = 1
	supervisors = "Generally speaking your only actual supervisor is your own judgement."
	description = "You are a researcher stationed in the outpost. You may conduct research, develop new technologies and sell your findings for money."
	enforces = "Conduct research, develop new technologies and sell your findings for money."
	selection_color = "#FF95FF"
	exp_requirements = 0

	outfit = /datum/outfit/job/frontier/researcher

	access = list(ACCESS_OUTPOST, ACCESS_SCIENCE)
	minimal_access = list(ACCESS_OUTPOST, ACCESS_SCIENCE)

/datum/outfit/job/frontier/researcher
	name =	"Researcher"
	jobtype =	/datum/job/frontier/researcher
	id =		/obj/item/card/id/dogtag/medlab
	ears =		/obj/item/radio/headset/headset_outpost/medlab
	uniform =	/obj/item/clothing/under/medlab_uniform
	belt = 		/obj/item/supplykit
	chemwhiz =	TRUE
	glasses = /obj/item/clothing/glasses/science
	suit =		/obj/item/clothing/suit/toggle/labcoat
	shoes =	/obj/item/clothing/shoes/f13/brownie
	gloves = /obj/item/pda
	l_pocket = /obj/item/storage/wallet/stash/mid
	duffelbag =	/obj/item/storage/backpack/duffelbag/med
	backpack =	/obj/item/storage/backpack/science
	satchel =	/obj/item/storage/backpack/satchel/tox
	backpack_contents = list(
		/obj/item/pda = 1,
		/obj/item/book/granter/trait/techno = 1,
		/obj/item/storage/wallet/stash/high = 1,
		/obj/item/storage/belt/utility/full/engi = 1,
		/obj/item/disk/xenobio_console_upgrade/monkey = 1,
		/obj/item/disk/xenobio_console_upgrade/slimeadv = 1,
		)


/datum/outfit/job/frontier/researcher/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalradio)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/durathread_vest)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/jet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/turbo)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/psycho)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx/chemistry)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak/chemistry)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak5)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/stimpak5/chemistry)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/superstimpak)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/superstimpak5)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/buffout)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steady)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/rechargerpistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/pico_manip)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/super_matter_bin)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/phasic_scanning)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/super_capacitor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ultra_micro_laser)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)

