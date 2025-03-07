/*
/obj/item/baby
	name = "baby"
	desc = "A tiny baby requiring care."
	icon = 'modular_guidesa/dmi_folder/caretaking.dmi'
	icon_state = "furred_baby"
	var/hunger = 100	   // 0 = starving
	var/happiness = 100	// 0 = distressed
	var/cleanliness = 100  // 0 = filthy
	var/next_emote = 0

/obj/item/baby/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)  // For needs decay

/obj/item/baby/process()
	// Needs decay over time
	hunger = max(0, hunger - 0.5)
	cleanliness = max(0, cleanliness - 0.3)
	if(hunger < 30 || cleanliness < 30)
		happiness = max(0, happiness - 1)
	
	// Random emotes
	if(world.time > next_emote)
		perform_random_emote()
		next_emote = world.time + rand(2 MINUTES, 5 MINUTES)

/obj/item/baby/proc/perform_random_emote()
	var/list/emotes = list(
		"coos softly",
		"giggles at nothing",
		"waves their tiny fists",
		"blinks sleepily",
		"yawns cutely",
		"stares around with wide eyes",
		"starts to cry",
		"snuggles into a blanket",
		"plays with their fingers",
		"smiles",
		"makes a gurgling noise",
		"looks around curiously",
		"pouts cutely",
		"stretches their arms"
	)
	
	if(happiness < 50)
		emotes += "fusses restlessly"
	if(hunger < 30)
		emotes += "cries hungrily!"
	if(cleanliness < 30)
		emotes += "whimpers uncomfortably"
	
	visible_message(span_notice("[src] [pick(emotes)]."))

// Interaction System
/obj/item/baby/attack_self(mob/user)
	var/list/options = list(
		"Feed" = image(icon = 'modular_guidesa/dmi_folder/caretaking.dmi', icon_state = "bottle"),
		"Play" = image(icon = 'modular_guidesa/dmi_folder/caretaking.dmi', icon_state = "teddy"),
		"Clean" = image(icon = 'modular_guidesa/dmi_folder/caretaking.dmi', icon_state = "mop")
	)
	
	var/choice = show_radial_menu(user, src, options, radius = 38)
	if(!choice || !user.canUseTopic(src))
		return
	
	switch(choice)
		if("Feed")
			try_breastfeed(user)
		if("Play")
			play_with_baby(user)
		if("Clean")
			clean_baby(user)

// Breastfeeding Implementation
/obj/item/baby/proc/try_breastfeed(mob/user)
	var/mob/living/carbon/human/feeder = user
	if(!istype(feeder))
		return
	
	var/obj/item/organ/breasts/milk_source = feeder.has_breasts()
	if(!milk_source || !milk_source.lactating)
		to_chat(user, span_warning("No lactating breasts available!"))
		return
	
	if(milk_source.milk_stored <= 0)
		to_chat(user, span_warning("[feeder] is out of milk!"))
		return
	
	if(do_after(user, 5 SECONDS, target = feeder))
		var/milk_transfer = min(20, milk_source.milk_stored)
		hunger = min(100, hunger + milk_transfer)
		milk_source.milk_stored -= milk_transfer
		happiness = min(100, happiness + 10)
		user.visible_message(span_notice("[user] breastfeeds [src]."), span_notice("You nurse [src]."))

// Play Interaction
/obj/item/baby/proc/play_with_baby(mob/user)
	if(do_after(user, 3 SECONDS, target = src))
		happiness = min(100, happiness + 15)
		user.visible_message(span_notice("[user] plays with [src]."), span_notice("You entertain [src]."))
		perform_random_emote()

// Clean Interaction
/obj/item/baby/proc/clean_baby(mob/user)
	if(do_after(user, 4 SECONDS, target = src))
		cleanliness = 100
		user.visible_message(span_notice("[user] cleans [src]."), span_notice("You clean [src] thoroughly."))

*/

/obj/item/baby
	name = "baby"
	desc = "A tiny baby requiring care."
	icon = 'modular_guidesa/dmi_folder/caretaking.dmi'
	icon_state = "furred_baby"
	obj_flags = UNIQUE_RENAME
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	dropshrink = 0.75
	var/hunger = 100
	var/happiness = 100
	var/cleanliness = 100
	var/next_emote = 0
	var/static/list/edible_reagents = list(
		/datum/reagent/consumable/milk,
//		/datum/reagent/consumable/babyfood,
//		/datum/reagent/consumable/cream
	)

/obj/item/baby/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/baby/update_icon()
	. = ..()
	add_atom_colour(color, FIXED_COLOUR_PRIORITY)

// Enhanced process with wiggle states
/obj/item/baby/process()
	hunger = max(0, hunger - 0.5)
	cleanliness = max(0, cleanliness - 0.3)
	
	if(hunger < 30 || cleanliness < 30)
		happiness = max(0, happiness - 1.5)
	
	if(world.time > next_emote)
		perform_random_emote()
		next_emote = world.time + rand(90 SECONDS, 150 SECONDS) // More frequent emotes

// Enhanced emotes with name display
/obj/item/baby/proc/perform_random_emote()
	var/list/emotes = list(
		"coos softly",
		"giggles at nothing",
		"waves [p_their()] tiny fists",
		"blinks sleepily",
		"sucks on [p_their()] thumb"
	)
	
	if(happiness < 50)
		emotes += "whines softly"
	if(hunger < 30)
		emotes += "lets out a hungry wail!"
	if(cleanliness < 30)
		emotes += "squirms uncomfortably"
	
	var/emote = pick(emotes)
	visible_message(span_notice("\The [src] [emote]")) // Use definite article for immersion

// Wiggling animation
/obj/item/baby/proc/do_wiggle()
	animate(src, pixel_y = 3, time = 3, easing = SINE_EASING)
	animate(pixel_y = -3, time = 3, easing = SINE_EASING)
	animate(pixel_y = 0, time = 3, easing = SINE_EASING)

// Enhanced feeding system
/obj/item/baby/proc/try_feed(mob/user)
	var/obj/item/reagent_container = user.get_active_held_item()
	
	// Bottle feeding
	if(istype(reagent_container, /obj/item/reagent_containers))
		if(reagent_container.reagents.has_reagent(edible_reagents))
			var/transfer_amount = 15
			if(reagent_container.reagents.remove_reagent(edible_reagents, transfer_amount))
				hunger = min(100, hunger + 20)
				happiness = min(100, happiness + 10)
				do_wiggle()
				user.visible_message(
					span_notice("[user] bottle-feeds [src]."),
					span_notice("You feed [src] with [reagent_container].")
				)
				return TRUE
			else
				to_chat(user, span_warning("[reagent_container] is empty!"))
				return FALSE
				
	// Breastfeeding
	var/mob/living/carbon/human/feeder = user
	if(istype(feeder))
		var/obj/item/organ/breasts/milk_source = feeder.has_breasts()
		if(milk_source?.lactating)
			if(milk_source.milk_stored <= 0)
				to_chat(user, span_warning("[feeder] is out of milk!"))
				return FALSE
			
			if(do_after(user, 4 SECONDS, feeder))
				var/milk_transfer = min(25, milk_source.milk_stored)
				hunger = min(100, hunger + milk_transfer)
				milk_source.milk_stored -= milk_transfer
				happiness += 15
				do_wiggle()
				user.visible_message(
					span_notice("[user] breastfeeds [src]."),
					span_notice("You nurse [src]."))
				return TRUE
	
	to_chat(user, span_warning("No valid food source!"))
	return FALSE

// Enhanced interaction system
/obj/item/baby/attack_self(mob/user)
	var/list/options = list(
		"Feed" = image(icon = 'modular_guidesa/dmi_folder/caretaking.dmi', icon_state = "bottle"),
		"Play" = image(icon = 'modular_guidesa/dmi_folder/caretaking.dmi', icon_state = "teddy"),
		"Clean" = image(icon = 'modular_guidesa/dmi_folder/caretaking.dmi', icon_state = "mop"),
		"Check Status" = image(icon = 'modular_guidesa/dmi_folder/caretaking.dmi', icon_state = "contractsigned")
	)
	
	var/choice = show_radial_menu(user, src, options, radius = 42)
	if(!choice || !user.canUseTopic(src))
		return
	
	switch(choice)
		if("Feed")
			try_feed(user)
		if("Play")
			play_with_baby(user)
		if("Clean")
			clean_baby(user)
		if("Check Status")
			show_status(user)

// Status check with detailed feedback
/obj/item/baby/proc/show_status(mob/user)
	var/status_message = span_info("\The [src]'s status:\n\
		Hunger: [hunger >= 75 ? "Full" : hunger >= 50 ? "Content" : hunger >= 25 ? "Peevish" : "Starving"]\n\
		Mood: [happiness >= 75 ? "Happy" : happiness >= 50 ? "Content" : happiness >= 25 ? "Fussy" : "Distressed"]\n\
		Cleanliness: [cleanliness >= 75 ? "Pristine" : cleanliness >= 50 ? "Tidy" : cleanliness >= 25 ? "Messy" : "Filthy"]")
	
	to_chat(user, status_message)
	do_wiggle()

// Enhanced play interaction
/obj/item/baby/proc/play_with_baby(mob/user)
	if(do_after(user, 3 SECONDS, src))
		happiness = min(100, happiness + 20)
		user.visible_message(
			span_notice("[user] plays peek-a-boo with [src]!"),
			span_notice("You make funny faces at [src]!")
		)
		do_wiggle()
		perform_random_emote()

// Enhanced cleaning
/obj/item/baby/proc/clean_baby(mob/user)
	if(cleanliness > 80)
		to_chat(user, span_warning("[src] is already clean!"))
		return
	
	if(do_after(user, 4 SECONDS, src))
		cleanliness = 100
		happiness = min(100, happiness + 15)
		user.visible_message(
			span_notice("[user] gives [src] a thorough cleaning!"),
			span_notice("You freshen up [src] completely.")
		)
		do_wiggle()

/obj/item/baby/attackby(obj/item/reagent_container, mob/user, params)
	if(istype(reagent_container, /obj/item/reagent_containers))
		handle_container_feeding(reagent_container, user)
		return TRUE
	return ..()

/obj/item/baby/proc/handle_container_feeding(obj/item/reagent_containers/container, mob/user)
	// Check for valid food
	var/datum/reagent/food = null
	for(var/R in edible_reagents)
		if(container.reagents.has_reagent(R))
			food = R
			break
	
	if(!food)
		to_chat(user, span_warning("[container] doesn't contain anything [src] can drink!"))
		return
	
	// Get actual amount
	var/available = container.reagents.get_reagent_amount(food)
	if(available <= 0)
		to_chat(user, span_warning("[container] is empty!"))
		return
	
	// Calculate transfer
	var/feed_amount = min(available, 20, 100 - hunger)
	if(feed_amount <= 0)
		to_chat(user, span_notice("[src] is full!"))
		return
	
	// Feeding interaction
	if(do_after(user, 5 SECONDS, target = src))
		container.reagents.remove_reagent(food, feed_amount)
		hunger = min(100, hunger + feed_amount)
		happiness = min(100, happiness + 5)
		
		// Visual feedback
		do_wiggle()
		user.visible_message(
			span_notice("[user] feeds [src] with [container]."),
			span_notice("You feed [src] with [container]. [hunger >= 90 ? "They look full!" : ""]")
		)
		
		// Special messages
		switch(feed_amount)
			if(0 to 9)
				to_chat(user, span_warning("That wasn't enough milk!"))
			if(10 to 19)
				to_chat(user, span_notice("[src] drinks hungrily."))
			if(20)
				to_chat(user, span_nicegreen("[src] happily empties [container]!"))
