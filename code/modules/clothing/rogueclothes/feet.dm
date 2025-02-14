/obj/item/clothing/shoes/roguetown
	name = "shoes"
	icon = 'icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/feet.dmi'
	desc = ""
	gender = PLURAL
	slot_flags = ITEM_SLOT_SHOES
	body_parts_covered = FEET
	sleeved = 'icons/roguetown/clothing/onmob/feet.dmi'
	sleevetype = "leg"
	bloody_icon_state = "shoeblood"
	equip_delay_self = 30
	resistance_flags = FIRE_PROOF

/obj/item/clothing/shoes/roguetown/boots
	name = "dark boots"
	//dropshrink = 0.75
	color = "#d5c2aa"
	desc = ""
	gender = PLURAL
	icon_state = "blackboots"
	item_state = "blackboots"
	sewrepair = TRUE
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/shoes/roguetown/psydonboots
	name = "enduring boots"
	desc = "A reliable pair of dark leather boots. Seems like they could endure the world!"
	color = "#d5c2aa"
	icon_state = "psydonboots"
	item_state = "psydonboots"
	sewrepair = TRUE
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "fire" = 0, "acid" = 0)
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide

/obj/item/clothing/shoes/roguetown/nobleboot
	name = "noble boots"
	//dropshrink = 0.75
	color = "#d5c2aa"
	desc = "Fine dark leather boots."
	gender = PLURAL
	icon_state = "nobleboots"
	item_state = "nobleboots"
	sewrepair = TRUE
	armor = list("blunt" = 35, "slash" = 15, "stab" = 25, "fire" = 0, "acid" = 0)
	salvage_amount = 2
	salvage_result = /obj/item/natural/hide

/obj/item/clothing/shoes/roguetown/shortboots
	name = "shortboots"
	color = "#d5c2aa"
	desc = ""
	gender = PLURAL
	icon_state = "shortboots"
	item_state = "shortboots"
	sewrepair = TRUE
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide

/obj/item/clothing/shoes/roguetown/ridingboots
	name = "riding boots"
	color = "#d5c2aa"
	desc = ""
	gender = PLURAL
	icon_state = "ridingboots"
	item_state = "ridingboots"
	sewrepair = TRUE
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide

///obj/item/clothing/shoes/roguetown/ridingboots/Initialize()
//	. = ..()
//	AddComponent(/datum/component/squeak, list('sound/foley/spurs (1).ogg'sound/blank.ogg'=1), 50)

/obj/item/clothing/shoes/roguetown/simpleshoes
	name = "shoes"
	desc = ""
	gender = PLURAL
	icon_state = "simpleshoe"
	item_state = "simpleshoe"
	sewrepair = TRUE
	resistance_flags = null
	color = "#473a30"
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide

/obj/item/clothing/shoes/roguetown/simpleshoes/white
	color = null


/obj/item/clothing/shoes/roguetown/simpleshoes/buckle
	name = "shoes"
	icon_state = "buckleshoes"
	color = null

/obj/item/clothing/shoes/roguetown/simpleshoes/lord
	name = "shoes"
	desc = ""
	gender = PLURAL
	icon_state = "simpleshoe"
	item_state = "simpleshoe"
	resistance_flags = null
	color = "#cbcac9"

/obj/item/clothing/shoes/roguetown/gladiator
	name = "leather soleae"
	desc = "A form of fashionable sandaled boots whose design comes from a distant land, with straps that extend partway up the lower leg."
	gender = PLURAL
	icon_state = "gladiator"
	item_state = "gladiator"
	sewrepair = TRUE

/obj/item/clothing/shoes/roguetown/sandals
	name = "leather sandals"
	desc = ""
	gender = PLURAL
	icon_state = "sandals"
	item_state = "sandals"
	sewrepair = TRUE

/obj/item/clothing/shoes/roguetown/shalal
	name = "babouche"
	desc = ""
	gender = PLURAL
	icon_state = "shalal"
	item_state = "shalal"
	sewrepair = TRUE

/obj/item/clothing/shoes/roguetown/boots/leather
	name = "leather boots"
	//dropshrink = 0.75
	desc = ""
	gender = PLURAL
	icon_state = "leatherboots"
	item_state = "leatherboots"
	sewrepair = TRUE
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "fire" = 0, "acid" = 0)
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide

/obj/item/clothing/shoes/roguetown/boots/armor
	name = "plated boots"
	desc = "Boots forged of a set of steel plates to protect your fragile toes."
	body_parts_covered = FEET
	icon_state = "armorboots"
	item_state = "armorboots"
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	color = null
	blocksound = PLATEHIT
	resistance_flags = FIRE_PROOF
	max_integrity = 300
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/shoes/roguetown/otavan
	name = "otavan leather boots"
	desc = "Boots of outstanding craft, your fragile feet has never felt so protected and comfortable before."
	body_parts_covered = FEET
	icon_state = "fencerboots"
	item_state = "fencerboots"
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = SOFTHIT
	max_integrity = 200
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed_race = NON_DWARVEN_RACE_TYPES
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide

/obj/item/clothing/shoes/roguetown/boots/armor/iron
	name = "iron plated boots"
	desc = "Boots with iron for added protection."
	body_parts_covered = FEET
	icon_state = "armorironboots"
	item_state = "armorironboots"
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	color = null
	blocksound = PLATEHIT
	max_integrity = 200
	armor = list("blunt" = 80, "slash" = 100, "stab" = 70, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/shoes/roguetown/jester
	name = "funny shoes"
	icon_state = "jestershoes"
	resistance_flags = null
	sewrepair = TRUE

/obj/item/clothing/shoes/roguetown/jester/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/item_equipped_movement_rustle, SFX_JINGLE_BELLS)

/obj/item/clothing/shoes/roguetown/grenzelhoft
	name = "mercenary boots"
	icon_state = "grenzelboots"
	item_state = "grenzelboots"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	armor = list("blunt" = 15, "slash" = 15, "stab" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/shoes/roguetown/boots/furlinedboots
	name = "fur lined boots"
	desc = "Leather boots lined with fur."
	gender = PLURAL
	icon_state = "furlinedboots"
	item_state = "furlinedboots"
	sewrepair = TRUE
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "fire" = 0, "acid" = 0)
	salvage_amount = 1
	salvage_result = /obj/item/natural/fur

/obj/item/clothing/shoes/roguetown/boots/furlinedanklets
	name = "fur lined anklets"
	desc = "Leather anklets lined with fur, foot remains bare."
	gender = PLURAL
	icon_state = "furlinedanklets"
	item_state = "furlinedanklets"
	sewrepair = TRUE
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	is_barefoot = TRUE
	salvage_amount = 1
	salvage_result = /obj/item/natural/fur

/obj/item/clothing/shoes/roguetown/boots/clothlinedanklets
	name = "cloth lined anklets"
	desc = "Cloth anklets lined with with fibers, foot remains bare."
	gender = PLURAL
	icon_state = "furlinedanklets"
	item_state = "furlinedanklets"
	is_barefoot = TRUE
	sewrepair = TRUE
	armor = list("blunt" = 5, "slash" = 5, "stab" = 5, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0) //Thinks its fair for a piece of cloth and fiber.


// ----------------- ADAMANTINE -----------------------

/obj/item/clothing/shoes/roguetown/boots/adamantine/plateboots
	name = "Adamantine Plate Boots"
	desc = "Boots forged of durable adamantine."
	body_parts_covered = FEET
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	icon_state = "bkboots"
	item_state = "bkboots"
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	color = null
	blocksound = PLATEHIT
	max_integrity = 400
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/adamantine
	resistance_flags = FIRE_PROOF


///////////////////////////////////////////////////////////////////
// Part of Kaizoku project that is still yet to be finished.     //
// The Demo usage is meant for Stonekeep and Warmongers.		 //
// If the usage for other sources is desired, before it finishes,//
// ask monochrome9090 for permission. Respect the artists's will.//
// If you want this quality content, COMMISSION me instead. 	 //
// For this project, requirements are low, and mostly lore-based.//
// I just do not desire for the Abyssariads to be butchered.	 //
///////////////////////////////////////////////////////////////////

/obj/item/clothing/shoes/roguetown/boots/armor/light/kusaritabi
	name = "kusari tabi"
	icon_state = "kusaritabi"
	item_state = "kusaritabi"
	desc = "The riveted chainmail version of the unarmored Tabi footwear."
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'

/obj/item/clothing/shoes/roguetown/boots/armor/suneate
	name = "suneate boots"
	desc = "Armored suneate made from steel offering heavy protection against both melee and ranged attacks."
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	icon_state = "suneate"
	item_state = "suneate"

/obj/item/clothing/shoes/roguetown/boots/armor/suneate/cursed/Initialize()
	. = ..()
	name = "soulbinded suneate"
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/shoes/roguetown/boots/jikatabi
	name = "jikatabi"
	desc = "A standard tabi that keeps the toes flexible and healthy, avoiding calluses of long expeditions. However, it looks rather goofy for the non-islanders."
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	icon_state = "jikatabi"
	item_state = "jikatabi"

/obj/item/clothing/shoes/roguetown/boots/jikatabi/shinobi
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/shoes/roguetown/boots/jikatabi/dragontabi
	name = "dragontabi"
	icon_state = "dragontabi"
	item_state = "dragontabi"
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	desc = "A tabi reinforced in dragon bones and asbestos, making it fire immune. Not very protective against physical damage, but still fairly durable."
	armor = list("melee" = 40, "bullet" = 40, "laser" = 0,"energy" = 0, "bomb" = 60, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 0)
	max_integrity = 250
	armor_class = AC_MEDIUM
	heat_protection = LEGS|FEET
	body_parts_covered = LEGS|FEET
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/shoes/roguetown/sandals/geta
	name = "geta"
	desc = "A normal wooden geta most suitable for those who need to wander where the mud absorbs pressure."
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	icon_state = "geta"
	item_state = "geta"

/obj/item/clothing/shoes/roguetown/shortboots/cloudhead
	name = "cloudhead shoes"
	desc = "A traditional shoes with distinctive upturned toe design that resembles the shape of clouds, to symbolize connection to the skies."
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	icon_state = "cloudhead_shoes"
	item_state = "cloudhead_shoes"

/obj/item/clothing/shoes/roguetown/shortboots/cloudhead/kabukimono
	name = "kabuki-maru cloudhead shoes"
	desc = "The same traditional cloudhead shoes of the Abyssariads, but colored in rich yellow tone and with intense implication of being used by a lowly burakumin whom belongs to an armed gang."
	color = "#9b874f"

/obj/item/clothing/shoes/roguetown/shortboots/cloudhead/toweryakkos
	name = "tower-yakko cloudhead shoes"
	desc = "The same traditional cloudhead shoes of the Abyssariads, but colored in rich purple tone and with intense implication of being used by a lowly burakumin whom belongs to an armed gang."
	color = "#804d97"

/obj/item/clothing/shoes/roguetown/ridingboots/gutal
	name = "leather gutal"
	desc = "The boots used by Abyssariad cavalry with upturned toes and durable, oil-boiled leather."
	icon_state = "leathergutal"
	item_state = "leathergutal"
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'
