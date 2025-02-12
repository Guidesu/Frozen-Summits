/obj/effect/proc_holder/spell/targeted/shapeshift/werewolf_m // THIS IS FUCKING AWFUL
	name = "Werewolf Form"
	desc = "Call upon the curse of lycanthropy, transforming into a werewolf to unleash primal fury. In this form, you embody the predatory instincts and resilience of the lycanthrope, gaining enhanced physical prowess and feral abilities. While in this state, your actions teeter on the edge of control, driven by the beast within."
	invocation = "RAAAAAAAAAAAAAAAAAAAAAAAAWR!!"
	charge_max = 120 SECONDS
	revert_on_death = TRUE
	die_with_shapeshifted_form = FALSE
	convert_damage = TRUE
	convert_damage_type = BRUTE
	sound = 'sound/combat/gib (1).ogg'
	shapeshift_type = /mob/living/carbon/human/species/werewolf/male

/obj/effect/proc_holder/spell/targeted/shapeshift/werewolf_f
	name = "Werewolf Form"
	desc = "Call upon the curse of lycanthropy, transforming into a werewolf to unleash primal fury. In this form, you embody the predatory instincts and resilience of the lycanthrope, gaining enhanced physical prowess and feral abilities. While in this state, your actions teeter on the edge of control, driven by the beast within."
	invocation = "RAAAAAAAAAARRRRARAAAAAAAAAWR!!"
	charge_max = 120 SECONDS
	revert_on_death = TRUE
	die_with_shapeshifted_form = FALSE
	convert_damage = TRUE
	convert_damage_type = BRUTE
	sound = 'sound/combat/gib (1).ogg'
	shapeshift_type = /mob/living/carbon/human/species/werewolf/female

/obj/effect/proc_holder/spell/targeted/shapeshift/wolf_form
	name = "Wolf Form"
	desc = "Call upon nature to transform yourself into a wolf."
	invocation = "RAAAAAAAAAARRRRARAAAAAAAAAWR!!"
	charge_max = 120 SECONDS
	revert_on_death = TRUE
	die_with_shapeshifted_form = FALSE
	convert_damage = TRUE
	convert_damage_type = BRUTE
	sound = 'sound/combat/gib (1).ogg'
	shapeshift_type = /mob/living/simple_animal/hostile/retaliate/rogue/wolf

/obj/effect/proc_holder/spell/targeted/shapeshift/rat_form
	name = "Rat Form"
	desc = "Call upon nature to transform yourself into a rat."
	invocation = "RAAAAAAAAAARRRRARAAAAAAAAAWR!!"
	charge_max = 120 SECONDS
	revert_on_death = TRUE
	die_with_shapeshifted_form = FALSE
	convert_damage = TRUE
	convert_damage_type = BRUTE
	sound = 'sound/combat/gib (1).ogg'
	shapeshift_type = /mob/living/simple_animal/hostile/retaliate/rogue/bigrat

/obj/effect/proc_holder/spell/targeted/shapeshift/dragon_form
	name = "Dragon Form"
	desc = "Call upon your draconic lineage to transform yourself into a dragon."
	invocation = "RAAAAAAAAAARRRRARAAAAAAAAAWR!!"
	charge_max = 120 SECONDS
	revert_on_death = TRUE
	die_with_shapeshifted_form = FALSE
	convert_damage = TRUE
	convert_damage_type = BRUTE
	sound = 'sound/combat/gib (1).ogg'
	shapeshift_type = /mob/living/simple_animal/hostile/retaliate/rogue/dragon/broodmother/whelp


/obj/effect/proc_holder/spell/self/rename_self
	name = "Rename Self"
	desc = "Allows you to rename yourself. Choose wisely!"
	school = "illusion"
	human_req = FALSE
	clothes_req = FALSE
	charge_max = 120 SECONDS
	miracle = FALSE
	invocation = ""

	cast(mob/living/user = usr)
		if(!user)
			return
		// Prompt the user for a new name
		var/new_name = input(user, "Enter your new name:", "Rename Self") as null|text
		if(!new_name || new_name == "") // If no name is entered, cancel
			to_chat(user, "You decide to stick with your current name.")
			return
		to_chat(user, "You have chosen a new name: [new_name]!")
		user.real_name = new_name // Update the user's actual name



//-----------------------------
/mob/living/simple_animal/hostile/retaliate/rogue/dragon/broodmother/whelp
	health = 350
	maxHealth = 350
	name = "dragon youngling"
	projectiletype = /obj/projectile/magic/aoe/fireball/rogue/great
	projectilesound = 'sound/blank.ogg'
	ranged = 1
	ranged_message = "breathes fire"
	ranged_cooldown_time = 45 SECONDS











// ========================
// CINEMATIC SHAPESHIFT SYSTEM
// ========================

/datum/shapeshift_data
	var/transforming = FALSE
	var/transformed = FALSE
	var/untransforming = FALSE
	var/transform_time = 35 SECONDS
	var/mob/living/shape_type
	var/transform_sound = 'sound/music/wolfintro.ogg'
	var/list/transform_messages = list(
		10 SECONDS = "Your bones begin to ache...",
		25 SECONDS = "Your body contorts violently!",
		35 SECONDS = "You complete your transformation!"
	)

/obj/effect/proc_holder/spell/targeted/cinematic_shapeshift
	name = "Shapeshift"
	desc = "Transform through painful stages into a new form"
	charge_max = 300
	clothes_req = FALSE
	human_req = TRUE
	range = 0
	include_user = TRUE
	var/datum/shapeshift_data/transformation = new
	var/list/possible_forms = list( // Added list of available forms
		"Werewolf" = /mob/living/carbon/human/species/werewolf
	)

/obj/effect/proc_holder/spell/targeted/cinematic_shapeshift/cast(list/targets, mob/user)
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return
	
	if(transformation.transformed)
		restore_form(H)
		return
	
	var/form_choice = input(H, "Choose your transformation form", "Shapeshift") as null|anything in possible_forms
	if(!form_choice)
		return
	
	transformation.shape_type = possible_forms[form_choice]
	begin_transformation(H)

/obj/effect/proc_holder/spell/targeted/cinematic_shapeshift/proc/begin_transformation(mob/living/carbon/human/H)
	H.visible_message(span_warning("[H] begins to convulse violently!"))
	transformation.transforming = world.time
	playsound(get_turf(H), transformation.transform_sound, 80)
	H.flash_fullscreen("redflash1")
	
	// Transformation stages
	addtimer(CALLBACK(src, PROC_REF(transformation_stage), 10 SECONDS))
	addtimer(CALLBACK(src, PROC_REF(transformation_stage), 25 SECONDS))
	addtimer(CALLBACK(src, PROC_REF(complete_transformation), transformation.transform_time))

/obj/effect/proc_holder/spell/targeted/cinematic_shapeshift/proc/transformation_stage()
	if(!transformation.transforming)
		return
	
	var/mob/living/carbon/human/H = transformation.transforming
	switch(world.time - transformation.transforming)
		if(10 SECONDS)
			to_chat(H, span_userdanger("[transformation.transform_messages[10 SECONDS]]"))
			H.emote("scream")
		if(25 SECONDS)
			H.flash_fullscreen("redflash3")
			to_chat(H, span_userdanger("[transformation.transform_messages[25 SECONDS]]"))
			H.Stun(30)
			H.Knockdown(30)

/obj/effect/proc_holder/spell/targeted/cinematic_shapeshift/proc/complete_transformation()
	if(!transformation.transforming)
		return
	
	var/mob/living/carbon/human/H = transformation.transforming
	var/mob/living/new_form = new transformation.shape_type(H.loc)
	
	// Store original mob
	new_form.stored_mob = H
	H.forceMove(new_form)
	H.apply_status_effect(STATUS_EFFECT_STASIS)
	
	// Transfer mind and appearance
	if(H.mind)
		H.mind.transfer_to(new_form)
	
	// Visual effects
	new_form.visible_message(span_boldwarning("[H] transforms into [new_form]!"))
//	playsound(new_form, 'sound/magic/lightningbolt.ogg', 100)
	new_form.spawn_gibs(FALSE)
	
	transformation.transformed = TRUE
	transformation.transforming = FALSE

/obj/effect/proc_holder/spell/targeted/cinematic_shapeshift/proc/restore_form(mob/living/carbon/human/H)
	if(!transformation.transformed)
		return
	
	var/mob/living/shifted_form = H
	var/mob/living/original_form = shifted_form.stored_mob
	
	// Reverse transformation
	original_form.forceMove(get_turf(shifted_form))
	original_form.remove_status_effect(STATUS_EFFECT_STASIS)
	
	if(shifted_form.mind)
		shifted_form.mind.transfer_to(original_form)
	
	original_form.visible_message(span_boldwarning("[shifted_form] reverts to their original form!"))
//	playsound(original_form, 'sound/magic/smoke.ogg', 100)
	original_form.Knockdown(30)
	
	qdel(shifted_form)
	transformation.transformed = FALSE
// ========================
// SUPPORTING SYSTEMS
// ========================
/mob/living
	var/mob/stored_mob = null
