
/obj/item/rogue/painting
	name = "painting"
	icon_state = "painting"
	desc = ""
	w_class = WEIGHT_CLASS_NORMAL
	static_price = TRUE
	sellprice = 20
	icon = 'icons/roguetown/items/misc.dmi'
	var/deployed_structure = /obj/structure/fluff/walldeco/painting

/obj/item/rogue/painting/attack_turf(turf/T, mob/living/user)
	if(isclosedturf(T))
		if(get_dir(T,user) in GLOB.cardinals)
			to_chat(user, span_warning("I place [src] on the wall."))
			var/obj/structure/S = new deployed_structure(user.loc)
			switch(get_dir(T,user))
				if(NORTH)
					S.pixel_y = -32
				if(SOUTH)
					S.pixel_y = 32
				if(WEST)
					S.pixel_x = 32
				if(EAST)
					S.pixel_x = -32
			qdel(src)
			return
	..()

/obj/structure/fluff/walldeco/painting
	name = "Painting"
	desc = "An old Portrait of the famous Liriel Baenre of house Baenre. Famous Noblewoman and Archmage of Menzoberranzan.	"
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "painting_deployed"
	anchored = TRUE
	density = FALSE
	max_integrity = 0
	layer = ABOVE_MOB_LAYER
	var/stolen_painting = /obj/item/rogue/painting

/obj/structure/fluff/walldeco/painting/attack_hand(mob/user)
	if(do_after(user, 30, target = user))
		var/obj/item/I = new stolen_painting(user.loc)
		user.put_in_hands(I)
		qdel(src)
		return
	..()

/obj/structure/fluff/walldeco/painting/queen
	desc = "A very old portrait of the Mage Laeral Silverhand, once Lady of Waterdeep."
	icon_state = "queenpainting_deployed"
	stolen_painting = /obj/item/rogue/painting/queen

/obj/item/rogue/painting/queen
	icon_state = "queenpainting"
	desc = "A painting of a noblewoman. These mass-reproduced paintings are unfortunately devalued."
	dropshrink = 0.5
	sellprice = 40
	deployed_structure = /obj/structure/fluff/walldeco/painting/queen

/obj/item/rogue/painting/seraphina
	icon_state = "Seraphinapainting"
	desc = "A depiction of a Cleric woman."
	dropshrink = 0.5
	sellprice = 40
	deployed_structure = /obj/structure/fluff/walldeco/painting/seraphina

/obj/structure/fluff/walldeco/painting/seraphina
	desc = "A depiction of a Cleric woman."
	icon_state = "seraphinapainting_deployed"
	stolen_painting = /obj/item/rogue/painting/seraphina

/obj/structure/fluff/walldeco/painting/darlak
	desc = "a portrait of a pale man."
	icon_state = "darlakpainting_deployed"
	stolen_painting = /obj/item/rogue/painting/darlak

/obj/item/rogue/painting/darlak
	icon_state = "darlakpainting"
	desc = "A portrait of a pale man."
	dropshrink = 0.5
	sellprice = 50
	deployed_structure = /obj/structure/fluff/walldeco/painting/darlak
