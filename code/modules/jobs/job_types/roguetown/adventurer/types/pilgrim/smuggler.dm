/datum/advclass/smuggler
	name = "Smuggler"
	tutorial = "Your past as a smuggler gave you experience in moving goods discreetly, avoiding other ships and authorities alike, \
	now, land-bound, you continue to trade in goods that others can't get their hands on, using your extensive knowledge to do so."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/smuggler
	category_tags = list(CTAG_PILGRIM)
	maximum_possible_slots = 2
	cmode_music = 'sound/music/combat_pirate.ogg'

/datum/outfit/job/roguetown/adventurer/smuggler
	allowed_patrons =  list(/datum/patron/divine/abyssia, /datum/patron/inhumen/thief)

/datum/outfit/job/roguetown/adventurer/smuggler/pre_equip(mob/living/carbon/human/H)
	..()
	head =/obj/item/clothing/head/roguetown/helmet/bandana
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/leather
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	backl = /obj/item/storage/backpack/rogue/backpack
	backr = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/rogueweapon/huntingknife/idagger/steel
	beltl = /obj/item/rogueweapon/huntingknife/idagger/steel
	backpack_contents = list(/obj/item/reagent_containers/powder/spice = 3, /obj/item/reagent_containers/glass/bottle/mercury = 1, /obj/item/reagent_containers/glass/bottle/rogue/poison = 1, /obj/item/reagent_containers/glass/bottle/rogue/healthpot = 1, /obj/item/reagent_containers/glass/bottle/rogue/manapot = 2,)

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODRUNNER, TRAIT_GENERIC)

	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 5, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/fishing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
	H.change_stat("perception", 2)
	H.change_stat("intelligence", 2)
	H.change_stat("speed", 3)
	H.grant_language(/datum/language/thievescant)
