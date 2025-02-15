/obj/structure/flora/roguegrass/herb
	name = "herbbush"
	desc = "A bush, for an herb."
	icon = 'icons/roguetown/misc/herbfoliage.dmi'
	icon_state = "spritemeplz"
	var/res_replenish
	max_integrity = 10
	climbable = FALSE
	dir = SOUTH
	var/list/looty = list()
	var/herbtype

/obj/structure/flora/roguegrass/herb/Initialize()
	. = ..()
	desc = "An herb. This one looks like [name]."

/obj/structure/flora/roguegrass/herb/update_icon()
	return

/obj/structure/flora/roguegrass/herb/attack_hand(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		user.changeNext_move(CLICK_CD_MELEE)
		playsound(src.loc, "plantcross", 80, FALSE, -1)
		if(do_after(L, rand(3,5), target = src))
			if(!looty.len && (world.time > res_replenish))
				loot_replenish()
			if(prob(50) && looty.len)
				if(looty.len == 1)
					res_replenish = world.time + 5 MINUTES
				var/obj/item/B = pick_n_take(looty)
				if(B)
					B = new B(user.loc)
					user.put_in_hands(B)
					user.visible_message(span_notice("[user] finds [B] in [src]."))
					return
			user.visible_message(span_notice("[user] searches through [src]."))
			if(!looty.len)
				to_chat(user, span_warning("Picked clean; but looks healthy. I should try again later."))

/obj/structure/flora/roguegrass/herb/proc/loot_replenish()
	if(herbtype)
		looty += herbtype

/obj/structure/flora/roguegrass/herb/random
	name = "random herb"
	desc = "Haha, im in danger."

/obj/structure/flora/roguegrass/herb/random/Initialize()
	var/type = pick(list(
		/obj/structure/flora/roguegrass/herb/atropa,
		/obj/structure/flora/roguegrass/herb/matricaria,
		/obj/structure/flora/roguegrass/herb/symphitum,
		/obj/structure/flora/roguegrass/herb/taraxacum,
		/obj/structure/flora/roguegrass/herb/euphrasia,
		/obj/structure/flora/roguegrass/herb/paris,
		/obj/structure/flora/roguegrass/herb/calendula,
		/obj/structure/flora/roguegrass/herb/mentha,
		/obj/structure/flora/roguegrass/herb/urtica,
		/obj/structure/flora/roguegrass/herb/salvia,
		/obj/structure/flora/roguegrass/herb/hypericum,
		/obj/structure/flora/roguegrass/herb/benedictus,
		/obj/structure/flora/roguegrass/herb/valeriana,
		/obj/structure/flora/roguegrass/herb/artemisia,
		/obj/structure/flora/roguegrass/herb/roguemorsel,
		/obj/structure/flora/roguegrass/herb/bonecap,
		/obj/structure/flora/roguegrass/herb/balsam))

	var/obj/structure/flora/roguegrass/herb/boi = new type
	boi.forceMove(get_turf(src))
	boi.pixel_x += rand(-3,3)
	. = ..()

	return INITIALIZE_HINT_QDEL

/obj/structure/flora/roguegrass/herb/underdark/random
	name = "random underdark herb"
	desc = "Haha, im in danger."

/obj/structure/flora/roguegrass/herb/underdark/random/Initialize()
	var/type = pick(list(
		/obj/structure/flora/roguegrass/herb/roguemorsel,
		/obj/structure/flora/roguegrass/herb/weavemoss,
		/obj/structure/flora/roguegrass/herb/nightorchid,
		/obj/structure/flora/roguegrass/herb/timmask,
		/obj/structure/flora/roguegrass/herb/nightlight,
		/obj/structure/flora/roguegrass/herb/bonecap,
		/obj/structure/flora/roguegrass/herb/bluecap,
		/obj/structure/flora/roguegrass/herb/bullywug,
		/obj/structure/flora/roguegrass/herb/torchstalk,
		/obj/structure/flora/roguegrass/herb/firelichen,
		/obj/structure/flora/roguegrass/herb/waterorb,
		/obj/structure/flora/roguegrass/herb/tongueofmadness,))

	var/obj/structure/flora/roguegrass/herb/underdark/boi = new type
	boi.forceMove(get_turf(src))
	boi.pixel_x += rand(-3,3)
	. = ..()

	return INITIALIZE_HINT_QDEL

/obj/structure/flora/roguegrass/herb/underdark/water/random
	name = "random aquatic underdark herb"
	desc = "Haha, im in danger."

/obj/structure/flora/roguegrass/herb/underdark/water/random/Initialize()
	var/type = pick(list(
		/obj/structure/flora/roguegrass/herb/waterorb))

	var/obj/structure/flora/roguegrass/herb/underdark/water/boi = new type
	boi.forceMove(get_turf(src))
	boi.pixel_x += rand(-3,3)
	. = ..()

	return INITIALIZE_HINT_QDEL


/obj/structure/flora/roguegrass/herb/atropa
	name = "atropa"
	icon_state = "atropa"

	herbtype = /obj/item/alch/atropa

/obj/structure/flora/roguegrass/herb/matricaria
	name = "matricaria"
	icon_state = "matricaria"

	herbtype = /obj/item/alch/matricaria

/obj/structure/flora/roguegrass/herb/symphitum
	name = "symphitum"
	icon_state = "symphitum"

	herbtype = /obj/item/alch/symphitum

/obj/structure/flora/roguegrass/herb/taraxacum
	name = "taraxacum"
	icon_state = "taraxacum"

	herbtype = /obj/item/alch/taraxacum

/obj/structure/flora/roguegrass/herb/euphrasia
	name = "euphrasia"
	icon_state = "euphrasia"

	herbtype = /obj/item/alch/euphrasia

/obj/structure/flora/roguegrass/herb/paris
	name = "paris"
	icon_state = "paris"

	herbtype = /obj/item/alch/paris

/obj/structure/flora/roguegrass/herb/calendula
	name = "calendula"
	icon_state = "calendula"

	herbtype = /obj/item/alch/calendula

/obj/structure/flora/roguegrass/herb/mentha
	name = "mentha"
	icon_state = "mentha"

	herbtype = /obj/item/alch/mentha

/obj/structure/flora/roguegrass/herb/urtica
	name = "urtica"
	icon_state = "urtica"

	herbtype = /obj/item/alch/urtica

/obj/structure/flora/roguegrass/herb/salvia
	name = "salvia"
	icon_state = "salvia"

	herbtype = /obj/item/alch/salvia

/obj/structure/flora/roguegrass/herb/hypericum
	name = "hypericum"
	icon_state = "hypericum"

	herbtype = /obj/item/alch/hypericum

/obj/structure/flora/roguegrass/herb/benedictus
	name = "benedictus"
	icon_state = "benedictus"

	herbtype = /obj/item/alch/benedictus

/obj/structure/flora/roguegrass/herb/valeriana
	name = "valeriana"
	icon_state = "valeriana"

	herbtype = /obj/item/alch/valeriana

/obj/structure/flora/roguegrass/herb/artemisia
	name = "artemisia"
	icon_state = "artemisia"

	herbtype = /obj/item/alch/artemisia

// Frozen Summit Herbs

/obj/structure/flora/roguegrass/herb/roguemorsel
	name = "rogue's morsel"
	icon_state = "roguemorsel"

	herbtype = /obj/item/alch/roguemorsel

/obj/structure/flora/roguegrass/herb/balsam
	name = "balsam"
	icon_state = "balsam"

	herbtype = /obj/item/alch/balsam

/obj/structure/flora/roguegrass/herb/weavemoss
	name = "weavemoss"
	icon_state = "weavemoss"

	herbtype = /obj/item/alch/weavemoss

/obj/structure/flora/roguegrass/herb/weavemoss/New(loc, obj/item/seeds/newseed, mutate_stats)
	..()
	set_light(1.5, 1.5, "#a56dd3")

/obj/structure/flora/roguegrass/herb/nightorchid
	name = "night orchid"
	icon_state = "nightorchid"

	herbtype = /obj/item/alch/nightorchid

/obj/structure/flora/roguegrass/herb/tongueofmadness
	name = "tongue of madness"
	icon_state = "tongueofmadness"

	herbtype = /obj/item/alch/tongueofmadness

/obj/structure/flora/roguegrass/herb/timmask
	name = "timmask"
	icon_state = "timmask"

	herbtype = /obj/item/alch/timmask

/obj/structure/flora/roguegrass/herb/nightlight
	name = "nightlight"
	icon_state = "nightlight"

	herbtype = /obj/item/alch/nightlight

/obj/structure/flora/roguegrass/herb/nightlight/New(loc, obj/item/seeds/newseed, mutate_stats)
	..()
	set_light(4, 1.5, "#5473d6")

/obj/structure/flora/roguegrass/herb/bonecap
	name = "bonecap"
	icon_state = "bonecap"

	herbtype = /obj/item/alch/bonecap

/obj/structure/flora/roguegrass/herb/bluecap
	name = "bluecap"
	icon_state = "bluecap"

	herbtype = /obj/item/alch/bluecap

/obj/structure/flora/roguegrass/herb/bullywug
	name = "bullywug trumpet"
	icon_state = "bullywug"

	herbtype = /obj/item/alch/bullywug

/obj/structure/flora/roguegrass/herb/torchstalk
	name = "torchstalk"
	icon_state = "torchstalk"

	herbtype = /obj/item/alch/torchstalk

/obj/structure/flora/roguegrass/herb/torchstalk/New(loc, obj/item/seeds/newseed, mutate_stats)
	..()
	set_light(4, 1.5, "#e06f2e")

/obj/structure/flora/roguegrass/herb/firelichen
	name = "fire lichen"
	icon_state = "firelichen"

	herbtype = /obj/item/alch/firelichen

/obj/structure/flora/roguegrass/herb/firelichen/New(loc, obj/item/seeds/newseed, mutate_stats)
	..()
	set_light(1.5, 1.5, "#e06f2e")

/obj/structure/flora/roguegrass/herb/waterorb
	name = "water orb"
	icon_state = "waterorb"

	herbtype = /obj/item/alch/waterorb
