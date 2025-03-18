/datum/status_effect/debuff
	status_type = STATUS_EFFECT_REFRESH

///////////////////////////

/datum/status_effect/debuff/hungryt1
	id = "hungryt1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt1
	effectedstats = list("constitution" = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt1
	name = "Hungry"
	desc = "Hunger weakens this living body."
	icon_state = "hunger1"

/datum/status_effect/debuff/hungryt2
	id = "hungryt2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt2
	effectedstats = list("strength" = -2, "constitution" = -2, "endurance" = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt2
	name = "Hungry"
	desc = "This living body suffers heavily from hunger."
	icon_state = "hunger2"

/datum/status_effect/debuff/hungryt3
	id = "hungryt3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt3
	effectedstats = list("strength" = -5, "constitution" = -3, "endurance" = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt3
	name = "Hungry"
	desc = "My body can barely hold it!"
	icon_state = "hunger3"

//SILVER DAGGER EFFECT

/datum/status_effect/debuff/silver_curse
	id = "silver_curse"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/silver_curse
	effectedstats = list("strength" = -2,"perception" = -2,"intelligence" = -2, "constitution" = -2, "endurance" = -2,"speed" = -2)
	duration = 45 SECONDS

/atom/movable/screen/alert/status_effect/debuff/silver_curse
	name = "Silver Curse"
	desc = "My BANE!"
	icon_state = "hunger3"

////////////////////


/datum/status_effect/debuff/thirstyt1
	id = "thirsty1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt1
	effectedstats = list("endurance" = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt1
	name = "Thirsty"
	desc = "I need water."
	icon_state = "thirst1"

/datum/status_effect/debuff/thirstyt2
	id = "thirsty2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt2
	effectedstats = list("speed" = -1, "endurance" = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt2
	name = "Thirsty"
	desc = "My mouth feels much drier."
	icon_state = "thirst2"

/datum/status_effect/debuff/thirstyt3
	id = "thirsty3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt3
	effectedstats = list("strength" = -1, "speed" = -2, "endurance" = -3)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt3
	name = "Thirsty"
	desc = "I urgently need water!"
	icon_state = "thirst3"

/////////

/datum/status_effect/debuff/uncookedfood
	id = "uncookedfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/uncookedfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER) || HAS_TRAIT(owner, TRAIT_ORGAN_EATER) || HAS_TRAIT(owner, TRAIT_WILD_EATER))
		return ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(100)
	return ..()

/datum/status_effect/debuff/badmeal
	id = "badmeal"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/badmeal/on_apply()
	owner.add_stress(/datum/stressevent/badmeal)
	return ..()

/datum/status_effect/debuff/burnedfood
	id = "burnedfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/burnedfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER))
		return ..()
	owner.add_stress(/datum/stressevent/burntmeal)
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(100)
	return ..()

/datum/status_effect/debuff/rotfood
	id = "rotfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/rotfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER) || HAS_TRAIT(owner, TRAIT_ROT_EATER))
		return ..()
	owner.add_stress(/datum/stressevent/rotfood)
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(200)
	return ..()

/datum/status_effect/debuff/bleeding
	id = "bleedingt1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt1
	effectedstats = list("speed" = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt1
	name = "Dizzy"
	desc = ""
	icon_state = "bleed1"

/datum/status_effect/debuff/bleedingworse
	id = "bleedingt2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt2
	effectedstats = list("strength" = -1, "speed" = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt2
	name = "Faint"
	desc = ""
	icon_state = "bleed2"

/datum/status_effect/debuff/bleedingworst
	id = "bleedingt3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt3
	effectedstats = list("strength" = -3, "speed" = -4)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt3
	name = "Drained"
	desc = ""
	icon_state = "bleed3"

/datum/status_effect/debuff/sleepytime
	id = "sleepytime"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/sleepytime

/atom/movable/screen/alert/status_effect/debuff/sleepytime
	name = "Tired"
	desc = "I should get some rest."
	icon_state = "sleepy"

/datum/status_effect/debuff/muscle_sore
	id = "muscle_sore"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/muscle_sore
	effectedstats = list("strength" = -1, "endurance" = -1)

/atom/movable/screen/alert/status_effect/debuff/muscle_sore
	name = "Muscle Soreness"
	desc = "My muscles need some sleep to recover."
	icon_state = "muscles"

/datum/status_effect/debuff/devitalised
	id = "devitalised"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/devitalised
	effectedstats = list("fortune" = -3)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/debuff/devitalised
	name = "Devitalised"
	desc = "Something has been taken from me, and it will take time to recover."

/datum/status_effect/debuff/vamp_dreams
	id = "sleepytime"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/vamp_dreams

/atom/movable/screen/alert/status_effect/debuff/vamp_dreams
	name = "Insight"
	desc = "With some sleep in a coffin I feel like I could become better."
	icon_state = "sleepy"

/// SURRENDERING DEBUFFS

/datum/status_effect/debuff/breedable
	id = "breedable"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/breedable
	duration = 30 SECONDS

/datum/status_effect/debuff/breedable/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_CRITICAL_RESISTANCE, id)

/datum/status_effect/debuff/breedable/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_CRITICAL_RESISTANCE, id)

/atom/movable/screen/alert/status_effect/debuff/breedable
	name = "Obedient"
	desc = "They won't hurt me too much..."

/datum/status_effect/debuff/submissive
	id = "submissive"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/submissive
	duration = 60 SECONDS

/datum/status_effect/debuff/submissive/on_apply()
	. = ..()
	owner.add_movespeed_modifier("SUBMISSIVE", multiplicative_slowdown = 4)

/datum/status_effect/debuff/submissive/on_remove()
	. = ..()
	owner.remove_movespeed_modifier("SUBMISSIVE")

/atom/movable/screen/alert/status_effect/debuff/submissive
	name = "Compliant"
	desc = "Falling in line is my only choice."

/datum/status_effect/debuff/chilled
	id = "chilled"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/chilled
	effectedstats = list("speed" = -5, "strength" = -2, "endurance" = -2)
	duration = 15 SECONDS

/atom/movable/screen/alert/status_effect/debuff/chilled
	name = "Chilled"
	desc = "I can barely feel my limbs!"
	icon_state = "chilled"

//////////////////////Kaizoku stuff//////////////////

//frozentomb

/datum/status_effect/abyssaltomb //Abyssor-followers should instantly break away from this coffin.
	id = "abyssor_frozen"
	status_type = STATUS_EFFECT_UNIQUE
	duration = -1
	examine_text = "You've been frozen within an abyssal tomb."
	alert_type = /atom/movable/screen/alert/status_effect/frozen
	var/obj/structure/abyssaltomb/tomb
	var/attempts = 0 // special feature that increases difficulty with each failed struggle attempt against the ice coffin. Or that's what I intended for it to be.

/atom/movable/screen/alert/status_effect/frozen
	name = "Abyssal Submission"
	desc = "Imprisoned by frozen tides, beneath the deep blue."
	icon_state = "intomb"
	icon = 'icons/roguetown/kaizoku/misc/screen_alert.dmi'

//Normal Freeze

/atom/movable/screen/alert/status_effect/debuff/freezing //the abyss is cold.
	name = "Abyssal Frostnip"
	desc = "<span class='boldwarning'>Frost-bitten and touched by the ancient god, seeping through time and existence. The god feels, spreads and carves your skin.</span>\n" //that's abyssor.
	icon_state = "freezing"
	icon = 'icons/roguetown/kaizoku/misc/screen_alert.dmi'

/atom/movable/screen/alert/status_effect/debuff/freezing/severe //the abyss is VERY cold.
	name = "Abyssal Frostbite"
	desc = "<span class='boldwarning'>It carries his touch, the cold for those who trespassed his domain. Ice crystals carves patterns upon where he gazes, the stare is on you.</span>\n" //that's abyssor.
	icon_state = "freezing_severe"
	icon = 'icons/roguetown/kaizoku/misc/screen_alert.dmi'

/datum/status_effect/debuff/freezing
	id = "freezing"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/freezing
	duration = 30 SECONDS
	effectedstats = list("speed" = -7, "endurance" = -2)

/datum/status_effect/debuff/freezing/tick()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.adjustOxyLoss(-6, 0) //it will actually allow you to breath underwater.
		if(prob(50))
			C.adjustFireLoss(2)
			C.Jitter(3)

/datum/status_effect/debuff/freezing/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		to_chat(C, "<span class='info'>The frigid spike manifests supernatural cold within me.</span>")

/datum/status_effect/debuff/freezing/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_status_effect(/datum/status_effect/debuff/freezing)
		to_chat(C, "<span class='info'>I feel the suffocating cold vanishing, as body warmth returns to me.</span>")
// severe freezing

/datum/status_effect/debuff/freezing
	id = "freezing"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/freezing/severe
	duration = 30 SECONDS
	effectedstats = list("speed" = -5, "endurance" = -4, "strength" = -2)

/datum/status_effect/debuff/freezing/severe/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		if(C.has_status_effect(/datum/status_effect/debuff/freezing))
			C.remove_status_effect(/datum/status_effect/debuff/freezing)
			to_chat(C, "<span class='info'>The biting cold intensified. Cold, abyssal tendrils roams and invades the surface of my skin.</span>")
		else
			to_chat(C, "<span class='info'>Torturous, carving frost upon my core! It reaches down into my spine in soul-rending agony!</span>")
		return ..()

/datum/status_effect/debuff/freezing/severe/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.apply_status_effect(/datum/status_effect/debuff/freezing)// Allows transition from severe freezing to normal freezing. Your body is warming up.
		to_chat(C, "<span class='info'>The excruciating icy tendrils retreats, leaving behind a bone-chilling cold weighting upon my muscles.</span>")

/datum/status_effect/debuff/freezing/severe/tick()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.adjustOxyLoss(-6, 0) // Same underwater breathing
		if(prob(50))
			C.adjustFireLoss(4)
			C.Jitter(3)
/datum/status_effect/debuff/cold
	id = "Frostveiled"
	alert_type =  /atom/movable/screen/alert/status_effect/debuff/cold
	effectedstats = list("speed" = -2)
	duration = 12 SECONDS

/datum/status_effect/debuff/cold/on_apply()
	. = ..()
	var/mob/living/target = owner
	var/newcolor = rgb(136, 191, 255)
	target.add_atom_colour(newcolor, TEMPORARY_COLOUR_PRIORITY)
	addtimer(CALLBACK(target, TYPE_PROC_REF(/atom, remove_atom_colour), TEMPORARY_COLOUR_PRIORITY, newcolor), 12 SECONDS)

/atom/movable/screen/alert/status_effect/debuff/cold
	name = "Cold"
	desc = "Something has chilled me to the bone! It's hard to move."
	icon_state = "muscles"
// Darkling debuffs
/datum/status_effect/debuff/darkling_glare
	id = "darkling_glare"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/darkling_glare
	effectedstats = list("perception" = -1)
	duration = 10 SECONDS

/atom/movable/screen/alert/status_effect/debuff/darkling_glare
	name = "Eye Strain"
	desc = "My eyes are starting to water, the light burns."
	icon_state = "stressb"

/datum/status_effect/debuff/darkling_migraine
	id = "darkling_migraine"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/darkling_migraine
	effectedstats = list("perception" = -1, "endurance" = -1, "speed" = -1)
	duration = 1 MINUTES

/atom/movable/screen/alert/status_effect/debuff/darkling_migraine
	name = "Migraine"
	icon_state = "muscles"
	desc = "My head is pounding, I need to get away from the light and rest a while!"
