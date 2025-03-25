/datum/prayer/cleric/guidance
	name = "Guidance of the Divine"
	desc = "Bestows mental clarity upon nearby faithful."
	stages = list(
		list("text" = "Oh wise arbiters of celestial truth...", "delay" = 50, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "Illuminate the minds of your servants...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "GRANT US GUIDANCE!", "delay" = 40, "sound" = 'sound/magic/holyshield.ogg')
	)
	required_skill = /datum/skill/magic/holy
	min_skill = 2

/datum/prayer/cleric/guidance/grant_boon(mob/user)
	var/turf/source_turf = get_turf(user)
	playsound(source_turf, 'sound/magic/revive.ogg', 100, TRUE)
	
	for(var/mob/living/carbon/human/target in view(7, source_turf))
		if(target.stat == CONSCIOUS)
			target.apply_status_effect(/datum/status_effect/buff/guidance)
			to_chat(target, span_cultsmall("Divine guidance illuminates my mind!"))

/datum/prayer/cleric/fortitude
	name = "Fortitude of the Martyr"
	desc = "Grants physical resilience to nearby followers."
	stages = list(
		list("text" = "By the unbroken spirit of the sanctified...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "Temper our flesh in holy crucible...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "ENDOW US WITH STRENGTH!", "delay" = 50, "sound" = 'sound/magic/holyshield.ogg')
	)
	required_skill = /datum/skill/magic/holy
	min_skill = 2

/datum/prayer/cleric/fortitude/grant_boon(mob/user)
	var/turf/source_turf = get_turf(user)
	playsound(source_turf, 'sound/magic/revive.ogg', 100, TRUE)


	for(var/mob/living/carbon/human/target in view(7, source_turf))
		if(target.stat == CONSCIOUS)
			target.apply_status_effect(/datum/status_effect/buff/fortitude5e)
			to_chat(target, span_cultsmall("Holy endurance fortifies my body!"))

/datum/prayer/cleric/thought_guidance
	name = "Communion of Minds"
	desc = "Links the thoughts of nearby faithful."
	stages = list(
		list("text" = "By the chorus of a thousand psalms...", "delay" = 80, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "Weave our mind with divine guidance...", "delay" = 90, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "COME FORTH, GUIDANCE!", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg')
	)
	required_skill = /datum/skill/magic/holy
	min_skill = 2

/datum/prayer/cleric/thought_guidance/grant_boon(mob/user)
	var/turf/source_turf = get_turf(user)
	playsound(source_turf, 'sound/magic/revive.ogg', 100, TRUE)

	for(var/mob/living/carbon/human/target in view(7, source_turf))
		if(target.stat == CONSCIOUS)
			target.apply_status_effect(/datum/status_effect/buff/thought_guidance5e)
			to_chat(target, span_cultsmall("The divine chorus resonates within my mind!"))



/datum/prayer/cleric/guiding_light
	name = "Guiding Light's Radiance"
	desc = "Blesses allies with enhanced perception to pierce deception and darkness."
	stages = list(
		list("text" = "Oh lantern in the eternal night...", "delay" = 50, "sound" = 'sound/combat/hits/burn (1).ogg'),
		list("text" = "Let your glow reveal hidden truths...", "delay" = 60, "sound" = 'sound/combat/hits/burn (1).ogg'),
		list("text" = "SHOW US THE PATH!", "delay" = 40, "sound" = 'sound/combat/hits/burn (1).ogg')
	)
	required_skill = /datum/skill/magic/holy
	min_skill = 2

/datum/prayer/cleric/guiding_light/grant_boon(mob/user)
	var/turf/source_turf = get_turf(user)
	playsound(source_turf, 'sound/magic/revive.ogg', 100, TRUE)
	
	for(var/mob/living/carbon/human/target in view(7, source_turf))
		if(target.stat == CONSCIOUS)
			target.apply_status_effect(/datum/status_effect/buff/guidinglight)
			to_chat(target, span_cultsmall("My vision pierces through deception like radiant starlight!"))

/datum/prayer/cleric/moonlit_dance
	name = "Moonlit Intellect"
	desc = "Grants supernatural intellect under lunar auspices."
	stages = list(
		list("text" = "Silver Lady of shifting phases...", "delay" = 40, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "Bless our steps with celestial grace...", "delay" = 55, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "MAKE OUR MIND SHARPER!", "delay" = 35, "sound" = 'sound/magic/holyshield.ogg')
	)
	required_skill = /datum/skill/magic/holy
	min_skill = 2

/datum/prayer/cleric/moonlit_dance/grant_boon(mob/user)
	var/turf/source_turf = get_turf(user)
	playsound(source_turf, 'sound/magic/revive.ogg', 80, TRUE)
	
	for(var/mob/living/carbon/human/target in view(5, source_turf))
		if(target.stat == CONSCIOUS)
			target.apply_status_effect(/datum/status_effect/buff/moonlightdance)
			to_chat(target, span_cultsmall("I feel smarter and my eyes sharper!"))

/datum/prayer/cleric/wolf_instinct
	name = "Lesser Wolf's Instinct"
	desc = "Awakens primal hunting senses in allies."
	stages = list(
		list("text" = "Great Predator of frozen wastes...", "delay" = 60, "sound" = 'sound/vo/mobs/vw/idle (1).ogg'),
		list("text" = "Sharpen our senses to blood's song...", "delay" = 45, "sound" = 'sound/vo/mobs/vw/idle (1).ogg'),
		list("text" = "MAKE US HUNTERS!", "delay" = 30, "sound" = 'sound/vo/mobs/vw/bark (1).ogg')
	)
	required_skill = /datum/skill/magic/holy
	min_skill = 2

/datum/prayer/cleric/wolf_instinct/grant_boon(mob/user)
	var/turf/source_turf = get_turf(user)
	playsound(source_turf, 'sound/vo/mobs/wwolf/howl (2).ogg', 120, TRUE)
	
	for(var/mob/living/carbon/human/target in view(7, source_turf))
		if(target.stat == CONSCIOUS)
			target.apply_status_effect(/datum/status_effect/buff/lesserwolf)
			to_chat(target, span_cultsmall("My legs move faster in the hunt, and my teeths sharper!"))



/datum/prayer/cleric/consecrated_tome
	name = "Call of the Sacred Word"
	desc = "Summons a consecrated tome to record divine revelations."
	min_length = 30
	stages = list(
		list("text" = "By the quill of Deneir and the light of Lathander...", "delay" = 50, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "Grant your servant a vessel for holy wisdom...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "MANIFEST THE SACRED TOME!", "delay" = 40, "sound" = 'sound/magic/holyshield.ogg')
	)
	required_skill = /datum/skill/magic/holy
	min_skill = 1

/datum/prayer/cleric/consecrated_tome/grant_boon(mob/user)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	var/obj/item/book/granter/prayerbook/W = new(get_turf(user))
	user.put_in_hands(W)
	user.visible_message(span_notice("A glowing tome materializes in a shower of golden light!"))
	to_chat(user, span_alert("The cover bears your deity's holy symbol - a sacred charge to record divine truths."))
