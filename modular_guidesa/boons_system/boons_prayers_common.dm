/datum/prayer/common/sustenance
	name = "Basic Sustenance"
	min_length = 20
	success_base = 40
	stages = list(
		list("text" = "Oh lords of hearth and harvest...", "delay" = 40, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "Bless this humble servant with nourishment...", "delay" = 50, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "GRANT US THIS DAILY BREAD!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/common/sustenance/grant_boon(mob/user)
	playsound(user, 'sound/magic/revive.ogg', 75, TRUE)
	var/obj/item/reagent_containers/food/snacks/rogue/bread/W = new(get_turf(user))
	user.put_in_hands(W)
	user.visible_message(span_notice("A loaf of bread materializes in a puff of flour!"))
