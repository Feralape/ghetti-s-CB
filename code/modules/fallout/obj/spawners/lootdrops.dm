//Loot spawners. Divided by types.
// TODO: Armor spawners.


/obj/effect/spawner/lootdrop/crafts
	color = "#0FFFA0"
	loot = list(
	/obj/item/crafting/diode = 5,
	/obj/item/crafting/transistor = 5,
	/obj/item/crafting/capacitor = 5,
	/obj/item/crafting/fuse = 5,
	/obj/item/crafting/resistor = 5,
	/obj/item/crafting/switch_crafting = 5,
	/obj/item/crafting/bulb = 5,
	/obj/item/crafting/board = 5,
	/obj/item/crafting/buzzer = 5,
	/obj/item/crafting/frame = 5,
	/obj/item/crafting/small_gear = 5,
	/obj/item/crafting/large_gear = 5,
	/obj/item/crafting/duct_tape = 5,
	/obj/item/crafting/wonderglue = 5,
	/obj/item/crafting/turpentine = 5,
	/obj/item/crafting/abraxo = 5,
	/obj/item/assembly/igniter = 5,
	/obj/item/circuitboard/machine/autolathe/ammo/improvised = 5,
	/obj/item/assembly/timer = 5,
	/obj/item/assembly/prox_sensor = 5)

/obj/effect/spawner/lootdrop/wrange_low
	color = "#CCCCCC"
	loot = list()
//	/obj/item/weapon/gun/ballistic/automatic/pistol/n99 = 50,
//	/obj/item/weapon/gun/ballistic/shotgun/pipe = 50)

/obj/effect/spawner/lootdrop/wrange_middle
	color = "#0AAAFA"
	loot = list()
//	/obj/item/weapon/gun/ballistic/automatic/assault_rifle = 1,
//	/obj/item/weapon/gun/ballistic/shotgun/rifle = 1,
//	/obj/item/weapon/gun/ballistic/shotgun/rifle/scope = 1,
//	/obj/item/weapon/gun/ballistic/shotgun/trail = 1)

/obj/effect/spawner/lootdrop/wrange_high
	color = "#FFAAFA"
	loot = list()
//	/obj/item/weapon/gun/energy/laser/rifle = 1,
//	/obj/item/weapon/gun/energy/plasma/pistol = 1,
//	/obj/item/weapon/gun/energy/plasma/glock = 1,
//	/obj/item/weapon/gun/energy/plasma = 1,
//	/obj/item/weapon/gun/ballistic/automatic/smg10mm = 1,
//	/obj/item/weapon/gun/ballistic/automatic/rifle = 1,
//	/obj/item/weapon/gun/energy/laser/pistol = 1)

/obj/effect/spawner/lootdrop/wrange_legend
	color = "#FF0000"
	loot = list()
//	/obj/item/weapon/gun/ballistic/automatic/bozar = 1,
//	/obj/item/weapon/gun/ballistic/revolver/magnum = 1,
//	/obj/item/weapon/gun/energy/laser/rifle/tri = 1,
//	/obj/item/weapon/gun/energy/plasma/turbo = 1,
//	/obj/item/weapon/gun/energy/laser/rifle/aer13 = 1,
//	/obj/item/weapon/gun/energy/plasma/tri = 1)

/obj/effect/spawner/lootdrop/ammo
	color = "#FF00FF"
	loot = list(
	/obj/item/ammo_box/magazine/m10mm/adv = 1,
	/obj/item/ammo_box/magazine/m10mm/adv/ext = 1,
	/obj/item/ammo_box/m44 = 1,
	/obj/item/ammo_box/magazine/m308 = 1,
//	/obj/item/ammo_box/m308 = 1,
//	/obj/item/ammo_box/magazine/m223 = 1,
//	/obj/item/ammo_box/m223 = 1,
	/obj/item/ammo_casing/shotgun/buckshot = 1,
//	/obj/item/weapon/stock_parts/cell = 1
	)

/obj/effect/spawner/lootdrop/wmelee_low
	color = "#FF0000"
	loot = list(
	/obj/item/melee/onehanded/club = 1,
	/obj/item/melee/onehanded/club/tireiron = 1,
	/obj/item/twohanded/baseball = 1)

/obj/effect/spawner/lootdrop/wmelee_middle
	color = "#FF0000"
	loot = list(
	/obj/item/melee/onehanded/machete = 1,
	/obj/item/twohanded/baseball = 1,
	/obj/item/twohanded/baseball/golfclub = 1,
	/obj/item/twohanded/spear = 1)

/obj/effect/spawner/lootdrop/wmelee_high
	color = "#FF0000"
	loot = list(
	/obj/item/twohanded/sledgehammer/simple = 1,
	/obj/item/twohanded/spear = 1,
	/obj/item/melee/powerfist/f13 = 1,
	/obj/item/twohanded/baseball/golfclub = 1)

/obj/effect/spawner/lootdrop/wmelee_legend
	color = "#FF0000"
	loot = list(
	/obj/item/twohanded/sledgehammer/supersledge = 1)



/obj/effect/spawner/lootdrop/food
	color = "#FF0000"
	loot = list(
	/obj/item/trash/f13/bubblegum = 1,
	/obj/item/trash/f13/bubblegum_large = 1,
	/obj/item/trash/f13/cram = 1,
	/obj/item/trash/f13/cram_large = 1,
	/obj/item/trash/f13/yumyum = 1,
	/obj/item/trash/f13/fancylads = 1,
	/obj/item/trash/f13/sugarbombs = 1,
	/obj/item/trash/f13/crisps = 1,
	/obj/item/trash/f13/steak = 1,
	/obj/item/trash/f13/specialapples = 1,
	/obj/item/trash/f13/dandyapples = 1,
	/obj/item/trash/f13/blamco_large = 1,
	/obj/item/trash/f13/blamco = 1,
	/obj/item/trash/f13/mechanist = 1,
	/obj/item/trash/f13/instamash = 1,
	/obj/item/trash/f13/porknbeans = 1,
	/obj/item/trash/f13/borscht = 1,
	/obj/item/trash/f13/dog = 1,
	/obj/item/trash/f13/mre = 1,
	/obj/item/trash/f13/rotten = 1,
	/obj/item/clothing/head/f13/headscarf = 1)

/obj/effect/spawner/lootdrop/clothing_low
	color = "#FF0000"
	loot = list(
	/obj/item/clothing/suit/armor/light/leather = 1,
	/obj/item/clothing/suit/armor/medium/raider/slam = 1,
	/obj/item/clothing/glasses/f13/biker = 1,
	/obj/item/clothing/gloves/f13/leather = 1,
	/obj/item/clothing/head/f13/police = 1,
	/obj/item/clothing/head/f13/det_hat_alt = 1,
	/obj/item/clothing/head/f13/bandit = 1,
	/obj/item/clothing/head/helmet/f13/motorcycle = 1,
	/obj/item/clothing/mask/balaclava = 1,
	/obj/item/clothing/shoes/f13/brownie = 1,
	/obj/item/clothing/shoes/f13/tan = 1,
	/obj/item/clothing/shoes/f13/rag = 1,
	/obj/item/clothing/under/f13/brahmin = 1,
	/obj/item/clothing/under/f13/settler = 1,
	/obj/item/clothing/suit/armor/outfit/vest = 1)

/obj/effect/spawner/lootdrop/clothing_middle
	color = "#FF0000"
	loot = list(
	/obj/item/clothing/gloves/f13/leather = 1,
	/obj/item/clothing/head/f13/stormchaser = 1,
	/obj/item/clothing/head/helmet/f13/tribal = 1,
	/obj/item/clothing/head/helmet/f13/raider/supafly = 1,
	/obj/item/clothing/head/helmet/f13/firefighter = 1,
	/obj/item/clothing/head/helmet/f13/combat = 1,
	/obj/item/clothing/shoes/f13/military = 1,
	/obj/item/clothing/shoes/f13/diesel = 1,
	/obj/item/clothing/suit/armor/medium/combat = 1,
	/obj/item/clothing/suit/armor/light/kit = 1,
	/obj/item/clothing/suit/armor/outfit/jacket/merc = 1,
	/obj/item/clothing/under/f13/combat = 1,
	/obj/item/clothing/under/f13/petrochico = 1)

/obj/effect/spawner/lootdrop/clothing_high
	color = "#FF0000"
	loot = list(
		
	/obj/item/clothing/head/helmet/f13/combat/mk2 = 1,
	/obj/item/clothing/suit/armor/heavy/metal= 1,
	/obj/item/clothing/suit/armor/medium/combat/mk2 = 1)

/obj/effect/spawner/lootdrop/clothing_legend
	color = "#FF0000"
	loot = list(
	/obj/item/clothing/under/f13/recon = 1)
