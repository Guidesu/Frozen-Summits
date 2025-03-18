/obj/item/clothing/suit/roguetown/shirt
	slot_flags = ITEM_SLOT_SHIRT
	body_parts_covered = CHEST|VITALS
	icon = 'icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/shirts.dmi'
	equip_sound = 'sound/blank.ogg'
	drop_sound = 'sound/blank.ogg'
	pickup_sound =  'sound/blank.ogg'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	sleevetype = "shirt"
	edelay_type = 1
	equip_delay_self = 25
	bloody_icon_state = "bodyblood"
	boobed = TRUE
	sewrepair = TRUE
	flags_inv = HIDEBOOB
	
	grid_width = TWO_SLOTS
	grid_height = TWO_SLOTS

/obj/item/clothing/suit/roguetown/shirt/undershirt
	name = "shirt"
	desc = ""
	icon_state = "undershirt"
	item_state = "undershirt"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|ARMS|VITALS

/obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	name = "undervestments"
	desc = ""
	icon_state = "priestunder"
	item_state = "priestunder"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	allowed_sex = list(MALE, FEMALE)
	allowed_race = NON_DWARVEN_RACE_TYPES
	boobed = TRUE
	flags_inv= HIDEBOOB|HIDECROTCH
	body_parts_covered = CHEST|GROIN|ARMS|VITALS

/obj/item/clothing/suit/roguetown/shirt/undershirt/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/undershirt/purple
	color = CLOTHING_PURPLE

/obj/item/clothing/suit/roguetown/shirt/undershirt/brown
	color = "#6b5445"

/obj/item/clothing/suit/roguetown/shirt/undershirt/lord
	desc = ""
	color = "#616898"

/obj/item/clothing/suit/roguetown/shirt/undershirt/red
	color = "#851a16"

/obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	color = CLOTHING_AZURE

/obj/item/clothing/suit/roguetown/shirt/undershirt/guard/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/shirt/undershirt/guard/Destroy()
	GLOB.lordcolor -= src
	return ..()


/obj/item/clothing/suit/roguetown/shirt/undershirt/guardsecond
	color = CLOTHING_PURPLE

/obj/item/clothing/suit/roguetown/shirt/undershirt/guardsecond/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/shirt/undershirt/guardsecond/lordcolor(primary,secondary)
	if(secondary)
		color = secondary

/obj/item/clothing/suit/roguetown/shirt/undershirt/guardsecond/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/shirt/undershirt/random/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f")
	..()

/obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	name = "formal silks"
	icon_state = "puritan_shirt"
	allowed_race = CLOTHED_RACES_TYPES
	sleeved = 'icons/roguetown/clothing/onmob/shirts.dmi'
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/undershirt/artificer
	name = "tinker suit"
	desc = "Typical fashion of the best engineers."
	icon_state = "artishirt"

/obj/item/clothing/suit/roguetown/shirt/undershirt/lowcut
	name = "low cut tunic"
	desc = "A tunic exposing much of the shoulders and neck. Shoulders?! How scandalous..."
	icon_state = "lowcut"

/obj/item/clothing/suit/roguetown/shirt/shadowshirt
	name = "silk shirt"
	desc = "A sleeveless shirt woven of glossy material."
	icon_state = "shadowshirt"
	item_state = "shadowshirt"
	r_sleeve_status = SLEEVE_TORN
	l_sleeve_status = SLEEVE_TORN
	body_parts_covered = CHEST|VITALS

/obj/item/clothing/suit/roguetown/shirt/apothshirt
	name = "apothecary shirt"
	desc = "When trudging through late-autumn forests, one needs to keep warm."
	icon_state = "apothshirt"
	item_state = "apothshirt"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|VITALS

/obj/item/clothing/suit/roguetown/shirt/tunic/noblecoat
	name = "fancy coat"
	desc = "A fancy tunic and coat combo. How elegant."
	icon_state = "noblecoat"
	sleevetype = "noblecoat"
	color = CLOTHING_WHITE
	boobed = TRUE

/obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
	icon_state = "sailorblues"

/obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red
	icon_state = "sailorreds"

/obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	r_sleeve_status = SLEEVE_TORN
	body_parts_covered = CHEST|ARM_LEFT|VITALS

/obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_TORN
	body_parts_covered = CHEST|ARM_RIGHT|VITALS

/obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f")
	..()

/obj/item/clothing/suit/roguetown/shirt/shortshirt
	name = "shirt"
	desc = ""
	icon_state = "shortshirt"
	item_state = "shortshirt"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/shortshirt/random/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f")
	..()

/obj/item/clothing/suit/roguetown/shirt/shortshirt/merc
	name = "shirt"
	desc = ""
	icon_state = "shortshirt"
	item_state = "shortshirt"
	r_sleeve_status = SLEEVE_TORN
	l_sleeve_status = SLEEVE_TORN
	body_parts_covered = CHEST|VITALS

/obj/item/clothing/suit/roguetown/shirt/shortshirt/bog
	color = "#9ac878"

/obj/item/clothing/suit/roguetown/shirt/rags
	slot_flags = ITEM_SLOT_ARMOR
	name = "rags"
	desc = ""
	body_parts_covered = CHEST|GROIN|VITALS
	color = "#b0b0b0"
	icon_state = "rags"
	item_state = "rags"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	flags_inv = HIDECROTCH|HIDEBOOB

/obj/item/clothing/suit/roguetown/shirt/tribalrag
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "tribalrag"
	desc = ""
	body_parts_covered = CHEST|VITALS
	boobed = TRUE
	icon_state = "tribalrag"
	item_state = "tribalrag"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	flags_inv = HIDECROTCH|HIDEBOOB

/obj/item/clothing/suit/roguetown/shirt/robe/archivist
	name = "archivist's robe"
	desc = "Robes belonging to seekers of knowledge."
	icon_state = "archivist"
	icon = 'icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	boobed = TRUE
	flags_inv = HIDEBOOB
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	allowed_sex = list(MALE, FEMALE)
	color = null
	sellprice = 100

/obj/item/clothing/suit/roguetown/shirt/tunic
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "tunic"
	desc = ""
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "tunic"
	boobed = FALSE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	flags_inv = HIDECROTCH|HIDEBOOB

/obj/item/clothing/suit/roguetown/shirt/tunic/green
	color = CLOTHING_GREEN

/obj/item/clothing/suit/roguetown/shirt/tunic/blue
	color = CLOTHING_BLUE

/obj/item/clothing/suit/roguetown/shirt/tunic/red
	color = CLOTHING_RED

/obj/item/clothing/suit/roguetown/shirt/tunic/purple
	color = CLOTHING_PURPLE

/obj/item/clothing/suit/roguetown/shirt/tunic/white
	color = CLOTHING_WHITE

/obj/item/clothing/suit/roguetown/shirt/tunic/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/tunic/ucolored
	color = COLOR_GRAY

/obj/item/clothing/suit/roguetown/shirt/tunic/random/Initialize()
	color = pick(CLOTHING_PURPLE, CLOTHING_RED, CLOTHING_BLUE, CLOTHING_GREEN, CLOTHING_BLACK, CLOTHING_WHITE, COLOR_GRAY)
	..()
/obj/item/clothing/suit/roguetown/shirt/dress
	slot_flags = ITEM_SLOT_ARMOR
	name = "dress"
	desc = ""
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon_state = "dress"
	item_state = "dress"
	allowed_sex = list(MALE, FEMALE)
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	flags_inv = HIDECROTCH|HIDEBOOB


/obj/item/clothing/suit/roguetown/shirt/dress/bra
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "bra"
	desc = ""
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon_state = "bra"
	item_state = ""
	allowed_sex = list(MALE, FEMALE)
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	flags_inv = NONE

/obj/item/clothing/suit/roguetown/shirt/dress/gen
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "dress"
	desc = ""
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon_state = "dressgen"
	item_state = "dressgen"
	color = "#6b5445"

/obj/item/clothing/suit/roguetown/shirt/dress/gen/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/dress/gen/blue
	color = CLOTHING_BLUE

/obj/item/clothing/suit/roguetown/shirt/dress/gen/purple
	color = CLOTHING_PURPLE

/obj/item/clothing/suit/roguetown/shirt/dress/gen/random/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f", CLOTHING_BLUE)
	..()

/obj/item/clothing/suit/roguetown/shirt/dress/gen/big
	name = "big dress"
	desc = ""
	icon_state = "dressgenbig"
	item_state = "dressgenbig"

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "chemise"
	desc = "Comfortable yet elegant, it offers both style and comfort for everyday wear"
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon_state = "silkdress"
	item_state = "silkdress"
	color = "#e6e5e5"

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/princess
	color = CLOTHING_WHITE

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/princess/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/princess/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/green
	color = CLOTHING_DARK_GREEN

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/random/Initialize()
	. = ..()
	color = pick("#e6e5e5", "#52BE80", "#C39BD3", "#EC7063","#5DADE2")

/obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy
	slot_flags = ITEM_SLOT_ARMOR
	name = "dress"
	desc = ""
	body_parts_covered = null
	icon_state = "sexydress"
	sleevetype = null
	sleeved = null
	color = "#a90707"

/obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy/Initialize()
	. = ..()
	color = pick("#a90707", "#16239a", "#d68fbd", CLOTHING_BLACK)

/obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy/black/Initialize()
	. = ..()
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/undershirt/webs
	name = "webbed shirt"
	desc = "Exotic silk finely woven into.. this? Might as well be wearing a spiderweb"
	icon_state = "webs"
	item_state = "webs"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|ARMS|VITALS
	color = null


/obj/item/clothing/suit/roguetown/shirt/undershirt/maid_dress
	name = "maid dress"
	desc = "A maid dress meant to clean stuff with."
	icon_state = "maid"
	item_state = "maid"
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	body_parts_covered = CHEST|ARMS|VITALS
	color = null

/obj/item/clothing/suit/roguetown/shirt/jester
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "jester's tunick"
	desc = ""
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "jestershirt"
	icon = 'icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/shirts.dmi'
	boobed = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	flags_inv = HIDECROTCH|HIDEBOOB

/obj/item/clothing/suit/roguetown/shirt/grenzelhoft
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "mercenary hip-shirt"
	desc = "Padded shirt for extra comfort and protection, adorned in vibrant colors."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "grenzelshirt"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	boobed = TRUE
	detail_tag = "_detail"
	detail_color = CLOTHING_WHITE
	armor = list("blunt" = 40, "slash" = 30, "stab" = 30, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0) //gambeson stats
	max_integrity = 250
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	var/picked = FALSE

/obj/item/clothing/suit/roguetown/shirt/grenzelhoft/attack_right(mob/user)
	..()
	if(!picked)
		var/list/colors = list(
		"Swan White"="#ffffff",
		"Lavender"="#865c9c",
		"Royal Purple"="#5E4687",
		"Wine Rouge"="#752B55",
		"Sow's skin"="#CE929F",
		"Knight's Red"="#933030",
		"Madroot Red"="#AD4545",
		"Marigold Orange"="#E2A844",
		"Politely, Yuck"="#685542",
		"Astrata's Yellow"="#FFFD8D",
		"Bog Green"="#375B48",
		"Seafoam Green"="#49938B",
		"Woad Blue"="#395480",
		"Cornflower Blue"="#749EE8",
		"Adamantine Grey"="#404040",)

		var/choice = input(user, "Choose a color.", "Grenzelhoft colors") as anything in colors
		var/playerchoice = colors[choice]
		picked = TRUE
		detail_color = playerchoice
		detail_tag = "_detail"
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_shirt()




/obj/item/clothing/suit/roguetown/shirt/grenzelhoft/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/steward
	color = null
	name = "ornate silk dress"
	desc = "A dress woven of only the finest, softest silks. Golden thread is inlaid with a deep royal crimson, expressing the owner's exquisitve wealth."
	icon_state = "stewarddress"
	item_state = "stewarddress"

/obj/item/clothing/suit/roguetown/shirt/tunic/silktunic
	name = "ornate silk tunic"
	desc = "A billowing tunic made of the finest silks and softest fabrics. Inlaid with golden thread, this is the height of fashion for the wealthiest of wearers."
	icon_state = "stewardtunic"
	item_state = "stewardtunic"

///////////////////////////////////////////////////////////////////
// Part of Kaizoku project that is still yet to be finished.     //
// The Demo usage is meant for Stonekeep and Warmongers.		 //
// If the usage for other sources is desired, before it finishes,//
// ask monochrome9090 for permission. Respect the artists's will.//
// If you want this quality content, COMMISSION me instead. 	 //
// For this project, requirements are low, and mostly lore-based.//
// I just do not desire for the Abyssariads to be butchered.	 //
///////////////////////////////////////////////////////////////////

/obj/item/clothing/suit/roguetown/shirt/tunic/kimono
	name = "traditional kimono"
	desc = "A front-wrapped garment with long sleeves made from a long, narrow bolt of cloth used as a formal garment by the poor and rich alike."
	icon = 'icons/roguetown/kaizoku/clothingicon/shirt.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/shirt.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_shirts.dmi'
	icon_state = "kimono"
	item_state = "kimono"
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	boobed = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/tunic/kimono/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/clothing/suit/roguetown/shirt/tunic/kimono/ronin
	color = CLOTHING_RONIN

/obj/item/clothing/suit/roguetown/shirt/tunic/kimono/dark
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/suit/roguetown/shirt/tunic/kimono/kabukimono
	color = CLOTHING_KABUKIMONO

/obj/item/clothing/suit/roguetown/shirt/rags/monkgarb
	name = "monk samue"
	desc = "The Samue is the clothing used by Kara-tur monks engaged on the act of Samu, most proper for those performing temple maintenance and mountain hiking."
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon = 'icons/roguetown/kaizoku/clothingicon/shirt.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/shirt.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_shirts.dmi'
	icon_state = "monkgarb"
	item_state = "monkgarb"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|ARMS|VITALS

/obj/item/clothing/suit/roguetown/shirt/rags/monkgarb/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/clothing/suit/roguetown/shirt/tunic/kamishimo //I know this is actually a Kataginu, but it is know more as 'Kamishimo', even if lacking a Hakama. Because HAKAMA is its own thing here.
	name = "kataginu"
	desc = "A formal kimono used by men, a short sleeveless garment made of hemp which usually comes together with a hakama, and worn on top of a kosode or kimono. To use one without cloth underneath, conveys a ronin nature."
	icon = 'icons/roguetown/kaizoku/clothingicon/shirt.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/shirt.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_shirts.dmi'
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	icon_state = "kamishimo"
	item_state = "kamishimo"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|VITALS

/obj/item/clothing/suit/roguetown/shirt/tunic/kamishimo/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/clothing/suit/roguetown/shirt/tunic/kamishimo/ronin
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/suit/roguetown/shirt/tunic/kamishimo/eidolon
	color = CLOTHING_EIDOLON

/obj/item/clothing/suit/roguetown/shirt/looseshirt
	name = "kimono jinbei"
	desc = "A summer shirt that goes along with a tobi, used during the hot summers in Shou Lung."
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon = 'icons/roguetown/kaizoku/clothingicon/shirt.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/shirt.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_shirts.dmi'
	icon_state = "looseshirt"
	item_state = "looseshirt"
	boobed = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|ARMS|VITALS

/obj/item/clothing/suit/roguetown/shirt/looseshirt/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/clothing/suit/roguetown/shirt/looseshirt/shinobi
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/suit/roguetown/shirt/looseshirt/dragonslayer
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	color = CLOTHING_WINESTAIN_RED

/obj/item/clothing/suit/roguetown/shirt/rags/tribal
	name = "tribal garbs"
	desc = "Tribal clothings made from plant fiber commonly used by the easts tribesmen."
	icon = 'icons/roguetown/kaizoku/clothingicon/shirt.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/shirt.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_shirts.dmi'
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon_state = "tribalgarb"
	item_state = "tribalgarb"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|VITALS

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian
	name = "onmyoji's warfare garb"
	desc = "The garbs used by Kara-tur magicians during times of warfare, holding the marks of the east upon the cloth."
	icon_state = "abyssaltunic"
	icon = 'icons/roguetown/kaizoku/clothingicon/shirt.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/shirt.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_shirts.dmi'
	boobed = TRUE
	flags_inv = HIDEBOOB
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	allowed_sex = list(MALE, FEMALE)
	color = null
	sellprice = 100

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/black
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/random/Initialize()
	color = RANDOM_NOBLE_DYES
	..()

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/thunder
	name = "thunder onmyoji's warfare garb"
	desc = "The garbs used by Kara-tur magicians during times of warfare. Marked in yellow for the mountainous magicians and monks who praises the easts thunders."
	color = CLOTHING_THUNDER

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/storm
	name = "storm onmyoji's warfare garb"
	desc = "The garbs used by Kara-tur magicians during times of warfare. Marked in dark blue for the lighthouse keepers of Abyssanctum's faith, who keeps the eternal fire going."
	color = CLOTHING_STORM

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/ocean
	name = "ocean onmyoji's warfare garb"
	desc = "The garbs used by Kara-tur magicians during times of warfare.  Marked in light blue for the expeditionary magicians and monks of the Kara-tur's faith, long married to the ocean."
	color = CLOTHING_OCEAN

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/island
	name = "island onmyoji's warfare garb"
	desc = "The garbs used by Kara-tur magicians during times of warfare. Marked in red for the soilgazers of the Kara-tur's faith, those bent in ensuring no plague shall reach their blessed islands. "
	color = CLOTHING_ISLAND

/obj/item/clothing/suit/roguetown/shirt/kaizoku/robe
	slot_flags = ITEM_SLOT_ARMOR
	name = "onmyoji's garb"
	desc = "Casual Kara-tur garbs usually used by magicians, or those living on the frigid, treacherous mountains on the edges of Shou Lung."
	icon_state = "loosetunic"
	icon = 'icons/roguetown/kaizoku/clothingicon/shirt.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/shirt.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_shirts.dmi'
	boobed = TRUE
	flags_inv = HIDEBOOB
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	allowed_sex = list(MALE)
	color = null

/obj/item/clothing/suit/roguetown/shirt/kaizoku/robe/Initialize()
	color = RANDOM_PEASANT_DYES
	..()
