/datum/job/roguetown/druid
	title = "Druid"
	f_title = "Druid"
	flag = DRUID
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	spells = list(/obj/effect/proc_holder/spell/invoked/diagnose/secular)
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = ALL_DIVINE_PATRONS //gets set to Silvanus on the outfit anyways lol
	outfit = /datum/outfit/job/roguetown/druid
	tutorial = "You have always been drawn to the wild, and the wild drawn to you. When your calling came, it was from him. Your patron claims dominion over all nature--promising bounties to those who act in his name to bring balance to His domain. The forest is the most comfortable place for you, toiling alongside farmers...although sometimes what lies beyond the gates fills your soul with a feral yearning."

	display_order = JDO_DRUID
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null
	round_contrib_points = 2

/datum/outfit/job/roguetown/druid
	name = "Druid"
	jobtype = /datum/job/roguetown/druid
	allowed_patrons = list(/datum/patron/divine/dendor)

/datum/outfit/job/roguetown/druid/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltr = /obj/item/flashlight/flare/torch/lantern
	beltl = /obj/item/rogueweapon/whip //The whip itself is not often associated to many jobs. Druids feel like a thematic choice to have a self-defense whip
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/natural/worms/leech/cheele = 1, //little buddy
	)
	head = /obj/item/clothing/head/roguetown/dendormask
	wrists = /obj/item/clothing/neck/roguetown/psicross/dendor
	shirt = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/druidic, 2, TRUE) //This does nothing, but maybe one day it will.
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE) //Druids know the forest and when it has been disturbed
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) //To help them defend themselves with parrying
		H.put_in_hands(new /obj/item/rogueweapon/woodstaff(H), TRUE) //To encourage them to wander the forests and to help defend themselves
		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 1)
		H.change_stat("strength", 2)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/druidic, 1, TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 1)
		H.change_stat("perception", -1)
		H.ambushable = FALSE

	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)

	C.grant_spells_churchling(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	H.mind.adjust_spellpoints(8)

	for(var/datum/quirk/nobag/NB in H.roundstart_quirks)
		backpack_contents = null
		backl = null
		break
