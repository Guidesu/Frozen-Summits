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

/obj/effect/proc_holder/spell/self/rename_self/cast(mob/living/user = usr)
	var/new_name = input(user, "Enter your new name:", "Rename Self") as null|text
	if(!user)
		return
	// Prompt the user for a new name
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


/mob/living/carbon/human/species/werewolf/Initialize()
	. = ..()
	// Add skin armor automatically
	skin_armor = new /obj/item/clothing/suit/roguetown/armor/skin_armor/werewolf_skin(src)


// New proc for endurance check
/mob/living/carbon/human/proc/check_endurance_freakout()
	if(STAEND > 15) // STAEND defined in your mob stats
		return
	
	// Freak out effects
	ww_freak_out()

// Freak out proc (you'll need to implement actual effects)
/mob/living/carbon/human/proc/ww_freak_out()
	if(mob_timers["freakout"])
		if(world.time < mob_timers["freakout"] + 10 SECONDS)
			flash_fullscreen("stressflash")
			return
	mob_timers["freakout"] = world.time
	shake_camera(src, 1, 3)
	flash_fullscreen("stressflash")
	changeNext_move(CLICK_CD_EXHAUSTED)
	add_stress(/datum/stressevent/freakout)
	emote("fatigue", forced = TRUE)
	if(hud_used)
		var/matrix/skew = matrix()
		skew.Scale(2)
		var/matrix/newmatrix = skew
		for(var/C in hud_used.plane_masters)
			var/atom/movable/screen/plane_master/whole_screen = hud_used.plane_masters[C]
			if(whole_screen.plane == HUD_PLANE)
				continue
			animate(whole_screen, transform = newmatrix, time = 1, easing = QUAD_EASING)
			animate(transform = -newmatrix, time = 30, easing = QUAD_EASING)
	visible_message(span_warning("[src] screams in terror!"), span_userdanger("The horrific transformation leaves you frozen with fear!"))
	Stun(50)
	Knockdown(50)
	adjustStaminaLoss(30)
	flash_fullscreen("redflash3")
	emote("scream", forced=TRUE)




//-------------------------------------------------------------------------------------------
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
	var/transformed = FALSE

/datum/shapeshift_data
	var/mob/living/shape_type
	var/transform_sound = 'sound/music/wolfintro.ogg'
	var/list/transform_messages = list(
		"Your body begins to change violently!",
		"You feel an uncontrollable urge to roar!"
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

/obj/effect/proc_holder/spell/self/cinematic_shapeshift/cast(mob/user)
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return
	
	if(transformed)
		restore_form(H)
		return
	
	var/list/form_choices = list()
	for(var/name in possible_forms)
		form_choices[name] = possible_forms[name]
	
	var/selected_form = input(H, "Choose your shapeshift form:", "Shapeshift") as null|anything in form_choices
	if(!selected_form)
		return
	
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
	// Final transformation effects
	for(var/message in transformation.transform_messages)
		to_chat(H, span_userdanger("[message]"))
	H.visible_message(span_boldwarning("[H] lets out a deafening howl!"))
	
	// Drop all clothing/items
	for(var/obj/item/W in H)
		H.dropItemToGround(W)
	H.fully_heal(FALSE)
	H.spawn_gibs(FALSE)

	// Create new werewolf form
	var/mob/living/new_form = new transformation.shape_type(H.loc)
	
	// Store original human and apply stasis
	new_form.stored_mob = H
	H.apply_status_effect(STATUS_EFFECT_STASIS)
	H.forceMove(new_form)
	ADD_TRAIT(H, TRAIT_NOSLEEP, TRAIT_GENERIC)
	
	// Transfer mind and identity
	if(H.mind)
		H.mind.transfer_to(new_form)
	new_form.real_name = "Werewolf"
	new_form.name = "Werewolf"
	ADD_TRAIT(new_form, TRAIT_ORGAN_EATER, TRAIT_GENERIC)
	ADD_TRAIT(new_form, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(new_form, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	
	new_form.visible_message(span_boldwarning("The beast has fully transformed!"))
	new_form.emote("rage", forced = TRUE)
	playsound(new_form, 'sound/combat/gib (1).ogg', 100)
	transformed = TRUE

	for(var/mob/living/carbon/human/viewer in viewers(7, new_form))
		if(viewer == new_form)
			continue
		if(viewer.STAEND <= 15)
			viewer.ww_freak_out()

/obj/effect/proc_holder/spell/self/cinematic_shapeshift/proc/restore_form(mob/living/carbon/human/H)
	if(!transformed)
		return
	
	var/mob/living/shifted_form = H
	var/mob/living/carbon/original_form = shifted_form.stored_mob
	
	// Restore original human
	original_form.forceMove(get_turf(shifted_form))
	original_form.remove_status_effect(STATUS_EFFECT_STASIS)
	REMOVE_TRAIT(original_form, TRAIT_NOSLEEP, TRAIT_GENERIC)
	
	// Transfer mind back
	if(shifted_form.mind)
		shifted_form.mind.transfer_to(original_form)
	
	// Cleanup effects
	shifted_form.spawn_gibs(FALSE)
	original_form.visible_message(span_boldwarning("[shifted_form] reverts to their original form!"))
	playsound(original_form, 'sound/combat/gib (1).ogg', 100)
	H.emote("agony", forced = TRUE)
	qdel(shifted_form)
	
	// Apply transformation aftermath
	original_form.Stun(30)
	original_form.Knockdown(30)
	original_form.adjustBruteLoss(70)
	original_form.adjustFireLoss(50)
	transformed = FALSE
//-----------------------------

/mob/living/carbon/human
	var/last_werewolf_regeneration = 0
	var/werewolf_regeneration_cooldown = 300 // 30 seconds in deciseconds

/mob/living/carbon/human/proc/werewolf_regenerate()
	set name = "Devour & Regenerate"
	set category = "IC"
	
	
	// Cooldown check
	if(world.time < last_werewolf_regeneration + werewolf_regeneration_cooldown)
		var/remaining_time = (werewolf_regeneration_cooldown - (world.time - last_werewolf_regeneration))/10
		to_chat(src, span_warning("I need [remaining_time] more seconds before I can regenerate again!"))
		return
	
	// Check for required components in hands
	var/obj/item/main_hand = get_active_held_item()
	var/obj/item/off_hand = get_inactive_held_item()
	var/has_meat = FALSE
	
	// Initial check
	if(istype(main_hand, /obj/item/reagent_containers/food/snacks/rogue/meat) || istype(main_hand, /obj/item/bodypart))
		has_meat = TRUE
	if(istype(off_hand, /obj/item/reagent_containers/food/snacks/rogue/meat) || istype(off_hand, /obj/item/bodypart))
		has_meat = TRUE
	
	if(!has_meat)
		to_chat(src, span_warning("I need fresh meat or flesh in my hands to regenerate!"))
		return
	
	// Windup phase
	to_chat(src, span_danger("I begin devouring the flesh... (Hold still for 5 seconds)"))
	visible_message(span_warning("[src] starts tearing into some flesh with their teeth!"))
	
	if(!do_after(src, 50, target = src, progress = TRUE))
		to_chat(src, span_warning("Regeneration interrupted!"))
		return
	
	// Post-windup validation
	var/obj/item/post_main = get_active_held_item()
	var/obj/item/post_off = get_active_held_item()
	var/still_has_meat = FALSE
	
	if(istype(post_main, /obj/item/reagent_containers/food/snacks/rogue/meat) || istype(post_main, /obj/item/bodypart))
		still_has_meat = TRUE
		qdel(post_main)
	if(istype(post_off, /obj/item/reagent_containers/food/snacks/rogue/meat) || istype(post_off, /obj/item/bodypart))
		still_has_meat = TRUE
		qdel(post_off)
	
	if(!still_has_meat)
		to_chat(src, span_warning("The meat was lost during regeneration!"))
		return
	
	// Execute regeneration
	to_chat(src, span_danger("I ravenously consume the flesh and feel my wounds mend!"))
	visible_message(span_danger("[src]'s wounds close up as they devour the flesh!"))
	playsound(src, 'sound/combat/gib (1).ogg', 100, TRUE)
	
	// Healing effects
	fully_heal()
	regenerate_limbs()
	regenerate_organs()
	blood_volume = BLOOD_VOLUME_NORMAL
