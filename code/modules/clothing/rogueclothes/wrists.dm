/obj/item/clothing/wrists/roguetown
	slot_flags = ITEM_SLOT_WRISTS
	sleeved = 'icons/roguetown/clothing/onmob/wrists.dmi'
	icon = 'icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/wrists.dmi'
	sleevetype = "shirt"

/obj/item/clothing/wrists/roguetown/bracers
	name = "bracers"
	desc = ""
	body_parts_covered = ARMS
	icon_state = "bracers"
	item_state = "bracers"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	resistance_flags = FIRE_PROOF
	max_integrity = 300
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/wrists/roguetown/bracers/leather
	name = "leather bracers"
	desc = ""
	icon_state = "lbracers"
	item_state = "lbracers"
	armor = list("blunt" = 50, "slash" = 25, "stab" = 40, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide

/obj/item/clothing/wrists/roguetown/wrappings
	name = "solar wrappings"
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "wrappings"
	item_state = "wrappings"
	sewrepair = TRUE

/obj/item/clothing/wrists/roguetown/nocwrappings
	name = "moon wrappings"
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "nocwrappings"
	item_state = "nocwrappings"
	sewrepair = TRUE


/obj/item/clothing/wrists/roguetown/splintarms
	name = "brigandine rerebraces"
	desc = "Brigandine bracers, pauldrons and a set of metal couters, designed to protect the arms while still providing almost complete free range of movement."
	body_parts_covered = ARMS
	icon_state = "splintarms"
	item_state = "splintarms"
	armor = list("blunt" = 60, "slash" = 70, "stab" = 70, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = SOFTHIT
	max_integrity = 250
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/iron
	armor_class = ARMOR_CLASS_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = FIRE_PROOF
	sewrepair = FALSE

///////////////////////////////////////////////////////////////////
// Part of Kaizoku project that is still yet to be finished.     //
// The Demo usage is meant for Stonekeep and Warmongers.		 //
// If the usage for other sources is desired, before it finishes,//
// ask monochrome9090 for permission. Respect the artists's will.//
// If you want this quality content, COMMISSION me instead. 	 //
// For this project, requirements are low, and mostly lore-based.//
// I just do not desire for the Abyssariads to be butchered.	 //
///////////////////////////////////////////////////////////////////

/obj/item/clothing/wrists/roguetown/bracers/kote
	name = "kote"
	desc = "A sashinuki kote, the armored sleeves and gloves knitted into a jacketed layer. It belongs as one of the armor component of sangu, together with suneate and haidate."
	icon = 'icons/roguetown/kaizoku/clothingicon/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/wrists.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/wrists.dmi'
	body_parts_covered = ARMS|HANDS //bracer that protects hands and arms. Costier. Why no one made something with this theme before?
	icon_state = "kote"
	item_state = "kote"

/obj/item/clothing/wrists/roguetown/bracers/kote/cursed/Initialize()
	. = ..()
	name = "soulbinded kote"
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/wrists/roguetown/bracers/mountainstar
	name = "weeping god-patterned bracers"
	desc = "Y-shaped steel plates marks this bracer everywhere it is looked upon, most proper for the Weeping God."
	icon = 'icons/roguetown/kaizoku/clothingicon/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/wrists.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/wrists.dmi'
	icon_state = "mountainstar"
	item_state = "mountainstar"

/obj/item/clothing/wrists/roguetown/splintarms/dragonwrap
	name = "dragon wrappings"
	desc = "fireproof cloth wrappings to cover the arms and hands. It is completely made of asbestos and resin keeping its toxicity in place. For now."
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "dragonwrap"
	item_state = "dragonwrap"
	icon = 'icons/roguetown/kaizoku/clothingicon/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/wrists.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/wrists.dmi'
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 50, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 0)
	heat_protection = ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/wrists/roguetown/bracers/leather/khudagach
	name = "khudagach bracers"
	desc = "Oil-boiled leather bracers made to protect the forearms and wrists of abyssariad archers, light cavalry and farming folk."
	icon_state = "khudagach"
	item_state = "khudagach"
	icon = 'icons/roguetown/kaizoku/clothingicon/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/wrists.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/wrists.dmi'

/obj/item/clothing/wrists/roguetown/splintarms/bonebracer
	name = "bone bracers"
	desc = "the bracers made of rough bone and iron ore, usually created and used by tribalistic Abyssals."
	icon = 'icons/roguetown/kaizoku/clothingicon/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/wrists.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/wrists.dmi'
	icon_state = "bonebracers"
	item_state = "bonebracers"
	blocksound = SOFTHIT
	smeltresult = /obj/item/ash
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'

/obj/item/clothing/wrists/roguetown/shrinekeeper
	slot_flags = ITEM_SLOT_WRISTS
	name = "purificators"
	desc = "Blessed gauntlets for those who believes they can punch spirits."
	icon = 'icons/roguetown/kaizoku/clothingicon/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/wrists.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/wrists.dmi'
	icon_state = "shrinekeeper_gauntlet"
	sleevetype = "shirt"
	resistance_flags = FLAMMABLE
	sewrepair = TRUE
	anvilrepair = null
