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

/*/datum/shapeshift_data
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

/datum/shapeshift_data/werewolf
	shape_type = /mob/living/carbon/human/species/werewolf
	transform_sound = 'sound/music/wolfintro.ogg'
	transform_messages = list(
		10 SECONDS = "Your bones begin to ache...",
		25 SECONDS = "Your body contorts violently!",
		35 SECONDS = "You complete your transformation into a werewolf!"
	)


/obj/effect/proc_holder/spell/self/cinematic_shapeshift
	name = "Shapeshift"
	desc = "Transform through painful stages into a new form"
	charge_max = 300
	clothes_req = FALSE
	human_req = TRUE
	range = 0
	include_user = TRUE
	var/datum/shapeshift_data/transformation = new /datum/shapeshift_data/werewolf // Default to werewolf
	var/list/possible_forms = list(
		"Werewolf" = /datum/shapeshift_data/werewolf,

	)

/obj/effect/proc_holder/spell/self/cinematic_shapeshift/cast(mob/user)
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return
	
	if(transformation.transformed)
		restore_form(H)
		return
	
	// Automatically select the user as the target
	begin_transformation(H)

/obj/effect/proc_holder/spell/self/cinematic_shapeshift/proc/begin_transformation(mob/living/carbon/human/H)
	if(!istype(H))
		return
	
	H.visible_message(span_warning("[H] begins to convulse violently!"))
	transformation.transforming = H // Store the mob reference
	playsound(get_turf(H), transformation.transform_sound, 80)
	H.flash_fullscreen("redflash1")
	
	// Debugging: Confirm timers are being set
	world << "DEBUG: Starting transformation timers for [H]."

	// Transformation stages
	addtimer(CALLBACK(src, PROC_REF(transformation_stage_1), H), 10 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(transformation_stage_2), H), 25 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(complete_transformation), H), transformation.transform_time)

/obj/effect/proc_holder/spell/self/cinematic_shapeshift/proc/transformation_stage_1(mob/living/carbon/human/H)
	if(!H || transformation.transforming != H)
		return
	
	// Emote and message for stage 1
	to_chat(H, span_userdanger(transformation.transform_messages[10 SECONDS]))
	H.visible_message("[H] screams in agony as their bones begin to crack and shift!")
	H.emote("scream") // Use a valid emote
	H.Stun(20) // Apply stun
	H.adjustBruteLoss(10) // Physical stress from transformation
	
	world << "[H] has reached stage 1 of transformation." // Debugging

/obj/effect/proc_holder/spell/self/cinematic_shapeshift/proc/transformation_stage_2(mob/living/carbon/human/H)
	if(!H || transformation.transforming != H)
		return
	
	// Emote and message for stage 2
	H.flash_fullscreen("redflash3")
	to_chat(H, span_userdanger(transformation.transform_messages[25 SECONDS]))
	H.visible_message("[H]'s body contorts violently as fur begins to sprout from their skin!")
	H.emote("collapse") // Use a valid emote
	H.Knockdown(30) // Apply knockdown
	H.adjustBruteLoss(20) // Physical stress from transformation
	
	world << "[H] has reached stage 2 of transformation." // Debugging

/obj/effect/proc_holder/spell/self/cinematic_shapeshift/proc/complete_transformation(mob/living/carbon/human/H)
	if(!H || transformation.transforming != H)
		return
	
	// Create new form
	var/mob/living/new_form = new transformation.shape_type(H.loc)
	
	// Store original mob
	new_form.stored_mob = H
	H.forceMove(new_form)
	H.apply_status_effect(STATUS_EFFECT_STASIS)
	
	// Transfer mind and appearance
	if(H.mind)
		H.mind.transfer_to(new_form)
	
	// Visual effects
	new_form.visible_message(span_boldwarning("[H] lets out a deafening howl as they complete their transformation into a monster!"))
	new_form.emote("howl") // Use a valid emote
//	playsound(new_form, 'sound/magic/lightningbolt.ogg', 100)
	new_form.spawn_gibs(FALSE)
	
	// Cleanup
	transformation.transformed = TRUE
	transformation.transforming = null
	world << "[H] has completed the transformation." // Debugging


/obj/effect/proc_holder/spell/self/cinematic_shapeshift/proc/restore_form(mob/living/carbon/human/H)
	if(!H || !transformation.transformed)
		return
	
	var/mob/living/shifted_form = H
	var/mob/living/original_form = shifted_form.stored_mob
	
	if(!original_form)
		return
	
	// Reverse transformation
	original_form.forceMove(get_turf(shifted_form))
	original_form.remove_status_effect(STATUS_EFFECT_STASIS)
	
	if(shifted_form.mind)
		shifted_form.mind.transfer_to(original_form)
	
	original_form.visible_message(span_boldwarning("[shifted_form] reverts to their original form!"))
//	playsound(original_form, 'sound/magic/smoke.ogg', 100)
	original_form.Knockdown(30) // Temporarily paralyze the mob for 30 seconds
	
	qdel(shifted_form)
	transformation.transformed = FALSE
	transformation.transforming = null
	world << "[H] has reverted to their original form." // Debugging
	

// Custom knockdown and stun implementation
/proc/apply_knockdown(mob/living/carbon/human/H, duration)
	if(!H)
		return
	H.visible_message("[H] collapses to the ground, unable to move!")
	H.Knockdown(duration) // Temporarily paralyze the mob for the specified duration
*/
// ========================
// SUPPORTING SYSTEMS
// ========================
/mob/living
	var/mob/stored_mob = null



/obj/effect/proc_holder/spell/self/cinematic_shapeshift
	name = "Shapeshift"
	desc = "Transform into a new form with dramatic effects and a longer delay."
	overlay_state = "wolf_head"
	charge_max = 300
	clothes_req = FALSE
	range = -1
	human_req = TRUE
	var/datum/shapeshift_data/transformation
	var/list/possible_forms = list(
		"Werewolf" = /datum/shapeshift_data/werewolf_male,
		"Werewolf Female" = /datum/shapeshift_data/werewolf_female
	)
	var/transformed = FALSE // Track transformation state on the SPELL, not the datum

/datum/shapeshift_data
	var/mob/living/shape_type
	var/transform_sound = 'sound/music/wolfintro.ogg'
	var/list/transform_messages = list(
		"Your body begins to change violently!",
		"You feel an uncontrollable urge to howl!"
	)

/datum/shapeshift_data/werewolf_male
	shape_type = /mob/living/carbon/human/species/werewolf/male
	transform_sound = 'sound/music/wolfintro.ogg'
	transform_messages = list(
		"Your bones crack and shift as fur sprouts from your skin!",
		"You let out a deafening howl as you transform into a werewolf!"
	)

/datum/shapeshift_data/werewolf_female
	shape_type = /mob/living/carbon/human/species/werewolf/female
	transform_sound = 'sound/music/wolfintro.ogg'
	transform_messages = list(
		"Your bones crack and shift as fur sprouts from your skin!",
		"You let out a deafening howl as you transform into a werewolf!"
	)

// Define stored_mob for werewolf mobs


/obj/effect/proc_holder/spell/self/cinematic_shapeshift/cast(mob/user)
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return
	
	if(transformed) // Check spell's state variable
		restore_form(H)
		return
	
	var/list/form_choices = list()
	for(var/name in possible_forms)
		form_choices[name] = possible_forms[name]
	
	var/selected_form = input(H, "Choose your shapeshift form:", "Shapeshift") as null|anything in form_choices
	if(!selected_form)
		return
	
	// Create NEW instance of the selected datum
	var/selected_type = possible_forms[selected_form]
	transformation = new selected_type()
	
	begin_transformation(H)

/obj/effect/proc_holder/spell/self/cinematic_shapeshift/proc/begin_transformation(mob/living/carbon/human/H)
	H.visible_message(span_warning("[H] begins to convulse violently!"))
	to_chat(H, span_userdanger("Your body begins to change violently!"))
	H.emote("agony", forced = TRUE)
	playsound(get_turf(H), transformation.transform_sound, 100)
	H.flash_fullscreen("redflash1")
	H.Stun(30)
	H.Knockdown(30)
	
	addtimer(CALLBACK(src, .proc/complete_transformation, H), 7 SECONDS)

/obj/effect/proc_holder/spell/self/cinematic_shapeshift/proc/complete_transformation(mob/living/carbon/human/H)
	for(var/message in transformation.transform_messages)
		to_chat(H, span_userdanger("[message]"))
	
	H.visible_message(span_boldwarning("[H] lets out a deafening howl!"))
	H.spawn_gibs(FALSE)
	
	// Create new mob and transfer
	var/mob/living/new_form = new transformation.shape_type(H.loc)
	new_form.stored_mob = H
	H.mind?.transfer_to(new_form) // Transfer mind first
	H.forceMove(new_form) // Hide original mob
	
	new_form.real_name = "Werewolf"
	new_form.name = "Werewolf"
	
	new_form.visible_message(span_boldwarning("The beast has fully transformed!"))
	new_form.emote("rage", forced = TRUE)
	transformed = TRUE // Update SPELL state
	playsound(new_form, 'sound/combat/gib (1).ogg', 100)

/obj/effect/proc_holder/spell/self/cinematic_shapeshift/proc/restore_form(mob/living/carbon/human/H)
	if(!transformed)
		return
	
	var/mob/living/shifted_form = H
	if(!shifted_form.stored_mob)
		return
	
	// Restore original mob
	var/mob/living/original_form = shifted_form.stored_mob
	original_form.forceMove(get_turf(shifted_form))
	shifted_form.mind?.transfer_to(original_form)
	
	shifted_form.spawn_gibs(FALSE)
	original_form.visible_message(span_boldwarning("[shifted_form] reverts to their original form!"))
	playsound(original_form, 'sound/combat/gib (1).ogg', 100)
	H.emote("agony", forced = TRUE)
	qdel(shifted_form)
	H.adjustBruteLoss(70)
	H.adjustFireLoss(50)

	original_form.Stun(30)
	original_form.Knockdown(30)
	transformed = FALSE // Reset SPELL state
