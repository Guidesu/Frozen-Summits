/**
  * Spellbooks for learning arcane points.
  * Difficult to learn by default, has multipliers for weed, gems and rituals.
  * Inherits most of it's functionality from default granters, however also has some copy paste from roguebooks for parity.
  */

/obj/item/book/granter/spellbook
	name = "tome of the weave"
	desc = "A crackling, glowing book filled with runes tied to the Weave—Mystra's fabric of magic. Staring too long invites migraines."
	remarks = list(
		"The pages hum with residual Weave energy...",
		"Mystra's sigils shift subtly as I read...",
		"The Moon-and-Star theory links Selûne and Corellon as sources of primal magic...",
		"Tracing a finger over this rune temporarily numbs my hand...",
		"Netherese glyphs spiral across the parchment...",
		"Didn't I just read this page? The text rearranges itself...",
		"An illustration of Mystra's Chosen gazes back, judging my comprehension...",
		"References to Candlekeep's arcane protocols dominate this chapter...",
		"Red Wizards of Thay use blood rituals to bypass Weave restrictions. Disturbing, yet insightful...",
		"Dragonshards pulse faintly in rhythm with the text...",
		"Warnings about Karsus' Folly fill the margins...",
		"The Weave reacts to emotion—passion fuels evocation, calm enhances abjuration...",
		"My mind fog lifts briefly—I glimpse the Shadow Weave before it vanishes..."
	)	
	var/open = FALSE
	icon = 'icons/roguetown/items/books.dmi'
	icon_state = "spellbookbrown_0"
	slot_flags = ITEM_SLOT_HIP
	var/base_icon_state = "spellbookbrown"
	unique = TRUE
	firefuel = 2 MINUTES
	dropshrink = 0.6
	drop_sound = 'sound/foley/dropsound/book_drop.ogg'
	force = 5
	associated_skill = /datum/skill/misc/reading
	pages_to_mastery = 7
	oneuse = FALSE
	var/owner = null
	var/list/allowed_readers = list()
	var/stored_gem = FALSE
	var/picked // if the book has had it's style picked or not
	var/born_of_rock = FALSE // was a magical stone used to make it instead of a gem?
	var/bookquality = 3
/obj/item/book/granter/spellbook/getonmobprop(tag)
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


/obj/item/book/granter/spellbook/attack_self(mob/user)
	if(!open)
		attack_right(user)
		return
	..()
	user.update_inv_hands()

/obj/item/book/granter/spellbook/rmb_self(mob/user)
	attack_right(user)
	return

/obj/item/book/granter/spellbook/read(mob/user)
	return FALSE

/obj/item/book/granter/spellbook/attack_right(mob/user)
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

/obj/item/book/granter/spellbook/update_icon()
	icon_state = "[base_icon_state]_[open]"

/obj/item/book/granter/spellbook/on_reading_start(mob/user)
	to_chat(user, span_notice("The Weave's secrets whisper from Mystra's towards the tome..."))

/obj/item/book/granter/spellbook/on_reading_finished(mob/user)
	var/mob/living/carbon/human/gamer = user
	if(gamer != owner && !allowed_readers.Find(gamer))
		to_chat(user, span_notice("What was that gibberish? Even for the weave it was completely illegible!"))
		return
	user.mind?.has_studied = TRUE
	var/mob/living/reader = user
	var/qualityoflearn = (reader.STAINT*2 + (user.mind?.get_skill_level(/datum/skill/misc/reading)*10) + (user.mind?.get_skill_level(/datum/skill/magic/arcane)*5))
	if(reader.has_status_effect(/datum/status_effect/buff/weed))
		to_chat(user, span_smallgreen("Swampweed truly does open one's third eye to the secrets of the weave..."))
		qualityoflearn += 10
	var/obj/effect/decal/cleanable/roguerune/rune = (locate(/obj/effect/decal/cleanable/roguerune) in range(1, user))
	if(rune)
		to_chat(user, span_cultsmall("The rune beneath my feet glows..."))
		qualityoflearn += rune.spellbonus
		rune.do_invoke_glow()
	if(stored_gem)
		to_chat(user, span_smallnotice("I can feel the magical energies imbued within the crystaline dust scattered upon my tome resonate with the weave..."))
		qualityoflearn += stored_gem
		stored_gem = FALSE
	if(!isarcyne(user))
		if (gamer != owner) // if you didn't make this book, get fucked.
			qualityoflearn = 1
		else
			qualityoflearn *= 0.5
			qualityoflearn = min(qualityoflearn, 15)
	if (born_of_rock)
		// the rock tomes are neat, and low quality. Might as well make them better to learn from!
		qualityoflearn *= 1.2
	testing("Quality of learning is [qualityoflearn]")
	user.visible_message(span_warning("[user] is filled with weave power! You witness [user.p_their()] body convulse and spark brightly."), \
	span_notice("Mystra blesses me. I have been granted knowledge and wisdom beyond my years, this tome's mysteries unveiled one at a time."))
	qualityoflearn = qualityoflearn / 100
	var/spellpoints = (src.bookquality * qualityoflearn)
	spellpoints = round(spellpoints)	//Rounds. 2.4 spellpoint level? too bad. You get 2, not 3.
	user.mind.adjust_spellpoints(spellpoints)
	user.log_message("successfully studied their spellbook and gained spellpoints", LOG_ATTACK, color="orange")
	onlearned(user)
	if(prob(55))
		to_chat(user, span_notice("Confounded weave mysteries, my notes has gone in circles. I must sleep before I can bring myself to open this damned thing again..."))
		user.mind?.add_sleep_experience(/datum/skill/misc/reading, reader.STAINT*10)
	to_chat(user, span_small("My notes include passages I've read before, but don't understand. I must sleep on their meaning..."))
/obj/item/book/granter/spellbook/onlearned(mob/user)
	used = FALSE

/obj/item/book/granter/spellbook/recoil(mob/user)
	user.visible_message(span_warning("[src] shoots out a spark of angry, weave energy at [user]!"))
	var/mob/living/gamer = user
	gamer.electrocute_act(5, src)

/obj/item/book/granter/spellbook/attack(mob/living/M, mob/living/carbon/human/user)
	var/mob/living/carbon/human/gamer = user
	if(gamer != owner)
		return
	if (M.stat != DEAD)
		if(user == M)
			to_chat(user, span_warning("I'm already chained to this tome!"))
			return
		if(ishuman(M))
			M.visible_message(span_danger("[user] beats [M] over the head with [src]!"), \
								span_danger("[user] beats [M] over the head with [src]!"))
			if(src.allowed_readers.len <= 2 && !src.allowed_readers.Find(user))
				src.allowed_readers += M
			else
				to_chat(user, span_smallnotice("I can't change this pleboid to my tome..."))
			playsound(src.loc, "punch", 25, TRUE, -1)
			log_combat(user, M, "attacked", src)
	else
		M.visible_message(span_danger("[user] smacks [M]'s lifeless corpse with [src]."))
		playsound(src.loc, "punch", 25, TRUE, -1)

/// Book Types:
/obj/item/book/granter/spellbook/horrible
	name = "Novice's Scrapbook"
	desc = "A amateur's first attempt at spellcrafting. Pages torn from tavern menus, bound in cheap leather. Charcoal-drawn runes flicker erratically. Smells of burnt hair from botched rituals."
	bookquality = 1
	sellprice = 15


/obj/item/book/granter/spellbook/mid
	name = "Journeyman's Ledger"
	desc = "A serviceable spellbook with wax-sealed pages. Contains copied sigils from borrowed tomes. Binding reinforced with rusted chain links. Margin notes confess doubts about fireball timing."
	bookquality = 2
	sellprice = 30

/obj/item/book/granter/spellbook/apprentice
	name = "Spellcrafter's Codex"
	desc = "A mage's proud first 'proper' grimoire. Linen paper infused with alchemical ink. Runes glow steadily... unless the caster sneezes. Bears the maker's personal sigil scratched inside the cover."
	bookquality = 3
	sellprice = 75

/obj/item/book/granter/spellbook/adept
	name = "Artisan's Tome"
	desc = "Years of practice evident in its gold-leafed pages. Spells stabilized with dragonshard dust. Cover etched with anti-misfire wards. Slight hum reveals residual Weave resonance from hasty enchantments."
	bookquality = 4
	sellprice = 150

/obj/item/book/granter/spellbook/expert
	name = "Masterwork Grimoire"
	desc = "Flawless vellum pages bear iridescent ink recipes. Bound in chimera leather cured during a lunar eclipse. Glows warmly when near its creator. Contains personalized spell variants refined over decades."
	bookquality = 5
	sellprice = 200

/obj/item/book/granter/spellbook/master
	name = "Arcane Magnum Opus"
	desc = "A lifetime's work containing original spells. Pages made from phase spider silk, ink from bottled spellplague. Must be fed monthly with rare components to prevent magical decay."
	bookquality = 6
	sellprice = 250

/obj/item/book/granter/spellbook/legendary
	name = "Living Spellcodex"
	desc = "Its creator poured their soul into this sentient book. Pages rewrite themselves using stolen Weave threads. Screams softly when spells are added without proper sacrifices."
	bookquality = 8
	sellprice = 400

/obj/item/book/granter/spellbook/debug
	name = "Reality Draft"
	desc = "An unstable prototype by an overambitious wizard. Contains crossed-out 'spells' like 'Mordenkainen's Disappointing Supper' and 'Tasha's Slightly Warmer Laughter'. Smells of desperation."
	bookquality = 99
	sellprice = 400

/// Book slapcrafting

/obj/item/spellbook_unfinished
	var/pages_left = 4
	name = "bound scrollpaper"
	dropshrink = 0.6
	icon = 'icons/roguetown/items/books.dmi'
	icon_state ="basic_book_0"
	desc = "Thick scroll paper bound at the spine. It lacks pages."
	throw_speed = 1
	throw_range = 5
	w_class = WEIGHT_CLASS_NORMAL		 //upped to three because books are, y'know, pretty big. (and you could hide them inside eachother recursively forever)
	attack_verb = list("bashed", "whacked", "educated")
	resistance_flags = FLAMMABLE
	drop_sound = 'sound/foley/dropsound/book_drop.ogg'
	pickup_sound =  'sound/blank.ogg'

/obj/item/spellbook_unfinished/pre_arcyne
	name = "tome in waiting"
	icon_state = "spellbook_unfinished"
	desc = "A fully bound tome of scroll paper. It's lacking a certain weave energy."

/obj/item/natural/hide/attackby(obj/item/P, mob/living/carbon/human/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(istype(P, /obj/item/paper/scroll))
		if(isturf(loc)&& (found_table))
			var/crafttime = (100 - ((user.mind?.get_skill_level(/datum/skill/magic/arcane))*5))
			if(do_after(user, crafttime, target = src))
				playsound(loc, 'sound/items/book_close.ogg', 100, TRUE)
				to_chat(user, span_notice("I add the first few pages to the leather cover..."))
				new /obj/item/spellbook_unfinished(loc)
				qdel(P)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>You need to put the [src] on a table to work on it.</span>")
	else
		return ..()

/obj/item/spellbook_unfinished/attackby(obj/item/P, mob/living/carbon/human/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(istype(P, /obj/item/paper/scroll))
		if(isturf(loc)&& (found_table))
			var/crafttime = (60 - ((user.mind?.get_skill_level(/datum/skill/magic/arcane))*5))
			if(do_after(user, crafttime, target = src))
				if(pages_left > 0)
					playsound(loc, 'sound/items/book_page.ogg', 100, TRUE)
					pages_left -= 1
					to_chat(user, span_notice("[pages_left+1] left..."))
					qdel(P)
				else
					playsound(loc, 'sound/items/book_open.ogg', 100, TRUE)
					if(isarcyne(user))
						to_chat(user, span_notice("The book is bound. I must find a catalyst to weave the arcyne into it now."))
					else
						to_chat(user, span_notice("I've made an empty book of thick, useless scroll paper. I can't even thumb through it!"))
					new /obj/item/spellbook_unfinished/pre_arcyne(loc)
					qdel(P)
					qdel(src)
		else
			to_chat(user, "<span class='warning'>You need to put the [src] on a table to work on it.</span>")
	else
		return ..()

/obj/item/spellbook_unfinished/pre_arcyne/attackby(obj/item/P, mob/living/carbon/human/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(istype(P, /obj/item/roguegem/amethyst))
		user.visible_message(span_notice("I run my weave energy into the crystal. It's artifical lattices pulse and then fall dormant. It must not be strong enough to make a spellbook with!"))
		return
	if(istype(P, /obj/item/roguegem/violet))
		if(isturf(loc)&& (found_table))
			var/crafttime = (100 - ((user.mind?.get_skill_level(/datum/skill/magic/arcane))*5))
			if(do_after(user, crafttime, target = src))
				if(isarcyne(user))
					playsound(loc, 'sound/magic/crystal.ogg', 100, TRUE)
					user.visible_message(span_warning("[user] crushes [user.p_their()] [P]! Its powder seeps into the [src]."), \
						span_notice("I run my weave energy into the crystal. It shatters and seeps into the cover of the tome! Runes and symbols of an unknowable language cover it's pages now..."))
					var/obj/item/book/granter/spellbook/newbook = new /obj/item/book/granter/spellbook/expert(loc)
					newbook.owner = user
					qdel(P)
					qdel(src)
				else
					to_chat(user, span_notice("I press the gem into the cover of the book. What a pretty design this would make!"))
					return ..()
		else
			to_chat(user, "<span class='warning'>You need to put the [src] on a table to work on it.</span>")

	if(istype(P, /obj/item/roguegem))
		if(isturf(loc)&& (found_table))
			var/crafttime = (100 - ((user.mind?.get_skill_level(/datum/skill/magic/arcane))*5))
			if(do_after(user, crafttime, target = src))
				if(isarcyne(user))
					playsound(loc, 'sound/magic/crystal.ogg', 100, TRUE)
					user.visible_message(span_warning("[user] crushes [user.p_their()] [P]! Its powder seeps into the [src]."), \
						span_notice("I run my arcyne energy into the crystal. It shatters and seeps into the cover of the tome! Runes and symbols of an unknowable language cover it's pages now..."))
					var/obj/item/book/granter/spellbook/newbook = new /obj/item/book/granter/spellbook/adept(loc)
					newbook.owner = user
					qdel(P)
					qdel(src)
				else
					to_chat(user, span_notice("I press the gem into the cover of the book. What a pretty design this would make!"))
					return ..()
		else
			to_chat(user, "<span class='warning'>You need to put the [src] on a table to work on it.</span>")
	else if (istype(P, /obj/item/natural/stone))
		var/obj/item/natural/stone/the_rock = P
		if (the_rock.magic_power)
			if(isturf(loc) && (found_table))
				var/crafttime = ((130 - the_rock.magic_power) - ((user.mind?.get_skill_level(/datum/skill/magic/arcane))*5))
				if(do_after(user, crafttime, target = src))
					if (isarcyne(user))
						playsound(loc, 'sound/magic/crystal.ogg', 100, TRUE)
						user.visible_message(span_warning("[user] crushes [user.p_their()] [P]! Its powder seeps into the [src]."), \
							span_notice("I join my weave energy with that of the magical stone in my hands, which shudders briefly before dissolving into motes of ash. Runes and symbols of an unknowable language cover its pages now..."))
						to_chat(user, span_notice("...yet even for an enigma of the weave, these characters are unlike anything I've seen before. They're going to be -much- harder to understand..."))
						if(the_rock.magic_power <=5)
							var/obj/item/book/granter/spellbook/newbook = new /obj/item/book/granter/spellbook/horrible(loc)
							newbook.owner = user
							newbook.born_of_rock = TRUE
							newbook.desc += " Traces of multicolored stone limn its margins."
							qdel(P)
							qdel(src)
						else if(the_rock.magic_power >5 && the_rock.magic_power <=9)
							var/obj/item/book/granter/spellbook/newbook = new /obj/item/book/granter/spellbook/mid(loc)
							newbook.owner = user
							newbook.born_of_rock = TRUE
							newbook.desc += " Traces of multicolored stone limn its margins."
							qdel(P)
							qdel(src)
						else if(the_rock.magic_power >=10)
							var/obj/item/book/granter/spellbook/newbook = new /obj/item/book/granter/spellbook/apprentice(loc)
							newbook.owner = user
							newbook.born_of_rock = TRUE
							newbook.desc += " Traces of multicolored stone limn its margins."
							qdel(P)
							qdel(src)
					else
						if (prob(the_rock.magic_power)) // for reference, this is never higher than 15 and usually significantly lower
							playsound(loc, 'sound/magic/crystal.ogg', 100, TRUE)
							user.visible_message(span_warning("[user] carefully sets down [the_rock] upon [src]. Nothing happens for a moment or three, then suddenly, the glow surrounding the stone becomes as liquid, seeps down and soaks into the tome!"), \
							span_notice("I knew this stone was special! Its colourful magick has soaked into my tome and given me gift of mystery!"))
							to_chat(user, span_notice("...what in the world does any of this scribbling possibly mean?"))
							if(the_rock.magic_power <=5)
								var/obj/item/book/granter/spellbook/newbook = new /obj/item/book/granter/spellbook/horrible(loc)
								newbook.owner = user
								newbook.born_of_rock = TRUE
								newbook.desc += " Traces of multicolored stone limn its margins."
								qdel(P)
								qdel(src)
							else if(the_rock.magic_power >5 && the_rock.magic_power <=9)
								var/obj/item/book/granter/spellbook/newbook = new /obj/item/book/granter/spellbook/mid(loc)
								newbook.owner = user
								newbook.born_of_rock = TRUE
								newbook.desc += " Traces of multicolored stone limn its margins."
								qdel(P)
								qdel(src)
							else if(the_rock.magic_power >=10)
								var/obj/item/book/granter/spellbook/newbook = new /obj/item/book/granter/spellbook/apprentice(loc)
								newbook.owner = user
								newbook.born_of_rock = TRUE
								newbook.desc += " Traces of multicolored stone limn its margins."
								qdel(P)
								qdel(src)
						else
							user.visible_message(span_warning("[user] sets down [the_rock] upon the surface of [src] and watches expectantly. Without warning, the rock violently pops like a squashed gourd!"), \
							span_notice("No! My precious stone! It musn't have wanted to share its mysteries with me..."))
							user.electrocute_act(5, src)
							qdel(P)
		else
			to_chat(user, span_notice("This is a mere rock - it has no arcyne potential. Bah!"))
			return ..()
	else if (istype(P, /obj/item/natural/melded/t1))
		if(isturf(loc) && (found_table))
			var/crafttime = (100 - ((user.mind?.get_skill_level(/datum/skill/magic/arcane))*5))
			if(do_after(user, crafttime, target = src))
				if (isarcyne(user))
					playsound(loc, 'sound/magic/crystal.ogg', 100, TRUE)
					user.visible_message(span_warning("[user] imbues [user.p_their()] [P]! It fuses into the [src]."), \
						span_notice("I join my weave energy with that of the [P] in my hands, which shudders briefly before dissolving into motes of energy. Runes and symbols of an unknowable language cover its pages now..."))
					to_chat(user, span_notice("...yet even for an enigma of the weave, these characters are unlike anything I've seen before. They're going to be -much- harder to understand..."))
					var/obj/item/book/granter/spellbook/newbook = new /obj/item/book/granter/spellbook/adept(loc)
					newbook.owner = user
					qdel(P)
					qdel(src)
				else
					user.visible_message(span_warning("[user] sets down [P] upon the surface of [src] and watches expectantly. Without warning, the [P] lets out a burst of arcane energy!"), \
					span_notice("I should have known messing with the arcyne as dangerous!"))
					user.electrocute_act(20, src)
					qdel(P)
		return ..()
	else if (istype(P, /obj/item/natural/melded/t2))
		if(isturf(loc) && (found_table))
			var/crafttime = (100 - ((user.mind?.get_skill_level(/datum/skill/magic/arcane))*5))
			if(do_after(user, crafttime, target = src))
				if (isarcyne(user))
					playsound(loc, 'sound/magic/crystal.ogg', 100, TRUE)
					user.visible_message(span_warning("[user] crushes [user.p_their()] [P]! Its powder seeps into the [src]."), \
						span_notice("I join my weave energy with that of the [P] in my hands, which shudders briefly before dissolving into motes of energy. Runes and symbols of an unknowable language cover its pages now..."))
					to_chat(user, span_notice("...yet even for an enigma of the weave, these characters are unlike anything I've seen before. They're going to be -much- harder to understand..."))
					var/obj/item/book/granter/spellbook/newbook = new /obj/item/book/granter/spellbook/expert(loc)
					newbook.owner = user
					qdel(P)
					qdel(src)
				else
					user.visible_message(span_warning("[user] sets down [P] upon the surface of [src] and watches expectantly. Without warning, the [P] violently explodes!"), \
					span_notice("I should have known messing with the weave as dangerous!"))
					user.electrocute_act(40, src)
					qdel(P)
	else if (istype(P, /obj/item/natural/melded/t3))
		if(isturf(loc) && (found_table))
			var/crafttime = (100 - ((user.mind?.get_skill_level(/datum/skill/magic/arcane))*5))
			if(do_after(user, crafttime, target = src))
				if (isarcyne(user))
					playsound(loc, 'sound/magic/crystal.ogg', 100, TRUE)
					user.visible_message(span_warning("[user] crushes [user.p_their()] [P]! Its powder seeps into the [src]."), \
						span_notice("I join my weave energy with that of the [P] in my hands, which shudders briefly before dissolving into motes of energy. Runes and symbols of an unknowable language cover its pages now..."))
					to_chat(user, span_notice("...yet even for an enigma of the weave, these characters are unlike anything I've seen before. They're going to be -much- harder to understand..."))
					var/obj/item/book/granter/spellbook/newbook = new /obj/item/book/granter/spellbook/master(loc)
					newbook.owner = user
					qdel(P)
					qdel(src)
				else
					user.visible_message(span_warning("[user] sets down [P] upon the surface of [src] and watches expectantly. Without warning, the [P] violently explodes!"), \
					span_notice("I should have known messing with the weave as dangerous!"))
					user.electrocute_act(60, src)
					qdel(P)
	else if (istype(P, /obj/item/natural/melded/t4))
		if(isturf(loc) && (found_table))
			var/crafttime = (100 - ((user.mind?.get_skill_level(/datum/skill/magic/arcane))*5))
			if(do_after(user, crafttime, target = src))
				if (isarcyne(user))
					playsound(loc, 'sound/magic/crystal.ogg', 100, TRUE)
					user.visible_message(span_warning("[user] crushes [user.p_their()] [P]! Its powder seeps into the [src]."), \
						span_notice("I join my weave energy with that of the [P] in my hands, which shudders briefly before dissolving into motes of energy. Runes and symbols of an unknowable language cover its pages now..."))
					to_chat(user, span_notice("...yet even for an enigma of the weave, these characters are unlike anything I've seen before. They're going to be -much- harder to understand..."))
					var/obj/item/book/granter/spellbook/newbook = new /obj/item/book/granter/spellbook/legendary(loc)
					newbook.owner = user
					qdel(P)
					qdel(src)
				else
					user.visible_message(span_warning("[user] sets down [P] upon the surface of [src] and watches expectantly. Without warning, the [P] violently explodes!"), \
					span_notice("I should have known messing with the weave as dangerous!"))
					user.electrocute_act(80, src)
					qdel(P)
	else
		return ..()

// qualityoflearn buff shit

/obj/item/roguegem
	var/arcyne_potency = 20

/obj/item/roguegem/yellow
	arcyne_potency = 5

/obj/item/roguegem/green
	arcyne_potency = 7

/obj/item/roguegem/violet
	arcyne_potency = 10

/obj/item/roguegem/blue
	arcyne_potency = 15

/obj/item/roguegem/diamond
	arcyne_potency = 25



/obj/item/book/granter/spellbook/attackby(obj/item/P, mob/living/carbon/human/user, params)
	if(istype(P, /obj/item/roguegem))
		if(!stored_gem)
			if(isarcyne(user))
				var/obj/item/roguegem/gem = P
				var/crafttime = (60 - ((user.mind?.get_skill_level(/datum/skill/magic/arcane))*5))
				if(do_after(user, crafttime, target = src))
					playsound(loc, 'sound/magic/glass.ogg', 100, TRUE)
					to_chat(user, span_notice("Running my weave energy through this crystal, I imbue the tome with my natural essence, attuning it to my state of mind..."))
					stored_gem = gem.arcyne_potency
					qdel(P)
			else
				to_chat(user, span_notice("Why am I jamming a gem into a book? I must look like a fool!"))
		else
			to_chat(user, span_notice("This tome is already coursing with weave energies..."))
	else
		return ..()


// helper proc


/obj/item/book/granter/spellbook/magician/Initialize()
	. = ..()
	var/mob/living/carbon/human/L = loc
	owner = L

