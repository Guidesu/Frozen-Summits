// =====================
// PRAYER DATUMS
// =====================
/datum/prayer
	var/name 	= "Divine Request"
	var/desc = "Basic prayer template"
	var/prayer_type = "Generic" // "Cleric" or "Common"
	var/min_length = 20
	var/smite_chance = 100
	var/required_skill
	var/min_skill = 0
	var/admin_alert = TRUE

/datum/prayer/proc/grant_boon(mob/living/carbon/human/user)

/datum/prayer/proc/can_pray(mob/living/carbon/human/user)
	if(required_skill)
		var/skill_level = user.mind?.get_skill_level(required_skill)
		return skill_level >= min_skill
	return TRUE

/datum/prayer/proc/handle_prayer(mob/living/carbon/human/user, prayer_text)
	if(admin_alert)
		var/admin_msg = span_adminnotice("<b>GM NOTE:</b> [key_name(user)] [ADMIN_FLW(user)][ADMIN_SM(user)] (IC: [user.real_name]) prays for [name]:\n[prayer_text]")
		message_admins(admin_msg)

	user.say("[prayer_text]")

	if(length(prayer_text) < min_length)
		if(smite_chance > 0 && prob(smite_chance))
			user.adjustBruteLoss(75)
			to_chat(user, span_userdanger("Divine wrath strikes you for your insolence!"))
		return FALSE

	playsound(user, 'sound/magic/revive.ogg', 75, TRUE)

	return TRUE
// =====================
// CLERIC PRAYERS
// =====================
/datum/prayer/cleric
	prayer_type = "Cleric"
	required_skill = /datum/skill/magic/holy
	min_skill = 2
	smite_chance = 100

/datum/prayer/cleric/holy_weapon
	name = "Consecrated Armament"
	min_length = 100
	var/weapon_path

/datum/prayer/cleric/holy_weapon/handle_prayer(mob/user, prayer_text)
	. = ..()
	if(!.) return
	
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	to_chat(user, span_notice("[W.name] materializes in your hands!"))




// Weapon Subtypes

/datum/prayer/cleric/holy_weapon/martyr
	name = "Paladin's Blessed Sword"
	weapon_path = /obj/item/rogueweapon/sword/long/martyr

/datum/prayer/cleric/holy_weapon/mace
	name = "Tempus' Duelist Maul"
	weapon_path = /obj/item/rogueweapon/mace/goden/steel/ravox

/datum/prayer/cleric/holy_weapon/flail
	name = "Kelemvor's Soul Flail"
	weapon_path = /obj/item/rogueweapon/flail/necraflail

/datum/prayer/cleric/holy_weapon/dagger
	name = "Selûne's Eclipse Dagger"
	weapon_path = /obj/item/rogueweapon/huntingknife/idagger/steel/holysee

/datum/prayer/cleric/holy_weapon/sickle
	name = "Talona's Plague Sickle"
	weapon_path = /obj/item/rogueweapon/huntingknife/idagger/steel/pestrasickle

/datum/prayer/cleric/holy_weapon/halberd
	name = "Lathander's Dawn Halberd"
	weapon_path = /obj/item/rogueweapon/halberd/holysee

/datum/prayer/cleric/holy_weapon/scythe
	name = "Chauntea's Harvest Scythe"
	weapon_path = /obj/item/rogueweapon/halberd/bardiche/scythe

/datum/prayer/cleric/holy_weapon/katar
	name = "Umberlee's Abyssal Claw"
	weapon_path = /obj/item/rogueweapon/katar/abyssor

/datum/prayer/cleric/holy_weapon/knuckles
	name = "Sune's Caress"
	weapon_path = /obj/item/rogueweapon/knuckles/eora

/datum/prayer/cleric/holy_weapon/flamberge
	name = "Moradin's Forgeflame"
	weapon_path = /obj/item/rogueweapon/sword/long/malumflamm

/datum/prayer/cleric/holy_weapon/sword
	name = "Tyr's Solar Judgement"
	weapon_path = /obj/item/rogueweapon/sword/long/exe/astrata

/datum/prayer/cleric/holy_weapon/khopesh
	name = "Mystra's Lunar Khopesh"
	weapon_path = /obj/item/rogueweapon/sword/sabre/nockhopesh

/datum/prayer/cleric/holy_weapon/shield
	name = "Helm's Bastion"
	weapon_path = /obj/item/rogueweapon/shield/tower/holysee


// =====================
// SILVER HOLY WEAPON PRAYERS
// =====================
/datum/prayer/cleric/holy_weapon/silver_waraxe
	name = "Silver Waraxe of Moradin"
	weapon_path = /obj/item/rogueweapon/stoneaxe/silver/holy_mace
	min_length = 100

/datum/prayer/cleric/holy_weapon/silver_mace
	name = "Silver Mace of Ilmater"
	weapon_path = /obj/item/rogueweapon/mace/silver/holy_mace
	min_length = 100

/datum/prayer/cleric/holy_weapon/silver_dagger
	name = "Silver Dagger of Sune"
	weapon_path = /obj/item/rogueweapon/huntingknife/idagger/silver/holy_dagger
	min_length = 100

/datum/prayer/cleric/holy_weapon/silver_spear
	name = "Silver Spear of Lathander"
	weapon_path = /obj/item/rogueweapon/spear/psyspear
	min_length = 100

/datum/prayer/cleric/holy_weapon/silver_halberd
	name = "Silver Halberd of Helm"
	weapon_path = /obj/item/rogueweapon/halberd/psyhalberd
	min_length = 100

/datum/prayer/cleric/holy_weapon/silver_greatsword
	name = "Silver Greatsword of Tyr"
	weapon_path = /obj/item/rogueweapon/greatsword/psygsword
	min_length = 100

/datum/prayer/cleric/holy_weapon/silver_sword
	name = "Silver Sword of Mystra"
	weapon_path = /obj/item/rogueweapon/sword/psysword
	min_length = 100

// =====================
// COMMON PRAYERS
// =====================
/datum/prayer/common
	prayer_type = "Common"
	var/success_base = 20

/datum/prayer/common/handle_prayer(mob/user, prayer_text)
	. = ..()
	if(!.) return
	
	var/success_mod = min((length(prayer_text) - min_length) * 0.5, 50)
	if(prob(success_base + success_mod))
		grant_boon(user)
	else
		to_chat(user, span_warning("Your prayer goes unanswered."))

/datum/prayer/common/sustenance
	name = "Basic Sustenance"
	min_length = 20
	success_base = 40

/datum/prayer/common/sustenance/grant_boon(mob/user)
	var/obj/item/reagent_containers/food/snacks/rogue/bread/W = new(get_turf(user))
	user.put_in_hands(W)
	to_chat(user, span_notice("A simple meal appears before you."))

// =====================
// CLERIC PRAYERS (RITUAL-STYLE FIX)
// =====================
/datum/prayer/cleric/guidance
	name = "Guidance of the Divine"
	desc = "Bestows mental clarity upon nearby faithful."
	min_length = 70
	smite_chance = 25

/datum/prayer/cleric/guidance/handle_prayer(mob/user, prayer_text)
	if(!..()) // Parent check first
		return FALSE
	
	var/turf/source_turf = get_turf(user)
	playsound(source_turf, 'sound/magic/holyshield.ogg', 100, TRUE)
	
	for(var/mob/living/carbon/human/target in view(7, source_turf))
		if(target.stat == CONSCIOUS)
			target.apply_status_effect(/datum/status_effect/buff/guidance)
			to_chat(target, span_cultsmall("Divine guidance illuminates my mind!"))
	
	return TRUE

/datum/prayer/cleric/fortitude
	name = "Fortitude of the Martyr"
	desc = "Grants physical resilience to nearby followers."
	min_length = 80
	smite_chance = 30

/datum/prayer/cleric/fortitude/handle_prayer(mob/user, prayer_text)
	if(!..())
		return FALSE
	
	var/turf/source_turf = get_turf(user)

	
	for(var/mob/living/carbon/human/target in view(7, source_turf))
		if(target.stat == CONSCIOUS)
			target.apply_status_effect(/datum/status_effect/buff/fortitude)
			to_chat(target, span_cultsmall("Holy endurance fortifies my body!"))
	
	return TRUE

/datum/prayer/cleric/thought_guidance
	name = "Communion of Minds"
	desc = "Links the thoughts of nearby faithful."
	min_length = 90
	smite_chance = 40
	required_skill = /datum/skill/magic/holy
	min_skill = 3

/datum/prayer/cleric/thought_guidance/handle_prayer(mob/user, prayer_text)
	if(!..())
		return FALSE
	
	var/turf/source_turf = get_turf(user)
	playsound(source_turf, 'sound/magic/holyshield.ogg', 100, TRUE)

	for(var/mob/living/carbon/human/target in view(7, source_turf))
		if(target.stat == CONSCIOUS)
			target.apply_status_effect(/datum/status_effect/buff/thought_guidance5e)
			to_chat(target, span_cultsmall("The divine chorus resonates within my mind!"))
	
	return TRUE

// =====================
// PRAYER SYSTEM CORE
// =====================
var/global/list/all_prayers = list(
	"Cleric" = list(
		new /datum/prayer/cleric/thought_guidance(),
		new /datum/prayer/cleric/guidance(),
		new /datum/prayer/cleric/fortitude()
	),
	"Clerical Weapon" = list(
		new /datum/prayer/cleric/holy_weapon/martyr(),
		new /datum/prayer/cleric/holy_weapon/mace(),
		new /datum/prayer/cleric/holy_weapon/flail(),
		new /datum/prayer/cleric/holy_weapon/dagger(),
		new /datum/prayer/cleric/holy_weapon/sickle(),
		new /datum/prayer/cleric/holy_weapon/halberd(),
		new /datum/prayer/cleric/holy_weapon/scythe(),
		new /datum/prayer/cleric/holy_weapon/katar(),
		new /datum/prayer/cleric/holy_weapon/knuckles(),
		new /datum/prayer/cleric/holy_weapon/flamberge(),
		new /datum/prayer/cleric/holy_weapon/sword(),
		new /datum/prayer/cleric/holy_weapon/khopesh(),
		new /datum/prayer/cleric/holy_weapon/shield(),
		new /datum/prayer/cleric/holy_weapon/silver_waraxe(),
		new /datum/prayer/cleric/holy_weapon/silver_mace(),
		new /datum/prayer/cleric/holy_weapon/silver_dagger(),
		new /datum/prayer/cleric/holy_weapon/silver_spear(),
		new /datum/prayer/cleric/holy_weapon/silver_halberd(),
		new /datum/prayer/cleric/holy_weapon/silver_greatsword(),
		new /datum/prayer/cleric/holy_weapon/silver_sword()
	),
	"Common" = list(
		new /datum/prayer/common/sustenance()
	)
)

/mob/living/carbon/human/verb/pray_boon()
	set name = "Pray for Boon"
	set category = "IC"
	set desc = "Seek divine intervention"

	var/choice = input(src, "Choose Prayer Type", "Divine Intervention") as null|anything in list("Prayer of the Faithful", "Prayer of the Commoner", "Prayer of Armaments", "Cancel")
	if(!choice || choice == "Cancel")
		return
	
	var/list/prayer_list
	switch(choice)
		if("Prayer of the Faithful")
			prayer_list = all_prayers["Cleric"]
		if("Prayer of the Commoner")
			prayer_list = all_prayers["Common"]
		if("Prayer of Armaments")
			prayer_list = all_prayers["Clerical Weapon"]
	
	var/list/available_prayers = list()
	for(var/datum/prayer/P in prayer_list)
		if(P.can_pray(src))
			available_prayers += P.name
	
	var/prayer_name = input(src, "Select Specific Prayer", choice) as null|anything in available_prayers
	if(!prayer_name)
		return
	
	var/datum/prayer/selected_prayer
	for(var/datum/prayer/P in prayer_list)
		if(P.name == prayer_name)
			selected_prayer = P
			break
	
	var/prayer_text = sanitize(input(src, "Compose Your Prayer (Min [selected_prayer.min_length] chars)", "[selected_prayer.name]") as message|null)
	selected_prayer.handle_prayer(src, prayer_text)
