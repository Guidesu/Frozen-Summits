// Meant for cave-races, less boons than other mercs but unique weapon + mining skill and helmet-torch combo.
/datum/advclass/mercenary/underdweller
	name = "Underdweller"
	tutorial = "A member of the Underdwellers, you've taken many of the deadliest contracts known to man in literal underground circles. Drow or Dwarf, you've put your differences aside for coin and adventure."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/dwarf/mountain,
		/datum/species/elf/dark,
		/datum/species/kobold,
		/datum/species/goblinp
	)
	outfit = /datum/outfit/job/roguetown/mercenary/underdweller
	category_tags = list(CTAG_MERCENARY)

/datum/outfit/job/roguetown/mercenary/underdweller/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Tunnelfighter","Sapper")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Tunnelfighter")
			H.set_blindness(0)
			to_chat(H, span_warning("You grew up in Dwarven Tunnels or the Underdark. You know how to survive in the deep and fight in narrow cave systems.."))
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/mining, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 4, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 3)
			H.change_stat("constitution", 3) //for the lack of ranged weaponry
			H.change_stat("perception", 1)
			H.change_stat("speed", 1)
			r_hand = /obj/item/rogueweapon/stoneaxe/battle
			beltl = /obj/item/rogueweapon/huntingknife
		if("Sapper")
			H.set_blindness(0)
			to_chat(H, span_warning("You are an experienced combat-artificer. Using Runepowder and engineering you took part in many sieges against Drow, Duergear and other Underdark-Dwellers. You recently managed to create a Runelock-Pistol. A rare and powerful weapon in these Lands.."))
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/mining, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE) //for the gun
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/engineering, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 2, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 2)
			H.change_stat("perception", 1)
			H.change_stat("speed", 1)
			H.change_stat("fortune", 1)
			r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/runelock
			beltl = /obj/item/storage/belt/rogue/pouch/bullets

	//General gear regardless of class.
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/flashlight/flare/torch/lantern/bronzelamptern
	neck = /obj/item/clothing/neck/roguetown/gorget
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red
	head = /obj/item/clothing/head/roguetown/helmet/leather/minershelm
	armor = /obj/item/clothing/suit/roguetown/armor/plate/adamantine_half_plate
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	gloves = /obj/item/clothing/gloves/roguetown/angle
	backl = /obj/item/storage/backpack/rogue/backpack
	backr = /obj/item/rogueweapon/stoneaxe/woodcut/pick

	backpack_contents = list(/obj/item/roguekey/mercenary)

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

	for(var/datum/quirk/nobag/NB in H.roundstart_quirks)
		backpack_contents = null
		backl = null
		break
