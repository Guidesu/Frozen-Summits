/datum/advclass/sfighter
	name = "Barbarian"
	tutorial = "Trained warriors and estemeed swordsmen from all corners of the world, \
	barbarians are defined by martial prowess - whether with a blade or their bare fists."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/sfighter
	traits_applied = list(TRAIT_STEELHEARTED)
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/sfighter/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Battlemaster","Barbarian")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Battlemaster")
			to_chat(H, span_warning("You are a seasoned weapon specialist, clad in skills, with years of experience in warfare and battle under your belt."))
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
			H.set_blindness(0)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			var/weapons = list("Bastard Sword","Mace","Billhook","Battle Axe")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Bastard Sword")
					H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
					backr = /obj/item/rogueweapon/sword/long
				if("Mace")
					H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
					beltr = /obj/item/rogueweapon/mace
				if("Billhook")
					H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
					r_hand = /obj/item/rogueweapon/spear/billhook
					backr = /obj/item/gwstrap
				if("Battle Axe")
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
					backr = /obj/item/rogueweapon/stoneaxe/battle
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 2)
			belt = /obj/item/storage/belt/rogue/leather
			backl = /obj/item/storage/backpack/rogue/satchel
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
			gloves = /obj/item/clothing/gloves/roguetown/chain/iron
			cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife = 1)

		if("Barbarian")
			to_chat(H, span_warning("You are a brutal warrior who foregoes armor in order to showcase your raw strength. You specialize in unarmed combat and wrestling."))
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
			ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
			H.cmode_music = 'sound/music/combat_gronn.ogg'
			H.set_blindness(0)
			var/weapons = list("Katar","Battle Axe","MY BARE HANDS!!!")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if ("Katar")
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
					beltr = /obj/item/rogueweapon/katar
				if("Battle Axe")
					H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
					beltr = /obj/item/rogueweapon/stoneaxe/battle
				if ("MY BARE HANDS!!!")
					H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
					ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC)
			H.change_stat("strength", 3)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 2)
			H.change_stat("intelligence", -2)
			if(H.pronouns == HE_HIM || H.pronouns == THEY_THEM || H.pronouns == IT_ITS)
				H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
				head = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
				wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
				pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
				shoes = /obj/item/clothing/shoes/roguetown/boots/leather
				gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
				backl = /obj/item/storage/backpack/rogue/satchel
				belt = /obj/item/storage/belt/rogue/leather
				neck = /obj/item/storage/belt/rogue/pouch/coins/poor
				beltl = /obj/item/rogueweapon/huntingknife
			if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
				head = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
				armor = /obj/item/clothing/suit/roguetown/armor/leather/bikini
				pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/shorts
				wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
				shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedboots
				gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
				backl = /obj/item/storage/backpack/rogue/satchel
				belt = /obj/item/storage/belt/rogue/leather
				neck = /obj/item/storage/belt/rogue/pouch/coins/poor
				beltl = /obj/item/rogueweapon/huntingknife
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1)


	for(var/datum/quirk/nobag/NB in H.roundstart_quirks)
		backpack_contents = null
		backl = null
		break
