/turf/open/floor/rogue/grass/green
	desc = "Grass, green with life."
	icon_state = "ggrass"

/obj/effect/wisp/tree
	name = "Crystal Tree"
	desc = "A strange tree touched by fey magic. It is said to be directly connected to the feywild."
	icon = 'icons/roguetown/misc/special_tree.dmi'
	icon_state = "gem"
	pixel_x = 0


/turf/open/lava/item_acid
	name = "magical acidic pond"
	icon_state = "pond"
	light_range = 4
	light_power = 1
	light_color = "#0dfbff"
	color = "#0dfbff"

/turf/open/lava/item_acid/burn_stuff(AM)
	. = 0

	if(is_safe())
		return FALSE

	var/thing_to_check = src
	if (AM)
		thing_to_check = list(AM)
	for(var/thing in thing_to_check)
		if(isobj(thing))
			var/obj/O = thing
			if((O.resistance_flags & (ACID_PROOF|INDESTRUCTIBLE)) || O.throwing)
				continue
			. = 1
			qdel(O)

/turf/open/lava/item_acid/onbite(mob/user)
	return // Disable drinking interaction completely
