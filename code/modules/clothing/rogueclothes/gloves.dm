
/obj/item/clothing/gloves/roguetown
	slot_flags = ITEM_SLOT_GLOVES
	body_parts_covered = HANDS
	sleeved = 'icons/roguetown/clothing/onmob/gloves.dmi'
	icon = 'icons/roguetown/clothing/gloves.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/gloves.dmi'
	bloody_icon_state = "bloodyhands"
	sleevetype = "shirt"
	max_heat_protection_temperature = 361

/obj/item/clothing/gloves/roguetown/leather
	name = "leather gloves"
	desc = ""
	icon_state = "leather_gloves"
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 1, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/gloves/roguetown/leather/black
	color = CLOTHING_BLACK

/obj/item/clothing/gloves/roguetown/fingerless
	name = "fingerless gloves"
	desc = "Cloth gloves to absorb palm sweat while leaving the fingers free for fine manipulation."
	icon_state = "fingerless_gloves"
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE

/obj/item/clothing/gloves/roguetown/fingerless/shadowgloves
	name = "fingerless gloves"
	desc = "Cloth gloves to absorb palm sweat while leaving the fingers free for fine manipulation."
	icon_state = "shadowgloves"
	allowed_race = NON_DWARVEN_RACE_TYPES

/obj/item/clothing/gloves/roguetown/angle
	name = "heavy leather gloves"
	desc = ""
	icon_state = "angle"
	armor = list("blunt" = 50, "slash" = 25, "stab" = 40, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	max_integrity = 200
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_result = /obj/item/natural/fur

/obj/item/clothing/gloves/roguetown/fingerless_leather
	name = "fingerless leather gloves"
	desc = "A pair of protective gloves favored by lockshimmers, laborers, and smokers for maintaining \
	manual dexterity over regular gloves."
	icon_state = "roguegloves"
	armor = list("blunt" = 50, "slash" = 25, "stab" = 40, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	max_integrity = 200
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/gloves/roguetown/chain
	name = "chain gauntlets"
	desc = ""
	icon_state = "cgloves"
	armor = list("blunt" = 60, "slash" = 100, "stab" = 80, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	resistance_flags = FIRE_PROOF
	blocksound = CHAINHIT
	max_integrity = 250
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/gloves/roguetown/chain/psydon
	name = "fancy chain gauntlets"
	icon_state = "psydongloveschain"
	item_state = "psydongloveschains"

/obj/item/clothing/gloves/roguetown/chain/iron
	icon_state = "icgloves"
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron
	max_integrity = 200

/obj/item/clothing/gloves/roguetown/otavan
	name = "fancy leather gloves"
	desc = "A pair of heavy Otavan leather gloves, commonly used by fencers, renowned for their quality."
	icon_state = "fencergloves"
	item_state = "fencergloves"
	armor = list("blunt" = 60, "slash" = 100, "stab" = 80, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CHOP, BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	max_integrity = 250
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	allowed_race = NON_DWARVEN_RACE_TYPES

//rogtodo sprites for this
/obj/item/clothing/gloves/roguetown/plate
	name = "plate gauntlets"
	desc = ""
	icon_state = "gauntlets"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CHOP, BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = FIRE_PROOF
	blocksound = PLATEHIT
	max_integrity = 300
	blade_dulling = DULLING_BASH
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel

	grid_width = TWO_SLOTS
	grid_height = ONE_SLOTS

/obj/item/clothing/gloves/roguetown/grenzelgloves
	name = "mercenary gloves"
	desc = ""
	icon_state = "grenzelgloves"
	item_state = "grenzelgloves"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	armor = list("blunt" = 15, "slash" = 15, "stab" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE

/obj/item/clothing/gloves/roguetown/grenzelgloves/blacksmith
	name = "forge gauntlets"

//---------------- ADAMANTINE ---------------------

/obj/item/clothing/gloves/roguetown/adamantine/plategloves
	name = "Adamantine Plate Gauntlets"
	desc = "A set of plate gauntlets forged of adamantine."
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	icon_state = "bkgloves"
	item_state = "bkgloves"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CHOP, BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = FIRE_PROOF
	blocksound = PLATEHIT
	max_integrity = 400
	blade_dulling = DULLING_BASH
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/adamantine

/obj/item/clothing/gloves/roguetown/angle/pontifex
	name = "rune-scrybed wrappings"
	desc = "Paper and cloth bandages enscrybed with powerful arcane runes. They do an ample job of protecting their user's hands in combat."
	icon_state = "clothwraps"
	item_state = "clothwraps"

///////////////////////////////////////////////////////////////////
// Part of Kaizoku project that is still yet to be finished.     //
// The Demo usage is meant for Stonekeep and Warmongers.		 //
// If the usage for other sources is desired, before it finishes,//
// ask monochrome9090 for permission. Respect the artists's will.//
// If you want this quality content, COMMISSION me instead. 	 //
// For this project, requirements are low, and mostly lore-based.//
// I just do not desire for the Abyssariads to be butchered.	 //
///////////////////////////////////////////////////////////////////

/obj/item/clothing/gloves/roguetown/fingerless/yugake
	name = "leather yugake"
	desc = "Traditional archery gloves used by foglanders to protect the fingers from the impact of the bow's string. Reinforced and sturdy."
	icon_state = "yugake"
	icon = 'icons/roguetown/kaizoku/clothingicon/gloves.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/gloves.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/gloves.dmi'

/obj/item/clothing/gloves/roguetown/leather/abyssal
	name = "eastern gloves"
	desc = "Flexible, sturdy gloves of Kara-tur making for horseback use to shield the hands against fast moving reins or grappling hook cables."
	icon_state = "abyssalgloves"
	icon = 'icons/roguetown/kaizoku/clothingicon/gloves.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/gloves.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/gloves.dmi'

/obj/item/clothing/gloves/roguetown/leather/abyssal/black
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/gloves/roguetown/leather/abyssal/kabukimono
	name = "kabuki-maru eastern gloves"
	desc = "Flexible, sturdy gloves of Kara-tur making, but with colours well know from being used by criminals of lower levels of Shou Lung."
	color = CLOTHING_KABUKIMONO

/obj/item/clothing/gloves/roguetown/leather/abyssal/toweryakko
	name = "tower-yakko eastern gloves"
	desc = "Flexible, sturdy gloves of Kara-tur making, but with colours well know from being used by criminals of lower levels of Shou Lung."
	color = CLOTHING_TOWERYAKKO

/obj/item/clothing/gloves/roguetown/angle/falcon
	name = "falconry gloves"
	desc = "thick, padded leather gloves to protect a handler's limbs against the sharp talons from their loyal flying companion. Falcons are used in warfare, hunting and communication in Shou Lung."
	icon_state = "falconrygloves"
	icon = 'icons/roguetown/kaizoku/clothingicon/gloves.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/gloves.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/gloves.dmi'

/obj/item/clothing/gloves/roguetown/chain/kikko
	name = "kikko steel tekko"
	desc = "Gauntlets made of steel in a shape that seems alike the shells of a turtle."
	icon_state = "kikkotekko"
	icon = 'icons/roguetown/kaizoku/clothingicon/gloves.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/gloves.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/gloves.dmi'

/obj/item/clothing/gloves/roguetown/chain/iron/kikko
	name = "kikko iron tekko"
	icon_state = "ikikkotekko"
	desc = "Gauntlets made of iron in a shape that seems alike the shells of a turtle."
	icon = 'icons/roguetown/kaizoku/clothingicon/gloves.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/gloves.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/gloves.dmi'

/obj/item/clothing/gloves/roguetown/plate/lamellaetekko
	name = "lamellae tekko"
	desc = "Gauntlets made of steel plates, in sendan style. Offers great protection for the hands while allowing delicate hand dexterity."
	icon_state = "tatamitekko" //that's not a tatami design.
	icon = 'icons/roguetown/kaizoku/clothingicon/gloves.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/gloves.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/gloves.dmi'
