/datum/virtue/size/giant_feral
	name = "Beastial"
	desc = "I've always been stronger and hardier than the average person, but not the brightest. I tend to lumber around a lot, though... and my un-natural sharp claws or hoofs..."
	added_stats = list(STAT_STRENGTH = 2, STAT_CONSTITUTION = 2, STAT_SPEED = -2, STAT_INTELLIGENCE = -1)
	triumph_cost = 0

/datum/virtue/size/giant_feral/apply_to_human(mob/living/carbon/human/recipient)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/claws)



//-------------

/datum/virtue/size/feral_sorcerer
	name = "Beastial Sorcerer"
	desc = "I've always been stronger and hardier than the average person, but not the brightest.... However my bloodline is blessed with arcana. I tend to lumber around a lot, though... and my un-natural sharp claws or hoofs..."
	added_stats = list(STAT_STRENGTH = 2, STAT_CONSTITUTION = 2, STAT_SPEED = -2)
	triumph_cost = 0

/datum/virtue/size/feral_sorcerer/apply_to_human(mob/living/carbon/human/recipient)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/claws)
	if (!recipient.mind?.get_skill_level(/datum/skill/magic/arcane)) 
		recipient.mind?.adjust_spellpoints(2)
		if (!recipient.mind?.has_spell(/obj/effect/proc_holder/spell/targeted/touch/prestidigitation))
			recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)

//-------------------

/datum/virtue/size/lycan
	name = "Lycanthropic Lineage"
	desc = "Born of the feral bloodline, my frame is broad, my strength immense, and my constitution unmatched. However, my mind is often clouded, a reflection of the wild instincts within. The sharpness of my claws and the deep, resonant howl that escapes my throat speak of the beast that stirs in my soul. The moon calls to me, drawing me closer to my true form, where man and wolf converge in a primal dance of power and fury. Through the gift of transformation and a name that marks my rebirth, I stride between civilization and the wilds, embodying both"
	added_stats = list(STAT_STRENGTH = 3, STAT_CONSTITUTION = 3, STAT_SPEED = -2)

/datum/virtue/size/lycan_male/apply_to_human(mob/living/carbon/human/recipient)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/claws)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/howl/call_of_the_moon)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/cinematic_shapeshift)
/*
/datum/virtue/size/lycan_female
	name = "Lycanthropic Lineage (Female)"
	desc = "Born of the feral bloodline, my frame is broad, my strength immense, and my constitution unmatched. However, my mind is often clouded, a reflection of the wild instincts within. The sharpness of my claws and the deep, resonant howl that escapes my throat speak of the beast that stirs in my soul. The moon calls to me, drawing me closer to my true form, where man and wolf converge in a primal dance of power and fury. Through the gift of transformation and a name that marks my rebirth, I stride between civilization and the wilds, embodying both"
	added_stats = list(STAT_STRENGTH = 3, STAT_CONSTITUTION = 3, STAT_SPEED = -2)

/datum/virtue/size/lycan_female/apply_to_human(mob/living/carbon/human/recipient)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/claws)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/howl/call_of_the_moon)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift/werewolf_f)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/rename_self)
*/
//-------------------------
/*

/datum/virtue/size/lycan_male_sorcerer
	name = "Magical Lycanthropic Lineage (Male)"
	desc = "Born of the feral bloodline, my frame is broad, my strength immense, and my constitution unmatched. Yet, the presence of magic in my veins grants me a touch of clarity and intellect rare among my kind. The sharpness of my claws and the deep, resonant howl that escapes my throat speak of the beast that stirs in my soul. The moon calls to me, its phases unlocking the primal might within, where man, beast, and magic converge in a dance of raw power and mystical energy. Through the gift of transformation and a name that marks my rebirth, I walk the balance between civilization and the wilds, embracing both the savage and the arcane."
	added_stats = list(STAT_STRENGTH = 2, STAT_CONSTITUTION = 1, STAT_SPEED = -3, STAT_INTELLIGENCE = 1)

/datum/virtue/size/lycan_male_sorcerer/apply_to_human(mob/living/carbon/human/recipient)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/claws)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/howl/call_of_the_moon)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift/werewolf_m)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/rename_self)
	if (!recipient.mind?.get_skill_level(/datum/skill/magic/arcane)) 
		recipient.mind?.adjust_spellpoints(2)
		if (!recipient.mind?.has_spell(/obj/effect/proc_holder/spell/targeted/touch/prestidigitation))
			recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)


/datum/virtue/size/lycan_female_sorcerer
	name = "Magical Lycanthropic Lineage (Female)"
	desc = "Born of the feral bloodline, my frame is broad, my strength immense, and my constitution unmatched. Yet, the presence of magic in my veins grants me a touch of clarity and intellect rare among my kind. The sharpness of my claws and the deep, resonant howl that escapes my throat speak of the beast that stirs in my soul. The moon calls to me, its phases unlocking the primal might within, where man, beast, and magic converge in a dance of raw power and mystical energy. Through the gift of transformation and a name that marks my rebirth, I walk the balance between civilization and the wilds, embracing both the savage and the arcane."
	added_stats = list(STAT_STRENGTH = 2, STAT_CONSTITUTION = 1, STAT_SPEED = -3, STAT_INTELLIGENCE = 1)

/datum/virtue/size/lycan_female_sorcerer/apply_to_human(mob/living/carbon/human/recipient)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/claws)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/howl/call_of_the_moon)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift/werewolf_f)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/rename_self)
	if (!recipient.mind?.get_skill_level(/datum/skill/magic/arcane)) 
		recipient.mind?.adjust_spellpoints(2)
		if (!recipient.mind?.has_spell(/obj/effect/proc_holder/spell/targeted/touch/prestidigitation))
			recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)

*/

//-----------
/datum/virtue/size/dragon
	name = "Draconic Lineage"
	desc = "You can transform into a lesser dragon due to your draconic ancestry."

/datum/virtue/size/dragon/apply_to_human(mob/living/carbon/human/recipient)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/claws)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift/dragon_form)

/*

/datum/virtue/size/lycan_female_sorcerer_druid_dragon_m
	name = "Lycanthropic and Draconic Lineage / Druid / (Male)"
	desc = "Blessed by both Mielikki, the goddess of forests and harmony, and Selûne, the goddess of the moon and transformation, I walk a sacred path between the primal and the divine. Mielikki’s touch grants me a deep connection to the natural world, a protector’s heart, and an unwavering sense of balance, while Selûne’s gift unlocks my lycanthropic nature, teaching me to embrace the duality of my soul under her silvery light. My draconic lineage whispers of arcane power and unyielding strength, a fire in my veins tempered by the wisdom of the stars. I am both predator and protector, a creature of both wild instinct and mystical insight, serving as a bridge between the savage wilds and the luminous heavens."
	added_stats = list(STAT_STRENGTH = 2, STAT_CONSTITUTION = 1, STAT_SPEED = -2, STAT_INTELLIGENCE = 1)
	added_stashed_items = list(
		"Quill" = /obj/item/natural/feather,
		"Scroll" = /obj/item/paper/scroll,
		"Book" = /obj/item/book/rogue/playerbook
	)

/datum/virtue/size/lycan_female_sorcerer_druid_dragon_m/apply_to_human(mob/living/carbon/human/recipient)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/claws)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/howl/call_of_the_moon)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift/werewolf_m)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift/dragon_form)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift/wolf_form)
	recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/self/rename_self)

	if (!recipient.mind?.get_skill_level(/datum/skill/magic/arcane)) 
		recipient.mind?.adjust_spellpoints(2)
		if (!recipient.mind?.has_spell(/obj/effect/proc_holder/spell/targeted/touch/prestidigitation))
			recipient.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)


//----------------------

*/
