/datum/virtue/combat/executioner
	name = "Executioner Apprentice"
	desc = "I have trained under a skilled executioner, and always have my trusty exeuctioner's axe close at hand. (+1 to Axes and Whips/Flails, Up to Journeyman, Minimum Apprentice. Stashed battleaxe.)"
	added_stashed_items = list("Battleaxe" = /obj/item/rogueweapon/stoneaxe/battle)

/datum/virtue/combat/executioner/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/whipsflails) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/whipsflails, 1, 3))
		handle_skills(recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/axes) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/axes, 1, 3))
		handle_skills(recipient)

/datum/virtue/combat/militia
	name = "Militiaman Apprentice"
	desc = "I have trained under a skilled militiaman, and always have my trusty billhook close at hand. (+1 to Maces and Polearms, Up to Journeyman, Minimum Apprentice. Stashed billhook.)"
	added_stashed_items = list("Billhook" = /obj/item/rogueweapon/spear/billhook)

/datum/virtue/combat/militia/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/polearms) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/polearms, 1, 3))
		handle_skills(recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/maces) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/maces, 1, 3))
		handle_skills(recipient)

/datum/virtue/combat/brawler
	name = "Brawler Apprentice"
	desc = "I have trained under a skilled brawler, and have some experience fighting with my fists. (+1 to Unarmed and Wrestling, Up to Journeyman, Minimum Apprentice. Stashed katar.)"
	added_stashed_items = list("Katar" = /obj/item/rogueweapon/katar)
	
/datum/virtue/combat/brawler/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/unarmed) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/unarmed, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/unarmed, 1, 3))
		handle_skills(recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/wrestling) < SKILL_LEVEL_APPRENTICE)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/wrestling, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/wrestling, 1, 3))
		handle_skills(recipient)

/datum/virtue/utility/physician
	name = "Physician's Apprentice"
	desc = "In my youth, I worked under a skilled physician, studying medicine and alchemy. (Apprentice in crafting, alchemy, and medicine. Stashed first aid pouch.)"
	added_skills = list(list(/datum/skill/craft/crafting, 2, 2),
						list(/datum/skill/craft/alchemy, 2, 2),
						list(/datum/skill/misc/alchemy, 2, 2),
						list(/datum/skill/misc/medicine, 2, 2)
	)


/datum/virtue/utility/blacksmith
	name = "Blacksmith's Apprentice"
	desc = "In my youth, I worked under a skilled blacksmith, honing my skills with an anvil. (Apprentice in crafting, blacksmithing, weaponsmithing, armorsmithing, and smelting.)"
	added_skills = list(list(/datum/skill/craft/crafting, 2, 2),
						list(/datum/skill/craft/weaponsmithing, 2, 2),
						list(/datum/skill/craft/armorsmithing, 2, 2),
						list(/datum/skill/craft/blacksmithing, 2, 2),
						list(/datum/skill/craft/smelting, 2, 2)
	)

/datum/virtue/utility/hunter
	name = "Hunter's Apprentice"
	desc = "In my youth, I trained under a skilled hunter, learning how to butcher animals and work with leather/hide. (Apprentice in crafting, trapmaking, tracking, butchering, sewing, and tanning.)"
	added_skills = list(list(/datum/skill/craft/crafting, 2, 2),
						list(/datum/skill/craft/traps, 2, 2),
						list(/datum/skill/labor/butchering, 2, 2),
						list(/datum/skill/misc/sewing, 2, 2),
						list(/datum/skill/craft/tanning, 2, 2),
						list(/datum/skill/misc/tracking, 2, 2)
	)

/datum/virtue/utility/artificer
	name = "Artificer's Apprentice"
	desc = "In my youth, I worked under a skilled artificer, studying construction and engineering. (Apprentice in crafting, engineering, carpentry, masonry, and smelting.)"
	added_skills = list(list(/datum/skill/craft/crafting, 2, 2),
						list(/datum/skill/craft/carpentry, 2, 2),
						list(/datum/skill/craft/masonry, 2, 2),
						list(/datum/skill/craft/engineering, 2, 2),
						list(/datum/skill/craft/smelting, 2, 2)
	)
