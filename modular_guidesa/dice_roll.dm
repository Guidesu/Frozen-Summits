/mob/living/carbon/human/proc/rp_dice_roll()
	set name = "Make Skill Check"
	set category = "IC"
	set desc = "Perform a skill check using D&D inspired mechanics"

	// Define skill list with associated stats
	var/list/skill_choices = list(
		"Athletics (Strength)" = STAT_STRENGTH,
		"Acrobatics (Speed)" = STAT_SPEED,
		"Sleight of Hand (Speed)" = STAT_SPEED,
		"Stealth (Speed)" = STAT_SPEED,
		"Arcana (Intelligence)" = STAT_INTELLIGENCE,
		"History (Intelligence)" = STAT_INTELLIGENCE,
		"Investigation (Perception)" = STAT_PERCEPTION,
		"Nature (Intelligence)" = STAT_INTELLIGENCE,
		"Religion (Intelligence)" = STAT_INTELLIGENCE,
		"Animal Handling (Constitution)" = STAT_CONSTITUTION,
		"Insight (Perception)" = STAT_PERCEPTION,
		"Medicine (Intelligence)" = STAT_INTELLIGENCE,
		"Perception (Perception)" = STAT_PERCEPTION,
		"Survival (Constitution)" = STAT_CONSTITUTION,
		"Deception (Fortune)" = STAT_FORTUNE,
		"Intimidation (Strength)" = STAT_STRENGTH,
		"Performance (Fortune)" = STAT_FORTUNE,
		"Persuasion (Fortune)" = STAT_FORTUNE
	)

	// Select skill from list
	var/chosen_skill = input(src, "Choose a skill to roll:", "Skill Check") as null|anything in skill_choices
	if(!chosen_skill)
		return

	// Get associated stat value
	var/stat_type = skill_choices[chosen_skill]
	var/stat_value = 10 // Default if somehow undefined
	switch(stat_type)
		if(STAT_STRENGTH) stat_value = STASTR
		if(STAT_PERCEPTION) stat_value = STAPER
		if(STAT_INTELLIGENCE) stat_value = STAINT
		if(STAT_CONSTITUTION) stat_value = STACON
		if(STAT_ENDURANCE) stat_value = STAEND
		if(STAT_SPEED) stat_value = STASPD
		if(STAT_FORTUNE) stat_value = STALUC

	// Calculate D&D-style modifier
	var/modifier = FLOOR((stat_value - 10)/2, 1)
/*
	// Animate dice
	var/obj/effect/temp_visual/dice_roll/D = new(get_turf(src))
	D.pixel_x = rand(-8, 8)
	D.pixel_y = rand(-8, 8)
*/
	// Roll with delay for animation
	addtimer(CALLBACK(src, .proc/finish_roll, chosen_skill, modifier), 3 SECONDS)

/mob/living/carbon/human/proc/finish_roll(skill, modifier)
	var/roll = rand(1, 20)
	var/total = roll + modifier
	
	// Sound effects
	if(roll == 20)
		playsound(src, 'modular_guidesa/sounds/success_check.mp3', 50)
	else if(roll == 1)
		playsound(src, 'modular_guidesa/sounds/fail_check.mp3', 50)
	else
		playsound(src, 'modular_guidesa/sounds/regular_check.mp3', 40)

	// Visible result message
	visible_message(span_nicegreen("[src] rolls [roll] + [modifier] for [skill] = [total] !"))

// Dice animation object
/*
/obj/effect/temp_visual/dice_roll
	icon = 'modular_guidesa/dice.dmi'
	icon_state = "dice"
	duration = 6 SECONDS
	layer = ABOVE_HUD_LAYER


/obj/effect/temp_visual/dice_roll/New()
		..()
		// Scale down to 25% size
		transform = matrix().Scale(0.25, 0.25)
		// Fast spinning animation (720 degrees every 0.5 seconds)
		animate(
			src,
			transform = matrix().Scale(0.25, 0.25).Turn(2160),  // 6 full rotations (360*6)
			time = duration,
			easing = LINEAR_EASING,
			flags = ANIMATION_RELATIVE
		)
		// Fade out at the end
		animate(
			alpha = 0,
			time = 1,
			easing = CIRCULAR_EASING
		)
*/
