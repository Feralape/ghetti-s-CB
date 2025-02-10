/area/frontier
	icon = 'modular/icons/turf/areas.dmi'
	has_gravity = STANDARD_GRAVITY
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED

/area/frontier/outdoor
	name = "outdoor"
	ambience_area = list(
		/datum/looping_sound/ambient/critters,
		/datum/looping_sound/ambient/critters/birds,
		/datum/looping_sound/ambient/critters/birds/crow,
		/datum/looping_sound/ambient/critters/frogs,
		/datum/looping_sound/ambient/forest,
	)
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 19
	grow_chance = 45
	weather_tags = list(WEATHER_ALL)

/area/frontier/outdoor/wilderness
	name = "Wilderness"
	icon_state = "wilderness"
	grow_chance = 45

/area/frontier/outdoor/river
	name = "River"
	icon_state = "river"
	ambience_area = list(
		/datum/looping_sound/ambient/critters,
		/datum/looping_sound/soundrock/creek,
		/datum/looping_sound/ambient/critters/birds,
		/datum/looping_sound/ambient/critters/birds/crow,
		/datum/looping_sound/ambient/critters/frogs,
		/datum/looping_sound/ambient/forest,
	)


/area/frontier/outdoor/shoreline
	name = "Shoreline"
	icon_state = "shoreline"
	ambience_area = list(
		/datum/looping_sound/soundrock/shore,
		/datum/looping_sound/ambient/building/sulphurtribe/highwinds,
		/datum/looping_sound/ambient/seagulls,
	)

/area/frontier/wilderness/event
	name = "Wilderness Event"

/area/frontier/radiation
	name = "radiation"
	icon_state = "radiation"

/// COLONY AREAS	
/area/frontier/outdoor/colony
	name = "Colony Outdoors"
	icon_state = "colony"
	requires_power = 1
	ambience_area = list(
		/datum/looping_sound/ambient/city,
		/datum/looping_sound/ambient/critters,
		/datum/looping_sound/ambient/general,
		/datum/looping_sound/ambient/swamp/quiet,
		/datum/looping_sound/ambient/critters/birds,
		/datum/looping_sound/ambient/critters/birds/crow,
		)

/area/frontier/outdoor/colony/depot_dock
	name = "Depot Dock"
	icon_state = "depot_shuttle"
	requires_power = 1
	ambience_area = list(
		/datum/looping_sound/ambient/city,
		/datum/looping_sound/ambient/critters,
		/datum/looping_sound/ambient/general,
		/datum/looping_sound/ambient/swamp/quiet,
		/datum/looping_sound/ambient/critters/birds,
		/datum/looping_sound/ambient/critters/birds/crow,
		)





/area/frontier/outdoor/colony/roof
	name = "Roof"
	icon_state = "roof_colony"
	requires_power = 1
	ambience_area = list(
		/datum/looping_sound/ambient/building/sulphurtribe/highwinds,
		/datum/looping_sound/ambient/building/sulphurtribe/highwinds/gong,
		)


/area/frontier/indoor
	name = "Indoor"
	ambience_area = list(
		/datum/looping_sound/ambient/building,
		/datum/looping_sound/ambient/general,
		/datum/looping_sound/ambient/lightbulb
		)
	weather_tags = null
	outdoors = FALSE
	grow_chance = 5

/area/frontier/indoor/colony
	name = "Colony"
	icon_state = "colony_indoor"
	requires_power = 1
	ambience_area = list(
		/datum/looping_sound/ambient/city,
		/datum/looping_sound/ambient/general,
		/datum/looping_sound/ambient/building,
		/datum/looping_sound/ambient/lightbulb

		)

/area/frontier/indoor/gatehouse
	name = "Gatehouse"
	icon_state = "gatehouse"

/area/frontier/indoor/power_plant
	name = "Power Plant"
	icon_state = "power_plant"
	ambientsounds = ENGINEERING

/area/frontier/indoor/generator_room
	name = "Generator Room"
	icon_state = "generator"
	ambientsounds = ENGINEERING

/area/frontier/indoor/power_plant/telecomm
	name = "Telecomm Chamber"
	icon_state = "telecomm"
	ambience_area = list(
		/datum/looping_sound/ambient/telecomm,
		/datum/looping_sound/ambient/building,
		/datum/looping_sound/ambient/general,
		)

/area/frontier/indoor/supply_depot
	name = "Supply Depot"
	icon_state = "depot"

/area/frontier/indoor/clinic
	name = "Clinic"
	icon_state = "clinic"
	ambience_area = list(
		/datum/looping_sound/ambient/building/hospital,
		/datum/looping_sound/ambient/building,
		/datum/looping_sound/ambient/general,
		/datum/looping_sound/ambient/lightbulb
		)

/area/frontier/indoor/cantina
	name = "Cantina"
	icon_state = "cantina"

/area/frontier/indoor/guardkeep
	name = "Guards Keep"
	icon_state = "guard"

/area/fronter/indoor/gate_house
	name = "Gatehouse"
	icon_state = "gatehouse"

/area/frontier/indoor/court
	name = "Court"
	icon_state = "court"

/area/frontier/indoor/research
	name = "Research"
	icon_state = "research"
	ambience_area = list(
		/datum/looping_sound/ambient/underground_lab,
		/datum/looping_sound/ambient/building,
		/datum/looping_sound/ambient/general,
		/datum/looping_sound/ambient/lightbulb
		)

/area/frontier/indoor/govenors_office
	name = "Governor's Office"
	icon_state = "governor"

/area/frontier/indoor/colony_building
	name = "Colony Building"
	icon_state = "vacant"

//RUINS

/area/frontier/outdoor/abandoned_town
	name = "Abandoned Town"
	icon_state = "colony_wilderness"
	requires_power = 1
	ambience_area = list(
		/datum/looping_sound/ambient/critters,
		/datum/looping_sound/ambient/town,
		/datum/looping_sound/ambient/building/sulphurtribe/highwinds,
		/datum/looping_sound/ambient/building/sulphurtribe/highwinds/gong,
		)

/area/frontier/indoor/building
	name = "Abandoned building"
	icon_state = "building"
	requires_power = TRUE
	ambience_area = list(
		/datum/looping_sound/ambient/general,
		/datum/looping_sound/ambient/woodcreak,
		/datum/looping_sound/ambient/lightbulb,
		)

/area/frontier/outdoor/roof
	name = "Abandoned Building Roof"
	icon_state = "roof_wilderness"
	requires_power = 1
	ambience_area = list(
		/datum/looping_sound/ambient/building/sulphurtribe/highwinds,
		/datum/looping_sound/ambient/building/sulphurtribe/highwinds/gong,
		/datum/looping_sound/ambient/critters,
		)

/area/frontier/indoor/tunnel
	name = "Highway Tunnel"
	icon_state = "tunnel"
	requires_power = 1
	ambience_area = list(
		/datum/looping_sound/ambient/cave,
		/datum/looping_sound/ambient/building/sulphurtribe/highwinds,
		/datum/looping_sound/ambient/building/sulphurtribe/highwinds/gong,
		/datum/looping_sound/ambient/general,
		/datum/looping_sound/ambient/lightbulb,
		/datum/looping_sound/ambient/critters,
		)

//EASTWATER BAY
/area/frontier/outdoor/eastwater_town
	name = "Eastwater Town"
	icon_state = "eastwater"
	requires_power = 1
	ambience_area = list(
		/datum/looping_sound/ambient/critters,
		/datum/looping_sound/ambient/town,
		/datum/looping_sound/ambient/building/sulphurtribe/highwinds,
		/datum/looping_sound/ambient/building/sulphurtribe/highwinds/gong,
		)


/area/frontier/outdoor/eastwater_town/bay
	name = "Eastwater Bay"
	icon_state = "eastwater_bay"
	requires_power = 1
	ambience_area = list(
		/datum/looping_sound/ambient/critters,
		/datum/looping_sound/ambient/town,
		/datum/looping_sound/ambient/building/sulphurtribe/highwinds,
		/datum/looping_sound/ambient/building/sulphurtribe/highwinds/gong,
		/datum/looping_sound/soundrock/shore,
		)

/area/frontier/indoor/eastwater_town
	name = "Eastwater Town Buildings"
	icon_state = "eastwater_building"
	requires_power = 1
	ambience_area = list(
		/datum/looping_sound/ambient/general,
		/datum/looping_sound/ambient/woodcreak,
		/datum/looping_sound/ambient/lightbulb,
		)

//CAVE WILDERNESS
/area/frontier/indoor/cave
	name = "Cave"
	icon_state = "cave"
	ambience_area = list(
		/datum/looping_sound/ambient/cave,
		/datum/looping_sound/ambient/general,
		/datum/looping_sound/ambient/swamp/quiet,
		)
	grow_chance = 5

/area/frontier/indoor/cave/river
	name = "River"
	icon_state = "river_cave"
	ambience_area = list(
		/datum/looping_sound/ambient/cave,
		/datum/looping_sound/soundrock/creek,
		/datum/looping_sound/ambient/general,
		/datum/looping_sound/soundrock/frogs,
		)

/area/frontier/indoor/sewer_colony
	name = "Sewer"
	icon_state = "sewer"
	requires_power = TRUE
	ambience_area = list(
	/datum/looping_sound/ambient/sewers,
		)

/area/frontier/indoor/sewer
	name = "Sewer"
	icon_state = "sewer"
	ambience_area = list(
	/datum/looping_sound/ambient/sewers,
		)
