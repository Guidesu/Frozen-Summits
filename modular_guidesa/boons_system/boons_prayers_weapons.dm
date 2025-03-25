
// Weapon Subtypes

/datum/prayer/cleric/holy_weapon/martyr
	name = "Paladin's Blessed Sword"
	weapon_path = /obj/item/rogueweapon/sword/long/martyr
	stages = list(
		list("text" = "By the holy light that pierces darkness...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I call upon the sacred forge of battle...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "ARM THE RIGHTEOUS!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/martyr/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] erupts in golden flames!"))



/datum/prayer/cleric/holy_weapon/mace
	name = "Tempus' Duelist Maul"
	weapon_path = /obj/item/rogueweapon/mace/goden/steel/ravox
	stages = list(
		list("text" = "By the clangor of unending war...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I summon the hammer of unyielding valor...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "FORGE THE WARRIOR'S PATH!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/mace/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] appears wreathed in battle aura!"))




/datum/prayer/cleric/holy_weapon/flail
	name = "Kelemvor's Soul Flail"
	weapon_path = /obj/item/rogueweapon/flail/necraflail
	stages = list(
		list("text" = "By the scales of eternal judgment...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I beckon the chain of final reckoning...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "WEIGH THE UNWORTHY SOULS!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/flail/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] materializes with ghostly wails!"))



/datum/prayer/cleric/holy_weapon/dagger
	name = "Selûne's Eclipse Dagger"
	weapon_path = /obj/item/rogueweapon/huntingknife/idagger/steel/holysee
	stages = list(
		list("text" = "By the silver light of moon's embrace...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I draw forth the shard of lunar shadow...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "PIERCE THE VEIL OF NIGHT!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/dagger/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] shimmers with moonlit energy!"))



/datum/prayer/cleric/holy_weapon/sickle
	name = "Talona's Plague Sickle"
	weapon_path = /obj/item/rogueweapon/huntingknife/idagger/steel/pestrasickle
	stages = list(
		list("text" = "By the pus-filled veins of corruption...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I harvest the blight of a thousand poxes...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "REAP THE SICKENED CROPS!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/sickle/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] drips with virulent toxins!"))

/datum/prayer/cleric/holy_weapon/halberd
	name = "Lathander's Dawn Halberd"
	weapon_path = /obj/item/rogueweapon/halberd/holysee
	stages = list(
		list("text" = "By the radiant light of morning's promise...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I raise the spear of dawn's first light...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "CLEAVE THE SHADOWS!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/halberd/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] gleams with divine radiance!"))

/datum/prayer/cleric/holy_weapon/scythe
	name = "Chauntea's Harvest Scythe"
	weapon_path = /obj/item/rogueweapon/halberd/bardiche/scythe
	stages = list(
		list("text" = "By the verdant fields of life's bounty...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I reap the blighted growth for new beginnings...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "SOW THE SEEDS OF RENEWAL!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/scythe/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] hums with the vitality of nature!"))


/datum/prayer/cleric/holy_weapon/katar
	name = "Umberlee's Abyssal Claw"
	weapon_path = /obj/item/rogueweapon/katar/abyssor
	stages = list(
		list("text" = "By the crushing depths of the endless sea...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I summon the talons of the brine queen...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "DRAG THEM TO DAVY JONES!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/katar/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] drips with seawater and kelp!"))

/datum/prayer/cleric/holy_weapon/knuckles
	name = "Sune's Caress"
	weapon_path = /obj/item/rogueweapon/knuckles/eora
	stages = list(
		list("text" = "By the blush of first love's passion...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I mold the gloves of crimson devotion...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "EMBRACE WITH FIERY ARDOR!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/knuckles/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] glows with rosy light!"))

/datum/prayer/cleric/holy_weapon/flamberge
	name = "Moradin's Forgeflame"
	weapon_path = /obj/item/rogueweapon/sword/long/malumflamm
	stages = list(
		list("text" = "By the anvil's eternal song...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I quench the blade in sacred magma...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "IGNITE THE SMITH'S WRATH!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/flamberge/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] bursts into arcane flames!"))


/datum/prayer/cleric/holy_weapon/sword
	name = "Tyr's Solar Judgement"
	weapon_path = /obj/item/rogueweapon/sword/long/exe/astrata
	stages = list(
		list("text" = "By the unblinking eye of celestial law...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I summon the blade of ultimate verdict...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "REND THE GUILTY SOULS!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/sword/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] erupts in blinding sunlight!"))

/datum/prayer/cleric/holy_weapon/khopesh
	name = "Mystra's Lunar Khopesh"
	weapon_path = /obj/item/rogueweapon/sword/sabre/nockhopesh
	stages = list(
		list("text" = "By the weave of arcane eternity...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I etch runes of moonlit sorcery...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "UNLEASH THE TIDES OF MAGIC!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/khopesh/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] shimmers with arcane constellations!"))

/datum/prayer/cleric/holy_weapon/shield
	name = "Helm's Bastion"
	weapon_path = /obj/item/rogueweapon/shield/tower/holysee
	stages = list(
		list("text" = "By the unyielding bulwark of vigilance...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I forge the aegis of eternal watch...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "HOLD THE LINE UNBROKEN!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/shield/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] resonates with an impenetrable hum!"))


// =====================
// SILVER HOLY WEAPON PRAYERS
// =====================
/datum/prayer/cleric/holy_weapon/silver_waraxe
	name = "Silver Waraxe of Moradin"
	weapon_path = /obj/item/rogueweapon/stoneaxe/silver/holy_mace
	stages = list(
		list("text" = "By the argent glow of purified ore...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I shape the bane of unholy flesh...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "CLEAVE THE UNHOLY!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/silver_waraxe/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] gleams with sanctified silver!"))

/datum/prayer/cleric/holy_weapon/silver_mace
	name = "Silver Mace of Ilmater"
	weapon_path = /obj/item/rogueweapon/mace/silver/holy_mace

	stages = list(
		list("text" = "By the tears of the broken martyr...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I forge the cudgel of sacred endurance...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "CRUSH THE OPPRESSOR'S HAND!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/silver_mace/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] rings with sanctified chimes!"))

//---------------------

/datum/prayer/cleric/holy_weapon/silver_dagger
	name = "Silver Dagger of Sune"
	weapon_path = /obj/item/rogueweapon/huntingknife/idagger/silver/holy_dagger

	stages = list(
		list("text" = "By the mirror of perfect beauty...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I hone the edge of celestial grace...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "PIERCE THE VEIL OF UGLINESS!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/silver_dagger/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] shines with prismatic reflections!"))
// =====================

/datum/prayer/cleric/holy_weapon/silver_spear
	name = "Silver Spear of Lathander"
	weapon_path = /obj/item/rogueweapon/spear/psyspear

	stages = list(
		list("text" = "By the dawn's first golden rays...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I temper the lance of new beginnings...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "PIERCE THE NIGHT'S VEIL!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/silver_spear/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] gleams with morning light!"))

/datum/prayer/cleric/holy_weapon/silver_halberd
	name = "Silver Halberd of Helm"
	weapon_path = /obj/item/rogueweapon/halberd/psyhalberd

	stages = list(
		list("text" = "By the ever-watchful sentinel's gaze...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I raise the polearm of vigilant mercy...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "GUARD THE INNOCENT BLOOD!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/silver_halberd/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] glows with argent vigilance!"))

/datum/prayer/cleric/holy_weapon/silver_greatsword
	name = "Silver Greatsword of Tyr"
	weapon_path = /obj/item/rogueweapon/greatsword/psygsword

	stages = list(
		list("text" = "By the balanced scales of cosmic order...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I quench the silvered edge of truth...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "SEVER THE CHAINS OF DECEIT!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/silver_greatsword/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] thrums with juristic power!"))

/datum/prayer/cleric/holy_weapon/silver_sword
	name = "Silver Sword of Mystra"
	weapon_path = /obj/item/rogueweapon/sword/psysword

	stages = list(
		list("text" = "By the infinite tapestry of the weave...", "delay" = 70, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "I channel arcane might through argent steel...", "delay" = 60, "sound" = 'sound/magic/holyshield.ogg'),
		list("text" = "CUT THE KNOTS OF SPELLBINDING!", "delay" = 30, "sound" = 'sound/magic/holyshield.ogg')
	)

/datum/prayer/cleric/holy_weapon/silver_sword/grant_boon(mob/user)
	var/obj/item/W = new weapon_path(get_turf(user))
	user.put_in_hands(W)
	playsound(user, 'sound/magic/revive.ogg', 100, TRUE)
	user.visible_message(span_warning("[W.name] pulses with raw magical energy!"))
