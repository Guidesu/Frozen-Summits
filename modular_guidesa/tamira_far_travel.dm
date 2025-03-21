/obj/structure/tamira_dragon
	name = "Tamira the Bronze Dragon"
	desc = "A friendly bronze dragon offering transport to Neverwinter.\n(Drag your sprite onto Tamira to depart from the game!)"
	icon = 'icons/roguetown/misc/96x96.dmi' // Update with dragon sprite
	icon_state = "Hoardmaster"
	layer = BELOW_OBJ_LAYER
	density = FALSE
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/in_use = FALSE

/obj/structure/tamira_dragon/MouseDrop_T(atom/dropping, mob/user)
	. = ..()
	if(!isliving(user) || user.incapacitated())
		return
	if(!ishuman(dropping))
		return
	if(in_use)
		return
	var/mob/living/carbon/human/departing_mob = dropping
	if(departing_mob != user && departing_mob.client)
		to_chat(user, span_warning("Tamira only accepts willing passengers."))
		return
	if(alert("Have Tamira carry you to Neverwinter? This cannot be undone!", "Dragonflight", "Yes", "No") != "Yes")
		return
	if(user.incapacitated() || QDELETED(departing_mob) || (departing_mob != user && departing_mob.client) || get_dist(src, dropping) > 2 || get_dist(src, user) > 2)
		return
	user.visible_message(span_warning("[user] approaches the bronze dragon."), span_notice("You prepare to climb onto Tamira's back."))
	in_use = TRUE
	if(!do_after(user, 50, target = src))
		in_use = FALSE
		return
	in_use = FALSE
	
	// Visual/Audio effects
	playsound(src, 'sound/effects/dragon_flap.ogg', 100, TRUE)
	icon_state = "tamira_flying" // Change to flying sprite
	alpha = 0 // Become invisible
	addtimer(CALLBACK(src, PROC_REF(reset_dragon)), 300) // 30 second cooldown

	// Original departure logic
	var/dat = "[key_name(user)] departed via Tamira at [AREACOORD(src)]. Inventory: [english_list(departing_mob.contents)]."
	message_admins(dat)
	if(departing_mob.stat == DEAD)
		visible_message(span_notice("Tamira carefully carries [departing_mob]'s body in her talons."))
	else
		visible_message(span_warning("With a mighty beat of her wings, Tamira soars into the sky carrying [departing_mob]!"))
	qdel(departing_mob)

/obj/structure/tamira_dragon/proc/reset_dragon()
	alpha = 255 // Make visible again
	icon_state = initial(icon_state) // Reset to resting sprite
	visible_message(span_notice("Tamira returns from her flight, landing gracefully."))
