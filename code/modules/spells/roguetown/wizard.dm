
/* MAGE GAMEPLAY LOOP NOTES:
The amount of spellpoints mages has varies fairly significantly.
Highly dependant on the mage's book quality for total amount, multiplied by a learning modifier dependant on arcana skill and reading as well as int.
That said, mage apprentices for the most part, start off with 5 (8 if counting the first night's rest) spell points.
Court magos has a total of 17 points, To allow for picking of their 'strongest' spell, between greater fireball, meteor, and sundering lightning.
Theoretically someone could get 12 spell points to get one of those spells, in 4 nights, but odds are, it's unlikely.
Unless of course, they went heavy into the gameplay loop, and got a better book. And even then, it's likely only feasible for apprentices given modifiers.
-Radiantflash 
//A spell to choose new spells, upon spawning or gaining levels - NOTE: Please keep this spell at the top of the file to make it better for organization -RadiantFlash
/obj/effect/proc_holder/spell/invoked/learnspell
	name = "Attempt to learn a new spell"
	desc = "Weave a new spell"
	school = "transmutation"
	overlay_state = "book1"
	chargedrain = 0
	chargetime = 0

/obj/effect/proc_holder/spell/invoked/learnspell/cast(list/targets, mob/living/user)
	. = ..()
	//TODO: make GLOB list of spells, give them a true/false tag for learning, run through that list to generate choices
	var/list/choices = list()//Current thought: standard combat spells 3 spell points. utility/buff spells 2 points, minor spells 1 point

	var/list/spell_choices = list(
		SPELL_FIREBALLGREATER,		// 13 cost	combat, AOE heavy single target damage
		SPELL_METEOR,				// 13 cost	combat, LARGE AOE, light damage.
		SPELL_SUNDER_LIGHTNING,		// 13 cost	combat, upper level AOE hard stunning damage
		SPELL_FIREBALL,				// 3 cost	combat, damaging AOE + damages worn/held things
		SPELL_LIGHTNINGBOLT,		// 3 cost	combat, single target damage, knockdown
		SPELL_SPITFIRE,				// 3 cost	combat, burstfire single target damage
		SPELL_ARCANEBOLT,			// 3 cost	combat, single target single shot damage
		SPELL_FROSTBOLT,			// 3 cost	combat, single target, single shot lesser damage w/ slow
		SPELL_LIGHTNINGLURE,		// 3 cost	combat, ranged single target hard stun w/ time requirement.
		SPELL_SLOWDOWN_SPELL_AOE,	// 3 cost	utility hold spell. Target unable to move, but can fight.
		SPELL_FINDFAMILIAR,			// 3 cost	combat, summon spell.
		SPELL_PUSH_SPELL,			// 3 cost	localized AOE knockback spell. Knocksdown/disarms victims
		SPELL_ARCYNE_STORM,			// 2 cost	combat, light damaging AOE, stall/area denial spell
		SPELL_DARKVISION,			// 2 cost	utility, dark sight
		SPELL_HASTE,				// 2 cost	utility/combatbuff, faster mve speed.
		SPELL_SUMMON_WEAPON,		// 2 cost	utility/combat, summons a marked weapon to caster.
		SPELL_MENDING,				// 2 cost	utility, repairs items
		SPELL_MESSAGE,				// 2 cost	utility, messages anyone you know the name of.
		SPELL_BLADE_BURST,			// 2 cost	combat, single target damage localized on rndm leg. possible bone break.
		SPELL_FETCH,				// 2 cost	utility/combat, pulls single target closer
		SPELL_REPEL,				// 2 cost	utility/combat, flings single target away
		SPELL_FORCEWALL_WEAK,		// 2 cost	utility/combat, places walls caster can walk through. stall spell.
		SPELL_NONDETECTION,			// 1 cost	utility, no scrying your location.
		SPELL_FEATHERFALL,			// 1 cost	utility, no fall damage from 1 zlevel drop
		SPELL_PRESTIDIGITATION		// free for all mage roles, Utility spell, used in gathering components and parlor tricks

	)

	//Patron Spelllists
	var/list/spell_choices_noc = list(
		SPELL_MAGEBLINDNESS,  // 2cost
		SPELL_MAGEINVISIBILITY,
	)

	var/list/spell_choices_graggar = list(

	)

	var/list/spell_choices_matthios = list()

	var/list/spell_choices_zizo = list(
		SPELL_STRENGTHEN_UNDEAD,// 4 cost
		SPELL_SICKNESS,// 3 cost
		SPELL_EYEBITE,// 3 cost
	)

	if(user.patron.type == /datum/patron/divine/noc)
		spell_choices.Add(spell_choices_noc)
		for(var/i = 1, i <= spell_choices.len, i++)
			choices["[spell_choices[i].name]: [spell_choices[i].cost]"] = spell_choices[i]

	else if(user.patron.type == /datum/patron/inhumen/graggar)
		spell_choices.Add(spell_choices_graggar)
		for(var/i = 1, i <= spell_choices.len, i++)
			choices["[spell_choices[i].name]: [spell_choices[i].cost]"] = spell_choices[i]

	else if(user.patron.type == /datum/patron/inhumen/matthios)
		spell_choices.Add(spell_choices_matthios)
		for(var/i = 1, i <= spell_choices.len, i++)
			choices["[spell_choices[i].name]: [spell_choices[i].cost]"] = spell_choices[i]

	else if(user.patron.type == /datum/patron/zizo)
		spell_choices.Add(spell_choices_zizo)
		for(var/i = 1, i <= spell_choices.len, i++)
			choices["[spell_choices[i].name]: [spell_choices[i].cost]"] = spell_choices[i]

	else
		for(var/i = 1, i <= spell_choices.len, i++)
			choices["[spell_choices[i].name]: [spell_choices[i].cost]"] = spell_choices[i]

	var/totalspellcount = 0
	for(var/obj/effect/proc_holder/spell/knownspell in user.mind.spell_list)
		totalspellcount++
	if(totalspellcount >= 12)
		to_chat(user,span_warning("You can not memorize more spells then you already have!"))
		return
	var/spellsleft = 12 - totalspellcount
	to_chat(user,span_warning("You can memorize [spellsleft] more spells."))
	var/choice = input("Choose a spell, points left: [user.mind.spell_points - user.mind.used_spell_points]") as null|anything in choices
	var/obj/effect/proc_holder/spell/item = choices[choice]
	if(!item)
		return     // user canceled;
	if(alert(user, "[item.desc]", "[item.name]", "Learn", "Cancel") == "Cancel") //gives a preview of the spell's description to let people know what a spell does
		return
	for(var/obj/effect/proc_holder/spell/knownspell in user.mind.spell_list)
		if(knownspell.type == item.type)
			to_chat(user,span_warning("You already know this one!"))
			return	//already know the spell
	if(item.cost > user.mind.spell_points - user.mind.used_spell_points)
		to_chat(user,span_warning("You do not have enough experience to create a new spell."))
		return		// not enough spell points
	else
		user.mind.used_spell_points += item.cost
		user.mind.AddSpell(new item)
*/
/obj/effect/proc_holder/spell/invoked/projectile/lightningbolt
	name = "Bolt of Lightning"
	desc = "Emit a bolt of lightning that burns and stuns a target."
	clothes_req = FALSE
	overlay_state = "lightning"
	sound = 'sound/magic/lightning.ogg'
	invocation = "Qo'Strun!"
	invocation_type = "shout"
	range = 8
	projectile_type = /obj/projectile/magic/lightning
	releasedrain = 30
	chargedrain = 1
	chargetime = 15
	charge_max = 20 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokelightning
	associated_skill = /datum/skill/magic/arcane
	cost = 2
	xp_gain = TRUE

/obj/projectile/magic/lightning
	name = "bolt of lightning"
	tracer_type = /obj/effect/projectile/tracer/stun
	muzzle_type = null
	impact_type = null
	hitscan = TRUE
	movement_type = UNSTOPPABLE
	light_color = LIGHT_COLOR_WHITE
	damage = 15
	damage_type = BURN
	nodamage = FALSE
	speed = 0.3
	flag = "magic"
	light_color = "#ffffff"
	light_range = 7

/obj/projectile/magic/lightning/on_hit(target)
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
			if(L.STACON <= 14)
				L.electrocute_act(3, src)
			else
				L.electrocute_act(2, src)
	qdel(src)

/obj/effect/proc_holder/spell/invoked/projectile/bloodlightning
	name = "Blood Bolt"
	desc = ""
	clothes_req = FALSE
	overlay_state = "bloodlightning"
	sound = 'sound/magic/vlightning.ogg'
	range = 8
	projectile_type = /obj/projectile/magic/bloodlightning
	releasedrain = 30
	chargedrain = 1
	chargetime = 25
	charge_max = 20 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/blood

/obj/projectile/magic/bloodlightning
	name = "blood bolt"
	tracer_type = /obj/effect/projectile/tracer/blood
	muzzle_type = null
	impact_type = null
	hitscan = TRUE
	movement_type = UNSTOPPABLE
	damage = 35
	damage_type = BURN
	nodamage = FALSE
	speed = 0.3
	flag = "magic"
	light_color = "#802121"
	light_range = 7

/obj/projectile/magic/bloodlightning/on_hit(target)
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
			L.electrocute_act(3, src)
	qdel(src)

/obj/effect/proc_holder/spell/invoked/projectile/bloodsteal
	name = "Blood Steal"
	desc = ""
	clothes_req = FALSE
	overlay_state = "bloodsteal"
	sound = 'sound/magic/vlightning.ogg'
	range = 8
	projectile_type = /obj/projectile/magic/bloodsteal
	releasedrain = 30
	chargedrain = 1
	chargetime = 25
	charge_max = 20 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/blood

/obj/projectile/magic/bloodsteal
	name = "blood steal"
	tracer_type = /obj/effect/projectile/tracer/bloodsteal
	muzzle_type = null
	impact_type = null
	hitscan = TRUE
	movement_type = UNSTOPPABLE
	damage = 25
	damage_type = BRUTE
	nodamage = FALSE
	speed = 0.3
	flag = "magic"
	light_color = "#e74141"
	light_range = 7
	var/mob/living/carbon/human/sender

/obj/projectile/magic/bloodsteal/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			visible_message(span_warning("[src] fizzles on contact with [target]!"))
			playsound(get_turf(target), 'sound/magic/magic_nulled.ogg', 100)
			qdel(src)
			return BULLET_ACT_BLOCK
		if(ishuman(target))
			var/mob/living/carbon/human/H = target
			var/datum/antagonist/vampirelord/VDrinker = sender.mind.has_antag_datum(/datum/antagonist/vampirelord)
			H.blood_volume = max(H.blood_volume-45, 0)
			H.handle_blood()
			H.visible_message(span_danger("[target] has their blood ripped from their body!!"), \
					span_userdanger("My blood erupts from my body!"), \
					span_hear("..."), COMBAT_MESSAGE_RANGE, target)
			new /obj/effect/decal/cleanable/blood/puddle(H.loc)
			VDrinker.handle_vitae(400)
	qdel(src)

/obj/effect/proc_holder/spell/invoked/projectile/fireball
	name = "Fireball"
	desc = "Shoot out a ball of fire that emits a light explosion on impact, setting the target alight."
	clothes_req = FALSE
	range = 8
	projectile_type = /obj/projectile/magic/aoe/fireball/rogue
	overlay_state = "fireball"
	sound = list('sound/magic/fireball.ogg')
	invocation = "GAAR'ARDE!!"
	invocation_type = "shout"
	active = FALSE
	releasedrain = 30
	chargedrain = 1
	chargetime = 15
	charge_max = 10 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokefire
	associated_skill = /datum/skill/magic/arcane
	cost = 2
	xp_gain = TRUE

/obj/projectile/magic/aoe/fireball/rogue
	name = "fireball"
	exp_heavy = 0
	exp_light = 0
	exp_flash = 0
	exp_fire = 1
	damage = 10
	damage_type = BURN
	nodamage = FALSE
	flag = "magic"
	hitsound = 'sound/blank.ogg'
	aoe_range = 0


/obj/projectile/magic/aoe/fireball/rogue/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			visible_message(span_warning("[src] fizzles on contact with [target]!"))
			playsound(get_turf(target), 'sound/magic/magic_nulled.ogg', 100)
			qdel(src)
			return BULLET_ACT_BLOCK



/obj/effect/proc_holder/spell/invoked/projectile/fireball/greater
	name = "Greater Fireball"
	desc = "Shoot out an immense ball of fire that explodes on impact."
	clothes_req = FALSE
	range = 8
	projectile_type = /obj/projectile/magic/aoe/fireball/rogue/great
	overlay_state = "fireball_wide"
	sound = list('sound/magic/fireball.ogg')
	invocation = "GAAR'SOL'ARDE!!"
	invocation_type = "shout"
	active = FALSE
	releasedrain = 50
	chargedrain = 1
	chargetime = 15
	charge_max = 10 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	chargedloop = /datum/looping_sound/invokefire
	cost = 5
	xp_gain = TRUE

/obj/projectile/magic/aoe/fireball/rogue/great
	name = "fireball"
	exp_heavy = 0
	exp_light = 1
	exp_flash = 2
	exp_fire = 2
	flag = "magic"

/obj/effect/proc_holder/spell/invoked/projectile/spitfire
	name = "Spitfire"
	desc = "Shoot out a low-powered ball of fire that shines brightly on impact, potentially blinding a target."
	clothes_req = FALSE
	range = 8
	projectile_type = /obj/projectile/magic/aoe/fireball/rogue2
	overlay_state = "fireball_multi"
	sound = list('sound/magic/whiteflame.ogg')
	invocation = "Sol'Igniculus!!"
	invocation_type = "shout"
	active = FALSE
	releasedrain = 30
	chargedrain = 1
	chargetime = 1
	charge_max = 4 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokefire
	associated_skill = /datum/skill/magic/arcane
	cost = 1
	xp_gain = TRUE

/obj/projectile/magic/aoe/fireball/rogue2
	name = "fireball"
	exp_heavy = 0
	exp_light = 0
	exp_flash = 1
	exp_fire = 0
	damage = 20
	damage_type = BURN
	nodamage = FALSE
	flag = "magic"
	hitsound = 'sound/blank.ogg'
	aoe_range = 0

/obj/effect/proc_holder/spell/invoked/projectile/fetch
	name = "Fetch"
	desc = "Shoot out a magical bolt that draws in the target struck towards the caster."
	clothes_req = FALSE
	range = 15
	projectile_type = /obj/projectile/magic/fetch
	overlay_state = ""
	sound = list('sound/magic/magnet.ogg')
	invocation = "Rapto."
	invocation_type = "whisper"
	active = FALSE
	releasedrain = 5
	chargedrain = 0
	chargetime = 0
	warnie = "spellwarning"
	overlay_state = "fetch"
	no_early_release = TRUE
	charging_slowdown = 1
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	cost = 1
	xp_gain = TRUE

/obj/projectile/magic/fetch/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			visible_message(span_warning("[target] repells the fetch!"))
			playsound(get_turf(target), 'sound/magic/magic_nulled.ogg', 100)
			qdel(src)
			return BULLET_ACT_BLOCK

/obj/effect/proc_holder/spell/invoked/findfamiliar
	name = "Find Familiar"
	desc = "Summons a temporary spectral volf to aid you. Hostile to all but yourself. Summon with care."
	school = "transmutation"
	releasedrain = 30
	chargedrain = 1
	chargetime = 15
	charge_max = 40 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	clothes_req = FALSE
	active = FALSE
	sound = 'sound/blank.ogg'
	overlay_state = "forcewall"
	range = -1
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	xp_gain = TRUE
	cost = 1

/mob/living/simple_animal/hostile/retaliate/rogue/wolf/familiar/Initialize(mapload, mob/user)
	. = ..()
	summoner = user

/obj/effect/proc_holder/spell/invoked/findfamiliar/cast(list/targets, mob/user = usr)
	var/turf/target_turf = get_turf(targets[1])
	new /mob/living/simple_animal/hostile/retaliate/rogue/wolf/familiar(target_turf, user)
	return TRUE

/obj/effect/proc_holder/spell/invoked/arcyne_storm
	name = "Arcyne storm"
	desc = "Conjure ripples of force into existance over a large area, injuring any who enter"
	cost = 2
	xp_gain = TRUE
	releasedrain = 50
	chargedrain = 1
	chargetime = 35
	charge_max = 50 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	overlay_state = "hierophant"
	range = 3
	var/damage = 10

/obj/effect/proc_holder/spell/invoked/arcyne_storm/cast(list/targets, mob/user = usr)
	var/turf/T = get_turf(targets[1])
	var/list/affected_turfs = list()
	for(var/turf/turfs_in_range in range(range, T)) // use inrange instead of view
		if(turfs_in_range.density)
			continue
		affected_turfs.Add(turfs_in_range)
	for(var/i = 1, i < 16, i++)
		addtimer(CALLBACK(src, PROC_REF(apply_damage), affected_turfs), wait = i * 1 SECONDS)
	return TRUE

/obj/effect/proc_holder/spell/invoked/arcyne_storm/proc/apply_damage(var/list/affected_turfs)
	for(var/turf/damage_turf in affected_turfs)
		new /obj/effect/temp_visual/hierophant/squares(damage_turf)
		for(var/mob/living/L in damage_turf.contents)
			L.adjustBruteLoss(damage)
			playsound(damage_turf, "genslash", 40, TRUE)
			to_chat(L, "<span class='userdanger'>I'm cut by arcyne force!</span>")


/obj/effect/temp_visual/hierophant
	name = "vortex energy"
	layer = BELOW_MOB_LAYER
	var/mob/living/caster //who made this, anyway

/obj/effect/temp_visual/hierophant/Initialize(mapload, new_caster)
	. = ..()
	if(new_caster)
		caster = new_caster

/obj/effect/temp_visual/hierophant/squares
	icon_state = "hierophant_squares"
	duration = 3
	light_range = MINIMUM_USEFUL_LIGHT_RANGE
	randomdir = FALSE

/obj/effect/temp_visual/hierophant/squares/Initialize(mapload, new_caster)
	. = ..()

/obj/effect/proc_holder/spell/invoked/meteor_storm
	name = "Meteor storm"
	desc = "Summons forth dangerous meteors from the sky to scatter and smash foes."
	cost = 4
	releasedrain = 50
	chargedrain = 1
	chargetime = 50
	charge_max = 50 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane

/obj/effect/proc_holder/spell/invoked/meteor_storm/cast(list/targets, mob/user = usr)
	var/turf/T = get_turf(targets[1])
//	var/list/affected_turfs = list()
	playsound(T,'sound/magic/meteorstorm.ogg', 80, TRUE)
	sleep(2)
	create_meteors(T)

//meteor storm and lightstorm.
/obj/effect/proc_holder/spell/invoked/meteor_storm/proc/create_meteors(atom/target)
	if(!target)
		return
	target.visible_message(span_boldwarning("Fire rains from the sky!"))
	var/turf/targetturf = get_turf(target)
	for(var/turf/turf as anything in RANGE_TURFS(6,targetturf))
		if(prob(20))
			new /obj/effect/temp_visual/target(turf)

/obj/effect/temp_visual/fireball
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "meteor"
	name = "meteor"
	desc = "Get out of the way!"
	layer = FLY_LAYER
	plane = GAME_PLANE_UPPER
	randomdir = FALSE
	duration = 9
	pixel_z = 270

/obj/effect/temp_visual/fireball/Initialize(mapload)
	. = ..()
	animate(src, pixel_z = 0, time = duration)

/obj/effect/temp_visual/target
	icon = 'icons/mob/actions/actions_items.dmi'
	icon_state = "sniper_zoom"
	layer = BELOW_MOB_LAYER
	plane = GAME_PLANE
	light_range = 2
	duration = 9
	var/exp_heavy = 0
	var/exp_light = 2
	var/exp_flash = 0
	var/exp_fire = 3
	var/exp_hotspot = 0
	var/explode_sound = list('sound/misc/explode/incendiary (1).ogg','sound/misc/explode/incendiary (2).ogg')

/obj/effect/temp_visual/target/Initialize(mapload, list/flame_hit)
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(fall), flame_hit)

/obj/effect/temp_visual/target/proc/fall(list/flame_hit)	//Potentially minor explosion at each impact point
	var/turf/T = get_turf(src)
	playsound(T,'sound/magic/meteorstorm.ogg', 80, TRUE)
	new /obj/effect/temp_visual/fireball(T)
	sleep(duration)
	if(ismineralturf(T))
		var/turf/closed/mineral/M = T
		M.gets_drilled()
	new /obj/effect/hotspot(T)
	for(var/mob/living/L in T.contents)
		if(islist(flame_hit) && !flame_hit[L])
			L.adjustFireLoss(40)
			L.adjust_fire_stacks(8)
			L.IgniteMob()
			to_chat(L, span_userdanger("You're hit by a meteor!"))
			flame_hit[L] = TRUE
		else
			L.adjustFireLoss(10) //if we've already hit them, do way less damage
	explosion(T, -1, exp_heavy, exp_light, exp_flash, 0, flame_range = exp_fire, soundin = explode_sound)

/obj/effect/proc_holder/spell/targeted/summonweapon
	name = "Summon Weapon"
	desc = "Summon an imbued weapon."
	clothes_req = FALSE
	school = "transmutation"
	range = -1
	include_user = TRUE
	cooldown_min = 100
	charge_max = 2 MINUTES
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	action_icon_state = "summons"
	invocation = "Zar’kalthra ven’thelis!"
	invocation_type = "Whisper"
	cost = 1
	var/obj/marked_item


/obj/effect/proc_holder/spell/targeted/summonweapon/cast(list/targets,mob/user = usr)
	for(var/mob/living/L in targets)
		var/list/hand_items = list(L.get_active_held_item(),L.get_inactive_held_item())
		var/message
		if(!marked_item) //linking item to the spell
			message = "<span class='notice'>"
			for(var/obj/item/rogueweapon/item in hand_items)
				if(item.item_flags & ABSTRACT)
					continue
				if(SEND_SIGNAL(item, COMSIG_ITEM_MARK_RETRIEVAL) & COMPONENT_BLOCK_MARK_RETRIEVAL)
					continue
				if(HAS_TRAIT(item, TRAIT_NODROP))
					message += "Though it feels redundant, "
				marked_item = 		item
				message += "You imbue [item] for summoning.</span>"
				name = "Summon [item]"
				break

			if(!marked_item)
				if(hand_items)
					message = span_warning("I aren't holding anything that can be imbued to summon!")
				else
					message = span_warning("I must hold the desired weapon in my hands to imbue it for summoning!")

		else if(marked_item in hand_items) //unlinking item to the spell
			message = span_notice("I remove the imbuement on [marked_item] to use elsewhere.")
			name = "Instant Summons"
			marked_item = 		null

		else if(marked_item && QDELETED(marked_item)) //the item was destroyed at some point
			message = span_warning("I sense my imbued weapon has been destroyed!")
			name = "summon weapon"
			marked_item = 		null

		else	//Getting previously marked item
			var/obj/item/rogueweapon/item_to_retrieve = marked_item
			var/infinite_recursion = 0 //I don't want to know how someone could put something inside itself but these are wizards so let's be safe
			while(!isturf(item_to_retrieve.loc) && infinite_recursion < 10) //if it's in something you get the whole thing.
				if(isitem(item_to_retrieve.loc))
					var/obj/item/I = item_to_retrieve.loc
					if(I.item_flags & ABSTRACT) //Being able to summon abstract things because your item happened to get placed there is a no-no
						break
				if(ismob(item_to_retrieve.loc)) //If its on someone, properly drop it
					var/mob/M = item_to_retrieve.loc
					M.dropItemToGround(item_to_retrieve)
					if(iscarbon(M)) //Edge case housekeeping
						var/mob/living/carbon/C = M
						for(var/X in C.bodyparts)
							var/obj/item/bodypart/part = X
							if(item_to_retrieve in part.embedded_objects)
								part.remove_embedded_object(item_to_retrieve)
								to_chat(C, span_warning("The [item_to_retrieve] that was embedded in your [L] has mysteriously vanished. How fortunate!"))
								break
					item_to_retrieve = item_to_retrieve.loc

				infinite_recursion += 1

			if(!item_to_retrieve)
				return

			if(item_to_retrieve.loc)
				item_to_retrieve.loc.visible_message(span_warning("The [item_to_retrieve.name] suddenly disappears!"))
			if(!L.put_in_hands(item_to_retrieve))
				item_to_retrieve.forceMove(L.drop_location())
				item_to_retrieve.loc.visible_message(span_warning("The [item_to_retrieve.name] suddenly appears!"))
				playsound(get_turf(L), 'sound/blank.ogg', 50, TRUE)
			else
				item_to_retrieve.loc.visible_message(span_warning("The [item_to_retrieve.name] suddenly appears in [L]'s hand!"))
				playsound(get_turf(L), 'sound/blank.ogg', 50, TRUE)


		if(message)
			to_chat(L, message)


/obj/effect/proc_holder/spell/invoked/sundering_lightning
	name = "Sundering Lightning"
	desc = "Summons forth dangerous rapid lightning strikes."
	cost = 2
	releasedrain = 50
	chargedrain = 1
	chargetime = 50
	charge_max = 50 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	range = 4

/obj/effect/proc_holder/spell/invoked/sundering_lightning/cast(list/targets, mob/user = usr)
	var/turf/T = get_turf(targets[1])
//	var/list/affected_turfs = list()
	playsound(T,'sound/weather/rain/thunder_1.ogg', 80, TRUE)
	T.visible_message(span_boldwarning("The air feels crackling and charged!"))
	sleep(30)
	create_lightning(T)

//meteor storm and lightstorm.
/obj/effect/proc_holder/spell/invoked/sundering_lightning/proc/create_lightning(atom/target)
	if(!target)
		return
	var/turf/targetturf = get_turf(target)
	var/last_dist = 0
	for(var/t in spiral_range_turfs(range, targetturf))
		var/turf/T = t
		if(!T)
			continue
		var/dist = get_dist(targetturf, T)
		if(dist > last_dist)
			last_dist = dist
			sleep(2 + min(range - last_dist, 12) * 0.5) //gets faster
		new /obj/effect/temp_visual/targetlightning(T)


/obj/effect/temp_visual/lightning
	icon = 'icons/effects/32x96.dmi'
	icon_state = "lightning"
	name = "lightningbolt"
	desc = "ZAPP!!"
	layer = FLY_LAYER
	plane = GAME_PLANE_UPPER
	randomdir = FALSE
	duration = 7

/obj/effect/temp_visual/lightning/Initialize(mapload)
	. = ..()

/obj/effect/temp_visual/targetlightning
	icon = 'icons/effects/effects.dmi'
	icon_state = "trap"
	layer = BELOW_MOB_LAYER
	plane = GAME_PLANE
	light_range = 2
	duration =15
	var/explode_sound = list('sound/misc/explode/incendiary (1).ogg','sound/misc/explode/incendiary (2).ogg')

/obj/effect/temp_visual/targetlightning/Initialize(mapload, list/flame_hit)
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(storm), flame_hit)

/obj/effect/temp_visual/targetlightning/proc/storm(list/flame_hit)	//electroshocktherapy
	var/turf/T = get_turf(src)
	sleep(duration)
	playsound(T,'sound/magic/lightning.ogg', 80, TRUE)
	new /obj/effect/temp_visual/lightning(T)

	for(var/mob/living/L in T.contents)
		L.electrocute_act(50)
		to_chat(L, span_userdanger("You're hit by lightning!!!"))

