/* #define CLOTHING_SOOT_BLACK		"#414145" // Duplicates!
#define CLOTHING_WINESTAIN_RED	"#673c3c"
#define CLOTHING_PEASANT_BROWN	"#634f44"
#define CLOTHING_MUD_BROWN		"#6f5f4d"
#define CLOTHING_CHESTNUT		"#604631"
#define CLOTHING_OLD_LEATHER	"#473f39"
#define CLOTHING_SPRING_GREEN	"#41493a"
#define CLOTHING_BERRY_BLUE		"#39404d"

#define CLOTHING_ASH_GREY		"#676262"
#define CLOTHING_CANVAS			"#858564"
#define CLOTHING_LINEN			"#a1a17a"
#define CLOTHING_WHITE			"#ffffff"
#define CLOTHING_WET			"#afafaf"
 */

///Royal clothing:
//................ Royal Dress (Ball Gown)............... //
/obj/item/clothing/suit/roguetown/shirt/dress/royal
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon = 'icons/roguetown/clothing/shirts_royalty.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/shirts_royalty.dmi'
	name = "royal gown"
	desc = "An elaborate ball gown, a favoured fashion of queens and elevated nobility in Faerûn."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "royaldress"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_shirts_royalty.dmi'
	boobed = TRUE
	detail_tag = "_detail"
	detail_color = CLOTHING_SOOT_BLACK
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/dress/royal/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)


//................ Princess Dress ............... //
/obj/item/clothing/suit/roguetown/shirt/dress/royal/princess
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "pristine dress"
	desc = "A flowy, intricate dress made by the finest tailors in the land for the Faerûn's children."
	icon_state = "princess"
	boobed = TRUE
	detail_color = CLOTHING_BERRY_BLUE

//................ Winter Dress ............... //
/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/winterdress
	name = "winter dress"
	icon = 'icons/roguetown/clothing/shirts_royalty.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/shirts_royalty.dmi'
	desc = "A thick, padded, and comfortable dress to maintain both temperature and safety when leaving the house."
	icon_state = "winterdress"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_shirts_royalty.dmi'
	boobed = TRUE
	detail_tag = "_detail"
	detail_color = CLOTHING_SOOT_BLACK
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/winterdress/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

//................ Cloak ............... //
/obj/item/clothing/cloak/tribal
	name = "tribal pelt"
	desc = "A haphazardly cured pelt of a creecher, thrown on top of one's body or armor, to serve as additional protection against the cold. Itchy."
	icon_state = "tribal"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK
	body_parts_covered = CHEST|GROIN|VITALS
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	nodismemsleeves = TRUE
	boobed = FALSE
	sellprice = 10




/obj/item/clothing/cloak/volfmantle
	name = "wolf mantle"
	desc = "A warm cloak made using the hide and head of a slain wolf. A status symbol if ever there was one."
	color = null
	icon_state = "volfpelt"
	item_state = "volfpelt"
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	inhand_mod = FALSE
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK


/obj/item/clothing/cloak/wickercloak
	name = "wicker cloak"
	desc = "A makeshift cloak constructed with mud, sticks and fibers."
	icon_state = "wicker_cloak"
	item_state = "wicker_cloak"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	inhand_mod = TRUE


/obj/item/clothing/cloak/lordcloak/ladycloak
	name = "ladylike shortcloak"
	desc = "Ermine trimmed, handed down."
	color = null
	icon_state = "shortcloak"
	item_state = "shortcloak"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK|ITEM_SLOT_CLOAK
	boobed = TRUE
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	detail_tag = "_detail"
	detail_color = CLOTHING_SOOT_BLACK

/obj/item/clothing/cloak/matron
	name = "matron cloak"
	desc = "A cloak that only the meanest of old crones bother to wear."
	icon_state = "matroncloak"
	icon = 'icons/roguetown/clothing/cloaks.dmi'
	mob_overlay_icon ='icons/roguetown/clothing/onmob/cloaks.dmi'
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	slot_flags = ITEM_SLOT_CLOAK
	nodismemsleeves = TRUE
	slot_flags = ITEM_SLOT_CLOAK








/datum/crafting_recipe/roguetown/sewing/royal_dress
	name = "royal gown"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/royal)
	reqs = list(/obj/item/natural/cloth = 5)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/princess_dress
	name = "pristine dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/royal/princess)
	reqs = list(/obj/item/natural/cloth = 4)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/winter_dress
	name = "winter dress"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/winterdress)
	reqs = list(/obj/item/natural/cloth = 6, /obj/item/natural/hide = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/tribal_cloak
	name = "tribal pelt"
	result = list(/obj/item/clothing/cloak/tribal)
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/wolf_mantle
	name = "wolf mantle"
	result = list(/obj/item/clothing/cloak/volfmantle)
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/wicker_cloak
	name = "wicker cloak"
	result = list(/obj/item/clothing/cloak/wickercloak)
	reqs = list(/obj/item/natural/fibers = 3)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/ladycloak
	name = "ladylike shortcloak"
	result = list(/obj/item/clothing/cloak/lordcloak/ladycloak)
	reqs = list(/obj/item/natural/cloth = 4)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/matron_cloak
	name = "matron cloak"
	result = list(/obj/item/clothing/cloak/matron)
	reqs = list(/obj/item/natural/cloth = 5, /obj/item/natural/hide = 1)
	craftdiff = 0
