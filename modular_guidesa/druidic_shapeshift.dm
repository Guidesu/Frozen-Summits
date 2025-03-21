/obj/effect/proc_holder/spell/self/cinematic_shapeshift_druid
	name = "Druidic Shapeshifting"
	desc = "Channel nature's essence to transform your body through painful metamorphosis into a powerful animal form. Requires deep connection to nature."
	overlay_state = "druidic_shift"
	charge_max = 20 SECONDS
	clothes_req = FALSE
	range = -1
	stat_allowed = 1
	human_req = TRUE
	var/datum/shapeshift_data/transformation
	var/list/possible_forms = list(
		"dire wolf" = /datum/shapeshift_data/druidic/dire_wolf,
		"dire bear" = /datum/shapeshift_data/druidic/dire_bear
	)
	var/transformed = FALSE

/datum/shapeshift_data/druidic
	transform_messages = list(
		"Your body begins to change violently!",
		"You feel an uncontrollable urge to get closer to the nature!"
	)

/datum/shapeshift_data/druidic/dire_wolf
	shape_type = /mob/living/simple_animal/hostile/retaliate/rogue/wolf/dire_wolf
	transform_sound = 'sound/music/wolfintro.ogg'
	transform_messages = list(
		"Your bones crack and shift as fur sprouts from your skin!",
		"You let out a deafening howl as you transform into a dire wolf!"
	)

/datum/shapeshift_data/druidic/dire_bear
	shape_type = /mob/living/simple_animal/hostile/retaliate/rogue/wolf/dire_wolf/dire_bear
	transform_sound = 'sound/music/wolfintro.ogg'
	transform_messages = list(
		"Your bones crack and shift as fur sprouts from your skin!",
		"You let out a deafening roar as you transform into a dire bear!"
	)

/obj/effect/proc_holder/spell/self/cinematic_shapeshift_druid/cast(mob/user)
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return

	var/druidic_level = H.mind?.get_skill_level(/datum/skill/magic/druidic) || 0
	if(druidic_level < 2)
		to_chat(H, span_warning("Your connection to nature is too weak!"))
		revert_cast()
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

/obj/effect/proc_holder/spell/self/cinematic_shapeshift_druid/proc/begin_transformation(mob/living/carbon/human/H)
	H.visible_message(span_warning("[H] begins to convulse violently!"))
	to_chat(H, span_userdanger("Your body begins to change violently!"))
	H.emote("agony", forced = TRUE)
	playsound(get_turf(H), transformation.transform_sound, 100)
	H.flash_fullscreen("redflash1")
	H.Stun(30)
	H.Knockdown(30)
	
	addtimer(CALLBACK(src, .proc/complete_transformation, H), 7 SECONDS)

/obj/effect/proc_holder/spell/self/cinematic_shapeshift_druid/proc/complete_transformation(mob/living/carbon/human/H)
	// Final transformation effects
	for(var/message in transformation.transform_messages)
		to_chat(H, span_userdanger("[message]"))
	H.visible_message(span_boldwarning("[H] lets out a deafening roar!"))
	
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
//	new_form.real_name = "Werewolf"
//	new_form.name = "Werewolf"
	ADD_TRAIT(new_form, TRAIT_ORGAN_EATER, TRAIT_GENERIC)
	ADD_TRAIT(new_form, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(new_form, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	
	new_form.visible_message(span_boldwarning("The druid has fully transformed!"))
	new_form.emote("rage", forced = TRUE)
	playsound(new_form, 'sound/combat/gib (1).ogg', 100)
	transformed = TRUE

	for(var/mob/living/carbon/human/viewer in viewers(7, new_form))
		if(viewer == new_form)
			continue
		if(viewer.STAEND <= 15)
			viewer.ww_freak_out()

/obj/effect/proc_holder/spell/self/cinematic_shapeshift_druid/proc/restore_form(mob/living/carbon/human/H)
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

//Unique druid animals to shapeshift into
/mob/living/simple_animal/hostile/retaliate/rogue/wolf/dire_wolf
	icon = 'modular_guidesa/druidic_animals_64_32.dmi'
	name = "dire wolf"
	icon_state = "direwolf"
	icon_living = "direwolf"
	icon_dead = "direwolf-dead"
	gender = PLURAL
	emote_hear = null
	emote_see = null
	speak_chance = 1
	turns_per_move = 3
	see_in_dark = 6
	move_to_delay = 3
	base_intents = list(/datum/intent/simple/bite)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 2,
						/obj/item/natural/hide = 2,
						/obj/item/natural/fur = 1, /obj/item/natural/bone = 4, /obj/item/alch/sinew = 2, /obj/item/alch/bone = 1, /obj/item/alch/viscera = 1,
						/obj/item/natural/fur = 1, 
						/obj/item/natural/bone = 4,
						/obj/item/natural/head/volf = 1,
						/obj/item/natural/volf_head = 1)
	faction = list("beast")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	health = 300
	maxHealth = 300
	melee_damage_lower = 25
	melee_damage_upper = 45
	vision_range = 7
	aggro_vision_range = 9
	environment_smash = ENVIRONMENT_SMASH_NONE
	retreat_distance = 0
	minimum_distance = 0
	milkies = FALSE
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat, /obj/item/bodypart, /obj/item/organ)
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	STACON = 17
	STASTR = 17
	STASPD = 20
	simple_detect_bonus = 20
	deaggroprob = 0
	defprob = 40
	defdrain = 10
	del_on_deaggro = 44 SECONDS
	retreat_health = 0.3
	food = 0
	attack_sound = list('sound/vo/mobs/vw/attack (1).ogg','sound/vo/mobs/vw/attack (2).ogg','sound/vo/mobs/vw/attack (3).ogg','sound/vo/mobs/vw/attack (4).ogg')
	dodgetime = 30
	aggressive = 1
//	stat_attack = UNCONSCIOUS
	remains_type = /obj/effect/decal/remains/wolf

/mob/living/simple_animal/hostile/retaliate/rogue/wolf/dire_wolf/dire_bear
	icon = 'modular_guidesa/druidic_animals_64x64.dmi'
	name = "dire bear"
	icon_state = "bear"
	icon_living = "bear"
	icon_dead = "bear_dead"
	footstep_type = FOOTSTEP_MOB_HEAVY
	STACON = 20
	STASTR = 20
	STASPD = 10
	health = 700
	maxHealth = 700
	melee_damage_lower = 25
	melee_damage_upper = 75
