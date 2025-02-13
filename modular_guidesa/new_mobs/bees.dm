/mob/living/simple_animal/hostile/retaliate/rogue/bee
	icon = 'icons/roguetown/mob/monster/32x32.dmi'
	name = "domesticated giant bee"
	icon_state = "masterbee"
	icon_living = "masterbee"
	icon_dead = "masterbee_dead"
	gender = FEMALE
	speak_chance = 1
	turns_per_move = 3
	see_in_dark = 6
	move_to_delay = 4
	vision_range = 5
	aggro_vision_range = 9
	base_intents = list(/datum/intent/simple/bite)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 1,
					/obj/item/natural/silk = 2)
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	attack_sound = 'sound/combat/wooshes/punch/punchwoosh (2).ogg'
	health = 125
	maxHealth = 125
	melee_damage_lower = 17
	melee_damage_upper = 21
	environment_smash = ENVIRONMENT_SMASH_NONE
	retreat_distance = 0
	minimum_distance = 0
	milkies = FALSE
	food_type = list(/obj/item/bodypart, /obj/item/organ, /obj/item/reagent_containers/food/snacks/rogue/meat, /obj/item/reagent_containers/food/snacks/grown/berries/rogue)
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	STACON = 6
	STASTR = 9
	STASPD = 10
	deaggroprob = 0
	defprob = 40
	defdrain = 10
	attack_same = 0
	retreat_health = 0.3
	attack_sound = list('sound/vo/mobs/spider/attack (1).ogg','sound/vo/mobs/spider/attack (2).ogg','sound/vo/mobs/spider/attack (3).ogg','sound/vo/mobs/spider/attack (4).ogg')
	aggressive = 0
	stat_attack = UNCONSCIOUS
	faction = list("neutral", "Station")

	// By default they can be only in hay, they are domesticated.
	var/global/list/suitable_turf_types =  list(
		/turf/open/floor/rogue/hay
	)

// Makes the AI unable to willingly go on land.
/mob/living/simple_animal/hostile/retaliate/rogue/bee/Move(newloc, dir = 0)
	if(!istype(newloc, /turf)) // Ensure the target location is a turf
		return FALSE
	if(!is_type_in_list(newloc, suitable_turf_types)) // Restrict movement to water turfs
		return FALSE
	return ..(newloc, dir) // Proceed as normal if valid



/mob/living/simple_animal/hostile/retaliate/rogue/bee/AttackingTarget()
	. = ..()
	if(. && isliving(target))
		var/mob/living/L = target
		if(L.reagents)
			L.reagents.add_reagent(/datum/reagent/toxin/venom, 1)


/obj/structure/bee
	icon = 'modular_guidesa/dmi_folder/bees.dmi'
	icon_state = "beehive"
	name = "honeyhive"
	desc = "A hive specifically made to produce honey instead of larvas"
	max_integrity = 700
	density = TRUE
	anchored = TRUE
	var/honey_count = 0
	var/max_honey = 5
	var/spawning_honey = FALSE

/obj/structure/bee/Initialize()
	. = ..()
	spawn_honey()

/obj/structure/bee/proc/create_honey()
	if(QDELETED(src))
		return
	if(!spawning_honey)
		return
	spawning_honey = FALSE
	new /obj/item/reagent_containers/food/snacks/rogue/honey(get_turf(src))
	honey_count++
	if(honey_count < max_honey)
		spawn_honey()

/obj/structure/bee/proc/spawn_honey()
	if(QDELETED(src))
		return
	if(spawning_honey)
		return
	spawning_honey = TRUE
	spawn(30 SECONDS)
		create_honey()


/obj/structure/beehive
	icon = 'modular_guidesa/dmi_folder/bees.dmi'
	icon_state = "beehive_bee"
	name = "brood chamber"
	desc = "A hive specifically made to produce bees instead of honey"
	max_integrity = 250
	density = TRUE
	anchored = TRUE
	var/bee_count = 0 // Keeps track of the number of bees spawned
	var/max_bees = 2 // Maximum number of bees allowed
	var/spawning_bee = FALSE

/obj/structure/beehive/Initialize()
	. = ..()
	spawn_bees()

/obj/structure/beehive/proc/create_bee()
	if(QDELETED(src))
		return
	if(!spawning_bee)
		return
	spawning_bee = FALSE
	// var/mob/living/simple_animal/hostile/retaliate/rogue/bee/new_bee = new /mob/living/simple_animal/hostile/retaliate/rogue/bee(get_turf(src)) // Defined but not used. Find a spot for this.
	bee_count++
	if(bee_count < max_bees)
		spawn_bees()

/obj/structure/beehive/proc/spawn_bees()
	if(QDELETED(src))
		return
	if(spawning_bee)
		return
	spawning_bee = TRUE
	spawn(30 SECONDS)
		create_bee()
