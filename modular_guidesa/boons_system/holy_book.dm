/obj/item/book/granter/prayerbook
	name = "Sacred Tome"
	desc = "A heavy volume of divine litanies and holy rituals. The pages hum with celestial energy."
	icon = 'icons/roguetown/items/books.dmi'
	icon_state = "bibble_0"
	var/open = FALSE
	var/base_icon_state = "bibble_0"
	associated_skill = /datum/skill/magic/holy
	oneuse = FALSE
	var/last_use = -18000 // -30 minutes in deciseconds
	var/cooldown = 30 MINUTES
	var/picked // if the book has had it's style picked or not
	var/owner = null
	remarks = list(
		"Lathander's dawn hymns glow with golden warmth as I read...",
		"Ilmater's martyrdom passages make old scars tingle sympathetically...",
		"Tyr's scales of justice shimmer, weighing my soul's balance...",
		"Chauntea's harvest blessings leave my fingers smelling of sacred wheat...",
		"The Triad's teachings shift to reflect recent moral choices...",
		"A pressed holy wafer imbues the page with consecrated energy...",
		"Corellon's battle psalms make my pulse race with righteous fury...",
		"Kelemvor's funeral rites section chills the room noticeably...",
		"Annotations debate the ethics of resurrection magic...",
		"The Platinum Oath of Bahamut resonates deep in my chest...",
		"Warnings about Cyric's heresies blacken the parchment as I read...",
		"Yondalla's family protection rituals glow with hearthlight...",
		"Torm's codes of conduct rearrange to match current dilemmas...",
		"A hidden page details St. Cuthbert's cudgel techniques...",
		"The Creed Resolute of Helm makes my shield arm tingle...",
		"Eilistraee's moonlit dances diagrammed in silver ink...",
		"Moradin's forge prayers heat the metal clasps slightly...",
		"A pressed rose from Sune's temple perfumes the air...",
		"Gruumsh's profane counter-rites bleed through the pages...",
		"The Twelve Acts of Mercy illustrated with glowing hands...",
		"A paladin's broken oath record screams silently when touched...",
		"Deneir's holy sigils rewrite themselves in perfect calligraphy...",
		"The Book of Exalted Deeds section repels shadow...",
		"Mask's deceptive verses shift when viewed indirectly...",
		"A hair from a saint's relic vibrates with divine energy..."
	)


/obj/item/book/granter/prayerbook/getonmobprop(tag)
	. = ..()
	if(tag)
		if(open)
			switch(tag)
				if("gen")
					return list("shrink" = 0.4,
	"sx" = -2,
	"sy" = -3,
	"nx" = 10,
	"ny" = -2,
	"wx" = 1,
	"wy" = -3,
	"ex" = 5,
	"ey" = -3,
	"northabove" = 0,
	"southabove" = 1,
	"eastabove" = 1,
	"westabove" = 0,
	"nturn" = 0,
	"sturn" = 0,
	"wturn" = 0,
	"eturn" = 0,
	"nflip" = 0,
	"sflip" = 0,
	"wflip" = 0,
	"eflip" = 0)
				if("onbelt")
					return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
		else
			switch(tag)
				if("gen")
					return list("shrink" = 0.4,
	"sx" = -2,
	"sy" = -3,
	"nx" = 10,
	"ny" = -2,
	"wx" = 1,
	"wy" = -3,
	"ex" = 5,
	"ey" = -3,
	"northabove" = 0,
	"southabove" = 1,
	"eastabove" = 1,
	"westabove" = 0,
	"nturn" = 0,
	"sturn" = 0,
	"wturn" = 0,
	"eturn" = 0,
	"nflip" = 0,
	"sflip" = 0,
	"wflip" = 0,
	"eflip" = 0)
				if("onbelt")
					return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/book/granter/prayerbook/attack_self(mob/user)
	if(!open)
		attack_right(user)
		return
	..()
	user.update_inv_hands()

/obj/item/book/granter/prayerbook/rmb_self(mob/user)
	attack_right(user)
	return

/obj/item/book/granter/prayerbook/read(mob/user)
	return TRUE

/obj/item/book/granter/prayerbook/attack_right(mob/user)
	if(!picked)
		var/list/designlist = list("green", "yellow", "brown","steel", "gem", "skin", "mimic")
		var/the_time = world.time
		var/design = input(user, "Select a design.","Spellbook Design") as null|anything in designlist
		if(!design)
			return
		if(world.time > (the_time + 30 SECONDS))
			return
		base_icon_state = "spellbook[design]"
		update_icon()
		picked = TRUE
		return
	if(owner == null)
		owner = user
	if(!open)
		slot_flags &= ~ITEM_SLOT_HIP
		open = TRUE
		playsound(loc, 'sound/items/book_open.ogg', 100, FALSE, -1)
	else
		slot_flags |= ITEM_SLOT_HIP
		open = FALSE
		playsound(loc, 'sound/items/book_close.ogg', 100, FALSE, -1)
	curpage = 1
	update_icon()
	user.update_inv_hands()

/obj/item/book/granter/prayerbook/update_icon()
	icon_state = "[base_icon_state]_[open]"


/obj/item/book/granter/prayerbook/on_reading_finished(mob/user)
	if(world.time < (last_use + cooldown))
		to_chat(user, span_warning("The divine energy hasn't replenished yet! Wait [round((last_use + cooldown - world.time)/600)] more minutes."))
		return
	
	var/mob/living/carbon/human/H = user
	if(!istype(H))
		return
	
	// Calculate learning quality based on holy skill
	var/holy_skill = H.mind.get_skill_level(/datum/skill/magic/holy)
	var/quality = (H.STAINT * 2) + (holy_skill * 15)
	
	// Convert to arcane points
	var/points_gained = round(quality / 25)
	points_gained = max(1, points_gained) // Minimum 1 point
	
	H.mind.adjust_spellpoints(points_gained)
	last_use = world.time
	
	to_chat(user, span_notice("Divine wisdom flows through you! Gained [points_gained] arcane points."))
	playsound(user, 'sound/magic/revive.ogg', 50, TRUE)

/obj/item/book/granter/prayerbook/Initialize()
	. = ..()
	var/mob/living/carbon/human/L = loc
	owner = L
