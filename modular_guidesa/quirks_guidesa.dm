// 2-4/(-2) cost for minor game affecting positive and negative quirks
// 5-6/(-4) cost for moderate quirks
// 7-10/(-6)-(-12) cost for major quirks
// 15/(-10)-(-15) cost for quirks that can drastically affect the game

// These values can vary, but this should help establish a standard. 
// Try to keep negatives a lower point gain than positives require, especially if they affect the same thing.*
// *This is to prevent some quirks from being free, especially if they cancel eachother out to a positive degree.

// Keep skill ups to 3, as well.

// If everyone's special, then noone is.

/datum/quirk/elemental_breath_fire
	name = "(Spells) Elemental Breath (Fire Breath)"
	desc = "Harness the elemental fury within you to unleash a breath of scorching fire. This power, often gifted by draconic heritage or a deep elemental connection, allows you to exhale a ball of flames, searing the enemies. Its not not as strong as a true dragon breath, the intensity only embodies a little of your lineage's power, but it requires time to recover after each use."
	value = 4 // Spell

/datum/quirk/elemental_breath_fire/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/elemental_fire_breath)

/obj/effect/proc_holder/spell/invoked/projectile/elemental_fire_breath
	name = "Fire Breath"
	desc = "Using your own body energy or organ, you can use fire breath as a minor weapon."
	clothes_req = FALSE
	range = 8
	projectile_type = /obj/projectile/magic/aoe/fireball/firebolt5e
	overlay_state = "fireball_multi"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE
	releasedrain = 30
	chargedrain = 1
	chargetime = 3
	charge_max = 15 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	cost = 1
	xp_gain = TRUE

/obj/projectile/magic/aoe/fireball/firebolt5e
	name = "fireball"
	exp_heavy = 0
	exp_light = 0
	exp_flash = 1
	exp_fire = -1
	damage = 35
	damage_type = BURN
	nodamage = FALSE
	flag = "magic"
	hitsound = 'sound/blank.ogg'
	aoe_range = 0

//---------------------------------------------

/datum/quirk/elemental_breath_eletricity
	name = "(Spells) Elemental Breath (Lighting Breath)"
	desc = "You can unleash a bolt of lightning from your breath, striking enemies in a straight line. This power comes from your draconic heritage or elemental connection and can only be used occasionally as it takes time to recharge."
	value = 4

/datum/quirk/elemental_breath_eletricity/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)

/datum/quirk/elemental_acid
	name = "(Spells) Elemental Breath (Acid)"
	desc = "You can breath acid. Ouch."
	value = 4

/datum/quirk/elemental_acid/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/acidsplash5e)






//---------------------

/datum/quirk/xenophobic
	name = "(Flavor) Xenophobic"
	desc = "Thoses filthy lesser races, to even look at them makes me feel disgust."
	value = -4 // Makes you get a stress event when examining people who arent your own race. Negated by tolerant, unfortunately.

/datum/quirk/xenophobic/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_XENOPHOBIC, TRAIT_GENERIC)




/datum/quirk/tolerant
	name = "(Flavor) Tolerant"
	desc = "Well, people are alright i guess."
	value = 4

/datum/quirk/tolerant/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_TOLERANT, TRAIT_GENERIC)


/datum/quirk/nosey
	name = "(Flavor/Combat) Nosey"
	desc = "I can grab people by their nose!"
	value = 2 // Barely useful, primarily only after you've won a fight with another player.

/datum/quirk/nosey/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)


/datum/quirk/nutcracker
	name = "(Flavor/Combat) Nutkicker"
	desc = "I can kick people in the nuts and CRACK them... even not having one does not save them from me."
	value = 3

/datum/quirk/nutcracker/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)

/datum/quirk/critical_weakness
	name = "(Flaws) Critically Weak"
	desc = "I am quick to wound, and a fracture on my head would be my doom. "
	value = -20 // An unusual increase to the max of 15 Im aiming for. Only because taking this can literally cause you to instantly die based on RNG.

/datum/quirk/critical_weakness/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)

/datum/quirk/good_trainer
	name = "(Weapons/Skills) Good Trainer"
	desc = "I am good at training people in combat, if they parry my attacks or attack me with their desired weapon they will learn faster than others."
	value = 2 // Keep this low, incentivises rp and sparring.

/datum/quirk/good_trainer/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_GOODTRAINER, TRAIT_GENERIC)

/datum/quirk/one_eye_l
	name = "(Flaws) Bad Eye (Left)"
	desc = "My left eye is bad, wounded, or lost, and thus my vision is bad"
	value = -8

/datum/quirk/one_eye_l/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_CYCLOPS_LEFT, TRAIT_GENERIC)

/datum/quirk/one_eye_r
	name = "(Flaws) Bad Eye (Right)"
	desc = "My Right eye is bad, wounded, or lost, and thus my vision is bad"
	value = -8

/datum/quirk/one_eye_r/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_CYCLOPS_RIGHT, TRAIT_GENERIC)


/datum/quirk/one_eye_both
	name = "(Flaws) Bad Eye (Both)"
	desc = "My both eyes are bad. My vision is really limited."
	value = -16 // 16 cause its both bad eye quirks

/datum/quirk/one_eye_both/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_CYCLOPS_BOTH_EYES, TRAIT_GENERIC)


/datum/quirk/immune_eletricity
	name = "(Virtue) Shock Immunity"
	desc = "Due to my blood heritage, fey magic, or elemental prowess, i am immune to a degree to shocks."
	value = 10

/datum/quirk/immune_eletricity/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_SHOCKIMMUNE, TRAIT_GENERIC)

/* /datum/quirk/seed_knower // Irrelevant quirk. Just having a competent farming level accomplishes this, and you can get that with quirks alone.
	name = "(Virtue) Seed Knower"
	desc = "Due to teachings i had, i know which seed is which when i look at them."
	value = 1

/datum/quirk/seed_knower/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
 */



/datum/quirk/pugilist
	name = "(Combat) Pugilist"
	desc = "I am good at punching people."
	value = 8 // The  dmg increase is huge, shouldnt be low

/datum/quirk/pugilist/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_PUGILIST, TRAIT_GENERIC)




/datum/quirk/bed_breaker
	name = "(Kinky) Bed Breaker"
	desc = "Usually i hurt others really badly in the bed when i want to."
	value = 0

/datum/quirk/bed_breaker/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_DEATHBYSNOOSNOO, TRAIT_GENERIC)

/datum/quirk/strong_throw
	name = "(Combat) Strong Throw"
	desc = "By being big, or knowing how to throw stuff, i can hurl stuffs in a greater force in larger distance."
	value = 2

/datum/quirk/strong_throw/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_STRONGTHROW, TRAIT_GENERIC)



/datum/quirk/martist
	name = "(Combat) Martial Artist"
	desc = "I know martial arts to a degree, and i can use it in battle, like kicks in a better manner."
	value = 6

/datum/quirk/martist/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_MARTIALARTIST, TRAIT_GENERIC)


/datum/quirk/bash_door
	name = "(Feat) Door Basher"
	desc = "Due to my terrifying size or merely my body, i can bash into doors, and break them."
	value = 4

/datum/quirk/bash_door/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_BASHDOORS, TRAIT_GENERIC)

/datum/quirk/silver_bless
	name = "(Feat) Silver Blessed"
	desc = "I was blessed by the moonmaiden since i was little, completing the trial of the forest under her guidance under the moon made me slightly more special than others."
	value = 2

/datum/quirk/silver_bless/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_SILVER_BLESSED, TRAIT_GENERIC)


/datum/quirk/nyctophobia
	name = "(Flaws) Nyctophobia"
	desc = "I fear the dark..."
	value = -6 // Prevents running unless you have a light source, in the dark.
	medical_record_text = "Patient demonstrates a fear of the dark. (Seriously?)"

/datum/quirk/nyctophobia/on_process()
	var/mob/living/carbon/human/H = quirk_holder
	if(H.dna.species.id in list("shadow", "nightmare"))
		return //we're tied with the dark, so we don't get scared of it; don't cleanse outright to avoid cheese
	var/turf/T = get_turf(quirk_holder)
	var/lums = T.get_lumcount()
	if(lums <= 0.2)
		if(quirk_holder.m_intent == MOVE_INTENT_RUN)
			to_chat(quirk_holder, span_warning("Easy, easy, I need to take it slow... I am in the dark..."))
			quirk_holder.toggle_move_intent(MOVE_INTENT_WALK)


/datum/quirk/weird_weapons
	name = "(Weapons) Ritual Weaponary"
	desc = "You have a few less than conventional weapons stashed around."


/datum/quirk/weird_weapons/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.special_items["Bone Scythe"] = /obj/item/rogueweapon/sword/iron/scythe
	H.mind.special_items["Enchanted Iron Sword"] = /obj/item/rogueweapon/sword/iron/cultist_Sword
	H.mind.special_items["Giant Cleaver"] = /obj/item/rogueweapon/sword/iron/cleaver

/datum/quirk/teacher
	name = "(Virtue) Teacher"
	desc = "I can teach others lessons in skills they don't know and i do! Usually would not work at someone who is more skilled at me."
	value = 8 // Free levels with minimal effort for other people.

/datum/quirk/teacher/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/teach)


/datum/quirk/sea_drinker
	name = "(Virtue) - Sea Drinker"
	desc = "As a denizen of the deep, I can drink salty ocean water safely."
	value = 2

/datum/quirk/sea_drinker/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_SEA_DRINKER, TRAIT_GENERIC)

/datum/quirk/student
	name = "(Cosmetic) - Student"
	desc = "I am overwhelmed by all this knowledge... so much to learn!"
	value = 0

/datum/quirk/student/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_STUDENT, TRAIT_GENERIC)

/datum/quirk/bigguy
	name = "(Health) - Big Guy"
	desc = "My immense frame and size allows me to smash through wooden walls and doors, and into people with more effectiveness, and throw them really easily."
	value = 4

/datum/quirk/bigguy/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_BIGGUY, TRAIT_GENERIC)

/datum/quirk/abyssor_swim
	name = "(Virtue) - Blessed Swim"
	desc = "I get far less tired when swimming than my peers."
	value = 4 // Can take a patron to get this anyway

/datum/quirk/abyssor_swim/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_ABYSSOR_SWIM, TRAIT_GENERIC)

/datum/quirk/waterbreathing
	name = "(Virtue) - Water Breathing"
	desc = "I do not drown in bodies of water."
	value = 4

/datum/quirk/waterbreathing/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_WATERBREATHING, TRAIT_GENERIC)

/datum/quirk/guardsman
	name = "(Favored Terrain) - Urban"
	desc = "I am vigilant in my duties. In the town of Frozen Summit, my abilities are sharper due to my routine and familiarity."
	value = 5

/datum/quirk/guardsman/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_GUARDSMAN, TRAIT_GENERIC)

/datum/quirk/woodsman
	name = "(Favored Terrain) - Forest"
	desc = "I am vigilant in my duties. In the grove and coast of Frozen Summit, my abilities are sharper due to my routine and familiarity."
	value = 5

/datum/quirk/woodsman/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_WOODSMAN, TRAIT_GENERIC)

/datum/quirk/underdarkadept
	name = "(Favored Terrain) - Underdark"
	desc = "I've favored the underdark for so long, I know it like the back of my hand."
	value = 5

/datum/quirk/underdarkadept/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_UNDERDARKLING, TRAIT_GENERIC)

/datum/quirk/antiguardsman
	name = "(UnFavored Terrain) - Urban"
	desc = "In the town of Frozen Summit, my abilities are dulled due to unfamiliarity."
	value = -6 // Debuff is stronger than the buff for favored terrain

/datum/quirk/antiguardsman/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_ANTIGUARDSMAN, TRAIT_GENERIC)

/datum/quirk/antiwoodsman
	name = "(UnFavored Terrain) - Forest"
	desc = "In the grove and coast of Frozen Summit, my abilities are dulled due to unfamiliarity."
	value = -6

/datum/quirk/antiwoodsman/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_ANTIWOODSMAN, TRAIT_GENERIC)

/datum/quirk/antiunderdarkadept
	name = "(UnFavored Terrain) - Underdark"
	desc = "There's something about the underdark that just leaves me unsettled and off my game."
	value = -6

/datum/quirk/antiunderdarkadept/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_ANTIUNDERDARKLING, TRAIT_GENERIC)

/datum/quirk/bad_mood
	name = "(Flaw) - Bad Mood"
	desc = "Everything just seems to piss me off."
	value = -8 // Increases stress values. Can result in heart attacks much more easily.

/datum/quirk/bad_mood/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_BAD_MOOD, TRAIT_GENERIC)

/datum/quirk/bready
	name = "(Combat) - Battle Ready"
	desc = "Defensive stance does not passively fatigue me."
	value = 6

/datum/quirk/bready/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_BREADY, TRAIT_GENERIC)

/datum/quirk/mediumarmor
	name = "(Skills) - Medium Armor Proficiency"
	desc = "I can move freely in medium armor."
	value = 6 // Most roles have their relevant armor proficiencies. This lets you break the mold and be tankier, based on what youre going for.

/datum/quirk/mediumarmor/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/quirk/heavyarmor
	name = "(Skills) - Heavy Armor Proficiency"
	desc = "I can move freely in heavy and medium armor."
	value = 12 // Double the cost of medium because it also applies medium armor, too.

/datum/quirk/heavyarmor/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)


/datum/quirk/skeletal_curse
	name = "(Curse) Skeletal Form"
	desc = "Your body has been transformed into an animated skeleton. You require no sustenance and feel no pain, but your brittle bones are fragile. How are you a sentient skeleton? That is up to you decide. Beware Kelemvor paladins."
	value = 0 


/datum/quirk/skeletal_curse/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	
	// Set species traits
	H.dna.species.species_traits |= NOBLOOD
	H.dna.species.soundpack_m = new /datum/voicepack/skeleton()
	H.dna.species.soundpack_f = new /datum/voicepack/skeleton()

	// Limb transformation
	var/static/list/limbs_to_regenerate = list(BODY_ZONE_R_ARM, BODY_ZONE_L_ARM)
	for(var/zone in limbs_to_regenerate)
		var/obj/item/bodypart/O = H.get_bodypart(zone)
		if(O)
			O.drop_limb()
			qdel(O)
		H.regenerate_limb(zone)

	// Sensory changes
	var/obj/item/organ/eyes/old_eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(old_eyes)
		old_eyes.Remove(H, TRUE)
		qdel(old_eyes)
	
	var/obj/item/organ/eyes/new_eyes = new /obj/item/organ/eyes/night_vision/zombie()
	new_eyes.Insert(H)

	// Biological traits
	H.mob_biotypes |= MOB_UNDEAD

	// Trait additions
	ADD_TRAIT(H, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_TOXIMMUNE, TRAIT_GENERIC)

	// Visual transformation
	for(var/obj/item/bodypart/B in H.bodyparts)
		B.skeletonize(FALSE)
	H.update_body()
