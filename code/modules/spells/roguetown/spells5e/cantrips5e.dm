// Notes: When I was thinking about an ultimate magic update. I would have non-cantrip spells be refunded on sleep.
// in DND a wizard must prepare his spells each day. I would also attempt to bring a per-day/per-sleep limit to spells that are of higher level.
// With that in mind, since these spells are ones which are permanently attached to your character (in my head-code)
// these are the ones that don't provide you experience as higher level magic should. These are also meant to damage/utility scale with arcane skill later.
// Please enjoy.

//Contributors:

// ways you can contribute:
// balance damage
// balance cooldowns
// balance stamina loss from spell
// improve visuals
// improve dictation
// improve sound
// improve utility eg. maybe acid splash can skeletonize a limb if casted by a high level mage


//==============================================
//	BLADE WARD
//==============================================
// Notes: You extend your hand and trace a sigil of warding in the air. 
/obj/effect/proc_holder/spell/self/bladeward5e
	name = "Blade Ward"
	desc = ""
	clothes_req = FALSE
	range = 8
	overlay_state = "blade_ward"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE

	releasedrain = 30
	chargedrain = 1
	chargetime = 3
	charge_max = 60 SECONDS //cooldown

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	antimagic_allowed = FALSE //can you use it if you are antimagicked?
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "Manus, Potentis, Paro!"
	invocation_type = "shout" //can be none, whisper, emote and shout
// Notes: Bard, Sorcerer, Warlock, Wizard

/obj/effect/proc_holder/spell/self/bladeward5e/cast(mob/user = usr)
	var/mob/living/target = user
	target.apply_status_effect(/datum/status_effect/buff/bladeward5e)
	ADD_TRAIT(target, TRAIT_BREADY, TRAIT_GENERIC)
	user.visible_message("<span class='info'>[user] traces a warding sigil in the air.</span>", "<span class='notice'>I trace a a sigil of warding in the air.</span>")

/datum/status_effect/buff/bladeward5e
	id = "blade ward"
	alert_type = /atom/movable/screen/alert/status_effect/buff/bladeward5e
	effectedstats = list("constitution" = 2)
	duration = 20 SECONDS
	var/static/mutable_appearance/ward = mutable_appearance('icons/effects/beam.dmi', "purple_lightning", -MUTATIONS_LAYER)

/atom/movable/screen/alert/status_effect/buff/bladeward5e
	name = "Blade Ward"
	desc = "I am resistant to damage."
	icon_state = "buff"

/datum/status_effect/buff/bladeward5e/on_apply()
	. = ..()
	var/mob/living/target = owner
	target.add_overlay(ward)
	target.update_vision_cone()

/datum/status_effect/buff/bladeward5e/on_remove()
	var/mob/living/target = owner
	target.cut_overlay(ward)
	target.update_vision_cone()
	REMOVE_TRAIT(target, TRAIT_BREADY, TRAIT_GENERIC)
	. = ..()

//==============================================
//	BOOMING BLADE
//==============================================
/obj/effect/proc_holder/spell/invoked/boomingblade5e
	name = "Booming Blade"
	overlay_state = "booming_blade"
	releasedrain = 50
	chargetime = 3
	charge_max = 15 SECONDS
	//chargetime = 10
	//charge_max = 30 SECONDS
	range = 6
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = TRUE
	miracle = FALSE

	invocation = "Incertus, Pulcher, Imperio!"
	invocation_type = "shout" //can be none, whisper, emote and shout

/obj/effect/proc_holder/spell/invoked/boomingblade5e/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		var/mob/living/L = target
		var/mob/U = user
		var/obj/item/held_item = user.get_active_held_item() //get held item
		if(held_item)
			held_item.melee_attack_chain(U, L)
			target.apply_status_effect(/datum/status_effect/buff/boomingblade5e/) //apply buff

/datum/status_effect/buff/boomingblade5e
	id = "booming blade"
	alert_type = /atom/movable/screen/alert/status_effect/buff/boomingblade5e
	duration = 10 SECONDS
	var/turf/start_pos
	var/static/mutable_appearance/glow = mutable_appearance('icons/effects/effects.dmi', "empdisable", -MUTATIONS_LAYER)

/datum/status_effect/buff/boomingblade5e/on_apply()
	. = ..()
	var/mob/living/target = owner
	target.add_overlay(glow)
	target.update_vision_cone()
	start_pos = get_turf(target) //set buff starting position

/datum/status_effect/buff/boomingblade5e/on_remove()
	var/mob/living/target = owner
	target.cut_overlay(glow)
	target.update_vision_cone()
	. = ..()

/datum/status_effect/buff/boomingblade5e/tick()
	var/turf/new_pos = get_turf(owner)
	var/startX = start_pos.x
	var/startY = start_pos.y
	var/newX = new_pos.x
	var/newY = new_pos.y
	if(startX != newX || startY != newY)//if target moved
		//explosion
		if(!owner.anti_magic_check())
			boom()
		qdel(src)

/datum/status_effect/buff/boomingblade5e/proc/boom()
	var/exp_heavy = 0
	var/exp_light = 0
	var/exp_flash = 2
	var/exp_fire = 0
	var/damage = 30
	explosion(owner, -1, exp_heavy, exp_light, exp_flash, 0, flame_range = exp_fire)
	owner.adjustBruteLoss(damage)
	owner.visible_message(span_warning("A thunderous boom eminates from [owner]!"), span_danger("A thunderous boom eminates from you!"))

/atom/movable/screen/alert/status_effect/buff/boomingblade5e
	name = "Booming Blade"
	desc = "I feel if I move I am in serious trouble."
	icon_state = "debuff"

//==============================================
//	CONTROL FLAMES
//==============================================
//lame. skip. merge it with on/off

//==============================================
//	CREATE BONFIRE
//==============================================
//Conjure temporary campfire, why not?
/obj/effect/proc_holder/spell/aoe_turf/conjure/createbonfire5e
	name = "Create Bonfire"
	desc = ""
	clothes_req = FALSE
	range = 0
	overlay_state = "bonfire"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE

	releasedrain = 30
	chargedrain = 1
	chargetime = 3
	charge_max = 60 SECONDS //cooldown

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	antimagic_allowed = FALSE //can you use it if you are antimagicked?
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "Facio, Voco, Ferre!"
	invocation_type = "shout" //can be none, whisper, emote and shout

	summon_type = list(
		/obj/machinery/light/rogue/campfire/createbonfire5e
	)
	summon_lifespan = 10 MINUTES
	summon_amt = 1

	action_icon_state = "the_traps"

/obj/machinery/light/rogue/campfire/createbonfire5e
	name = "magical bonfire"
	icon_state = "churchfire1"
	base_state = "churchfire"
	density = FALSE
	layer = 2.8
	brightness = 7
	fueluse = 10 MINUTES
	color = "#6ab2ee"
	bulb_colour = "#6ab2ee"
	cookonme = TRUE
	can_damage = TRUE
	max_integrity = 30

//==============================================
//	DANCING LIGHTS
//==============================================
//lame. skip maybe add later for a dance party or something

//==============================================
//	DECOMPOSE
//==============================================
// Notes: turn a freshly dead body into a rotman
/obj/effect/proc_holder/spell/invoked/decompose5e
	name = "Decompose"
	overlay_state = "decompose"
	releasedrain = 50
	chargetime = 5
	charge_max = 15 SECONDS
	//chargetime = 10
	//charge_max = 30 SECONDS
	range = 6
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = TRUE
	miracle = FALSE

	invocation = "Vita, Mortis, Careo"
	invocation_type = "shout" //can be none, whisper, emote and shout

/obj/effect/proc_holder/spell/invoked/decompose5e/cast(list/targets, mob/living/user)
	if(!isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target == user)
			return FALSE
		var/has_rot = FALSE
		if(iscarbon(target))
			var/mob/living/carbon/stinky = target
			for(var/obj/item/bodypart/bodypart as anything in stinky.bodyparts)
				if(bodypart.rotted || bodypart.skeletonized)
					has_rot = TRUE
					break
		if(has_rot)
			to_chat(user, span_warning("Already rotted."))
			return FALSE
		//do some sounds and effects or something (flies?)
		if(target.mind)
			target.mind.add_antag_datum(/datum/antagonist/zombie)
		target.Unconscious(20 SECONDS)
		target.emote("breathgasp")
		target.Jitter(100)
		var/datum/component/rot/rot = target.GetComponent(/datum/component/rot)
		if(rot)
			rot.amount = 100
		if(iscarbon(target))
			var/mob/living/carbon/stinky = target
			for(var/obj/item/bodypart/rotty in stinky.bodyparts)
				rotty.rotted = TRUE
				rotty.update_limb()
				rotty.update_disabled()
		target.update_body()
		if(HAS_TRAIT(target, TRAIT_ROTMAN))
			target.visible_message(span_notice("[target]'s body rots!"), span_green("I feel rotten!"))
		else
			target.visible_message(span_warning("[target]'s body fails to rot!"), span_warning("I feel no different..."))
		return TRUE
	return FALSE

//==============================================
//	DRUIDCRAFT
//==============================================
//lame. skip

//==============================================
//	ELDRITCH BLAST
//==============================================
// Notes: 
/obj/effect/proc_holder/spell/invoked/projectile/eldritchblast5e
	name = "Eldritch Blast"
	desc = ""
	clothes_req = FALSE
	range = 8
	projectile_type = /obj/projectile/magic/eldritchblast5e
	overlay_state = "e_blast"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE

	releasedrain = 30
	chargedrain = 1
	chargetime = 3
	charge_max = 5 SECONDS //cooldown

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	antimagic_allowed = FALSE //can you use it if you are antimagicked?
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "DOLOR!"
	invocation_type = "shout" //can be none, whisper, emote and shout


/obj/projectile/magic/eldritchblast5e
	name = "eldritch blast"
	tracer_type = /obj/effect/projectile/tracer/stun
	muzzle_type = null
	impact_type = null
	hitscan = TRUE
	movement_type = UNSTOPPABLE
	light_color = LIGHT_COLOR_WHITE
	damage = 55
	damage_type = BURN
	nodamage = FALSE
	speed = 0.3
	flag = "magic"
	light_color = "#ff0000"
	light_range = 7
	knockdown = 1
	drowsy = 1


/obj/projectile/magic/eldritchblast5e/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			visible_message(span_warning("[src] fizzles on contact with [target]!"))
			playsound(get_turf(target), 'sound/magic/magic_nulled.ogg', 100)
			qdel(src)
			return BULLET_ACT_BLOCK
		if(isliving(target))
			var/mob/living/L = target
			if(L.STACON <= 7)
				L.electrocute_act(3, src)
			else
				L.electrocute_act(2, src)
	qdel(src)


//==============================================
//	ENCODE THOUGHTS
//==============================================
//Fine. I'll add it.
/obj/effect/proc_holder/spell/targeted/encodethoughts5e
	name = "Encode Thoughts"
	desc = "Latch onto the mind of one who is nearby, weaving a particular thought into their mind."
	name = "Encode Thoughts"
	overlay_state = "e_thought"
	releasedrain = 25
	chargetime = 1
	charge_max = 10 SECONDS
	//chargetime = 10
	//charge_max = 30 SECONDS
	range = 6
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "susurrus"
	invocation_type = "whisper" //can be none, whisper, emote and shout
	include_user = FALSE

/obj/effect/proc_holder/spell/targeted/encodethoughts5e/cast(list/targets, mob/user)
	. = ..()
	for(var/mob/living/carbon/C in targets)
		if(!C)
			return
		var/message = stripped_input(user, "What thought do you wish to weave into [C]'s mind?")
		if(!message)
			return
		to_chat(C, "Your mind thinks to itself: </span><font color=#7246ff>\"[message]\"</font>")
		to_chat(user, "I pluck the strings of [C]'s mind")
		log_game("[key_name(user)] sent a thought to [key_name(C)] with contents [message]")
		return TRUE
	to_chat(user, span_warning("I wasn't able to find a mind to weave here."))
	revert_cast()

//==============================================
//	FIRE BOLT
//==============================================
// Notes: 

/obj/effect/proc_holder/spell/invoked/projectile/firebolt5e
	name = "Fire Bolt"
	desc = ""
	clothes_req = FALSE
	range = 8
	projectile_type = /obj/projectile/magic/aoe/fireball/firebolt5e
	overlay_state = "f_bolt"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE
	releasedrain = 30
	chargedrain = 1
	chargetime = 3
	charge_max = 3 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	cost = 1
	xp_gain = TRUE

/obj/projectile/magic/aoe/fireball/firebolt5e
	name = "fireball"
	exp_heavy = 0
	exp_light = 0
	exp_flash = 1
	exp_fire = -1
	damage = 20
	damage_type = BURN
	nodamage = FALSE
	flag = "magic"
	hitsound = 'sound/blank.ogg'
	aoe_range = 0

//==============================================
//	FRIENDS
//==============================================
//lame. skip. You aren't going to get a player to become friendly.

//==============================================
//	FROSTBITE
//==============================================
/obj/effect/proc_holder/spell/invoked/frostbite5e
	name = "Frostbite"
	overlay_state = "frostbite"
	releasedrain = 50
	chargetime = 1
	charge_max = 25 SECONDS
	//chargetime = 10
	//charge_max = 30 SECONDS
	range = 6
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "Glacius!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	
/obj/effect/proc_holder/spell/invoked/frostbite5e/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.apply_status_effect(/datum/status_effect/buff/frostbite5e/) //apply debuff
		target.adjustFireLoss(12) //damage
		target.adjustBruteLoss(12)

/datum/status_effect/buff/frostbite5e
	id = "coldness"
	alert_type = /atom/movable/screen/alert/status_effect/buff/frostbite5e
	duration = 60 SECONDS
	var/static/mutable_appearance/frost = mutable_appearance('icons/roguetown/mob/coldbreath.dmi', "breath_m", ABOVE_ALL_MOB_LAYER)
	effectedstats = list("speed" = -3)

/atom/movable/screen/alert/status_effect/buff/frostbite5e
	name = "Coldness"
	desc = "I can feel myself slowing down."
	icon_state = "debuff"

/datum/status_effect/buff/frostbite5e/on_apply()
	. = ..()
	var/mob/living/target = owner
	target.add_overlay(frost)
	target.update_vision_cone()


/datum/status_effect/buff/frostbite5e/on_remove()
	var/mob/living/target = owner
	target.cut_overlay(frost)
	target.update_vision_cone()
	. = ..()

//==============================================
//	GREEN-FLAME BLADE
//==============================================
/obj/effect/proc_holder/spell/invoked/greenflameblade5e
	name = "Green-Flame Blade"
	overlay_state = "fireblade"
	releasedrain = 50
	chargetime = 3
	charge_max = 10 SECONDS
	//chargetime = 10
	//charge_max = 30 SECONDS
	range = 6
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "gladius!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	
/obj/effect/proc_holder/spell/invoked/greenflameblade5e/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		var/mob/living/L = target
		var/mob/U = user
		var/obj/item/held_item = user.get_active_held_item() //get held item
		var/aoe_range = 1
		if(held_item)
			held_item.melee_attack_chain(U, L)
			L.adjustFireLoss(15) //burn target
			playsound(target, 'sound/items/firesnuff.ogg', 100)
			//burn effect and sound
			for(var/mob/living/M in range(aoe_range, get_turf(target))) //burn non-user mobs in an aoe
				if(!M.anti_magic_check())
					if(M != user)
						M.adjustFireLoss(15) //burn target
						//burn effect and sound
						new /obj/effect/temp_visual/acidsplash5e(get_turf(M))
						playsound(M, 'sound/items/firelight.ogg', 100)

/obj/effect/temp_visual/greenflameblade5e
	icon = 'icons/effects/fire.dmi'
	icon_state = "1"
	name = "green-flame"
	desc = "Magical fire. Interesting."
	randomdir = FALSE
	duration = 1 SECONDS
	layer = ABOVE_ALL_MOB_LAYER

//==============================================
//	GUIDANCE
//==============================================
/obj/effect/proc_holder/spell/targeted/guidance5e
	name = "Guidance"
	overlay_state = "guidance"
	releasedrain = 50
	chargetime = 1
	charge_max = 30 SECONDS
	//chargetime = 10
	//charge_max = 30 SECONDS
	range = 6
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "Scio, Didici, Pecto"
	invocation_type = "shout" //can be none, whisper, emote and shout
	include_user = FALSE

/obj/effect/proc_holder/spell/targeted/guidance5e/cast(list/targets, mob/living/user)
	for(var/mob/living/carbon/C in targets)
		var/datum/status_effect/buff/guidance5e/G = new /datum/status_effect/buff/guidance5e/
		C.apply_status_effect(G) //apply buff
		to_chat(C, span_info("You are illuminated by [user]'s guiding light."))
		C.visible_message(span_info("[C] is illuminated by a guiding presence!"), span_info("You begin to guide [C]."))

/datum/status_effect/buff/guidance5e
	id = "guidance"
	alert_type = /atom/movable/screen/alert/status_effect/buff/guidance5e
	duration = 30 SECONDS
	effectedstats = list("intelligence" = 2)
	var/static/mutable_appearance/guided = mutable_appearance('icons/effects/effects.dmi', "blessed")
	var/mob/living/carbon/giver

/datum/status_effect/buff/guidance5e/on_apply()
	. = ..()
	var/mob/living/target = owner
	target.add_overlay(guided)
	target.update_vision_cone()

/datum/status_effect/buff/guidance5e/on_remove()
	var/mob/living/target = owner
	target.cut_overlay(guided)
	target.update_vision_cone()
	. = ..()

/atom/movable/screen/alert/status_effect/buff/guidance5e
	name = "Guidance"
	desc = "Someone is guiding me."
	icon_state = "buff"

//==============================================
//	GUST
//==============================================
//lame. skip. Kinda boring tbh. Might add later

//==============================================
//	HAND OF RADIANCE
//==============================================
//lame. skip. Without the ability to choose enemies real time not really viable an aoe like this. Maybe would be good as an aoe flash. Might add later

//==============================================
//	INFESTATION
//==============================================
/obj/effect/proc_holder/spell/invoked/infestation5e
	name = "Infestation"
	overlay_state = "infestation"
	invocation = "Infesta!"
	invocation_type = "shout"
	releasedrain = 50
	chargetime = 3
	charge_max = 20 SECONDS
	//chargetime = 10
	//charge_max = 30 SECONDS
	range = 8
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "olath ilhar zud'dar dos!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	
/obj/effect/proc_holder/spell/invoked/infestation5e/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.visible_message(span_warning("[target] is surrounded by a cloud of crawling things!"), span_notice("You surround [target] in a cloud of crawling things!"))
		target.apply_status_effect(/datum/status_effect/buff/infestation5e/) //apply debuff

/datum/status_effect/buff/infestation5e
	id = "infestation"
	alert_type = /atom/movable/screen/alert/status_effect/buff/infestation5e
	duration = 15 SECONDS
	effectedstats = list("constitution" = -2)
	var/static/mutable_appearance/rotten = mutable_appearance('icons/roguetown/mob/rotten.dmi', "rotten")

/datum/status_effect/buff/infestation5e/on_apply()
	. = ..()
	var/mob/living/target = owner
	to_chat(owner, span_danger("I am suddenly surrounded by a cloud of crawling things!"))
	target.Jitter(20)
	target.add_overlay(rotten)
	target.update_vision_cone()

/datum/status_effect/buff/infestation5e/on_remove()
	var/mob/living/target = owner
	target.cut_overlay(rotten)
	target.update_vision_cone()
	. = ..() 

/datum/status_effect/buff/infestation5e/tick()
	var/mob/living/target = owner
	var/mob/living/carbon/M = target
	target.adjustToxLoss(2)
	target.adjustBruteLoss(1)
	var/prompt = pick(1,2,3)
	var/message = pick(
		"Ticks on my skin start to engorge with blood!",
		"Flies are laying eggs in my open wounds!",
		"Something crawled in my ear!",
		"There are too many bugs to count!",
		"They're trying to get under my skin!",
		"Make it stop!",
		"Millipede legs tickle the back of my ear!",
		"Fire ants bite at my feet!",
		"A wasp sting right on the nose!",
		"Cockroaches scurry across my neck!",
		"Maggots slimily wriggle along my body!",
		"Beetles crawl over my mouth!",
		"Fleas bite my ankles!",
		"Gnats buzz around my face!",
		"Lice suck my blood!",
		"Crickets chirp in my ears!",
		"Earwigs crawl into my ears!")
	if(prompt == 1)
		M.add_nausea(pick(10,20))
		to_chat(target, span_warning(message))
		owner.playsound_local(get_turf(owner), 'sound/surgery/organ2.ogg', 35, FALSE, pressure_affected = FALSE)

/atom/movable/screen/alert/status_effect/buff/infestation5e
	name = "Infestation"
	desc = "Pestilent vermin bite and chew at my skin."
	icon_state = "debuff"

//==============================================
//	LIGHT
//==============================================
/obj/effect/proc_holder/spell/self/light5e
	name = "Light"
	overlay_state = "light"
	releasedrain = 50
	chargetime = 1
	charge_max = 30 SECONDS
	//chargetime = 10
	//charge_max = 30 SECONDS
	range = 2
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "Lux!"
	invocation_type = "shout" //can be none, whisper, emote and shout

	var/obj/item/item
	var/item_type = /obj/item/flashlight/flare/light5e
	var/delete_old = TRUE //TRUE to delete the last summoned object if it's still there, FALSE for infinite item stream weeeee

/obj/effect/proc_holder/spell/self/light5e/cast(list/targets, mob/user = usr)
	if (delete_old && item && !QDELETED(item))
		QDEL_NULL(item)
	if(user.dropItemToGround(user.get_active_held_item()))
		user.put_in_hands(make_item(), TRUE)
		user.visible_message(span_info("An orb of light condenses in [user]'s hand!"), span_info("You condense an orb of pure light!"))

/obj/effect/proc_holder/spell/self/light5e/Destroy()
	if(item)
		qdel(item)
	return ..()

/obj/effect/proc_holder/spell/self/light5e/proc/make_item()
	item = new item_type
	var/mutable_appearance/magic_overlay = mutable_appearance('icons/obj/projectiles.dmi', "gumball")
	item.add_overlay(magic_overlay)
	return item

/obj/item/flashlight/flare/light5e
	name = "condensed light"
	desc = "An orb of condensed light."
	w_class = WEIGHT_CLASS_NORMAL
	light_range = 10
	light_color = LIGHT_COLOR_WHITE
	force = 10
	icon = 'icons/roguetown/rav/obj/cult.dmi'
	icon_state = "sphere0"
	item_state = "sphere0"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	light_color = "#ffffff"
	on_damage = 10
	flags_1 = null
	possible_item_intents = list(/datum/intent/use)
	slot_flags = ITEM_SLOT_HIP
	var/datum/looping_sound/torchloop/soundloop
	max_integrity = 200
	fuel = 10 MINUTES
	light_depth = 0
	light_height = 0

/obj/item/flashlight/flare/light5e/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -9,"sy" = 3,"nx" = 12,"ny" = 4,"wx" = -6,"wy" = 5,"ex" = 3,"ey" = 6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 2,"sturn" = 2,"wturn" = -2,"eturn" = -2,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/flashlight/flare/light5e/Initialize()
	. = ..()
	soundloop = new(list(src), FALSE)
	on = TRUE
	START_PROCESSING(SSobj, src)

/obj/item/flashlight/flare/light5e/update_brightness(mob/user = null)
	..()
	item_state = "[initial(item_state)]"

/obj/item/flashlight/flare/light5e/process()
	item_state = "[initial(item_state)]"
	on = TRUE
	update_brightness()
	open_flame(heat)
	if(!fuel || !on)
		//turn_off()
		STOP_PROCESSING(SSobj, src)
		if(!fuel)
			item_state = "[initial(item_state)]"
		return
	if(!istype(loc,/obj/machinery/light/rogue/torchholder))
		if(!ismob(loc))
			if(prob(23))
				//turn_off()
				STOP_PROCESSING(SSobj, src)
				return

/obj/item/flashlight/flare/light5e/turn_off()
	playsound(src.loc, 'sound/items/firesnuff.ogg', 100)
	soundloop.stop()
	STOP_PROCESSING(SSobj, src)
	..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_hands()
		M.update_inv_belt()
	damtype = BRUTE
	Destroy(src)

/obj/item/flashlight/flare/light5e/fire_act(added, maxstacks)
	if(fuel)
		if(!on)
			playsound(src.loc, 'sound/items/firelight.ogg', 100)
			on = TRUE
			damtype = BURN
			update_brightness()
			force = on_damage
			soundloop.start()
			if(ismob(loc))
				var/mob/M = loc
				M.update_inv_hands()
			START_PROCESSING(SSobj, src)
			return TRUE
	..()

/obj/item/flashlight/flare/light5e/afterattack(atom/movable/A, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(on)
		if(prob(50) || (user.used_intent.type == /datum/intent/use))
			if(ismob(A))
				A.spark_act()
			else
				A.fire_act(3,3)

/obj/item/flashlight/flare/light5e/spark_act()
	fire_act()

/obj/item/flashlight/flare/light5e/get_temperature()
	if(on)
		return FIRE_MINIMUM_TEMPERATURE_TO_SPREAD
	return ..()

/obj/item/flashlight/flare/light5e/update_brightness(mob/user = null)
	..()
	if(on)
		item_state = "[initial(item_state)]"
	else
		item_state = "[initial(item_state)]"

//==============================================
//	LIGHTNING LURE
//==============================================

/obj/effect/proc_holder/spell/targeted/lightninglure5e
	name = "Lightning Lure"
	overlay_state = "lure"
	releasedrain = 50
	chargetime = 1
	charge_max = 5 SECONDS
	range = 3
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = ""
	invocation_type = "shout" //can be none, whisper, emote and shout
	include_user = FALSE

	var/delay = 3 SECONDS
	var/sprite_changes = 10
	var/datum/beam/current_beam = null

/obj/effect/proc_holder/spell/targeted/lightninglure5e/cast(list/targets, mob/user = usr)
	for(var/mob/living/carbon/C in targets)
		user.visible_message(span_warning("[C] is connected to [user] with a lightning lure!"), span_warning("You create a static link with [C]."))
		playsound(user, 'sound/items/stunmace_gen (2).ogg', 100)

		var/x 
		for(x=1; x < sprite_changes; x++)
			current_beam = new(user,C,time=30/sprite_changes,beam_icon_state="lightning[rand(1,12)]",btype=/obj/effect/ebeam, maxdistance=10)
			INVOKE_ASYNC(current_beam, TYPE_PROC_REF(/datum/beam, Start))
			sleep(delay/sprite_changes)

		var/dist = get_dist(user, C)
		if (dist <= range)
			C.electrocute_act(1, user) //just shock	
			//var/atom/throw_target = get_step(user, get_dir(user, C))
			//C.throw_at(throw_target, 100, 2) //from source material but kinda op.
		else
			playsound(user, 'sound/items/stunmace_toggle (3).ogg', 100)
			user.visible_message(span_warning("The lightning lure fizzles out!"), span_warning("[C] is too far away!"))
			
//==============================================
//	MAGE HAND
//==============================================
//lame. skip. Same functionality as on/off which I intend to add later.

//==============================================
//	MAGIC STONE
//==============================================
/obj/effect/proc_holder/spell/invoked/magicstone5e
	name = "Magic Stone"
	overlay_state = "rune1"
	releasedrain = 50
	chargetime = 10
	charge_max = 30 SECONDS
	range = 6
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "Facio, Voco, Ferre!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	var/magic_color = "#c8daff"

/obj/effect/proc_holder/spell/invoked/magicstone5e/cast(list/targets, mob/living/user)
	if(istype(targets[1], /obj/item/natural/stone))
		var/obj/item/natural/stone/S = targets[1]
		if (!S.magicstone)
			to_chat(user, "<span class='info'>[S] is infused with magical energy!</span>")
			S.name = "magic "+S.name
			S.force *= 1.5 //ouchy
			S.throwforce *= 1.5 //ouchy
			S.color = magic_color
			S.magicstone = TRUE
			var/mutable_appearance/magic_overlay = mutable_appearance('icons/effects/effects.dmi', "electricity")
			//PLAY A SOUND OR SOMETHING
			S.add_overlay(magic_overlay)
		else
			to_chat(user, span_warning("That stone can't get any more magical!"))
			revert_cast()
	else
		to_chat(user, span_warning("There is no stone here!"))
		revert_cast()

//==============================================
//	MENDING
//==============================================


/obj/effect/proc_holder/spell/invoked/mending5e
	name = "Mending"
	overlay_state = "mending"
	releasedrain = 50
	chargetime = 5
	charge_max = 15 SECONDS
	//chargetime = 10
	//charge_max = 30 SECONDS
	range = 1
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = TRUE
	miracle = FALSE

	invocation = "Cupio, Virtus, Licet."
	invocation_type = "whisper" //can be none, whisper, emote and shout

/obj/effect/proc_holder/spell/invoked/mending5e/cast(list/targets, mob/living/user)
	if(istype(targets[1], /obj/item))
		var/obj/item/I = targets[1]
		if(I.obj_integrity < I.max_integrity)
			var/repair_percent = 0.50
			repair_percent *= I.max_integrity
			I.obj_integrity = min(I.obj_integrity + repair_percent, I.max_integrity)
			user.visible_message(span_info("[I] glows in a faint mending light."))
			if(I.obj_broken == TRUE)
				I.obj_broken = FALSE
			if(istype(I, /obj/item/clothing))
				var/obj/item/clothing/C = I
				C.update_clothes_damaged_state(FALSE)
			I.update_overlays()
		else
			user.visible_message(span_info("[I] appears to be in pefect condition."))
			revert_cast()
	else
		to_chat(user, span_warning("There is no item here!"))
		revert_cast()

//==============================================
//	MESSAGE
//==============================================
//lame. skip. Already in the game.

//==============================================
//	MIND SLIVER
//==============================================

/obj/effect/proc_holder/spell/invoked/mindsliver5e
	name = "Mind Sliver"
	overlay_state = "sliver"
	releasedrain = 30
	chargetime = 0
	charge_max = 15 SECONDS
	range = 6
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "Veritas, Credo, Oculos"
	invocation_type = "shout" //can be none, whisper, emote and shout
	var/delay = 7

/obj/effect/proc_holder/spell/invoked/mindsliver5e/cast(list/targets, mob/user)
	var/turf/T = get_turf(targets[1])
	new /obj/effect/temp_visual/mindsliver5e_p1(T)
	sleep(delay)
	new /obj/effect/temp_visual/mindsliver5e_p2(T)
	playsound(T,'sound/magic/charged.ogg', 80, TRUE)
	for(var/mob/living/L in T.contents)
		var/obj/item/organ/brain/brain = L.getorganslot(ORGAN_SLOT_BRAIN)
		brain.applyOrganDamage((brain.maxHealth/8))
		playsound(T, "genslash", 80, TRUE)
		to_chat(L, "<span class='userdanger'>Psychic energy is driven into my skull!!</span>")

/obj/effect/temp_visual/mindsliver5e_p1
	icon = 'icons/effects/effects.dmi'
	icon_state = "bluestream_fade"
	name = "rippeling psionic energy"
	desc = "Get out of the way!"
	light_range = 2
	duration = 7
	layer = ABOVE_ALL_MOB_LAYER //this doesnt render above mobs? it really should

/obj/effect/temp_visual/mindsliver5e_p2
	icon = 'icons/effects/effects.dmi'
	icon_state = "rift"
	
	randomdir = FALSE
	duration = 1 SECONDS
	layer = ABOVE_ALL_MOB_LAYER

//==============================================
//	Minor Illusion
//==============================================

//==============================================
//	Mold Earth
//==============================================

//==============================================
//	On/Off
//==============================================

//==============================================
//	Poison Spray
//==============================================
//hold a container in your hand, it's contents turn into a 3-radius smoke, more interesting than the source material
//in the source material this would just be some sort of poison, since we have all sorts of potions, this is better.
//my hope is that it doesn't work with love poiton...
/obj/effect/proc_holder/spell/invoked/poisonspray5e
	name = "Poison Spray"
	overlay_state = "poison"
	releasedrain = 50
	chargetime = 3
	charge_max = 20 SECONDS
	//chargetime = 10
	//charge_max = 30 SECONDS
	range = 6
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "Mortis!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	
/obj/effect/proc_holder/spell/invoked/poisonspray5e/cast(list/targets, mob/living/user)
	var/turf/T = get_turf(targets[1]) //check for turf
	if(T)
		var/obj/item/held_item = user.get_active_held_item() //get held item
		var/obj/item/reagent_containers/con = held_item //get held item
		if(con)
			if(con.spillable)
				if(con.reagents.total_volume > 0)
					var/datum/reagents/R = con.reagents
					var/datum/effect_system/smoke_spread/chem/smoke = new
					smoke.set_up(R, 1, T, FALSE)
					smoke.start()

					user.visible_message(span_warning("[user] sprays the contents of the [held_item], creating a cloud!"), span_warning("You spray the contents of the [held_item], creating a cloud!"))
					con.reagents.clear_reagents() //empty the container
					playsound(user, 'sound/magic/webspin.ogg', 100)
				else
					to_chat(user, "<span class='warning'>The [held_item] is empty!</span>")
					revert_cast()
			else
				to_chat(user, "<span class='warning'>I can't get access to the contents of this [held_item]!</span>")
				revert_cast()
		else
			to_chat(user, "<span class='warning'>I need to hold a container to cast this!</span>")
			revert_cast()
	else
		to_chat(user, "<span class='warning'>I couldn't find a good place for this!</span>")
		revert_cast()



//==============================================
//	RAY OF FROST
//==============================================
// Notes: another projectile, this one slows the target for a short while
/obj/effect/proc_holder/spell/invoked/projectile/rayoffrost5e
	name = "Ray of Frost"
	desc = ""
	clothes_req = FALSE
	range = 8
	projectile_type = /obj/projectile/magic/rayoffrost5e
	overlay_state = "rof"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE

	releasedrain = 30
	chargedrain = 1
	chargetime = 3
	charge_max = 5 SECONDS //cooldown

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	antimagic_allowed = FALSE //can you use it if you are antimagicked?
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "Glacius!"
	invocation_type = "shout" //can be none, whisper, emote and shout


/obj/projectile/magic/rayoffrost5e
	name = "ray of frost"
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "ice_2"
	damage = 10
	damage_type = BRUTE
	flag = "magic"
	range = 15
	speed = 2

/obj/projectile/magic/rayoffrost5e/on_hit(atom/target, blocked = FALSE)
	. = ..()
	playsound(src, 'sound/items/stonestone.ogg', 100)
	if(isliving(target))
		var/mob/living/carbon/C = target
		C.apply_status_effect(/datum/status_effect/buff/frostbite5e) //apply debuff
		C.adjustFireLoss(5)

//==============================================
//	CURE WOUNDS
//==============================================
//Notes: Almost like a shorter range miracle that can't hurt undead
/obj/effect/proc_holder/spell/invoked/curewounds5e
	name = "Cure Wounds"
	overlay_state = "lesserheal"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 2
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/heal.ogg'
	associated_skill = /datum/skill/magic/arcane
	antimagic_allowed = FALSE
	charge_max = 30 SECONDS
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = "Vitae!"
	invocation_type = "shout" //can be none, whisper, emote and shout

/obj/effect/proc_holder/spell/invoked/curewounds5e/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.mob_biotypes & MOB_UNDEAD) //Doesn't affect undead according to the wiki
			target.visible_message("<span class='danger'>[target] is unaffected!</span>", "<span class='userdanger'>I'm unaffected!</span>")
			return TRUE
		target.visible_message(span_info("Magical healing energies infuse [target]!"), span_notice("I'm infused with a magical healing!"))
		if(iscarbon(target))
			var/mob/living/carbon/C = target
			var/healing = 2.5
			C.apply_status_effect(/datum/status_effect/buff/healing_weave, healing)
			target.adjustBruteLoss(-25)
			target.adjustFireLoss(-25)
		else
			target.adjustBruteLoss(-25)
			target.adjustFireLoss(-25)
		return TRUE
	revert_cast()
	return FALSE








/atom/movable/screen/alert/status_effect/buff/magical_healing
	name = "Arcane Healing"
	desc = "The weave flows in me, it relieves me of my ailments."
	icon_state = "buff"

#define MIRACLE_HEALING_FILTER "miracle_heal_glow"

/datum/status_effect/buff/healing_weave
	id = "weave healing"
	alert_type = /atom/movable/screen/alert/status_effect/buff/magical_healing
	duration = 10 SECONDS
	examine_text = "SUBJECTPRONOUN is bathed in a restorative aura from the weave!"
	var/healing_on_tick = 0.3
	var/outline_colour = "#6055f9"

/datum/status_effect/buff/healing_weave/on_creation(mob/living/new_owner, new_healing_on_tick)
	healing_on_tick = new_healing_on_tick
	return ..()

/datum/status_effect/buff/healing_weave/on_apply()
	var/filter = owner.get_filter(MIRACLE_HEALING_FILTER)
	if (!filter)
		owner.add_filter(MIRACLE_HEALING_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 60, "size" = 1))
	return TRUE

/datum/status_effect/buff/healing_weave/tick()
	var/obj/effect/temp_visual/heal/H = new /obj/effect/temp_visual/heal_rogue(get_turf(owner))
	H.color = "#6055f9"
	var/list/wCount = owner.get_wounds()
	if(owner.blood_volume < BLOOD_VOLUME_NORMAL)
		owner.blood_volume = min(owner.blood_volume+2, BLOOD_VOLUME_NORMAL)
	if(wCount.len > 0)
		owner.heal_wounds(healing_on_tick)
		owner.update_damage_overlays()
	owner.adjustBruteLoss(-healing_on_tick, 0)
	owner.adjustFireLoss(-healing_on_tick, 0)
	owner.adjustOxyLoss(-healing_on_tick, 0)
	owner.adjustToxLoss(-healing_on_tick, 0)
	owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, -healing_on_tick)
	owner.adjustCloneLoss(-healing_on_tick, 0)

/datum/status_effect/buff/healing_weave/on_remove()
	owner.remove_filter(MIRACLE_HEALING_FILTER)

//==============================================
//	RESISTANCE
//==============================================

/obj/effect/proc_holder/spell/self/goodberry
	name = "Goodberry"
	overlay_state = "gb"
	releasedrain = 50
	chargetime = 1
	charge_max = 30 SECONDS
	range = 2
	warnie = "spellwarning"
	movement_interrupt = FALSE
	no_early_release = FALSE
	chargedloop = null
	sound = 'sound/magic/whiteflame.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 2 // Theoretically infinite healing. 

	xp_gain = TRUE
	miracle = FALSE

	invocation = "Nutrire!"
	invocation_type = "shout" //can be none, whisper, emote and shout

	var/obj/item/item
	var/item_type = /obj/item/reagent_containers/food/snacks/grown/berries/rogue/goodberry
	var/delete_old = FALSE //TRUE to delete the last summoned object if it's still there, FALSE for infinite item stream weeeee

/obj/effect/proc_holder/spell/self/goodberry/cast(list/targets, mob/user = usr)
	var/obj/item/goodberry = user.get_active_held_item()
	if(!istype(goodberry, /obj/item/reagent_containers/food/snacks/grown/berries/rogue))
		user.visible_message(span_warning("I require some berries in a free hand."))
	else
		qdel(goodberry)
		if (delete_old && item && !QDELETED(item))
			QDEL_NULL(item)
		if(user.dropItemToGround(user.get_active_held_item()))
			user.put_in_hands(make_item(), TRUE)
			user.visible_message(span_info("The weave condenses into the berries in [user]'s hand!"), span_info("You magically charge the berries!"))
			return

/obj/effect/proc_holder/spell/self/goodberry/proc/make_item()
	item = new item_type
	return item

/obj/item/reagent_containers/food/snacks/grown/berries/rogue/goodberry
	seed = /obj/item/seeds/berryrogue
	name = "Goodberries"
	desc = "Plump, sweet berries charged with the weave. Eat them soon, before they lose their magic!"
	icon_state = "berries"
	color = "#d9f075"
	tastes = list("berry" = 1, "arcane healing" = 1)
	bitesize = 5
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/medicine/stronghealth = 3
		)
	faretype = FARE_NEUTRAL
	dropshrink = 0.75
	can_distill = TRUE
	distill_reagent = /datum/reagent/medicine/healthpotnew
	rotprocess = 30 SECONDS // Lasts 5 minutes 30 seconds upon creation.
	become_rot_type = /obj/item/reagent_containers/food/snacks/grown/berries/rogue

//==============================================
//	RESISTANCE
//==============================================
//Notes: 

//==============================================
//	SACRED FLAME
//==============================================
//Notes: 

//==============================================
//	SAPPING STING
//==============================================
//Notes: a projectile that hurst rogstam

//==============================================
//	SHAPE WATER
//==============================================
//Notes: 

//==============================================
//	SHILLELAGH
//==============================================
//Notes: add your int to the force of a club or staff

//==============================================
//	SHOCKING GRASP
//==============================================
//Notes: shock touch spell

/*
XX	added
X	added, needs work
S	skipped, might add later
SS	skipped

XX	Acid Splash			Conjuration		1 Action		60 Feet				Instantaneous	V, S
XX 	Blade Ward			Abjuration		1 Action		Self				1 round			V, S
X 	Booming Blade		Evocation		1 Action		Self (5-foot radius)1 round			S, M
XX 	Chill Touch			Necromancy		1 Action		120 feet			1 round			V, S
SS 	Control Flames		Transmutation	1 Action		60 Feet				Instantaneous	S
XX 	Create Bonfire		Conjuration		1 Action		60 Feet				1 minute		V, S
S 	Dancing Lights		Evocation		1 Action		120 feet			1 minute		V, S, M
X 	Decompose (HB)		Necromancy		1 Action		Touch				1 minute		V, S
SS 	Druidcraft			Transmutation	1 Action		30 Feet				Instantaneous	V, S
XX 	Eldritch Blast		Evocation		1 Action		120 Feet			Instantaneous	V, S
XX 	Encode Thoughts		Enchantment		1 Action		Self				8 hours			S
XX 	Fire Bolt			Evocation		1 Action		120 feet			Instantaneous	V, S
SS 	Friends				Enchantment		1 Action		Self				1 minute		S, M
XX 	Frostbite			Evocation		1 Action		60 feet				Instantaneous	V, S
X	Green-Flame Blade	Evocation		1 Action		Self (5-foot radius)Instantaneous	S, M
XX 	Guidance			Divination		1 Action		Touch				1 minute		V, S
S 	Gust				Transmutation	1 Action		30 feet				Instantaneous	V, S
S 	Hand of Radiance	Evocation		1 Action		5 feet				Instantaneous	V, S
XX 	Infestation			Conjuration		1 Action		30 feet				Instantaneous	V, S, M
XX 	Light				Evocation		1 Action		Touch				1 hour			V, M
XX	Lightning Lure		Evocation		1 Action		Self(15-foot radius)Instantaneous	V
S	Mage Hand			Conjuration		1 Action		30 feet				1 minute		V, S
XX	Magic Stone			Transmutation	1 Bonus Action	Touch				1 minute		V, S
XX	Mending				Transmutation	1 Minute		Touch				Instantaneous	V, S, M
SS 	Message				Transmutation	1 Action		120 feet			1 round			V, S, M
XX	Mind Sliver			Enchantment		1 Action		60 feet				1 round			V
S	Minor Illusion		Illusion		1 Action		30 feet				1 minute		S, M
SS	Mold Earth			Transmutation	1 Action		30 feet				Instantaneous	S
S	On/Off (UA)			Transmutation 	1 Action		60 feet				Instantaneous	V, S
XX	Poison Spray		Conjuration		1 Action		10 feet				Instantaneous	V, S
SS	Prestidigitation	Transmutation	1 Action		10 feet				Up to 1 hour	V, S
XX	Primal Savagery		Transmutation	1 Action		Self				Self			S
SS	Produce Flame		Conjuration		1 Action		Self				10 minutes		V, S
XX	Ray of Frost		Evocation		1 Action		60 feet				Instantaneous	V, S
SS	Resistance			Abjuration		1 Action		Touch				Concentration	V, S, M
SS	Sacred Flame		Evocation		1 Action		60 feet				Instantaneous	V, S
X	Sapping Sting		Necromancy		1 Action		30 feet				Instantaneous	V, S
SS	Shape Water			Transmutation	1 Action		30 feet				Instantaneous 	S
X	Shillelagh			Transmutation	1 Bonus Action	Touch				1 minute		V, S, M
X	Shocking Grasp		Evocation		1 Action		Touch				Instantaneous	V, S
S	Spare the Dying		Necromancy		1 Action		Touch				Instantaneous	V, S
SS	Sword Burst			Conjuration		1 Action		Self				Instantaneous	V
SS	Thaumaturgy			Transmutation	1 Action		30 feet				Up to 1 minute	V
	Thorn Whip			Transmutation	1 Action		30 feet				Instantaneous	V, S, M
	Thunderclap			Evocation		1 Action		Self				Instantaneous	S
	Toll the Dead		Necromancy		1 Action		60 feet				Instantaneous	V, S
	True Strike			Divination		1 Action		30 feet				Concentration	S
XX	Vicious Mockery		Enchantment		1 Action		60 feet				Instantaneous	V
	Virtue (UA)			Abjuration		1 Action		Touch				1 round			V, S
S	Word of Radiance	Evocation		1 Action		5 feet				Instantaneous	V, M
*/
