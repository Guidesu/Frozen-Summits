/datum/reagent/miasmagas
	name = "miasmagas"
	description = "."
	color = "#801E28" // rgb: 128, 30, 40
	taste_description = "ugly"
	metabolization_rate = 1

/datum/reagent/miasmagas/on_mob_life(mob/living/carbon/M)
	if(!HAS_TRAIT(M, TRAIT_NOSTINK))
		M.add_nausea(15)
		M.add_stress(/datum/stressevent/miasmagas)
	return ..()

/datum/reagent/rogueacid
	name = "rogueacid"
	description = "."
	reagent_state = LIQUID
	color = "#5eff00"
	taste_description = "burning"
	self_consuming = TRUE

/datum/reagent/rogueacid/reaction_mob(mob/living/M, method=TOUCH, reac_volume)
	M.adjustFireLoss(35, 0)
	..()

/datum/reagent/phlogiston/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(35, 0)
	..()
	return TRUE

/datum/reagent/blastpowder
	name = "blastpowder"
	description = "."
	color = "#6b0000"
	taste_description = "spicy"
	self_consuming = TRUE


/datum/reagent/fogblight
	name = "fogblight"
	description = "liquid concentrate from fog island's frogs. Used by shinobis."
	taste_description = ""
	reagent_state = LIQUID
	color = "#1f434d"
	metabolization_rate = 0.2

/datum/reagent/fogblight/on_mob_life(mob/living/carbon/M)
	switch(current_cycle)
		if(1 to 10)
			M.confused += 2
			M.drowsyness += 2
		if(10 to 50)
			M.Sleeping(40, 0)
			. = 1
		if(51 to INFINITY)
			M.Sleeping(40, 0)
			M.adjustToxLoss((current_cycle - 50)*REM, 0)
			. = 1
	..()
