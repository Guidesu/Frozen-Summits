//If you look at the "geyser_soup" overlay icon_state, you'll see that the first frame has 25 ticks.
//That's because the first 18~ ticks are completely skipped for some ungodly weird fucking byond reason

/obj/structure/geyser
	name = "geyser"
	icon = 'icons/obj/lavaland/terrain.dmi'
	icon_state = "geyser"
	anchored = TRUE

	var/erupting_state = null //set to null to get it greyscaled from "[icon_state]_soup". Not very usable with the whole random thing, but more types can be added if you change the spawn prob
	var/activated = FALSE //whether we are active and generating chems
	var/reagent_id = /datum/reagent/fuel/oil
	var/potency = 2 //how much reagents we add every process (2 seconds)
	var/max_volume = 500
	var/start_volume = 50

/obj/structure/geyser/proc/start_chemming()
	activated = TRUE
	create_reagents(max_volume, DRAINABLE)
	reagents.add_reagent(reagent_id, start_volume)
	START_PROCESSING(SSfluids, src) //It's main function is to be plumbed, so use SSfluids
	if(erupting_state)
		icon_state = erupting_state
	else
		var/mutable_appearance/I = mutable_appearance('icons/obj/lavaland/terrain.dmi', "[icon_state]_soup")
		I.color = mix_color_from_reagents(reagents.reagent_list)
		add_overlay(I)

/obj/structure/geyser/process()
	if(activated && reagents.total_volume <= reagents.maximum_volume) //this is also evaluated in add_reagent, but from my understanding proc calls are expensive and should be avoided in continous
		reagents.add_reagent(reagent_id, potency)						   //processes



/obj/structure/geyser/random
	erupting_state = null
	var/list/options = list(/datum/reagent/fuel/oil = 2, /datum/reagent/clf3 = 1) //fucking add more

/obj/structure/geyser/random/Initialize()
	. = ..()
	reagent_id = pickweight(options)

/obj/item/plunger
	name = "plunger"
	desc = ""
	icon = 'icons/obj/watercloset.dmi'
	icon_state = "plunger"

	slot_flags = ITEM_SLOT_MASK

	var/plunge_mod = 1 //time*plunge_mod = total time we take to plunge an object
	var/reinforced = FALSE //whether we do heavy duty stuff like geysers

/obj/item/plunger/attack_obj(obj/O, mob/living/user)

/obj/item/plunger/reinforced
	name = "reinforced plunger"
	desc = ""
	icon_state = "reinforced_plunger"

	reinforced = TRUE
	plunge_mod = 0.8
