/datum/crafting_recipe/roguetown/rucksack
	name = "Rucksack"
	result = /obj/item/storage/backpack/rogue/backpack/rucksack
	reqs = list(/obj/item/rope = 1, /obj/item/storage/roguebag/crafted = 1,)
	craftdiff = 0
	skillcraft = /datum/skill/craft/crafting

/obj/item/storage/backpack/rogue/backpack/rucksack
	name = "rucksack"
	desc = "A bulky rucksack worn on the back which can store many items."
	icon_state = "rucksack"
	item_state = "rucksack"
	icon = 'icons/roguetown/clothing/storage.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	resistance_flags = NONE
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	bloody_icon_state = "bodyblood"
	sewrepair = TRUE
	component_type = /datum/component/storage/concrete/roguetown/rucksack

/obj/item/quest_board
	name = "quest board"
	desc = "A board with various quests posted on it."
	icon = 'modular_guidesa/items_stuffs_any.dmi'
	icon_state = "quest_board"
	density = FALSE
	opacity = FALSE
	anchored = TRUE
	max_integrity = 300
	w_class = WEIGHT_CLASS_GIGANTIC
	drag_slowdown = 2
	throw_speed = 1
	throw_range = 1

/obj/item/quest_board/Initialize()
	AddComponent(/datum/component/storage/concrete/roguetown/bin)
	. = ..()

/obj/item/quest_board/Destroy()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))
	return ..()

/obj/item/quest_board/attack_hand(mob/user)
	var/datum/component/storage/CP = GetComponent(/datum/component/storage)
	if(CP)
		CP.rmb_show(user)
		return TRUE


/obj/item/quest_board/quest_board_bin
	name = "bin board" //This is a bin that is also a board
	desc = "A board with various quests posted on it. It also has a bin attached to it."
	icon = 'modular_guidesa/items_stuffs_any.dmi'
	icon_state = "bin_board"
