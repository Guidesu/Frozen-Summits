/datum/status_effect/buff/offensive_stance
	id = "offensive_stance"
	alert_type = /atom/movable/screen/alert/status_effect/buff/offensive_stance
	effectedstats = list("strength" = 3, "speed" = 2, "endurance" = -1)
	duration = 30 SECONDS
	var/outline_colour = "#ff0000" // Bright red for offensive stance

/atom/movable/screen/alert/status_effect/buff/offensive_stance
	name = "Offensive Stance"
	desc = "You are in an offensive stance, prioritizing power over defense."
	icon_state = "buff"

/datum/status_effect/buff/offensive_stance/on_apply()
	. = ..()
	var/filter = owner.get_filter("offensive_stance_filter")
	to_chat(owner, span_alert("You adopt an offensive stance, focusing on raw power!"))
	owner.visible_message("<span class='info'>[owner] adopts an offensive stance, ready to strike!</span>")
	if (!filter)
		owner.add_filter("offensive_stance_filter", 2, list("type" = "outline", "color" = outline_colour, "alpha" = 200, "size" = 1))
	return TRUE

/datum/status_effect/buff/offensive_stance/on_remove()
	owner.remove_filter("offensive_stance_filter")
	to_chat(owner, span_alert("You leave the offensive stance."))
	owner.visible_message("<span class='info'>[owner] relaxes, leaving their offensive stance.</span>")

//-----------------------------------------------------

/datum/status_effect/buff/defensive_stance
	id = "defensive_stance"
	alert_type = /atom/movable/screen/alert/status_effect/buff/defensive_stance
	effectedstats = list("endurance" = 4, "constitution" = 4, "speed" = -4)
	duration = 30 SECONDS
	var/outline_colour = "#4682b4" // Steel blue for defensive stance

/atom/movable/screen/alert/status_effect/buff/defensive_stance
	name = "Defensive Stance"
	desc = "You are in a defensive stance, prioritizing resilience over speed."
	icon_state = "buff"

/datum/status_effect/buff/defensive_stance/on_apply()
	. = ..()
	var/filter = owner.get_filter("defensive_stance_filter")
	to_chat(owner, span_alert("You adopt a defensive stance, bracing yourself for incoming attacks!"))
	owner.visible_message("<span class='info'>[owner] adopts a defensive stance, preparing to endure attacks!</span>")
	if (!filter)
		owner.add_filter("defensive_stance_filter", 2, list("type" = "outline", "color" = outline_colour, "alpha" = 200, "size" = 1))
	return TRUE

/datum/status_effect/buff/defensive_stance/on_remove()
	owner.remove_filter("defensive_stance_filter")
	to_chat(owner, span_alert("You leave the defensive stance."))
	owner.visible_message("<span class='info'>[owner] relaxes, leaving their defensive stance.</span>")

//----------------------------------------------------------------


/datum/status_effect/buff/balanced_stance
	id = "balanced_stance"
	alert_type = /atom/movable/screen/alert/status_effect/buff/balanced_stance
	effectedstats = list("strength" = 2, "speed" = 2, "endurance" = 2, "constitution" = 2)
	duration = 30 SECONDS
	var/outline_colour = "#32cd32" // Lime green for balanced stance

/atom/movable/screen/alert/status_effect/buff/balanced_stance
	name = "Balanced Stance"
	desc = "You are in a balanced stance, maintaining equilibrium between offense and defense."
	icon_state = "buff"

/datum/status_effect/buff/balanced_stance/on_apply()
	. = ..()
	var/filter = owner.get_filter("balanced_stance_filter")
	to_chat(owner, span_alert("You adopt a balanced stance, ready for anything!"))
	owner.visible_message("<span class='info'>[owner] adopts a balanced stance, prepared for any situation!</span>")
	if (!filter)
		owner.add_filter("balanced_stance_filter", 2, list("type" = "outline", "color" = outline_colour, "alpha" = 200, "size" = 1))
	return TRUE

/datum/status_effect/buff/balanced_stance/on_remove()
	owner.remove_filter("balanced_stance_filter")
	to_chat(owner, span_alert("You leave the balanced stance."))
	owner.visible_message("<span class='info'>[owner] relaxes, leaving their balanced stance.</span>")



//--------------------------------------------



/mob/living
	var/datum/status_effect/active_stance // Track current stance

/obj/effect/proc_holder/spell/self/toggle_stance
	name = "Toggle Stance"
	desc = "Switch between battle stances to adapt to the situation."
	overlay_state = "battle_stance"
	releasedrain = 10
	chargetime = 1
	charge_max = 30 SECONDS
	movement_interrupt = FALSE
	associated_skill = /datum/skill/magic/arcane

/obj/effect/proc_holder/spell/self/toggle_stance/cast(mob/living/user = usr)
	if(!user)
		return FALSE

	// Remove existing stance
	if(user.active_stance)
		qdel(user.active_stance)
		user.active_stance = null

	// Create list of stance choices with human-readable names
	var/list/possible_stances = list(
		"Offensive Stance" = /datum/status_effect/buff/offensive_stance,
		"Defensive Stance" = /datum/status_effect/buff/defensive_stance,
		"Balanced Stance" = /datum/status_effect/buff/balanced_stance
	)

	// Only show menu to humans
	if(ishuman(user))
		var/selected_stance = input(user, "Choose your combat stance:", "Stance Selection") as null|anything in possible_stances
		if(!selected_stance)
			return FALSE // User canceled
		var/stance_type = possible_stances[selected_stance]
		user.active_stance = user.apply_status_effect(stance_type)
		user.visible_message(span_info("[user] assumes [selected_stance]!"), span_notice("You switch to [selected_stance]!"))
	else
		// Fallback for non-human users (optional)
		var/stance_type = pick(possible_stances)
		user.active_stance = user.apply_status_effect(stance_type)
		user.visible_message(span_info("[user] shifts stance!"))

	return TRUE
