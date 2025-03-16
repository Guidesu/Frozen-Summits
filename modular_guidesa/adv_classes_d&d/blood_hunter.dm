/datum/advclass/bloodhunter
	name = "Blood Hunter"
	tutorial = "Warriors bound by dark rites who manipulate hemocraft to hunt supernatural threats."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/bloodhunter
	traits_applied = list(TRAIT_STEELHEARTED)
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/bloodhunter/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list(
		"Order of the Ghostslayer",
		"Order of the Lycan", 
		"Order of the Mutant",
		"Order of the Profane Soul"
	)
	var/classchoice = input("Choose your Blood Hunter Order", "Hemocraft Specialization") as anything in classes

	switch(classchoice)
		if("Order of the Ghostslayer")
			to_chat(H, span_warning("You wield silver and fire against restless dead. Your blood burns with purifying light."))
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/bloodlightning)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/bloodsteal)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_SILVER_BLESSED, TRAIT_GENERIC)
			H.cmode_music = 'sound/music/inquisitorcombat.ogg'
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 1)
			H.change_stat("intelligence", 1)
			beltr = /obj/item/rogueweapon/sword/silver
			backr = /obj/item/rogueweapon/sword
			backl = /obj/item/storage/backpack/rogue/satchel/black
			wrists = /obj/item/clothing/neck/roguetown/psicross/silver
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail
			belt = /obj/item/storage/belt/rogue/leather/knifebelt/black/steel
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/tights/black
			cloak = /obj/item/clothing/cloak/cape/puritan
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			head = /obj/item/clothing/head/roguetown/bucklehat
			gloves = /obj/item/clothing/gloves/roguetown/angle
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/rogueweapon/huntingknife = 1)
			beltl = pick(/obj/item/reagent_containers/glass/alchemical/strpot, 
						/obj/item/reagent_containers/glass/alchemical/conpot, 
						/obj/item/reagent_containers/glass/alchemical/endpot,
						/obj/item/reagent_containers/glass/alchemical/spdpot,
						/obj/item/reagent_containers/glass/alchemical/perpot,
						/obj/item/reagent_containers/glass/alchemical/intpot,
						/obj/item/reagent_containers/glass/alchemical/lucpot)

		if("Order of the Lycan")
			to_chat(H, span_warning("You walk the razor's edge between man and beast. The moon's call strengthens your strikes."))
			// Equipment 
			beltr = /obj/item/rogueweapon/katar
			armor = /obj/item/clothing/suit/roguetown/armor/leather
			// Skills
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			// Traits
			ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)

		if("Order of the Mutant")
			to_chat(H, span_warning("Alchemical mutagens course through your veins, granting power at great cost."))
			// Equipment
			beltl = /obj/item/reagent_containers/glass/alchemical/strpot
			backpack_contents = list(/obj/item/bomb = 2)
			// Skills
			H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 3, TRUE)
			// Stats
			H.change_stat("strength", 2)
			H.change_stat("intelligence", -1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/bloodlightning)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/bloodsteal)

		if("Order of the Profane Soul")
			to_chat(H, span_warning("Your power stems from an ancient pact. Otherworldly magic fuels your crimson rites."))
			// Equipment
			backr = /obj/item/rogueweapon/woodstaff
			beltr = /obj/item/spellbook_unfinished/pre_arcyne
			// Skills
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
			// Traits
			ADD_TRAIT(H, TRAIT_MAGEARMOR, TRAIT_GENERIC)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/bloodlightning)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/bloodsteal)

	// Common Blood Hunter Items
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather
	backl = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather

	backpack_contents += list(
		/obj/item/flashlight/flare/torch = 1,
		/obj/item/rogueweapon/huntingknife = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/manapot = 1
	)

	H.set_blindness(0)

	H.change_stat("perception", 2)
	H.change_stat("endurance", 2)


	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/music, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
