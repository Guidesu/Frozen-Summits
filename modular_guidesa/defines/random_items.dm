/obj/item/clothing/ring/duelist
	name = "duelist's ring"
	desc = "Born out of duelists desire for theatrics, this ring denotes a proposal — an honorable duel, with stakes set ahigh.\nIf both duelists wear this ring, successful baits will off balance them, and clashing disarms will never be unlikely.\n<i>'You shall know his name. You shall know his purpose. You shall die.'</i>"
	icon_state = "ring_duel"
	sellprice = 10

/obj/item/rogueweapon/pick/copper
	name = "copper pick"
	desc = "A copper pick, slightly better than a stone pick."
	force = 15
	force_wielded = 19
	icon_state = "cpick"
	max_integrity = 325
	smeltresult = /obj/item/ingot/copper

/obj/item/rogueweapon/pick/aalloy
	name = "decrepit pick"
	desc = "A decrepit old pick. Aeon's grasp is upon it."
	force = 12
	force_wielded = 17
	icon_state = "apick"
	possible_item_intents = list(/datum/intent/pick)
	gripped_intents = list(/datum/intent/pick)
	max_integrity = 150
	smeltresult = /obj/item/ingot/aalloy


/obj/item/storage/fancy/pilltin
	name = "pill tin"
	desc = "a tin for all your pill needs, snake branded (close/open mmb)"
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "pilltin"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1
	slot_flags = null

/obj/item/storage/fancy/pilltin/update_icon()
	if(fancy_open)
		if(contents.len == 0)
			icon_state = "pilltin_empty"
		else
			icon_state = "pilltincustom_open"
	else
		icon_state = "pilltin"

/obj/item/storage/fancy/pilltin/examine(mob/user)
	. = ..()
	if(fancy_open)
		if(length(contents) == 1)
			. += "There is one item left."
		else
			. += "There are [contents.len <= 0 ? "no" : "[contents.len]"] items left."

/obj/item/storage/fancy/pilltin/attack_self(mob/user)
	fancy_open = !fancy_open
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltin/Entered(mob/user)
	if(!fancy_open)
		to_chat(user, span_notice("[src] needs to be opened first."))
		return
	fancy_open = TRUE
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltin/Exited(mob/user)
	fancy_open = FALSE
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltin/MiddleClick(mob/user, params)
	fancy_open = !fancy_open
	update_icon()
	to_chat(user, span_notice("[src] is now [fancy_open ? "open" : "closed"]."))

/obj/item/storage/fancy/pilltinwake
	name = "pill tin (wake)"
	desc = "a tin for all your pill needs, snake branded (close/open mmb)"
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "pilltin"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1
	slot_flags = null

/obj/item/storage/fancy/pilltinwake/update_icon()
	if(fancy_open)
		if(contents.len == 0)
			icon_state = "pilltin_empty"
		else
			icon_state = "pilltinwake_open"
	else
		icon_state = "pilltin"

/obj/item/storage/fancy/pilltinwake/examine(mob/user)
	. = ..()
	if(fancy_open)
		if(length(contents) == 1)
			. += "There is one item left."
		else
			. += "There are [contents.len <= 0 ? "no" : "[contents.len]"] items left."

/obj/item/storage/fancy/pilltinwake/attack_self(mob/user)
	fancy_open = !fancy_open
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltinwake/Entered(mob/user)
	if(!fancy_open)
		to_chat(user, span_notice("[src] needs to be opened first."))
		return
	fancy_open = TRUE
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltinwake/Exited(mob/user)
	fancy_open = FALSE
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltinwake/MiddleClick(mob/user, params)
	fancy_open = !fancy_open
	update_icon()
	to_chat(user, span_notice("[src] is now [fancy_open ? "open" : "closed"]."))

/obj/item/storage/fancy/pilltinwake/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 42
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 12
		STR.set_holdable(list(/obj/item/reagent_containers/pill/caffpill))

/obj/item/storage/fancy/pilltinwake/PopulateContents()
	new /obj/item/reagent_containers/pill/caffpill(src)
	new /obj/item/reagent_containers/pill/caffpill(src)
	new /obj/item/reagent_containers/pill/caffpill(src)

/obj/item/storage/fancy/pilltinpink
	name = "pill tin (pnk)"
	desc = "a tin for all your pill needs, snake branded (close/open mmb)"
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "pilltin"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1
	slot_flags = null

/obj/item/storage/fancy/pilltinpink/update_icon()
	if(fancy_open)
		if(contents.len == 0)
			icon_state = "pilltin_empty"
		else
			icon_state = "pilltinpink_open"
	else
		icon_state = "pilltin"

/obj/item/storage/fancy/pilltinpink/examine(mob/user)
	. = ..()
	if(fancy_open)
		if(length(contents) == 1)
			. += "There is one item left."
		else
			. += "There are [contents.len <= 0 ? "no" : "[contents.len]"] items left."

/obj/item/storage/fancy/pilltinpink/attack_self(mob/user)
	fancy_open = !fancy_open
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltinpink/Entered(mob/user)
	if(!fancy_open)
		to_chat(user, span_notice("[src] needs to be opened first."))
		return
	fancy_open = TRUE
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltinpink/Exited(mob/user)
	fancy_open = FALSE
	update_icon()
	. = ..()

/obj/item/storage/fancy/pilltinpink/MiddleClick(mob/user, params)
	fancy_open = !fancy_open
	update_icon()
	to_chat(user, span_notice("[src] is now [fancy_open ? "open" : "closed"]."))

/obj/item/storage/fancy/pilltinpink/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 42
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 12
		STR.set_holdable(list(/obj/item/reagent_containers/pill/pnkpill))

/obj/item/storage/fancy/pilltinpink/PopulateContents()
	new /obj/item/reagent_containers/pill/pnkpill(src)
	new /obj/item/reagent_containers/pill/pnkpill(src)
	new /obj/item/reagent_containers/pill/pnkpill(src)

/obj/item/storage/fancy/skit
	name = "surgery kit"
	desc = "portable and compact (close/open mmb)"
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "skit"
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 1
	slot_flags = null

/obj/item/storage/fancy/skit/update_icon()
	if(fancy_open)
		if(contents.len == 0)
			icon_state = "skit_empty"
		else
			icon_state = "skit_open"
	else
		icon_state = "skit"

/obj/item/storage/fancy/skit/examine(mob/user)
	. = ..()
	if(fancy_open)
		if(length(contents) == 1)
			. += "There is one item left."
		else
			. += "There are [contents.len <= 0 ? "no" : "[contents.len]"] items left."

/obj/item/storage/fancy/skit/attack_self(mob/user)
	fancy_open = !fancy_open
	update_icon()
	. = ..()

/obj/item/storage/fancy/skit/Entered(mob/user)
	if(!fancy_open)
		to_chat(user, span_notice("[src] needs to be opened first."))
		return
	fancy_open = TRUE
	update_icon()
	. = ..()

/obj/item/storage/fancy/skit/Exited(mob/user)
	fancy_open = FALSE
	update_icon()
	. = ..()

/obj/item/storage/fancy/skit/MiddleClick(mob/user, params)
	fancy_open = !fancy_open
	update_icon()
	to_chat(user, span_notice("[src] is now [fancy_open ? "open" : "closed"]."))

/obj/item/storage/fancy/skit/ComponentInitialize()
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 10
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 42
	STR.set_holdable(list(
		/obj/item/rogueweapon/surgery/scalpel,
		/obj/item/rogueweapon/surgery/saw,
		/obj/item/rogueweapon/surgery/hemostat,
		/obj/item/rogueweapon/surgery/retractor,
		/obj/item/rogueweapon/surgery/bonesetter,
		/obj/item/rogueweapon/surgery/cautery,
		/obj/item/natural/worms/leech/cheele,
		/obj/item/needle,
		/obj/item/needle/thorn,
		/obj/item/needle/pestra
	))

/obj/item/storage/fancy/skit/PopulateContents()
	new /obj/item/rogueweapon/surgery/scalpel(src)
	new /obj/item/rogueweapon/surgery/saw(src)
	new /obj/item/rogueweapon/surgery/hemostat(src)
	new /obj/item/rogueweapon/surgery/hemostat(src)
	new /obj/item/rogueweapon/surgery/retractor(src)
	new /obj/item/rogueweapon/surgery/bonesetter(src)
	new /obj/item/rogueweapon/surgery/cautery(src)
	new /obj/item/natural/worms/leech/cheele(src)
	new /obj/item/needle/pestra(src)

/obj/item/storage/fancy/ifak
	name = "personal patch kit"
	desc = "Dr V's personal treatment pouch; has all you need to stop you or someone else from meeting necra. even comes with a lil guide scroll for the slow minded. (close/open mmb)"
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "ifak"
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 1
	slot_flags = null

/obj/item/storage/fancy/ifak/PopulateContents()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	for(var/i = 1 to STR.max_items)
		new spawn_type(src)

/obj/item/storage/fancy/ifak/update_icon()
	if(fancy_open)
		if(contents.len == 0)
			icon_state = "ifak_empty"
		else
			icon_state = "ifak_open"
	else
		icon_state = "ifak"

/obj/item/storage/fancy/ifak/examine(mob/user)
	. = ..()
	if(fancy_open)
		if(length(contents) == 1)
			. += "There is one item left."
		else
			. += "There are [contents.len <= 0 ? "no" : "[contents.len]"] items left."

/obj/item/storage/fancy/ifak/attack_self(mob/user)
	fancy_open = !fancy_open
	update_icon()
	. = ..()

/obj/item/storage/fancy/ifak/Entered(mob/user)
	if(!fancy_open)
		to_chat(user, span_notice("[src] needs to be opened first."))
		return
	fancy_open = TRUE
	update_icon()
	. = ..()

/obj/item/storage/fancy/ifak/Exited(mob/user)
	fancy_open = FALSE
	update_icon()
	. = ..()

/obj/item/storage/fancy/ifak/MiddleClick(mob/user, params)
	fancy_open = !fancy_open
	update_icon()
	to_chat(user, span_notice("[src] is now [fancy_open ? "open" : "closed"]."))

/obj/item/storage/fancy/ifak/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 8
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 42
	STR.set_holdable(list(
		/obj/item/reagent_containers/hypospray/medipen/sealbottle/reju,
		/obj/item/reagent_containers/hypospray/medipen/sty/detox,
		/obj/item/natural/cloth/bandage,
		/obj/item/natural/bundle/cloth/bandage,
		/obj/item/natural/bundle/cloth/bandage/full,
		/obj/item/reagent_containers/pill/pnkpill,
		/obj/item/candle,
		/obj/item/needle,
		/obj/item/needle/thorn,
		/obj/item/needle/pestra,
	))

/obj/item/storage/fancy/ifak/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/sealbottle/reju(src)
	new /obj/item/natural/bundle/cloth/bandage/full(src)
	new /obj/item/reagent_containers/hypospray/medipen/sty/detox(src)
	new /obj/item/reagent_containers/pill/pnkpill(src)
	new /obj/item/candle/yellow(src)
	new /obj/item/needle(src)

/obj/item/storage/backpack/rogue/satchel/heartfelt/PopulateContents()
	new /obj/item/natural/feather(src)
	new /obj/item/paper(src)


/obj/item/storage/backpack/rogue/bag_of_holding
	name = "bag of holding"
	desc = ""
	icon_state = "rogueboh"
	item_state = "rogueboh"
	icon = 'icons/roguetown/clothing/storage.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK_L
	resistance_flags = FIRE_PROOF
	max_integrity = 600
	equip_sound = 'sound/blank.ogg'
	bloody_icon_state = "bodyblood"
	sewrepair = TRUE
	component_type = /datum/component/storage/concrete/roguetown/bagofholding


/datum/component/storage/concrete/roguetown/sack/bag
	dump_time = 10
	not_while_equipped = TRUE
	click_gather = FALSE
	allow_quick_gather = FALSE
	allow_quick_empty = FALSE


/obj/item/storage/belt/rogue/pouch/ammo
	name = "sphere pouch"
	desc = "Usually used for holding runelock sphreres."

/obj/item/storage/belt/rogue/pouch/bullets/Initialize()
	. = ..()
	new /obj/item/ammo_casing/caseless/rogue/bullet(src)
	new /obj/item/ammo_casing/caseless/rogue/bullet(src)
	new /obj/item/ammo_casing/caseless/rogue/bullet(src)


/obj/item/storage/belt/rogue/pouch/ammo/PopulateContents()
	new /obj/item/ammo_casing/caseless/rogue/bullet(src)
	new /obj/item/ammo_casing/caseless/rogue/bullet(src)
	new /obj/item/ammo_casing/caseless/rogue/bullet(src)
