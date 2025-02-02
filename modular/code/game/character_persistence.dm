//persistent char inv code by vide noir.
//i could not make this work, not withdrawing nor depositing beyond one item, or saving. I dont know wtf is wrong.
/obj/machinery/computer/itemvault
	name = "Vaultier 1000"
	desc = "Stores and withdraws items for long term safekeeping."
	icon = 'icons/obj/computer.dmi'
	icon_state = "lunar"
	icon_keyboard = "lunar_key"
	icon_screen = "lunar"

/obj/machinery/computer/itemvault/attacked_by(obj/item/I, mob/living/user, attackchain_flags, damage_multiplier, damage_addition, damage_override)
	if(user.mind && isliving(user))
		if(I) //the number should help storing multiples
			var/list/bankedshit = user.client.prefs.bank_items
			if(istype(I, /obj/item/storage))
				say("You can not store containers here.")
				playsound(get_turf(src), 'sound/vox/denied.ogg', 50)
				return
			if(bankedshit)
				if(bankedshit.len > 8)
					say("You have reached your item limit.")
					playsound(get_turf(src), 'sound/vox/no.ogg', 50)
					return
			var/thenumber = 0
			for(var/obj/item/sameitem in bankedshit)
				if(I.type == sameitem.type)
					thenumber ++
			if(thenumber)
				bankedshit["[I.name] ([thenumber])"] = I.type
			else
				bankedshit[I.name] = I.type
			qdel(I)
			playsound(get_turf(src), 'sound/machines/disposalflush.ogg', 20)
			say("Your [I] has been deposited to the vault.")
			user.client.prefs.save_banked_items()

/obj/machinery/computer/itemvault/attack_hand(mob/user)
	. = ..()
	if(user.mind && isliving(user))
		var/list/bankedshit = user.client.prefs.bank_items
		if(bankedshit && bankedshit.len)
			var/item = input(user, "What will I take?", "VAULT") as null|anything in bankedshit
			if(item)
				if(user.Adjacent(src))
					if(bankedshit[item])
						var/path2item = bankedshit[item]
						bankedshit -= item
						var/obj/item/newitem = new path2item(user.loc)
						user.put_in_hands(newitem)
						playsound(get_turf(src), 'sound/machines/disposalflush.ogg', 30)
						user.client.prefs.save_banked_items(TRUE)
		else
			say("Your vault is empty.")

/datum/preferences/proc/save_banked_items(silent = FALSE)
	var/savefile/S = new /savefile(path)
	if(!S)
		return 0
	if(!silent)
		to_chat(parent, span_info("Your vault is saved, you now have <b>[bank_items.len]</b> items in your vault."))
	WRITE_FILE(S["bank_items"], bank_items)
