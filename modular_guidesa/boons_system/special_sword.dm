#define STATE_SAFE 			0
#define STATE_MARTYR		1
#define STATE_MARTYRULT		2

/datum/component/martyrweapon
	// Remove allowed_areas and allowed_patrons
	var/cooldown = 5 MINUTES
	var/last_activation = 0
	var/next_activation = 0
	var/end_activation = 0
	var/ignite_chance = 2
	var/traits_applied = list(TRAIT_NOPAINSTUN)
	var/stat_bonus_martyr = 1
	var/mob/living/current_holder
	var/is_active = FALSE
	var/allow_all = TRUE // Enable for everyone
	var/is_activating
	var/current_state = STATE_SAFE
	var/martyr_duration = 6 MINUTES
	var/safe_duration = 9 MINUTES
	var/ultimate_duration = 2 MINUTES
	var/last_time
	// Remove is_dying and death_time

/datum/component/martyrweapon/Initialize()
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(on_equip))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(on_drop))
	RegisterSignal(parent, COMSIG_ITEM_AFTERATTACK, PROC_REF(item_afterattack))
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine))
	START_PROCESSING(SSdcs, src)

/datum/component/martyrweapon/process()
	if(is_active)
		if(world.time > end_activation)
			handle_end()
		else
			var/timer = timehint()
			if(timer == 30 && current_state == STATE_MARTYRULT)
				adjust_stats(STATE_MARTYRULT)

/datum/component/martyrweapon/proc/handle_end()
	deactivate()
	var/mob/living/carbon/C = current_holder
	switch(current_state)
		if(STATE_SAFE)
			to_chat(current_holder, span_notice("The weapon's energies dissipate, your feel your body aching."))
			C.adjustBruteLoss(75)
			C.adjustFireLoss (50)
			C.adjustOxyLoss(65)
			C.freak_out()
		if(STATE_MARTYR)
			to_chat(current_holder, span_notice("The enhanced state subsides, the power makes you weak, your bones ache."))
			C.freak_out()
			C.adjustBruteLoss(125)
			C.adjustFireLoss (75)
			C.adjustOxyLoss(75)
			C.freak_out()
		if(STATE_MARTYRULT)
			to_chat(current_holder, span_notice("The ultimate power fades violently, leaving your body as a wreck. You feel the gods energy leave you."))
			C.freak_out()
			C.adjustBruteLoss(200)
			C.adjustFireLoss (75)
			C.adjustOxyLoss(100)
			C.freak_out()
	// Remove all death-related code

//This gives a countdown to the user, it's pretty hacky
/datum/component/martyrweapon/proc/timehint()
	var/result = round((end_activation - world.time) / 600)	//Minutes
	if(result != last_time && last_time != 30)
		to_chat(current_holder,span_notice("[result + 1] minute[result ? "s" : ""] left."))
		last_time = result
		return result
	if(result == 0)
		var/resultadv = (end_activation - world.time) / 10	//Seconds
		if(resultadv < 30 && resultadv > 27 && last_time != 30)
			to_chat(current_holder,span_notice("30 SECONDS!"))
			last_time = 30
			return 30
		else
			if(resultadv == 10 && last_time != 10)
				to_chat(current_holder,span_crit("10 SECONDS"))
				last_time = resultadv
	return 0

/datum/component/martyrweapon/proc/item_afterattack(obj/item/source, atom/target, mob/user, proximity_flag, click_parameters)
	if(is_active && proximity_flag)
		if(isobj(target))
			target.spark_act()
			target.fire_act()
		else if(isliving(target))
			var/mob/living/M = target
			switch(current_state)
				if(STATE_SAFE)
					return
				if(STATE_MARTYR)
					if(prob(ignite_chance))
						mob_ignite(M)
				if(STATE_MARTYRULT)
					if(prob(ignite_chance))
						mob_ignite(M)
		else
			return
	else
		return

/datum/component/martyrweapon/proc/mob_ignite(mob/target)
	if(isliving(target))
		var/mob/living/M = target
		M.adjust_fire_stacks(5)
		M.IgniteMob()

/datum/component/martyrweapon/proc/on_equip(datum/source, mob/user, slot)
	RegisterSignal(user, COMSIG_CLICK_ALT, PROC_REF(altclick), override = TRUE)
	current_holder = user
	to_chat(user, span_warning("The blade binds to you."))

/datum/component/martyrweapon/proc/altclick(mob/user)
	if(user == current_holder && !is_active && !is_activating)
		var/holding = user.get_active_held_item()
		if(holding == parent)
			if(world.time > next_activation)
				var/choice = alert("Activate weapon powers:","Choose Mode", "Standard", "Enhanced", "Ultimate")
				switch(choice)
					if("Standard")
						is_activating = TRUE
						activate(user, STATE_SAFE)
					if("Enhanced")
						is_activating = TRUE
						activate(user, STATE_MARTYR)
					if("Ultimate")
						is_activating = TRUE
						activate(user, STATE_MARTYRULT)
					else
						return
		else
			to_chat(user, span_info("You must be holding the sword in your active hand!"))
	
//IF it gets dropped, somehow (likely delimbing), turn it off immediately.
/datum/component/martyrweapon/proc/on_drop(datum/source, mob/user)
	if(current_holder == user)
		UnregisterSignal(user, COMSIG_CLICK_ALT)
	if(current_state == STATE_SAFE && is_active)
		deactivate()

	if(current_state == STATE_MARTYR && is_active)
		deactivate()

	if(current_state == STATE_MARTYRULT && is_active)
		deactivate()

/datum/component/martyrweapon/proc/on_examine(datum/source, mob/user, list/examine_list)
	if(current_holder && current_holder == user)
		examine_list += span_notice("It looks to be bound to you. Alt + right click to activate it.")
	if(!is_active && world.time < next_activation)
		var/time = next_activation - world.time
		time = time / 10	//Deciseconds to seconds
		examine_list += span_notice("The time remaining until it is prepared: [round(abs(time) / 60)] minutes.")
	else if(!is_active && world.time > next_activation)
		examine_list += span_notice("It looks ready to be used again.")
	if(is_active)
		examine_list += span_warningbig("It is lit afire by godly energies!")
		if(user == current_holder)
			examine_list += span_warningbig("<i>SLAY THE HERETICS! TAKE THEM WITH YOU!</i>")

/datum/component/martyrweapon/proc/adjust_traits(remove = FALSE)
	for(var/trait in traits_applied)
		if(!remove)
			ADD_TRAIT(current_holder, trait, TRAIT_GENERIC)
		else
			REMOVE_TRAIT(current_holder, trait, TRAIT_GENERIC)

/datum/component/martyrweapon/proc/adjust_stats(state)
	if(current_holder)
		var/mob/living/carbon/human/current_holder
		switch(state)
			if(STATE_SAFE) //Lowered damage due to BURN damage type and SAFE activation
				var/obj/item/I = parent
				I.force = 20
				I.force_wielded = 25
				return		
			if(STATE_MARTYR)
				current_holder.STASTR += stat_bonus_martyr
				current_holder.STASPD += stat_bonus_martyr
				current_holder.STACON += stat_bonus_martyr
				current_holder.STAEND += stat_bonus_martyr
				current_holder.STAINT += stat_bonus_martyr
				current_holder.STAPER += stat_bonus_martyr
				current_holder.STALUC += stat_bonus_martyr
			if(STATE_MARTYRULT)	//This is ONLY accessed during the last 30 seconds of the shorter variant.
				current_holder.STASTR += stat_bonus_martyr + 2
				current_holder.STASPD += stat_bonus_martyr + 2
				current_holder.STACON += stat_bonus_martyr + 2
				current_holder.STAEND += stat_bonus_martyr + 2
				current_holder.STAINT += stat_bonus_martyr + 2
				current_holder.STAPER += stat_bonus_martyr + 2
				current_holder.STALUC += stat_bonus_martyr + 2
				current_holder.visible_message(span_warning("[current_holder] rises up, empowered once more!"), span_warningbig("I rise again! I can feel my god flow through me!"))
				flash_lightning(current_holder)


//This is called regardless of the activated state (safe or not)
/datum/component/martyrweapon/proc/deactivate()
	var/obj/item/I = parent
	is_active = FALSE
	I.damtype = BRUTE
	I.force = initial(I.force)
	I.force_wielded = initial(I.force_wielded)
	I.max_integrity = initial(I.max_integrity)
	I.slot_flags = initial(I.slot_flags)	//Returns its ability to be sheathed
	I.obj_integrity = I.max_integrity
	last_time = null	//Refreshes the countdown tracker

	last_activation = world.time
	next_activation = last_activation + cooldown
	adjust_traits(remove = TRUE)
	adjust_icons(tonormal = TRUE)

/datum/component/martyrweapon/proc/flash_lightning(mob/user)
	for(var/mob/living/carbon/M in viewers(world.view, user))
		M.lightning_flashing = TRUE
		M.update_sight()
		addtimer(CALLBACK(M, TYPE_PROC_REF(/mob/living/carbon, reset_lightning)), 2)
	var/turf/T = get_step(get_step(user, NORTH), NORTH)
	T.Beam(user, icon_state="lightning[rand(1,12)]", time = 5)
	playsound(user, 'sound/magic/lightning.ogg', 100, FALSE)

/datum/component/martyrweapon/proc/lightning_strike_heretics(mob/user)
	for(var/mob/living/carbon/human/M in viewers(world.view, user))
		M.lightning_flashing = TRUE
		M.update_sight()
		addtimer(CALLBACK(M, TYPE_PROC_REF(/mob/living/carbon, reset_lightning)), 2)
		if(istype(M.patron, /datum/patron/inhumen))
			var/turf/T = get_step(get_step(M, NORTH), NORTH)
			T.Beam(M, icon_state="lightning[rand(1,12)]", time = 5)
			M.visible_message(span_warning("[M] gets struck down by the gods!"), span_warning("The gods curse you! You stood too close to one of their devout!"))
			M.electrocution_animation(20)
			mob_ignite(M)
			playsound(M, 'sound/magic/lightning.ogg', 100, FALSE)

/datum/component/martyrweapon/proc/adjust_icons(tonormal = FALSE)
	var/obj/item/I = parent
	if(!tonormal)
		if(current_state == STATE_MARTYR || current_state == STATE_MARTYRULT)
			I.toggle_state = "[initial(I.icon_state)]_ulton"
		else
			I.toggle_state = "[initial(I.icon_state)]_on"
		I.item_state = "[I.toggle_state][I.wielded ? "1" : ""]"
		I.icon_state = "[I.toggle_state][I.wielded ? "1" : ""]"
	else
		I.icon_state = initial(I.icon_state)
		I.item_state = initial(I.item_state)
		I.toggle_state = null
	
	current_holder.regenerate_icons()

//This is called once all the checks are passed and the options are made by the player to commit.
/datum/component/martyrweapon/proc/activate(mob/user, status_flag)
	current_holder.visible_message("[span_notice("[current_holder] begins invoking their Oath!")]", span_notice("You begin to invoke your oath."))
	switch(status_flag)
		if(STATE_MARTYR)
			user.playsound_local(user, 'sound/misc/martyrcharge.ogg', 100, FALSE)
		if(STATE_MARTYRULT)
			user.playsound_local(user, 'sound/misc/martyrultcharge.ogg', 100, FALSE)
	if(do_after(user, 50))
		flash_lightning(user)
		var/obj/item/I = parent
		I.damtype = BURN	//Changes weapon damage type to fire
		I.slot_flags = null	//Can't sheathe a burning sword

		if(status_flag)	//Important to switch this early.
			current_state = status_flag
		adjust_icons()
		switch(current_state)
			if(STATE_SAFE)
				end_activation = world.time + safe_duration	//Only a duration and nothing else.
			if(STATE_MARTYR)
				end_activation = world.time + martyr_duration
			if(STATE_MARTYRULT)
				end_activation = world.time + ultimate_duration
			else
				end_activation = world.time + safe_duration


		is_activating = FALSE
		is_active = TRUE
	else
		is_activating = FALSE
		SEND_SOUND(current_holder, sound(null))

////////////////////
/// Actual Sword ///
///////////////////


/obj/item/rogueweapon/sword/long/martyr
	force = 30
	force_wielded = 36
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/sword/strike, /datum/intent/sword/chop)
	icon_state = "martyrsword"
	icon = 'icons/roguetown/weapons/64.dmi'
	item_state = "martyrsword"
	lefthand_file = 'icons/mob/inhands/weapons/roguemartyr_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/roguemartyr_righthand.dmi'
	name = "blessed sword"
	desc = "A sword from the skies. It simmers with godly energies, and will only yield to the hands of those who have taken the Oath."
	max_blade_int = 200
	max_integrity = 300
	parrysound = "bladedmedium"
	swingsound = BLADEWOOSH_LARGE
	pickup_sound = 'sound/foley/equip/swordlarge2.ogg'
	bigboy = 1
	wlength = WLENGTH_LONG
	gripsprite = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	associated_skill = /datum/skill/combat/swords
	throwforce = 15
	thrown_bclass = BCLASS_CUT
	dropshrink = 1
	smeltresult = /obj/item/ingot/gold
	is_silver = FALSE
	toggle_state = null

/obj/item/rogueweapon/sword/long/martyr/Initialize()
	AddComponent(/datum/component/martyrweapon)
	..()

/obj/item/rogueweapon/sword/long/martyr/Destroy()
	var/datum/component/martyr = GetComponent(/datum/component/martyrweapon)
	if(martyr)
		martyr.RemoveComponent()
	return ..()


/obj/item/rogueweapon/sword/long/martyr/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen") return list("shrink" = 0.6,"sx" = -14,"sy" = -8,"nx" = 15,"ny" = -7,"wx" = -10,"wy" = -5,"ex" = 7,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -13,"sturn" = 110,"wturn" = -60,"eturn" = -30,"nflip" = 1,"sflip" = 1,"wflip" = 8,"eflip" = 1)
			if("onback") return list("shrink" = 0.6,"sx" = -2,"sy" = 3,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 90,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)
			if("wielded") return list("shrink" = 0.7,"sx" = 6,"sy" = -2,"nx" = -4,"ny" = 2,"wx" = -8,"wy" = -1,"ex" = 7,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 15,"sturn" = -200,"wturn" = -160,"eturn" = -25,"nflip" = 8,"sflip" = 8,"wflip" = 0,"eflip" = 0)
			if("onbelt") return list("shrink" = 0.6,"sx" = -2,"sy" = -5,"nx" = 0,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = -3,"ey" = -5,"nturn" = 180,"sturn" = 180,"wturn" = 0,"eturn" = 90,"nflip" = 0,"sflip" = 0,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 1,"eastabove" = 1,"westabove" = 0)



