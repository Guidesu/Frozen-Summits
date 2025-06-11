/obj/structure/fluff/grindwheel
	name = "grinding wheel"
	desc = "Steadily hums when operated, a massive wheel of grinding stone."
	icon = 'icons/roguetown/misc/forge.dmi'
	icon_state = "grindwheel"
	density = TRUE
	anchored = FALSE
	blade_dulling = DULLING_BASH
	max_integrity = 300

/obj/structure/fluff/grindwheel/attackby(obj/item/I, mob/living/user, params)
	if(I.max_blade_int)
		playsound(loc,'sound/foley/grindblade.ogg', 100, FALSE)
		if(do_after(user, 41, target = src))
			I.add_bintegrity(999)
		return
