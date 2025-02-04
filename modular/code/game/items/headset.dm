

/// ENCRYPTION KEYS	
/obj/item/encryptionkey/headset_outpost
	name = "Echoes Ridge radio encryption key"
	desc = "An encryption key for a radio headset.\
		\nTo access the outpost channel, use :v."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_SERVICE = 1)

/obj/item/encryptionkey/headset_outpost/depot
	name = "Echoes Ridge depot encryption key"
	desc = "An encryption key for a radio headset.\
		\nTo access the outpost channel, use :v.\
		\nTo access the depot channel, use :u"
	icon_state = "cargo_cypherkey"
	channels = list(RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_SUPPLY = 1)

/obj/item/encryptionkey/headset_outpost/rimwatch
	name = "Rimwatch encryption key"
	desc = "An encryption key for a radio headset.\
		\nTo access the outpost channel, use :v.\
		\nTo access the Rimwatch channel, use :s"
	icon_state = "sec_cypherkey"
	channels = list(RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_SECURITY = 1)

/obj/item/encryptionkey/headset_outpost/medsci
	name = "Laboratory encryption key"
	desc = "An encryption key for a radio headset.\
		\nTo access the outpost channel, use :v.\
		\nTo access the clinic channel, use :m\
		\nTo access the research channel, use :n"
	icon_state = "medsci_cypherkey"
	channels = list(RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_SCIENCE = 1, RADIO_CHANNEL_MEDICAL = 1)

/obj/item/encryptionkey/headset_outpost/technician
	name = "Technician encryption key"
	desc = "An encryption key for a radio headset.\
		\nTo access the outpost channel, use :v.\
		\nTo access the technician channel, use :e"
	icon_state = "eng_cypherkey"
	channels = list(RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_ENGINEERING = 1)

/obj/item/encryptionkey/headset_outpost/all
	name = "Governor encryption key"
	desc = "An encryption key for a radio headset.\
		\nTo access the outpost channel, use :v.\
		\nTo access the depot channel, use :u.\
		\nTo access the Rimwatch channel, use :s.\
		\nTo access the clinic channel, use :m.\
		\nTo access the research channel, use :u.\
		\nTo access the technician channel, use :e"
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_SUPPLY = 1, RADIO_CHANNEL_MEDICAL = 1, RADIO_CHANNEL_SCIENCE,
		RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_ENGINEERING = 1)


/// HEADSETS
/obj/item/radio/headset/headset_outpost
	name = "outpost radio headset"
	desc = "This is used by the outpost colonists.\n Use f to talk in the outpost channel."
	icon_state = "mine_headset" 
	item_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_outpost

/obj/item/radio/headset/headset_outpost/depot
	name = "depot radio headset"
	desc = "This is used by the depot workers.\nTo access the depot channel, use :u or :v to talk in the outpost channel."
	icon_state = "headset" 
	item_state = "headset"
	keyslot = new /obj/item/encryptionkey/headset_outpost/depot

/obj/item/radio/headset/headset_outpost/rimwatch
	name = "rimwatch radio headset"
	desc = "This is used by officers of the Rimwatch.\nTo access the Rimwatch channel, use :s or :v to talk in the outpost channel."
	icon_state = "sec_headset_alt" 
	item_state = "sec_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_outpost/rimwatch

/obj/item/radio/headset/headset_outpost/medlab
	name = "medlab radio headset"
	desc = "This is used by the outpost medlab workers.\nTo access the medical channel, use :m, for the research channel, use :n or v to talk in the outpost channel."
	icon_state = "med_headset_alt" 
	item_state = "med_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_outpost/medsci

/obj/item/radio/headset/headset_outpost/technician
	name = "technician radio headset"
	desc = "This is used by the outpost technician.\nTo access the technician channel, use :e or v to talk in the outpost channel."
	icon_state = "headset" 
	item_state = "headset"
	keyslot = new /obj/item/encryptionkey/headset_outpost/technician

/obj/item/radio/headset/headset_outpost/governor
	name = "governor radio headset"
	desc = "This is used by the outpost governor.\nTo access the outpost channel, use :v.\
		\nTo access the depot channel, use :u.\
		\nTo access the Rimwatch channel, use :s.\
		\nTo access the Medlab channel, use :m.\
		\nTo access the technician channel, use :e"
	icon_state = "com_headset_alt" 
	item_state = "com_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_outpost/all
