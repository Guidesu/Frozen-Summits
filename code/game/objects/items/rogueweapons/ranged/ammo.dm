/obj/item/ammo_casing/caseless/rogue/bolt
	name = "bolt"
	desc = "A durable iron bolt that will pierce a skull easily."
	projectile_type = /obj/projectile/bullet/reusable/bolt
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	caliber = "regbolt"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "bolt"
	dropshrink = 0.6
	max_integrity = 10
	force = 10
/*
/obj/item/ammo_casing/caseless/rogue/bolt/poison
	name = "poisoned bolt"
	desc = "A durable iron bolt that will pierce a skull easily. This one is coated in a clear liquid."
	projectile_type = /obj/projectile/bullet/reusable/bolt/poison
	icon_state = "arrow_poison"
*/
	w_class = WEIGHT_CLASS_SMALL

/obj/projectile/bullet/reusable/bolt
	name = "bolt"
	damage = 70
	damage_type = BRUTE
	armor_penetration = 50
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "bolt_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bolt
	range = 15
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 100
	woundclass = BCLASS_STAB
	flag = "bullet"
	speed = 0.5

/obj/projectile/bullet/reusable/bolt/on_hit(atom/target)
	. = ..()

	var/mob/living/L = firer
	if(!L || !L.mind) return

	var/skill_multiplier = 0

	if(isliving(target)) // If the target theyre shooting at is a mob/living
		var/mob/living/T = target
		if(T.stat != DEAD) // If theyre alive
			skill_multiplier = 4

	if(skill_multiplier && can_train_combat_skill(L, /datum/skill/combat/crossbows, SKILL_LEVEL_EXPERT))
		L.mind.add_sleep_experience(/datum/skill/combat/crossbows, L.STAINT * skill_multiplier)

/*
/obj/projectile/bullet/reusable/bolt/poison
	name = "poisoned bolt"
	damage = 50
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bolt/poison
*/
/obj/item/ammo_casing/caseless/rogue/arrow
	name = "arrow"
	desc = "A wooden shaft with a pointy iron end."
	projectile_type = /obj/projectile/bullet/reusable/arrow
	caliber = "arrow"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow"
	force = 30
	dropshrink = 0.6
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	max_integrity = 20

/obj/item/ammo_casing/caseless/rogue/arrow/iron
	name = "iron arrow"
	desc = "A wooden shaft with a pointy iron end."
	projectile_type = /obj/projectile/bullet/reusable/arrow/iron
	caliber = "arrow"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow"
	force = 30
	dropshrink = 0.6
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	max_integrity = 20

/obj/projectile/bullet/reusable/arrow
	name = "arrow"
	damage = 50
	damage_type = BRUTE
	armor_penetration = 40
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow
	range = 15
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 100
	woundclass = BCLASS_STAB
	flag = "bullet"
	speed = 0.4

/obj/projectile/bullet/reusable/arrow/on_hit(atom/target)
	. = ..()

	var/mob/living/L = firer
	if(!L || !L.mind) return

	var/skill_multiplier = 0

	if(isliving(target)) // If the target theyre shooting at is a mob/living
		var/mob/living/T = target
		if(T.stat != DEAD) // If theyre alive
			skill_multiplier = 4

	if(skill_multiplier && can_train_combat_skill(L, /datum/skill/combat/bows, SKILL_LEVEL_EXPERT))
		L.mind.add_sleep_experience(/datum/skill/combat/bows, L.STAINT * skill_multiplier)

/obj/projectile/bullet/reusable/arrow/iron
	name = "iron arrow"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/iron

/obj/projectile/bullet/reusable/arrow/stone
	name = "stone arrow"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/stone

/obj/item/ammo_casing/caseless/rogue/arrow/stone
	name = "stone arrow"
	desc = "A wooden shaft with a jagged rock on the end."
	icon_state = "stonearrow"
	max_integrity = 5
	projectile_type = /obj/projectile/bullet/reusable/arrow/stone

/obj/item/ammo_casing/caseless/rogue/arrow/poison
	name = "poisoned arrow"
	desc = "A wooden shaft with a pointy iron end. This one is stained green with floral toxins."
	projectile_type = /obj/projectile/bullet/reusable/arrow/poison
	icon_state = "arrow_poison"
	max_integrity = 20 // same as normal arrow; usually breaks on impact with a mob anyway

/obj/item/ammo_casing/caseless/rogue/arrow/stone/poison
	name = "poisoned stone arrow"
	desc = "A wooden shaft with a jagged rock on the end. This one is stained green with floral toxins."
	projectile_type = /obj/projectile/bullet/reusable/arrow/poison/stone
	icon_state = "stonearrow_poison"

/obj/projectile/bullet/reusable/arrow/poison
	name = "poison arrow"
	damage = 50
	damage_type = BRUTE
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/iron
	range = 15
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	poisontype = /datum/reagent/berrypoison //Support for future variations of poison for arrow-crafting
	poisonfeel = "burning" //Ditto
	poisonamount = 5 //Support and balance for bodkins, which will hold less poison due to how

//pyro bolts - stonekeep port 

/obj/item/ammo_casing/caseless/rogue/bolt/pyro
	name = "pyroclastic bolt"
	desc = "A bolt smeared with a flammable tincture."
	projectile_type = /obj/projectile/bullet/bolt/pyro
	possible_item_intents = list(/datum/intent/mace/strike)
	caliber = "regbolt"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "bolt_pyroclastic"
	dropshrink = 0.8
	max_integrity = 10
	force = 10

/obj/projectile/bullet/bolt/pyro
	name = "pyroclastic bolt"
	desc = "A bolt smeared with a flammable tincture."
	damage = 20
	damage_type = BRUTE
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "boltpyro_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bolt
	range = 15
	hitsound = 'sound/blank.ogg'
	embedchance = 0
	woundclass = BCLASS_BLUNT
	flag = "bullet"
	speed = 0.3

	var/explode_sound = list('sound/misc/explode/incendiary (1).ogg','sound/misc/explode/incendiary (2).ogg')

	//explosion values
	var/exp_heavy = 0
	var/exp_light = 0
	var/exp_flash = 0
	var/exp_fire = 1

/obj/projectile/bullet/bolt/pyro/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/living/M = target
		M.adjust_fire_stacks(6)
//		M.take_overall_damage(0,10) //between this 10 burn, the 10 brute, the explosion brute, and the onfire burn, my at about 65 damage if you stop drop and roll immediately
	var/turf/T
	if(isturf(target))
		T = target
	else
		T = get_turf(target)
	explosion(T, -1, exp_heavy, exp_light, exp_flash, 0, flame_range = exp_fire, soundin = explode_sound)

//pyro arrows
/obj/item/ammo_casing/caseless/rogue/arrow/pyro
	name = "pyroclastic arrow"
	desc = "An arrow with its tip drenched in a flammable tincture."
	projectile_type = /obj/projectile/bullet/arrow/pyro
	possible_item_intents = list(/datum/intent/mace/strike)
	caliber = "arrow"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow_pyroclastic"
	dropshrink = 0.8
	max_integrity = 10
	force = 10

/obj/projectile/bullet/arrow/pyro
	name = "pyroclatic arrow"
	desc = "An arrow with its tip drenched in a flammable tincture."
	damage = 15
	damage_type = BRUTE
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrowpyro_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow
	range = 15
	hitsound = 'sound/blank.ogg'
	embedchance = 0
	woundclass = BCLASS_BLUNT
	flag = "bullet"
	speed = 0.4

	var/explode_sound = list('sound/misc/explode/incendiary (1).ogg','sound/misc/explode/incendiary (2).ogg')

	//explosion values
	var/exp_heavy = 0
	var/exp_light = 0
	var/exp_flash = 0
	var/exp_fire = 1

/obj/projectile/bullet/arrow/pyro/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/living/M = target
		M.adjust_fire_stacks(6)
//		M.take_overall_damage(0,10) //between this 10 burn, the 10 brute, the explosion brute, and the onfire burn, my at about 65 damage if you stop drop and roll immediately
	var/turf/T
	if(isturf(target))
		T = target
	else
		T = get_turf(target)
	explosion(T, -1, exp_heavy, exp_light, exp_flash, 0, flame_range = exp_fire, soundin = explode_sound)

/obj/projectile/bullet/reusable/arrow/poison/stone
	name = "stone arrow"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow/stone

/obj/projectile/bullet/reusable/arrow/poison/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(istype(target, /mob/living/simple_animal)) //On-hit for carbon mobs has been moved to projectile act in living_defense.dm, to ensure poison is not applied if armor prevents damage.
		var/mob/living/simple_animal/M = target
		M.show_message(span_danger("You feel an intense burning sensation spreading swiftly from the puncture!")) //In case a player is in control of the mob.
		addtimer(CALLBACK(M, TYPE_PROC_REF(/mob/living, adjustToxLoss), 100), 10 SECONDS)
		addtimer(CALLBACK(M, TYPE_PROC_REF(/atom, visible_message), span_danger("[M] appears greatly weakened by the poison!")), 10 SECONDS)

//Musket spheres.
/obj/item/ammo_casing/caseless/rogue/bullet
	name = "iron sphere"
	desc = "A small iron sphere. It's been inscribed with countless runes, increasing its stopping power."
	projectile_type = /obj/projectile/bullet/reusable/bullet
	caliber = "runeball"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "musketball"
	dropshrink = 0.5
	possible_item_intents = list(/datum/intent/use)
	max_integrity = 0
	w_class = WEIGHT_CLASS_TINY

/obj/projectile/bullet/reusable/bullet
	name = "iron ball"
	desc = "A round iron shot, simple and spherical."
	damage = 65
	damage_type = BRUTE
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "musketball_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet
	range = 15
	jitter = 5
	eyeblur = 3
	hitsound = 'sound/combat/hits/hi_bolt (2).ogg'
	embedchance = 100
	woundclass = BCLASS_SHOT
	impact_effect_type = /obj/effect/temp_visual/impact_effect
	flag = "bullet"
	armor_penetration = 100
	speed = 0.3
	accuracy = 25 //Lower accuracy than an arrow.
/*
/obj/projectile/bullet/fragment
	name = "smaller lead ball"
	desc = "Haha. You're not able to see this!"
	damage = 25
	damage_type = BRUTE
	woundclass = BCLASS_SHOT
	range = 30
	jitter = 5
	eyeblur = 3
	stun = 1
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "musketball_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/cball/grapeshot
	impact_effect_type = /obj/effect/temp_visual/impact_effect
	flag = "bullet"
	armor_penetration = 100
	speed = 0.5

/obj/item/ammo_casing/caseless/rogue/bullet
	name = "iron sphere"
	desc = "A small iron ball, perfectly round. Deadly when projected at very high velocity."
	projectile_type = /obj/projectile/bullet/reusable/bullet
	caliber = "small_sphere"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "musketball"
	possible_item_intents = list(/datum/intent/use)
	max_integrity = 0
	force = 20

/obj/projectile/bullet/reusable/cannonball
	name = "large lead ball"
	desc = "A round lead ball. Complex and still spherical."
	damage = 300
	damage_type = BRUTE
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "musketball_proj" // No one sees it anyway. I think.
	ammo_type = /obj/item/ammo_casing/caseless/rogue/cball
	range = 999
	jitter = 5
	stun = 1
	hitsound = 'sound/combat/hits/hi_bolt (2).ogg'
	embedchance = 0
	dismemberment = 300
	spread = 0
	woundclass = BCLASS_SMASH
	impact_effect_type = /obj/effect/temp_visual/impact_effect
	flag = "bullet"
	hitscan = FALSE
	armor_penetration = 100
	speed = 0.8

/obj/projectile/bullet/reusable/cannonball/on_hit(atom/target,blocked = FALSE)
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.visible_message("<span class='danger'>[M] explodes into a shower of gibs!</span>")
		M.gib()
	explosion(get_turf(target), heavy_impact_range = 2, light_impact_range = 4, flame_range = 0, smoke = TRUE, soundin = pick('sound/misc/explode/bottlebomb (1).ogg','sound/misc/explode/bottlebomb (2).ogg'))
	..(target, blocked)

/obj/item/ammo_casing/caseless/rogue/cball
	name = "large lead ball"
	desc = "A round lead ball. Complex and still spherical."
	icon = 'icons/roguetown/weapons/ammo.dmi'
	projectile_type = /obj/projectile/bullet/reusable/cannonball
	dropshrink = 0.5
	icon_state = "cball"
	caliber = "cannoball"
	possible_item_intents = list(/datum/intent/use)
	max_integrity = 1
	randomspread = 0
	variance = 0
	force = 20

/obj/item/ammo_casing/caseless/rogue/cball/grapeshot
	name = "berryshot"
	desc = "A large pouch of smaller lead balls. Not as complex and not as spherical."
	icon_state = "grapeshot" // NEEDS SPRITE
	dropshrink = 0.5
	projectile_type = /obj/projectile/bullet/fragment

/obj/projectile/bullet/reusable/bullet
	name = "iron sphere"
	damage = 40
	armor_penetration = 50
	speed = 0.6
	damage_type = BRUTE
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "musketball"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet
	range = 30
	hitsound = 'sound/combat/hits/hi_bolt (2).ogg'
	embedchance = 100
	woundclass = BCLASS_STAB
	flag = "bullet"
	armor_penetration = 50
	speed = 0.1

/obj/projectile/bullet/reusable/bullet/on_hit(mob/living/target, blocked = FALSE)
	. = ..()

	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf)

		if(W && W.transformed == TRUE)
			H.adjustFireLoss(25)
			H.Paralyze(10)
			H.Stun(10)
			H.adjustFireLoss(25)
			H.fire_act(1,10)
			to_chat(H, span_userdanger("I'm hit by my BANE!"))
*/

//// Kaizoku Edition ////
/*
/obj/projectile/bullet/reusable/arrow/poison/fog
	name = "fog arrow"
	desc = "An arrow with it's tip drenched in a powerful sedative."
	icon = 'icons/roguetown/kaizoku/weapons/ammo.dmi'
	icon_state = "arrowfog_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow

/obj/item/ammo_casing/caseless/rogue/arrow/poison/fog
	name = "fog arrow"
	desc = "An arrow with it's tip drenched in a powerful sedative."
	projectile_type = /obj/projectile/bullet/reusable/arrow/poison/fog
	icon = 'icons/roguetown/kaizoku/weapons/ammo.dmi'
	icon_state = "arrow_fog"

/obj/projectile/bullet/reusable/arrow/poison/fog/Initialize()
	. = ..()
	create_reagents(50, NO_REACT)

/obj/projectile/bullet/reusable/arrow/poison/fog/on_hit(atom/target, blocked = FALSE)
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(blocked != 100) // not completely blocked
			if(M.can_inject(null, FALSE, def_zone, piercing)) // Pass the hit zone to see if it can inject by whether it hit the head or the body.
				..()
				reagents.reaction(M, INJECT)
				reagents.trans_to(M, reagents.total_volume)
				return BULLET_ACT_HIT
			else
				blocked = 100
				target.visible_message("<span class='danger'>\The [src] was deflected!</span>", \
									   "<span class='danger'>My armor protected me against \the [src]!</span>")

	..(target, blocked)
	DISABLE_BITFIELD(reagents.flags, NO_REACT)
	reagents.handle_reactions()
	return BULLET_ACT_HIT

/obj/projectile/bullet/reusable/arrow/poison/fog/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/fogblight, 5)

/obj/item/ammo_casing/caseless/rogue/bolt/poison/fog
	name = "fog bolt"
	desc = "A bolt dipped with a potent sedative."
	projectile_type = /obj/projectile/bullet/reusable/bolt/poison/fog
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	icon = 'icons/roguetown/kaizoku/weapons/ammo.dmi'
	icon_state = "bolt_fog"

/obj/projectile/bullet/reusable/bolt/poison/fog
	name = "fog bolt"
	desc = "A bolt dipped with a potent sedative."
	damage = 35
	damage_type = BRUTE
	icon = 'icons/roguetown/kaizoku/weapons/ammo.dmi'
	icon_state = "boltfogn_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bolt

/obj/projectile/bullet/reusable/bolt/poison/fog/Initialize()
	. = ..()
	create_reagents(50, NO_REACT)

/obj/projectile/bullet/reusable/bolt/poison/fog/on_hit(atom/target, blocked = FALSE)
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(blocked != 100) // not completely blocked
			if(M.can_inject(null, FALSE, def_zone, piercing)) // Pass the hit zone to see if it can inject by whether it hit the head or the body.
				..()
				reagents.reaction(M, INJECT)
				reagents.trans_to(M, reagents.total_volume)
				return BULLET_ACT_HIT
			else
				blocked = 100
				target.visible_message("<span class='danger'>\The [src] was deflected!</span>", \
									   "<span class='danger'>My armor protected me against \the [src]!</span>")

	..(target, blocked)
	DISABLE_BITFIELD(reagents.flags, NO_REACT)
	reagents.handle_reactions()
	return BULLET_ACT_HIT

/obj/projectile/bullet/reusable/bolt/poison/fog/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/fogblight, 5)
*/
//Javelins - Basically spears, but to get them working as proper javelins and able to fit in a bag, they are 'ammo'. (Maybe make an atlatl later?)
//Only ammo casing, no 'projectiles'. You throw the casing, as weird as it is.
/obj/item/ammo_casing/caseless/rogue/javelin
	force = 14
	throw_speed = 3		//1 lower than throwing knives, it hits harder + embeds more.
	name = "iron javelin"
	desc = "A tool used for centuries, as early as recorded history. This one is tipped with a iron head; standard among militiamen and irregulars alike."
	icon = 'icons/roguetown/weapons/ammo.dmi'
	icon_state = "ijavelin"
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_BULKY
	max_integrity = 50						//Breaks semi-easy, stops constant re-use. 
	wdefense = 3							//Worse than a spear
	thrown_bclass = BCLASS_STAB				//Knives are slash, lets try out stab and see if it's too strong in terms of wounding.
	throwforce = 25							//throwing knife is 22, slightly better for being bulkier.
	possible_item_intents = list(/datum/intent/sword/thrust, /datum/intent/spear/bash, /datum/intent/spear/cut)	//Sword-thrust to avoid having 2 reach.
	embedding = list("embedded_pain_multiplier" = 4, "embed_chance" = 35, "embedded_fall_chance" = 10)	//Better than iron throwing knife by 10%
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/polearms
	heavy_metal = FALSE					//Stops spin animation, maybe.

/obj/item/ammo_casing/caseless/rogue/javelin/steel
	force = 16
	name = "steel javelin"
	desc = "A tool used for centuries, as early as recorded history. This one is tipped with a steel head; perfect for piercing armor!"
	icon_state = "javelin"
	max_integrity = 100						//In-line with other stabbing weapons.
	throwforce = 28							//Equal to steel knife BUT this has peircing damage type so..
	thrown_bclass = BCLASS_PICK				//Bypasses crit protection better than stabbing. Makes it better against heavy-targets.
	embedding = list("embedded_pain_multiplier" = 4, "embed_chance" = 45, "embedded_fall_chance" = 10) //Better than steel throwing knife by 10%
	smeltresult = /obj/item/ingot/steel

/obj/item/ammo_casing/caseless/rogue/javelin/silver
	name = "silver javelin"
	desc = "A tool used for centuries, as early as recorded history. This one appears to be tipped with a silver head. Decorative, perhaps.. or for some sort of specialized hunter."
	icon_state = "sjavelin"
	is_silver = TRUE
	throwforce = 25							//Less than steel because it's.. silver. Good at killing vampires/WW's still.
	thrown_bclass = BCLASS_PICK				//Bypasses crit protection better than stabbing. Makes it better against heavy-targets.
	smeltresult = /obj/item/ingot/silver

//Snowflake code to make sure the silver-bane is applied on hit to targeted mob. Thanks to Aurorablade for getting this code to work.
/obj/item/ammo_casing/caseless/rogue/javelin/silver/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	..() 
	if(!iscarbon(hit_atom))
		return//abort
	check_dmg(hit_atom)//apply effects and damages
		
/obj/item/ammo_casing/caseless/rogue/javelin/silver/proc/check_dmg(mob/living/hit_atom)
	var/mob/living/carbon/human/H = hit_atom
	if(H.mind)
		var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
		var/datum/antagonist/vampirelord/lesser/V = H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser)
		var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(V)
			if(V.disguised)
				H.visible_message("<font color='white'>The silver weapon weakens the curse temporarily!</font>")
				to_chat(H, span_userdanger("I'm hit by my BANE!"))
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
			else
				H.visible_message("<font color='white'>The silver weapon weakens the curse temporarily!</font>")
				to_chat(H, span_userdanger("I'm hit by my BANE!"))
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
		if(V_lord)
			if(V_lord.vamplevel < 4 && !V)
				H.visible_message("<font color='white'>The silver weapon weakens the curse temporarily!</font>")
				to_chat(H, span_userdanger("I'm hit by my BANE!"))
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
			if(V_lord.vamplevel == 4 && !V)
				to_chat(H, "<font color='red'> The silver weapon fails!</font>")
				H.visible_message(H, span_userdanger("This feeble metal can't hurt me, I AM ANCIENT!"))
		if(W && W.transformed == TRUE)
			H.visible_message("<font color='white'>The silver weapon weakens the curse temporarily!</font>")
			to_chat(H, span_userdanger("I'm hit by my BANE!"))
			H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
			src.last_used = world.time
	return

#undef ARROW_DAMAGE
#undef BOLT_DAMAGE
#undef BULLET_DAMAGE
#undef ARROW_PENETRATION
#undef BOLT_PENETRATION
#undef BULLET_PENETRATION
