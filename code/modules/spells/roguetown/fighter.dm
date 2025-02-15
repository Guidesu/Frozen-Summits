// Fighter spells/abilities
// A bard's bread and butter. Maybe jester too?
/obj/effect/proc_holder/spell/self/secondwind
	name = "Second Wind"
	desc = ""
	clothes_req = FALSE
	range = 8
	overlay_state = "heal"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE

	releasedrain = 30
	chargedrain = 1
	chargetime = 3
	charge_max = 30 MINUTES //cooldown

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	antimagic_allowed = FALSE //can you use it if you are antimagicked?
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 1

	xp_gain = FALSE
	miracle = FALSE

	invocation = ""
	invocation_type = "shout" //can be none, whisper, emote and shout

/obj/effect/proc_holder/spell/self/secondwind/cast(mob/user = usr)
	var/mob/living/carbon/M = user
	M.rogfat_add(-100) // Restores fat
	M.rogstam_add(-100) // Restores stamina
	M.adjustBruteLoss(-100) // Heals 100 brute damage
	M.adjustFireLoss(-100) // Heals 100 burn damage
	M.adjustToxLoss(-100) // Reduces toxin damage
	M.adjustOxyLoss(-100) // Reduces oxygen deprivation
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = BLOOD_VOLUME_NORMAL

	user.visible_message("<span class='info'>[user] takes a deep, revitalizing breath!</span>", "<span class='notice'>I take a deep breath, and my vitality returns.</span>")
