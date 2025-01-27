//basically simplified roguetown banking without treasury connection, by vide noir.
GLOBAL_LIST_EMPTY(bank_accounts)

/obj/machinery/computer/atm
	name = "ATM"
	desc = "Stores and withdraws currency for long term safekeeping."
	icon = 'icons/obj/computer.dmi'
	icon_state = "tcstation"
	icon_keyboard = "tcstation_key"
	icon_screen = "syndie"
	density = FALSE
	pixel_y = 32

/obj/machinery/computer/atm/attack_hand(mob/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user

	if(H in GLOB.bank_accounts)
		var/amt = GLOB.bank_accounts[H]
		if(!amt)
			say("Your balance is nothing.")
			return
		if(amt < 0)
			say("Your balance is NEGATIVE.")
			return
		var/list/choicez = list()
		if(amt >= 100)
			choicez += "GOLD"
		if(amt >= 10)
			choicez += "SILVER"
		choicez += "COPPER"
		var/selection = input(user, "Make a Selection", src) as null|anything in choicez
		if(!selection)
			return
		amt = GLOB.bank_accounts[H]
		var/mod = 1
		if(selection == "GOLD")
			mod = 100
		if(selection == "SILVER")
			mod = 10
		if(selection == "COPPER")
			mod = 1
		var/coin_amt = input(user, "You may withdraw [floor(amt/mod)] [selection] COINS from your account.", src) as null|num
		coin_amt = round(coin_amt)
		if(coin_amt < 1)
			return
		amt = GLOB.bank_accounts[H]
		if(!Adjacent(user))
			return
		if((coin_amt*mod) > amt)
			return
		if(!withdraw_money_account(coin_amt*mod, H))
			return
		budget2change(coin_amt*mod, user)
		sync_bank_persistence(user)

/obj/machinery/computer/atm/attackby(obj/item/stack/f13Cash/P, mob/user, params)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(P, /obj/item/stack/f13Cash))
			if(H in GLOB.bank_accounts)
				generate_money_account(P.get_item_credit_value(), H)
				qdel(P)
				playsound(src, 'sound/misc/coininsert.ogg', 100, FALSE, -1)
				return
	return ..()

/proc/send_ooc_note(msg, name, job)
	var/list/names_to = list()
	if(name)
		names_to += name
	if(job)
		var/list/L = list()
		if(islist(job))
			L = job
		else
			L += job
		for(var/J in L)
			for(var/mob/living/carbon/human/X in GLOB.human_list)
				if(X.job == J)
					names_to |= X.real_name
	if(names_to.len)
		for(var/mob/living/carbon/human/X in GLOB.human_list)
			if(X.real_name in names_to)
				if(!X.stat)
					to_chat(X, span_info("[msg]"))

/mob/living/proc/init_bank_account(accowner, initial_deposit)
	if(!accowner)
		return
	if(accowner in GLOB.bank_accounts)
		return
	GLOB.bank_accounts += accowner
	if(initial_deposit)
		GLOB.bank_accounts[accowner] = initial_deposit
	else
		GLOB.bank_accounts[accowner] = 0
	client.prefs.save_character_persistence(TRUE)
	return TRUE

///@param amt: The amount of money to deposit.
///@param character: The character making the deposit.
///@return TRUE if the money was successfully deposited, FALSE otherwise.
/obj/machinery/computer/atm/proc/generate_money_account(amt, mob/living/carbon/human/character)
	if(!amt)
		return FALSE
	if(!character)
		return FALSE
	if(character in GLOB.bank_accounts)
		GLOB.bank_accounts[character] += amt
		sync_bank_persistence(character)
	else
		return FALSE
	return TRUE

/obj/machinery/computer/atm/proc/sync_bank_persistence(mob/living/carbon/human/character)
	character.client.prefs.bank_funds = GLOB.bank_accounts[character] 
	character.client.prefs.save_character_persistence()

/obj/machinery/computer/atm/proc/withdraw_money_account(amt, target)
	if(!amt)
		return
	var/target_name = target
	if(istype(target,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = target
		target_name = H.real_name
	var/found_account
	for(var/X in GLOB.bank_accounts)
		if(X == target)
			if(GLOB.bank_accounts[X] < amt)  // Check if the withdrawal amount exceeds the player's account balance
				send_ooc_note("Error: Insufficient funds in the account to complete the withdrawal.", name = target_name)
				return  // Return without processing the transaction
			GLOB.bank_accounts[X] -= amt //The account accounts accountingly. Shame on you if you copy this, apple.
			found_account = TRUE
			break
	sync_bank_persistence(target)
	if(!found_account)
		return
	return TRUE

/obj/machinery/computer/atm/proc/budget2change(budget, mob/user, specify)
	var/turf/T
	if(!user || (!ismob(user)))
		T = get_turf(src)
	else
		T = get_turf(user)
	if(!budget || budget <= 0)
		return
	budget = floor(budget)
	var/type_to_put
	var/coins_to_put
	if(specify)
		switch(specify)
			if("GOLD")
				coins_to_put = budget/100
				type_to_put = /obj/item/stack/f13Cash/aureus
			if("SILVER")
				coins_to_put = budget/10
				type_to_put = /obj/item/stack/f13Cash/denarius
			if("COPPER")
				coins_to_put = budget
				type_to_put = /obj/item/stack/f13Cash/caps
	else
		var/highest_found = FALSE
		var/coins = floor(budget/100)
		if(coins)
			budget -= coins * 100
			highest_found = TRUE
			type_to_put = /obj/item/stack/f13Cash/aureus
			coins_to_put = coins
		coins = floor(budget/10)
		if(coins)
			budget -= coins * 10
			if(!highest_found)
				highest_found = TRUE
				type_to_put = /obj/item/stack/f13Cash/denarius
				coins_to_put = coins
			else
				new /obj/item/stack/f13Cash/denarius(T, coins)
		if(budget >= 1)
			if(!highest_found)
				type_to_put = /obj/item/stack/f13Cash/caps
				coins_to_put = budget
			else
				new /obj/item/stack/f13Cash/caps(T, budget)
	if(!type_to_put || coins_to_put < 1)
		return
	var/obj/item/stack/f13Cash/G = new type_to_put(T, floor(coins_to_put))
	if(user)
		user.put_in_hands(G)
	playsound(T, 'sound/misc/coindispense.ogg', 100, FALSE, -1)

/datum/preferences/proc/save_character_persistence(silent = FALSE)
	var/savefile/S = new /savefile(path)
	if(!S)
		return 0
	if(!silent)
		to_chat(parent, span_info("Your banked funds are saved, you now have <b>[bank_funds]</b> in your account."))
	S.cd = "/character[default_slot]"
	WRITE_FILE(S["bank_funds"], bank_funds)
