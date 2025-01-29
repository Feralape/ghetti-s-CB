//persistent char inv code by vide noir.
/obj/machinery/computer/itemvault
	name = "Vaultier 1000"
	desc = "Stores and withdraws items for long term safekeeping."
	icon = 'icons/obj/computer.dmi'
	icon_state = "lunar"
	icon_keyboard = "lunar_key"
	icon_screen = "lunar"

/obj/machinery/computer/itemvault/attacked_by(obj/item/I, mob/living/user, attackchain_flags, damage_multiplier, damage_addition, damage_override)
	if(I) //the number should help storing multiples
		if(user.client.prefs.bank_items.len > 8)
			say("You have reached your item limit.")
			playsound(get_turf(src), 'sound/vox/no.ogg', 50)
			return
		if(istype(I, /obj/item/storage))
			say("You can not store containers here.")
			playsound(get_turf(src), 'sound/vox/denied.ogg', 50)
			return
		var/thenumber = 0
		for(var/obj/item/sameitem in user.client.prefs.bank_items)
			if(I.type == sameitem.type)
				thenumber ++
		if(thenumber)
			user.client.prefs.bank_items["[I.name] ([thenumber])"] = I.type
		else
			user.client.prefs.bank_items["[I.name]"] = I.type
		qdel(I)
		playsound(get_turf(src), 'sound/machines/disposalflush.ogg', 20)
		say("Your [I] has been deposited to the vault.")
		user.client.prefs.save_banked_items()

/obj/machinery/computer/itemvault/attack_hand(mob/user, act_intent, attackchain_flags)
	. = ..()
	if(user.mind && isliving(user))
		if(user.client.prefs.bank_items && user.client.prefs.bank_items.len)
			var/item = input(user, "What will I take?", "VAULT") as null|anything in user.client.prefs.bank_items
			if(item)
				if(user.Adjacent(src))
					if(user.client.prefs.bank_items[item])
						var/path2item = user.client.prefs.bank_items[item]
						user.client.prefs.bank_items -= item
						var/obj/item/newitem = new path2item(user.loc)
						user.put_in_hands(newitem)
						playsound(get_turf(src), 'sound/machines/disposalflush.ogg', 30)
						user.client.prefs.save_banked_items(TRUE)
			return

/datum/preferences/proc/save_banked_items(silent = FALSE)
	var/savefile/S = new /savefile(path)
	if(!S)
		return 0
	if(!silent)
		to_chat(parent, span_info("Your vault is saved, you now have <b>[bank_items.len]</b> items in your vault."))
	WRITE_FILE(S["bank_items"], bank_items)
