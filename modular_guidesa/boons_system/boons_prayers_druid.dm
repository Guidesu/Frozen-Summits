/datum/prayer/cleric/forest_armaments
	name = "Summon Verdant Armaments"
	desc = "Calls forth the sacred woodland gear of ancient guardians."
	stages = list(
		list("text" = "By root and branch, by tooth and claw...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "Spirits of the eternal grove, arm your champion!", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "NATURE PROVIDES!", "delay" = 50, "sound" = 'sound/magic/holyshield.ogg')
	)
	required_skill = /datum/skill/magic/druidic
	min_skill = 2

/datum/prayer/cleric/forest_armaments/grant_boon(mob/user)
	var/turf/source_turf = get_turf(user)
	playsound(source_turf, 'sound/magic/revive.ogg', 100, TRUE)
	
	var/list/forest_gear = list(
		// Armor
		/obj/item/clothing/suit/roguetown/armor/leather/hide/warden,
		/obj/item/clothing/suit/roguetown/armor/plate/druidic_plate,
		
		// Cloaks
		/obj/item/clothing/cloak/wardencloak,
		/obj/item/clothing/cloak/forrestercloak,
		
		// Footwear
		/obj/item/clothing/shoes/roguetown/boots/leather/druidic_boots,
		
		// Gloves
		/obj/item/clothing/gloves/roguetown/druidic_gloves,
		
		// Helmets
		/obj/item/clothing/head/roguetown/helmet/heavy/druidic_helm,
		/obj/item/clothing/head/roguetown/helmet/bascinet/antler,
		/obj/item/clothing/head/roguetown/helmet/heavy/goat,
		/obj/item/clothing/head/roguetown/helmet/heavy/bear,
		/obj/item/clothing/head/roguetown/helmet/heavy/wolf
	)

	for(var/gear_path in forest_gear)
		new gear_path(source_turf)
	
	to_chat(user, span_cultlarge("The forest's ancient armaments materialize around you!"))
	source_turf.visible_message(span_warning("Vines and roots twist into shape, forming ancient woodland gear!"))
