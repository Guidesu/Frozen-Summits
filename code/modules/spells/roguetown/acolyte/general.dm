// Lesser miracle
/obj/effect/proc_holder/spell/invoked/lesser_heal
	name = "Miracle"
	overlay_state = "lesserheal"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 4
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/heal.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 30 SECONDS
	miracle = TRUE
	devotion_cost = 10
	cost = 1

/obj/effect/proc_holder/spell/invoked/lesser_heal/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(user.patron?.undead_hater && (target.mob_biotypes & MOB_UNDEAD)) //positive energy harms the undead
			target.visible_message(span_danger("[target] is burned by holy light!"), span_userdanger("I'm burned by holy light!"))
			target.adjustFireLoss(10)
			target.fire_act(1,10)
		if(target.mob_biotypes & MOB_UNDEAD) //positive energy harms the undead
			target.visible_message("<span class='danger'>[target] is burned by holy light!</span>", "<span class='userdanger'>I'm burned by holy light!</span>")
			target.adjustFireLoss(25)
			target.fire_act(1,5)
			return TRUE
		if(target.real_name in GLOB.excommunicated_players)
			target.visible_message("<span class='warning'>The curse sears [user]s flesh, cursed being!</span>", "<span class='notice'>I am cursed, rejected, and this curse hits me with a wave of pain!</span>")
			target.emote("scream")
			target.adjustFireLoss(20)
			return TRUE
		var/conditional_buff = FALSE
		var/situational_bonus = 1
		if(HAS_TRAIT(target, TRAIT_ASTRATA_CURSE))
			target.visible_message(span_danger("[target] recoils in pain!"), span_userdanger("Divine healing shuns me!"))
			target.cursed_freak_out()
			return FALSE
		if(HAS_TRAIT(target, TRAIT_ATHEISM_CURSE))
			target.visible_message(span_danger("[target] recoils in disgust!"), span_userdanger("These fools are trying to cure me with religion!!"))
			target.cursed_freak_out()
			return FALSE
		//this if chain is stupid, replace with variables on /datum/patron when possible?

		switch(user.patron.type)

			if(/datum/patron/old_god)
				target.visible_message(span_info("A strange stirring feeling pours from [target]!"), span_notice("Sentimental thoughts drive away my pains!"))

			if(/datum/patron/divine/astrata)
				target.visible_message(span_info("A wreath of gentle light passes over [target]!"), span_notice("I'm bathed in holy light!"))
				// during the day, heal 1 more (basic as fuck)
				if (GLOB.tod == "day")
					conditional_buff = TRUE
					situational_bonus = 2
				// Day is 1/4th as long as night. Noc priests get a bonus for four times as long and during peak conflict hours, thus Astratans should have more powerful heals

			if(/datum/patron/divine/noc)
				target.visible_message(span_info("A shroud of soft moonlight falls upon [target]!"), span_notice("I'm shrouded in gentle moonlight!"))
				// during the night, heal 1 more (i wish this was more interesting but they're twins so whatever)
				if (GLOB.tod == "night")
					conditional_buff = TRUE

			if(/datum/patron/divine/dendor)
				target.visible_message(span_info("A rush of primal energy spirals about [target]!"), span_notice("I'm infused with primal energies!"))
				var/list/natural_stuff = list(/obj/structure/flora/roguegrass, /obj/structure/flora/roguetree, /obj/structure/flora/rogueshroom, /obj/structure/soil, /obj/structure/flora/newtree, /obj/structure/flora/tree, /obj/structure/glowshroom)
				situational_bonus = 0
				// the more natural stuff around US, the more we heal
				for (var/obj/O in oview(5, user))
					if (O in natural_stuff)
						situational_bonus = min(situational_bonus + 0.1, 2)
				for (var/obj/structure/flora/roguetree/wise/O in oview(5, user))
					situational_bonus += 1.5
				// Healing before the oaken avatar of Silvanus in the Druid Grove (exceptionally rare otherwise) supercharges their healing
				if (situational_bonus > 0)
					conditional_buff = TRUE

			if(/datum/patron/divine/abyssor)
				target.visible_message(span_info("A mist of salt-scented vapour settles on [target]!"), span_notice("I'm invigorated by healing vapours!"))
				// if our target is standing in water, heal a flat amount extra
				if (istype(get_turf(target), /turf/open/water))
					conditional_buff = TRUE
					situational_bonus = 1.5

			if(/datum/patron/divine/ravox)
				target.visible_message(span_info("An air of righteous defiance rises near [target]!"), span_notice("I'm filled with an urge to fight on!"))
				situational_bonus = 0
				// the bloodier the area around our target is, the more we heal
				for (var/obj/effect/decal/cleanable/blood/O in oview(5, target))
					situational_bonus = min(situational_bonus + 0.1, 2)
				conditional_buff = TRUE

			if(/datum/patron/divine/necra)
				target.visible_message(span_info("A sense of quiet respite radiates from [target]!"), span_notice("I feel Deaths's gaze turn from me for now!"))
				if (iscarbon(target))
					var/mob/living/carbon/C = target
					// if the target is "close to death" (at or below 25% health)
					if (C.health <= (C.maxHealth * 0.25))
						conditional_buff = TRUE
						situational_bonus = 2.5

			if(/datum/patron/divine/xylix)
				target.visible_message(span_info("A fugue seems to manifest briefly across [target]!"), span_notice("My wounds vanish as if they had never been there! "))
				// half of the time, heal a little (or a lot) more - flip the coin
				if (prob(50))
					conditional_buff = TRUE
					situational_bonus = rand(1, 2.5)

			if(/datum/patron/divine/pestra)
				target.visible_message(span_info("An aura of clinical care encompasses [target]!"), span_notice("I'm sewn back together by sacred medicine!"))
				// pestra always heals a little more toxin damage and restores a bit more blood
				target.adjustToxLoss(-situational_bonus)
				target.blood_volume += BLOOD_VOLUME_SURVIVE/2

			if(/datum/patron/divine/malum)
				target.visible_message("<span class='info'>A tempering heat is discharged out of [target]!</span>", "<span class='notice'>I feel the heat of a forge soothing my pains!</span>")
				var/list/firey_stuff = list(/obj/machinery/light/rogue/torchholder, /obj/machinery/light/rogue/campfire, /obj/machinery/light/rogue/hearth, /obj/machinery/light/rogue/wallfire, /obj/machinery/light/rogue/wallfire/candle, /obj/machinery/light/rogue/forge)
				// extra healing for every source of fire/light near us
				situational_bonus = 0
				for (var/obj/O in oview(5, user))
					if (O.type in firey_stuff)
						situational_bonus = min(situational_bonus + 0.5, 2.5)
				if (situational_bonus > 0)
					conditional_buff = TRUE

			if(/datum/patron/divine/eora)
				target.visible_message("<span class='info'>An emanance of love blossoms around [target]!</span>", "<span class='notice'>I'm filled with the restorative warmth of love!</span>")
				// if they're wearing an eoran bud (or are a pacifist), pretty much double the healing. if we're also wearing a bud at any point or a pacifist from any other source, apply another +15 bonus
				situational_bonus = 0
				if (HAS_TRAIT(target, TRAIT_PACIFISM))
					conditional_buff = TRUE
					situational_bonus = 2.5
				if (HAS_TRAIT(user, TRAIT_PACIFISM))
					conditional_buff = TRUE
					situational_bonus += 1.5

			if(/datum/patron/inhumen/zizo)
				target.visible_message(span_info("Vital energies are sapped towards [target]!"), span_notice("The life around me pales as I am restored!"))
				// set up a ritual pile of bones (or just cast near a stack of bones whatever) around us for massive bonuses, cap at 50 for 75 healing total (wowie)
				situational_bonus = 0
				for (var/obj/item/natural/bone/O in oview(5, user))
					situational_bonus += (0.5)
				for (var/obj/item/natural/bundle/bone/S in oview(5, user))
					situational_bonus += (S.amount * 0.5)
				if (situational_bonus > 0)
					conditional_buff = TRUE
					situational_bonus = min(situational_bonus, 5)

			if(/datum/patron/inhumen/graggar)
				target.visible_message(span_info("Foul fumes billow outward as [target] is restored!"), span_notice("A noxious scent burns my nostrils, but I feel better!"))
				// if you've got lingering toxin damage, you get healed more, but your bonus healing doesn't affect toxin
				var/toxloss = target.getToxLoss()
				if (toxloss >= 10)
					conditional_buff = TRUE
					situational_bonus = 2.5
					target.adjustToxLoss(situational_bonus) // remember we do a global toxloss adjust down below so this is okay

			if(/datum/patron/inhumen/matthios)
				target.visible_message(span_info("A wreath of... strange light passes over [target]?"), span_notice("I'm bathed in a... strange holy light?"))
				// COMRADES! WE MUST BAND TOGETHER!
				if (HAS_TRAIT(target, TRAIT_COMMIE))
					conditional_buff = TRUE
					situational_bonus = 2.5

			if(/datum/patron/inhumen/baotha)
				target.visible_message(span_info("Hedonistic impulses and emotions throb all about from [target]."), span_notice("An intoxicating rush of narcotic delight wipes away my pains!"))
				// i wanted to do something with pain here but it doesn't seem like pain is actually parameterized anywhere so... better necra it is - if they're below 50% health, they get 25 extra healing
				if (iscarbon(target))
					var/mob/living/carbon/C = target
					if (C.health <= (C.maxHealth * 0.5))
						conditional_buff = TRUE
						situational_bonus = 2.5

			if(/datum/patron/godless)
				target.visible_message(span_info("Without any particular cause or reason, [target] is healed!"), span_notice("My wounds close without cause."))
/*
			if(/datum/patron/divine/lathander)
				target.visible_message(span_info("A warm radiance dawns over [target]!"), span_notice("I am embraced by the renewing light of dawn!"))
				// Similar to Astrata: healing bonus during the day to symbolize Lathander's association with dawn
				if (GLOB.tod == "day")
					conditional_buff = TRUE
					situational_bonus = 2
*/
			if(/datum/patron/divine/selune)
				target.visible_message(span_info("A calming moonlit aura surrounds [target]!"), span_notice("The light of Selûne soothes my wounds!"))
				// Similar to Noc: healing bonus during the night, as Selûne is tied to the moon
				if (GLOB.tod == "night")
					conditional_buff = TRUE
					situational_bonus = 2

			if(/datum/patron/divine/chauntea)
				target.visible_message(span_info("A nurturing energy flows from [target]!"), span_notice("I am restored by the bounty of nature!"))
				// Similar to Dendor: healing is enhanced by natural elements nearby
				var/list/natural_stuff = list(/obj/structure/flora/roguegrass, /obj/structure/flora/roguetree, /obj/structure/flora/rogueshroom, /obj/structure/soil, /obj/structure/flora/newtree, /obj/structure/flora/tree, /obj/structure/glowshroom)
				situational_bonus = 0
				for (var/obj/O in oview(5, user))
					if (O in natural_stuff)
						situational_bonus = min(situational_bonus + 0.1, 2)
				for (var/obj/structure/flora/roguetree/wise/O in oview(5, user))
					situational_bonus += 1.5
				if (situational_bonus > 0)
					conditional_buff = TRUE

			if(/datum/patron/divine/bahamut)
				target.visible_message(span_info("A majestic aura of justice and protection surrounds [target]!"), span_notice("I feel renewed by the presence of Bahamut's wisdom!"))
				// Similar to Ravox: bonus healing in areas where justice or righteousness is represented (e.g., blood-soaked areas as a sign of battle)
				situational_bonus = 0
				for (var/obj/effect/decal/cleanable/blood/O in oview(5, target))
					situational_bonus = min(situational_bonus + 0.1, 2)
				conditional_buff = TRUE


			if(/datum/patron/inhumen/bane)
				target.visible_message(span_info("A suffocating pressure emanates from [target]!"), span_notice("I feel an iron will strengthening my body!"))
				// Similar to Ravox: healing increases in battle-heavy areas, reflecting Bane's dominion over tyranny and conflict
				situational_bonus = 0
				for (var/obj/effect/decal/cleanable/blood/O in oview(5, target))
					situational_bonus = min(situational_bonus + 0.1, 2)
				conditional_buff = TRUE

			if(/datum/patron/inhumen/lolth)
				target.visible_message(span_info("Web-like shadows spiral around [target]!"), span_notice("I am shrouded in the dark weave of the Spider Queen!"))
				// Similar to Xylix: healing has a probabilistic element to reflect Lolth's chaotic and deceptive nature
				if (prob(50))
					conditional_buff = TRUE
					situational_bonus = rand(1, 2.5)

			if(/datum/patron/inhumen/shar)
				target.visible_message(span_info("An oppressive darkness radiates from [target]!"), span_notice("The void calls to me, granting solace in its depths."))
				// Similar to Selûne/Noc: healing is amplified at night but with a sinister undertone
				if (GLOB.tod == "night")
					conditional_buff = TRUE
					situational_bonus = 2

			if(/datum/patron/inhumen/gruumsh)
				target.visible_message(span_info("A savage energy flares from [target]!"), span_notice("I am emboldened by unyielding rage!"))
				// Similar to Ravox: healing increases in blood-soaked areas, emphasizing Gruumsh's chaotic and warlike aspects
				situational_bonus = 0
				for (var/obj/effect/decal/cleanable/blood/O in oview(5, target))
					situational_bonus = min(situational_bonus + 0.1, 2)
				conditional_buff = TRUE

			if(/datum/patron/inhumen/maglubiyet)
				target.visible_message(span_info("A cunning energy rises from [target]!"), span_notice("The craft of conquest invigorates me!"))
				// Similar to Zizo: healing is enhanced by surrounding bones, symbolizing goblin warcraft and sacrifice
				situational_bonus = 0
				for (var/obj/item/natural/bone/O in oview(5, user))
					situational_bonus += (0.5)
				for (var/obj/item/natural/bundle/bone/S in oview(5, user))
					situational_bonus += (S.amount * 0.5)
				if (situational_bonus > 0)
					conditional_buff = TRUE
					situational_bonus = min(situational_bonus, 5)

			if(/datum/patron/inhumen/tiamat)
				target.visible_message(span_info("A tempest of chromatic energy surrounds [target]!"), span_notice("The draconic queen restores my strength!"))
				// Similar to Bahamut but with a chaotic edge: random healing boost based on her chromatic chaos
				conditional_buff = TRUE
				situational_bonus = rand(1, 2.5)

			if(/datum/patron/inhumen/dagon)
				target.visible_message(span_info("An eerie aquatic presence emanates from [target]!"), span_notice("I feel the deep waters of Dagon restoring me!"))
				// Similar to Abyssor: healing is amplified when standing in water
				if (istype(get_turf(target), /turf/open/water))
					conditional_buff = TRUE
					situational_bonus = 1.5

			if(/datum/patron/inhumen/malar)
				target.visible_message(span_info("A primal, predatory aura surrounds [target]!"), span_notice("The hunt fills me with vitality!"))
				// Similar to Dendor: healing increases in natural surroundings but with a predatory emphasis
				var/list/natural_stuff = list(/obj/structure/flora/roguegrass, /obj/structure/flora/roguetree, /obj/structure/flora/rogueshroom, /obj/structure/soil, /obj/structure/flora/newtree, /obj/structure/flora/tree, /obj/structure/glowshroom)
				situational_bonus = 0
				for (var/obj/O in oview(5, user))
					if (O in natural_stuff)
						situational_bonus = min(situational_bonus + 0.1, 2)
				for (var/obj/structure/flora/roguetree/wise/O in oview(5, user))
					situational_bonus += 1.5
				if (situational_bonus > 0)
					conditional_buff = TRUE

			if(/datum/patron/neutral/semuanya)
				target.visible_message(span_info("A primal, reptilian stillness radiates from [target]!"), span_notice("The survival instinct of Semuanya sustains me!"))
				// Inspired by natural surroundings and Dendor, focusing on areas with vegetation or water
				var/list/natural_elements = list(/obj/structure/flora/roguegrass, /obj/structure/flora/roguetree, /obj/structure/flora/rogueshroom, /turf/open/water, /obj/structure/flora/newtree, /obj/structure/flora/tree, /obj/structure/soil)
				situational_bonus = 0
				for (var/obj/O in oview(5, target))
					if (O in natural_elements)
						situational_bonus = min(situational_bonus + 0.1, 2)
				if (situational_bonus > 0)
					conditional_buff = TRUE
/*
			if(/datum/patron/neutral/mielikki)
				target.visible_message(span_info("An aura of peace and flourishing nature surrounds [target]!"), span_notice("Mielikki's touch rejuvenates me in her favored glades."))
				// Similar to Dendor but tied to forests specifically, with a focus on balance and harmony
				var/list/forest_items = list(/obj/structure/flora/tree, /obj/structure/flora/newtree, /obj/structure/soil, /obj/structure/flora/roguegrass)
				situational_bonus = 0
				for (var/obj/O in oview(5, target))
					if (O in forest_items)
						situational_bonus = min(situational_bonus + 0.2, 3)
				if (situational_bonus > 0)
					conditional_buff = TRUE

			if(/datum/patron/neutral/tymora)
				target.visible_message(span_info("An aura of daring chance and fortune sparks around [target]!"), span_notice("The Lady Luck's favor graces me!"))
				// A probabilistic healing boost, emphasizing Tymora's domain of chance and luck
				if (prob(75)) // High probability to align with "good luck"
					conditional_buff = TRUE
					situational_bonus = rand(1.5, 3)
*/
			if(/datum/patron/neutral/talos)
				target.visible_message(span_info("The storm's fury courses through [target]!"), span_notice("The Storm Lord's wrath fuels my resilience!"))
				// Similar to Abyssor but tied to storms; enhances healing in rainy or stormy conditions


			if(/datum/patron/neutral/elistraee)
				target.visible_message(span_info("A gentle melody surrounds [target], filled with grace and longing."), span_notice("Eilistraee's soothing song fills me with peace!"))

			if(/datum/patron/neutral/yondalla)
				target.visible_message(span_info("A nurturing warmth envelops [target], reminiscent of hearth and home."), span_notice("Yondalla's protective embrace heals my wounds!"))

			if(/datum/patron/neutral/garl)
				target.visible_message(span_info("A spark of humor and mischief dances around [target]."), span_notice("Garl Glittergold's playful magic restores my vigor!"))

			if(/datum/patron/neutral/corellon)
				target.visible_message(span_info("An ethereal radiance shines upon [target], infused with divine artistry."), span_notice("Corellon's grace renews me with inspiration!"))

			if(/datum/patron/neutral/oghma)
				target.visible_message(span_info("A wave of knowledge and understanding flows into [target]."), span_notice("Oghma's wisdom mends my soul and body!"))

			if(/datum/patron/neutral/talona)
				target.visible_message(span_info("A shadow of noxious energy surrounds [target], yet it seems oddly soothing."), span_notice("Talona's touch both poisons and purges, leaving me healed!"))
/*
			if(/datum/patron/neutral/helm)
				target.visible_message(span_info("A steadfast presence manifests around [target], unyielding and protective."), span_notice("Helm's vigilance restores my strength!"))

			if(/datum/patron/neutral/tempus)
				target.visible_message(span_info("A roar of battle echoes around [target], filled with martial vigor."), span_notice("Tempus' martial fury renews my resolve!"))
*/

			if(/datum/patron/forces/baphomet)
				target.visible_message(span_info("A primal roar reverberates through [target], and their eyes flash with savage fury."), span_notice("Baphomet's bestial rage empowers me!"))

			if(/datum/patron/forces/asmodeus)
				target.visible_message(span_info("A crimson glow envelops [target], resonating with the authority of infernal power."), span_notice("Asmodeus' dominion fills me with unstoppable might!"))

			if(/datum/patron/forces/caelthar)
				target.visible_message(span_info("An intense flame blazes around [target], flickering between destruction and creation."), span_notice("Caelthar's infernal balance strengthens my resolve!"))

			if(/datum/patron/forces/titania)
				target.visible_message(span_info("A shimmering, fey light dances around [target], infused with the vitality of the wild."), span_notice("Titania's enchanting power revitalizes me!"))

			if(/datum/patron/forces/oberon)
				target.visible_message(span_info("An ancient, commanding presence surrounds [target], filled with fey authority."), span_notice("Oberon's regal influence sharpens my focus!"))


			else
				target.visible_message(span_info("A choral sound comes from above and [target] is healed!"), span_notice("I am bathed in healing choral hymns!"))

		var/healing = 2.5
		if (conditional_buff)
			to_chat(user, "Channeling my patron's power is easier in these conditions!")
			healing += situational_bonus

		target.apply_status_effect(/datum/status_effect/buff/healing, healing)
		return TRUE
	revert_cast()
	return FALSE

// Miracle
/obj/effect/proc_holder/spell/invoked/heal
	name = "Fortify"
	overlay_state = "astrata"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 4
	warnie = "sydwarning"
	movement_interrupt = FALSE
//	chargedloop = /datum/looping_sound/invokeholy
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/heal.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 20 SECONDS
	miracle = TRUE
	devotion_cost = 20
	cost = 2

/obj/effect/proc_holder/spell/invoked/heal/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.mob_biotypes & MOB_UNDEAD) //positive energy harms the undead
			target.visible_message("<span class='danger'>[target] is burned by holy light!</span>", "<span class='userdanger'>I'm burned by holy light!</span>")
			target.adjustFireLoss(50)
			target.Knockdown(10)
			target.fire_act(1,5)
			return TRUE
		if(HAS_TRAIT(target, TRAIT_ASTRATA_CURSE))
			target.visible_message(span_danger("[target] recoils in pain!"), span_userdanger("Divine healing shuns me!"))
			target.cursed_freak_out()
			return FALSE
		if(HAS_TRAIT(target, TRAIT_ATHEISM_CURSE))
			target.visible_message(span_danger("[target] recoils in disgust!"), span_userdanger("These fools are trying to cure me with religion!!"))
			target.cursed_freak_out()
			return FALSE
		target.visible_message(span_info("A wreath of gentle light passes over [target]!"), span_notice("I'm bathed in holy light!"))
		if(iscarbon(target))
			var/mob/living/carbon/C = target
			C.apply_status_effect(/datum/status_effect/buff/fortify)
		else
			target.adjustBruteLoss(-50)
			target.adjustFireLoss(-50)
		return TRUE
	revert_cast()
	return FALSE
