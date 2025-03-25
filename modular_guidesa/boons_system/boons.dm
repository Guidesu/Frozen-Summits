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
	var/list/stages = list() // List of lists: "text", "delay", "sound"
	var/required_patron // Associated deity (e.g., /datum/patron/divine/astrata)
	var/cooldown_type = /datum/status_effect/debuff/ritesexpended
	var/active_icon // Visual effect icon (optional)
	var/fail_smite = TRUE // Whether to smite on interruption


/datum/prayer/proc/perform_ritual(mob/living/carbon/human/user)
	if(!can_perform(user))
		return FALSE
	
	user.visible_message(span_warning("[user] begins a ritual invocation!"))
	
	// Execute each stage
	for(var/list/stage in stages)
		if(!do_after(user, stage["delay"], target = user))
			if(fail_smite)
				user.adjustBruteLoss(50)
				to_chat(user, span_userdanger("The divine recoil punishes your lapse in focus!"))
			return FALSE
		
		user.say(stage["text"])
		if(stage["sound"])
			playsound(user, stage["sound"], 75, TRUE)

	// Final success effects
	grant_boon(user)
	user.apply_status_effect(cooldown_type)
	return TRUE

/datum/prayer/proc/can_perform(mob/living/carbon/human/user)
	if(user.has_status_effect(cooldown_type))
		to_chat(user, span_warning("You are too spiritually exhausted to perform another ritual."))
		return FALSE
	if(required_patron && (user.patron?.type != required_patron))
		to_chat(user, span_warning("You lack the divine connection for this ritual."))
		return FALSE
	if(required_skill && user.mind.get_skill_level(required_skill) < min_skill)
		to_chat(user, span_warning("Your [required_skill] is insufficient."))
		return FALSE
	return TRUE

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
	min_length = 20
	var/weapon_path

// =====================
// COMMON PRAYERS
// =====================
/datum/prayer/common
	prayer_type = "Common"
	var/success_base = 20

// =====================
// CLERIC PRAYERS (RITUAL-STYLE FIX)
// =====================
// =====================
// PRAYER SYSTEM CORE
// =====================
var/global/list/all_prayers = list(
	"Cleric" = list(
		new /datum/prayer/cleric/consecrated_tome(),
		new /datum/prayer/cleric/thought_guidance(),
		new /datum/prayer/cleric/guidance(),
		new /datum/prayer/cleric/fortitude(),
		new /datum/prayer/cleric/wolf_instinct(),
		new /datum/prayer/cleric/moonlit_dance(),
		new /datum/prayer/cleric/guiding_light(),
		new /datum/prayer/cleric/forest_armaments(),

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

	if(selected_prayer.perform_ritual(src))
		to_chat(src, span_notice("The ritual completes with a resonant hum."))
	else
		to_chat(src, span_warning("The ritual fails."))
