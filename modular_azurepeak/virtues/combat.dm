/datum/virtue/combat/magical_potential
	name = "Arcane Potential"
	desc = "I grasped the basics of arcane magic at an early age, and have been able to prestidigitate for as long as I can remember."
	added_skills = list(/datum/skill/magic/arcane = 1)

/datum/virtue/combat/magical_potential/apply_to_human(mob/living/carbon/human/recipient)
	if (!recipient.mind?.get_skill_level(/datum/skill/magic/arcane)) // we can do this because apply_to is always called first
		recipient.mind?.adjust_spellpoints(2) // no martial-arcane for you - not the intent of this virtue!
		if (!recipient.mind?.has_spell(/obj/effect/proc_holder/spell/targeted/touch/prestidigitation))
			recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	else
		if (!HAS_TRAIT(recipient, TRAIT_MEDIUMARMOR) && !HAS_TRAIT(recipient, TRAIT_HEAVYARMOR) && !HAS_TRAIT(recipient, TRAIT_DODGEEXPERT))
			recipient.mind?.adjust_spellpoints(1) // 1 extra spellpoint if you're already arcane
		else
			recipient.mind?.adjust_spellpoints(2) // This lessons the -6 that applies to martial classes by default (currently only pontifex at time of change).
			to_chat(recipient, span_notice("My virtue lessens the limitations of my magical reach."))

/datum/virtue/combat/adamantinebones
	name = "Adamantine Bones"
	desc = "My bones are far stronger than those of others of my species. I am immune to dismemberment."
	added_traits = list(TRAIT_NODISMEMBER)

/datum/virtue/combat/devotee
	name = "Devotee"
	desc = "Though not officially of the Church, my relationship with my chosen Patron is strong enough to grant me the most minor of their blessings. I've also kept a psycross of my deity. Combat-oriented classes get a weaker version of this virtue."
	added_skills = list(/datum/skill/magic/holy = 1)

/datum/virtue/combat/devotee/apply_to_human(mob/living/carbon/human/recipient)
	if (!recipient.mind)
		return
	if (!recipient.devotion)
		// only give non-devotionists orison... and t0 for some reason (this is probably a bad idea)
		var/datum/devotion/new_faith = new /datum/devotion(recipient, recipient.patron)
//		var/datum/patron/our_patron = new_faith.patron
		new_faith.max_devotion = CLERIC_REQ_1 - 20
		new_faith.max_progression = CLERIC_REQ_1 - 20
		recipient.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	else
		// for devotionists, bump up their maximum 1 tier and give them a TINY amount of passive devo gain
		var/datum/devotion/our_faith = recipient.devotion
		our_faith.passive_devotion_gain += 0.15
		switch (our_faith.max_progression)
			if (CLERIC_REQ_0)
				our_faith.max_progression = CLERIC_REQ_1
			if (CLERIC_REQ_1)
				our_faith.max_progression = CLERIC_REQ_2
			if (CLERIC_REQ_2)
				our_faith.max_progression = CLERIC_REQ_3
			if (CLERIC_REQ_3)
				our_faith.max_progression = CLERIC_REQ_4
			if (CLERIC_REQ_4)
				our_faith.passive_devotion_gain += 1
	switch(recipient.patron?.type)
		if(/datum/patron/divine/astrata)
			recipient.mind?.special_items["Astrata Psycross"] = /obj/item/clothing/neck/roguetown/psicross/astrata
		if(/datum/patron/divine/abyssor)
			recipient.mind?.special_items["Abyssor Psycross"] = /obj/item/clothing/neck/roguetown/psicross/abyssor
		if(/datum/patron/divine/dendor)
			recipient.mind?.special_items["Dendor Psycross"] = /obj/item/clothing/neck/roguetown/psicross/dendor
		if(/datum/patron/divine/necra)
			recipient.mind?.special_items["Necra Psycross"] = /obj/item/clothing/neck/roguetown/psicross/necra
		if(/datum/patron/divine/pestra)
			recipient.mind?.special_items["Pestra Psycross"] = /obj/item/clothing/neck/roguetown/psicross/pestra
		if(/datum/patron/divine/eora) 
			recipient.mind?.special_items["Eora Psycross"] = /obj/item/clothing/neck/roguetown/psicross/eora
		if(/datum/patron/divine/noc)
			recipient.mind?.special_items["Noc Psycross"] = /obj/item/clothing/neck/roguetown/psicross/noc
		if(/datum/patron/divine/ravox)
			recipient.mind?.special_items["Ravox Psycross"] =/obj/item/clothing/neck/roguetown/psicross/ravox
		if(/datum/patron/divine/malum)
			recipient.mind?.special_items["Malum Psycross"] = /obj/item/clothing/neck/roguetown/psicross/malum

/*
/datum/virtue/combat/duelist
	name = "Duelist Apprentice"
	desc = "I have trained under a duelist of considerable skill, and always have my trusty rapier close at hand. (+1 to Swords, Up to Expert, Minimum Apprentice)"
	added_stashed_items = list("Rapier" = /obj/item/rogueweapon/sword/rapier)
*/
/*
/datum/virtue/combat/duelist/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/swords) < SKILL_LEVEL_JOURNEYMAN)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/swords, 1, 4))
		handle_skills(recipient)
*/
/datum/virtue/combat/bowman
	name = "Toxophilite"
	desc = "I have studied underneath a bowman of considerable skill, and always have my trusty bow and a quiver of arrows close at hand. (+1 to Bows, Up to Legendary, Minimum Apprentice)"
	added_stashed_items = list("Recurve Bow" = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve,
								"Quiver (Arrows)" = /obj/item/quiver/arrows
	)

/datum/virtue/combat/bowman/apply_to_human(mob/living/carbon/human/recipient)
	if(recipient.mind?.get_skill_level(/datum/skill/combat/bows) < SKILL_LEVEL_JOURNEYMAN)
		recipient.mind?.adjust_skillrank_up_to(/datum/skill/combat/bows, SKILL_LEVEL_APPRENTICE, silent = TRUE)
	else
		added_skills = list(list(/datum/skill/combat/bows, 1, 6))
		handle_skills(recipient)

/datum/virtue/combat/rotcured
	name = "Rotcured"
	desc = "I was once afflicted with the accursed rot, and was cured. It has left me changed: my limbs are weaker, but I feel no pain and have no need to breathe..."
	// below is functionally equivalent to dying and being resurrected via astrata T4 - yep, this is what it gives you.
	added_traits = list(TRAIT_EASYDISMEMBER, TRAIT_NOPAIN, TRAIT_NOPAINSTUN, TRAIT_NOBREATH, TRAIT_TOXIMMUNE, TRAIT_ZOMBIE_IMMUNE, TRAIT_ROTMAN)

/datum/virtue/combat/rotcured/apply_to_human(mob/living/carbon/human/recipient)
	recipient.update_body() // applies the rot skin tone stuff

/datum/virtue/combat/sharp // This *adds* your int to parry chance. With this, defense is a matter of attrition.
	name = "Sentinel of Wits"
	desc = "Whether it's by having an annoying sibling that kept prodding me with a stick, or years of study and observation, I've become adept at both parrying and dodging stronger opponents, by learning their moves and studying them. My own attacks however, still rely on true training of my weapons. \n I convert INT into dodge and parry chance, every 2 INT points above 10 adding 10% additional chance. Does not count artificial buffs to INT from potions or substances."
	added_traits = list(TRAIT_SENTINELOFWITS)
