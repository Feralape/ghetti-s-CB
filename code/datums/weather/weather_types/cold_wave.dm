/datum/weather/cold_wave
	name = "cold wave"
	desc = "Harsh cold wave will grip an entire area."
	probability = 0

	telegraph_message = span_notice("A chilling and unfamiliar breeze sweeps over the valley.")
	telegraph_duration = 300
	telegraph_overlay = "snow_storm"
	telegraph_sound = 'sound/f13effects/coldwave.ogg'
	weather_sound = 'sound/f13effects/coldwave.ogg'

	weather_message = span_notice("The once only chilling breeze outside rapidly falls to an unbearable cold overtime with no signs of stopping. You feel as though you are better off indoors.")
	weather_overlay = "snow_storm"
	weather_duration_lower = 1200
	weather_duration_upper = 2400

	end_duration = 100
	end_message = span_notice("The cold snap dies down, it should be safe to go outside again.")

	area_types = list(/area/frontier/outdoor, 
/area/frontier/outdoor/wilderness, 
/area/frontier/outdoor/river, 
/area/frontier/outdoor/shoreline, 
/area/frontier/outdoor/colony, 
/area/frontier/outdoor/colony/depot_dock,
/area/frontier/outdoor/colony/roof,
/area/frontier/outdoor/eastwater_town
)
	protected_areas = list(/area/shuttle)
	target_trait = ZTRAIT_STATION
	tag_weather = WEATHER_COLD

	immunity_type = "snow"

	barometer_predictable = TRUE

	carbons_only = TRUE

/datum/weather/cold_wave/weather_act(mob/living/L)
	L.adjust_bodytemperature(-rand(5, 15))
