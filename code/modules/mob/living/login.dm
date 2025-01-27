/mob/living/Login()
	..()
	disconnect_time = null //we are connected
	//Mind updates
	sync_mind()
	mind.show_memory(src, 0)
	SSsecondwind.init_my_second_wind(ckey)

	//Round specific stuff
	if(SSticker.mode)
		switch(SSticker.mode.name)
			if("sandbox")
				CanBuild()

	update_damage_hud()
	update_health_hud()

	var/turf/T = get_turf(src)
	if (isturf(T))
		update_z(T.z)

	//Vents
	if(ventcrawler)
		to_chat(src, span_notice("You can ventcrawl! Use alt+click on vents to quickly travel about the station."))

	if(!(src in GLOB.bank_accounts))
		if(client.prefs.bank_funds)
			init_bank_account(src, client.prefs.bank_funds)
		else
			init_bank_account(src, 50) //make sure they got a bank account

	if(ranged_ability)
		ranged_ability.add_ranged_ability(src, span_notice("You currently have <b>[ranged_ability]</b> active!"))
	hud_client_check()

	SSstatpanels.collect_horny_demographic(src)
