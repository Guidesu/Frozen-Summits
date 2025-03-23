/datum/advclass/fighter
	name = "Fighter"
	tutorial = "Masters of martial combat, wielding weapons and armor with unmatched skill."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/fighter
	traits_applied = list(TRAIT_STEELHEARTED)
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/fighter/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Champion","Eldritch Knight","Weapon Master")
	var/classchoice = input("Choose your archetype", "Fighter Specialization") as anything in classes

	switch(classchoice)
		if("Champion")
			to_chat(H, span_warning("You are a living weapon, specializing in heavy armor and overwhelming physical force."))
			// Armor Setup
			head = /obj/item/clothing/head/roguetown/helmet/heavy/knight
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
			armor = /obj/item/clothing/suit/roguetown/armor/plate
			gloves = /obj/item/clothing/gloves/roguetown/chain
			pants = /obj/item/clothing/under/roguetown/chainlegs
			shoes = /obj/item/clothing/shoes/roguetown/boots/armor
			wrists = /obj/item/clothing/wrists/roguetown/bracers
			
			// Weapon Selection
			var/weapons = list("Heirloom Sword","Warhammer","Eaglebeak Polearm")
			var/weapon_choice = input("Choose your signature weapon", "Arms Selection") as anything in weapons
			switch(weapon_choice)
				if("Heirloom Sword")
					backr = /obj/item/rogueweapon/sword/long/heirloom
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
				if("Warhammer")
					backr = /obj/item/rogueweapon/mace/warhammer
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
				if("Eaglebeak Polearm")
					backr = /obj/item/rogueweapon/eaglebeak
					H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			
			// Skills & Traits
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
			H.change_stat("strength", 3)
			H.change_stat("constitution", 2)

		if("Eldritch Knight")
			to_chat(H, span_warning("You combine martial mastery with limited arcane magic."))
			// Armor Setup
			head = /obj/item/clothing/head/roguetown/helmet/sallet
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine
			gloves = /obj/item/clothing/gloves/roguetown/angle
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots

			// Magic & Weapons
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
			backr = /obj/item/rogueweapon/sword/long
			beltr = /obj/item/rogueweapon/huntingknife/idagger/steel

			// Skills & Stats
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			H.change_stat("strength", 2)
			H.change_stat("intelligence", 2)

		if("Weapon Master")
			to_chat(H, span_warning("You have perfected your technique with a single weapon type."))
			// Armor Setup
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
			pants = /obj/item/clothing/under/roguetown/trou
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather

			// Specialized Weapon Choice
			var/weapons = list("Rapier","Battleaxe","Flail")
			var/weapon_choice = input("Choose your mastered weapon", "Weapon Specialization") as anything in weapons
			switch(weapon_choice)
				if("Rapier")
					beltr = /obj/item/rogueweapon/sword/rapier
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
					ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
				if("Battleaxe")
					backr = /obj/item/rogueweapon/stoneaxe/battle
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 5, TRUE)
					ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
				if("Flail")
					backr = /obj/item/rogueweapon/flail
					H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 5, TRUE)
					ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)

			// Core Skills
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("perception", 2)

	// Common Fighter Items
	belt = /obj/item/storage/belt/rogue/leather
	backl = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	backpack_contents = list(/obj/item/flashlight/flare/torch = 1)
	H.set_blindness(0)

	for(var/datum/quirk/nobag/NB in H.roundstart_quirks)
		backpack_contents = null
		backl = null
		break
