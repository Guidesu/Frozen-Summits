/obj/shelf  //For my shelf man
	name = "wall shelf"
	desc = "A sturdy shelf mounted on the wall."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "shelf"
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	density = FALSE
	pass_flags = LETPASSTHROW
	max_integrity = 40
	pixel_y = 0
	pixel_x = 0



/obj/shelf/attackby(obj/item/W, mob/user, params)
	if(!user.cmode)
		if(!(W.item_flags & ABSTRACT))
			if(user.transferItemToLoc(W, drop_location(), silent = FALSE))
				var/list/click_params = params2list(params)
				if(!click_params || !click_params["icon-x"] || !click_params["icon-y"])
					return
				W.pixel_x = CLAMP(text2num(click_params["icon-x"]) - 16, -45, 45)
				W.pixel_y = CLAMP(text2num(click_params["icon-y"]) - 16, -45, 45)
				W.layer = layer+0.1
				to_chat(user, span_notice("You place [W] on [src]."))

/obj/shelf/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>click-drag</b> items onto it to place them precisely.")
