/datum/component/storage/concrete/roguetown
	grid = TRUE

/datum/component/storage/concrete/roguetown/satchel
	screen_max_rows = 4
	max_w_class = WEIGHT_CLASS_NORMAL

/datum/component/storage/concrete/roguetown/backpack
	screen_max_rows = 7
	screen_max_columns = 4
	max_w_class = WEIGHT_CLASS_NORMAL
	not_while_equipped = TRUE

/datum/component/storage/concrete/roguetown/bagofholding
	screen_max_rows = 9
	screen_max_columns = 6
	max_w_class = WEIGHT_CLASS_GIGANTIC
	not_while_equipped = TRUE
	allow_big_nesting = TRUE

/datum/component/storage/concrete/roguetown/bagofholding/handle_item_insertion(obj/item/W, prevent_warning = FALSE, mob/user, datum/component/storage/remote, params, storage_click = FALSE)
	var/atom/A = parent
	if(A == W)		//don't put myself into myself.
		return
	var/list/obj/item/storage/backpack/rogue/bag_of_holding/matching = typecache_filter_list(W.GetAllContents(), typecacheof(/obj/item/storage/backpack/rogue/bag_of_holding))
	matching -= A
	if(istype(W, /obj/item/storage/backpack/rogue/bag_of_holding) || matching.len)
		var/safety = alert(user, "Doing this will have extremely dire consequences for yourself and everything surrounding you.", "Put in [A.name]?", "Abort", "Proceed")
		if(safety != "Proceed" || QDELETED(A) || QDELETED(W) || QDELETED(user) || !user.canUseTopic(A, BE_CLOSE, iscarbon(user)))
			return
		var/turf/loccheck = get_turf(A)
		to_chat(user, span_danger("The dimensional spaces of the bags of holding conflict with one another!"))
		qdel(W)
		playsound(loccheck,'sound/blank.ogg', 200, TRUE)

		message_admins("[ADMIN_LOOKUPFLW(user)] detonated a bag of holding at [ADMIN_VERBOSEJMP(loccheck)].")
		log_game("[key_name(user)] detonated a bag of holding at [loc_name(loccheck)].")
		explosion(A, heavy_impact_range = 3, light_impact_range = 5, smoke = TRUE, soundin = pick('sound/misc/explode/incendiary (1).ogg','sound/misc/explode/incendiary (2).ogg'))
		qdel(A)
		return
	. = ..()

/datum/component/storage/concrete/roguetown/surgery_bag
	screen_max_rows = 5
	screen_max_columns = 4
	max_w_class = WEIGHT_CLASS_NORMAL

/datum/component/storage/concrete/roguetown/belt
	screen_max_rows = 3
	screen_max_columns = 2
	max_w_class = WEIGHT_CLASS_SMALL

/datum/component/storage/concrete/roguetown/coin_pouch
	screen_max_rows = 4
	screen_max_columns = 1
	max_w_class = WEIGHT_CLASS_NORMAL
	not_while_equipped = FALSE

/datum/component/storage/concrete/roguetown/keyring
	screen_max_rows = 4
	screen_max_columns = 5
	max_w_class = WEIGHT_CLASS_SMALL
	allow_dump_out = TRUE
	click_gather = TRUE
	attack_hand_interact = FALSE
	insert_preposition = "on"
	rustle_sound = 'sound/items/gems (1).ogg'

/datum/component/storage/concrete/roguetown/keyring/New(datum/P, ...)
	. = ..()
	can_hold = typecacheof(list(/obj/item/roguekey))

/datum/component/storage/concrete/roguetown/belt/knife_belt
	screen_max_rows = 6
	screen_max_columns = 4

/datum/component/storage/concrete/roguetown/belt/knife_belt/New(datum/P, ...)
	. = ..()
	can_hold = typecacheof(list(/obj/item/rogueweapon/huntingknife/throwingknife))


/datum/component/storage/concrete/roguetown/belt/cloth
	screen_max_columns = 1

/datum/component/storage/concrete/roguetown/belt/assassin
	max_w_class = WEIGHT_CLASS_NORMAL

/datum/component/storage/concrete/roguetown/cloak
	max_w_class = WEIGHT_CLASS_NORMAL
	screen_max_rows = 2
	screen_max_columns = 2

/datum/component/storage/concrete/roguetown/cloak/lord
	max_w_class = WEIGHT_CLASS_BULKY

/datum/component/storage/concrete/roguetown/mailmaster
	max_w_class = WEIGHT_CLASS_HUGE
	screen_max_rows = 10
	screen_max_columns = 10

/datum/component/storage/concrete/roguetown/bin
	max_w_class = WEIGHT_CLASS_HUGE
	screen_max_rows = 8
	screen_max_columns = 4

/datum/component/storage/concrete/roguetown/sack
	max_w_class = WEIGHT_CLASS_NORMAL
	screen_max_rows = 5
	screen_max_columns = 4
	click_gather = TRUE
	dump_time = 0
	allow_quick_gather = TRUE
	allow_quick_empty = TRUE
	insert_preposition = "in"
