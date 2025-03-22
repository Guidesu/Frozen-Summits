/datum/advclass/cleric
	name = "Cleric"
	tutorial = "Disciples of the divine - clerics are blessed with the power of miracles from the gods themselves."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	vampcompat = FALSE
	outfit = /datum/outfit/job/roguetown/adventurer/cleric
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/cleric
	allowed_patrons = ALL_PATRONS

/datum/outfit/job/roguetown/adventurer/cleric/pre_equip(mob/living/carbon/human/H)
	..()

	// Add druidic skill for Dendor followers
	if(istype(H.patron, /datum/patron/divine/dendor))
		H.mind.adjust_skillrank(/datum/skill/magic/druidic, 3, TRUE)
		to_chat(H, span_notice("As a follower of natural circle, you have innate knowledge of druidic magic."))

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Cleric", "Cantor","Missionary")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)



		if("Cleric")
			to_chat(src, span_warning("Clerics are intermediaries between the mortal world and the distant planes of the gods. As varied as the gods they serve, clerics strive to embody the handiwork of their deities. No ordinary priest, a cleric is imbued with divine magic."))
			H.set_blindness(0)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			H.change_stat("perception", 1)
			H.change_stat("strength", 2)
			H.change_stat("constitution", 2) // Classic paladin is faster then the battle master.
			H.change_stat("endurance", 1)
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			pants = /obj/item/clothing/under/roguetown/chainlegs
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather/steel
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltr = /obj/item/rogueweapon/huntingknife
			id = /obj/item/clothing/ring/silver
			backr = /obj/item/rogueweapon/sword
			backl = /obj/item/storage/backpack/rogue/satchel
			backpack_contents = list(
								/obj/item/flashlight/flare/torch = 1,
								)
		if("Cantor")
			H.set_blindness(0)
			to_chat(H, span_warning("You were a bard once - but you've found a new calling. Your eyes have been opened to the divine, now you wander from city to city singing songs and telling tales of your patron's greatness."))
			head = /obj/item/clothing/head/roguetown/bardhat
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
			backl = /obj/item/storage/backpack/rogue/satchel
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather/knifebelt/iron
			beltr = /obj/item/rogueweapon/huntingknife/idagger/steel/special
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.grant_spells_churchling(H)
			H.mind.adjust_spellpoints(4)
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1)
			H.mind.adjust_skillrank(/datum/skill/misc/music, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
			H.cmode_music = 'sound/music/combat_bard.ogg'
			H.change_stat("strength", 1)
			H.change_stat("endurance", 1)
			H.change_stat("speed", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mockery)
			switch(H.patron?.type)
				if(/datum/patron/old_god)
					cloak = /obj/item/clothing/cloak/templar/psydon
				if(/datum/patron/divine/astrata)
					cloak = /obj/item/clothing/cloak/templar/astrata
				if(/datum/patron/divine/noc)
					cloak = /obj/item/clothing/cloak/templar/noc
				if(/datum/patron/divine/abyssor)
					cloak = /obj/item/clothing/cloak/templar/abyssor
				if(/datum/patron/divine/dendor)
					cloak = /obj/item/clothing/cloak/templar/dendor
				if(/datum/patron/divine/necra)
					cloak = /obj/item/clothing/cloak/templar/necra
				if (/datum/patron/divine/malum)
					cloak = /obj/item/clothing/cloak/templar/malum
				if (/datum/patron/divine/eora)
					cloak = /obj/item/clothing/cloak/templar/eora
				if (/datum/patron/divine/ravox)
					cloak = /obj/item/clothing/cloak/templar/ravox
				if (/datum/patron/divine/xylix)
					cloak = /obj/item/clothing/cloak/templar/xylix
				if (/datum/patron/divine/pestra)
					cloak = /obj/item/clothing/cloak/templar/pestra
				else
					cloak = /obj/item/clothing/cloak/cape/crusader
			var/weapons = list("Harp","Lute","Accordion","Guitar","Hurdy-Gurdy","Viola","Vocal Talisman")
			var/weapon_choice = input("Choose your instrument.", "TAKE UP ARMS") as anything in weapons
			H.set_blindness(0)
			switch(weapon_choice)
				if("Harp")
					backr = /obj/item/rogue/instrument/harp
				if("Lute")
					backr = /obj/item/rogue/instrument/lute
				if("Accordion")
					backr = /obj/item/rogue/instrument/accord
				if("Guitar")
					backr = /obj/item/rogue/instrument/guitar
				if("Hurdy-Gurdy")
					backr = /obj/item/rogue/instrument/hurdygurdy
				if("Viola")
					backr = /obj/item/rogue/instrument/viola
				if("Vocal Talisman")
					backr = /obj/item/rogue/instrument/vocals

		if("Missionary")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a devout worshipper of the divine with a strong connection to your patron god. You've spent years studying scriptures and serving your deity - now you wander into foreign lands, spreading the word of your faith."))
			backl = /obj/item/storage/backpack/rogue/satchel
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
			pants = /obj/item/clothing/under/roguetown/trou/leather
			shoes = /obj/item/clothing/shoes/roguetown/boots
			backr = /obj/item/rogueweapon/woodstaff
			belt = /obj/item/storage/belt/rogue/leather
			beltr = /obj/item/flashlight/flare/torch/lantern
			backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/flashlight/flare/torch = 1)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
			H.cmode_music = 'sound/music/combat_holy.ogg'
			H.change_stat("intelligence", 2)
			H.change_stat("endurance", 1)
			H.change_stat("perception", 2)
			H.change_stat("speed", 1)
			switch(H.patron?.type)
				if(/datum/patron/old_god)
					cloak = /obj/item/clothing/cloak/psydontabard
					head = /obj/item/clothing/head/roguetown/roguehood/psydon
				if(/datum/patron/divine/astrata)
					head = /obj/item/clothing/head/roguetown/roguehood/astrata
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/astrata
				if(/datum/patron/divine/noc)
					head =  /obj/item/clothing/head/roguetown/nochood
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/noc
				if(/datum/patron/divine/abyssor)
					head = /obj/item/clothing/head/roguetown/roguehood/abyssor
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/abyssor
				if(/datum/patron/divine/dendor)
					head = /obj/item/clothing/head/roguetown/dendormask
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
					H.cmode_music = 'sound/music/combat_druid.ogg'
				if(/datum/patron/divine/necra)
					head = /obj/item/clothing/head/roguetown/necrahood
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/necra
				if (/datum/patron/divine/malum)
					head = /obj/item/clothing/head/roguetown/roguehood //placeholder
					cloak = /obj/item/clothing/cloak/templar/malumite
				if (/datum/patron/divine/eora)
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe/eora
					head = /obj/item/clothing/head/roguetown/eoramask
				if(/datum/patron/inhumen/zizo)
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe 
					head = /obj/item/clothing/head/roguetown/roguehood
				else
					cloak = /obj/item/clothing/suit/roguetown/shirt/robe //placeholder, anyone who doesn't have cool patron drip sprites just gets generic robes
					head = /obj/item/clothing/head/roguetown/roguehood
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.grant_spells_churchling(H)
			START_PROCESSING(SSobj, C)
			H.mind.adjust_spellpoints(8)

	switch(H.patron?.type)
		if(/datum/patron/old_god)
			neck = /obj/item/clothing/neck/roguetown/psicross
		if(/datum/patron/divine/astrata)
			neck = /obj/item/clothing/neck/roguetown/psicross/astrata
		if(/datum/patron/divine/noc)
			neck = /obj/item/clothing/neck/roguetown/psicross/noc
		if(/datum/patron/divine/abyssor)
			neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
		if(/datum/patron/divine/dendor)
			neck = /obj/item/clothing/neck/roguetown/psicross/dendor
		if(/datum/patron/divine/necra)
			neck = /obj/item/clothing/neck/roguetown/psicross/necra
		if(/datum/patron/divine/pestra)
			neck = /obj/item/clothing/neck/roguetown/psicross/pestra
		if(/datum/patron/divine/ravox)
			neck = /obj/item/clothing/neck/roguetown/psicross/ravox
		if(/datum/patron/divine/malum)
			neck = /obj/item/clothing/neck/roguetown/psicross/malum
		if(/datum/patron/divine/eora)
			neck = /obj/item/clothing/neck/roguetown/psicross/eora
		if(/datum/patron/inhumen/zizo)
			H.cmode_music = 'sound/music/combat_cult.ogg'
			neck = /obj/item/roguekey/inhumen
		if (/datum/patron/inhumen/matthios)
			H.cmode_music = 'sound/music/combat_cult.ogg'
		if(/datum/patron/divine/xylix) // Random pricross for Xylix
			var/list/psicross_options = list(
			/obj/item/clothing/neck/roguetown/psicross,
			/obj/item/clothing/neck/roguetown/psicross/astrata,
			/obj/item/clothing/neck/roguetown/psicross/noc,
			/obj/item/clothing/neck/roguetown/psicross/abyssor,
			/obj/item/clothing/neck/roguetown/psicross/dendor,
			/obj/item/clothing/neck/roguetown/psicross/necra,
			/obj/item/clothing/neck/roguetown/psicross/pestra,
			/obj/item/clothing/neck/roguetown/psicross/ravox,
			/obj/item/clothing/neck/roguetown/psicross/malum,
			/obj/item/clothing/neck/roguetown/psicross/eora
			)
			neck = pick(psicross_options)

	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)


	for(var/datum/quirk/nobag/NB in H.roundstart_quirks)
		backpack_contents = null
		backl = null
		break
