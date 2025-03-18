/datum/mind
	var/last_spell_refund = 0
	var/refund_cooldown = 20 SECONDS

/mob/living/carbon/human/verb/refund_spell()
	set name = "Refund Spell"
	set category = "IC"
	set desc = "Unlearn a spell and regain its cost (20s cooldown)"
	
	var/mob/M = usr
	if(!M.mind)
		return
	
	// WHITELISTED SPELLS - Add/remove types here
	var/static/list/refundable_spells = list(
		/obj/effect/proc_holder/spell/invoked/projectile/fireball,
		/obj/effect/proc_holder/spell/invoked/projectile/lightningbolt,
		/obj/effect/proc_holder/spell/invoked/projectile/spitfire,
		/obj/effect/proc_holder/spell/invoked/arcyne_storm,
		/obj/effect/proc_holder/spell/invoked/meteor_storm,
		/obj/effect/proc_holder/spell/invoked/projectile/acidsplash5e,
		/obj/effect/proc_holder/spell/invoked/projectile/firebolt5e,
		/obj/effect/proc_holder/spell/invoked/projectile/rayoffrost5e,
		/obj/effect/proc_holder/spell/invoked/snap_freeze,
		/obj/effect/proc_holder/spell/invoked/projectile/frostbolt,
		/obj/effect/proc_holder/spell/invoked/projectile/arcynebolt,
		/obj/effect/proc_holder/spell/invoked/sundering_lightning,
		/obj/effect/proc_holder/spell/invoked/blade_burst,
		/obj/effect/proc_holder/spell/invoked/boomingblade5e,
		/obj/effect/proc_holder/spell/invoked/greenflameblade5e,
		/obj/effect/proc_holder/spell/invoked/forcewall_weak,
		/obj/effect/proc_holder/spell/self/bladeward5e,
		/obj/effect/proc_holder/spell/invoked/counterspell,
		/obj/effect/proc_holder/spell/targeted/touch/nondetection,
		/obj/effect/proc_holder/spell/invoked/enlarge,
		/obj/effect/proc_holder/spell/invoked/featherfall,
		/obj/effect/proc_holder/spell/invoked/mending5e,
		/obj/effect/proc_holder/spell/invoked/haste,
		/obj/effect/proc_holder/spell/invoked/longstrider,
		/obj/effect/proc_holder/spell/invoked/gravity,
		/obj/effect/proc_holder/spell/targeted/touch/lesserknock,
		/obj/effect/proc_holder/spell/invoked/leap,
		/obj/effect/proc_holder/spell/self/goodberry,
		/obj/effect/proc_holder/spell/invoked/curewounds5e,
		/obj/effect/proc_holder/spell/invoked/guidance,
		/obj/effect/proc_holder/spell/invoked/fortitude,
		/obj/effect/proc_holder/spell/invoked/lesser_heal,
		/obj/effect/proc_holder/spell/invoked/diagnose,
		/obj/effect/proc_holder/spell/invoked/attach_bodypart,
		/obj/effect/proc_holder/spell/invoked/cure_rot,
		/obj/effect/proc_holder/spell/invoked/revive,
		/obj/effect/proc_holder/spell/invoked/heal,
		/obj/effect/proc_holder/spell/invoked/abyssheal,
		/obj/effect/proc_holder/spell/invoked/appraise,
		/obj/effect/proc_holder/spell/invoked/transact,
		/obj/effect/proc_holder/spell/invoked/equalize,
		/obj/effect/proc_holder/spell/invoked/churnwealthy,
		/obj/effect/proc_holder/spell/targeted/blesscrop,
		/obj/effect/proc_holder/spell/targeted/beasttame,
		/obj/effect/proc_holder/spell/targeted/conjure_glowshroom,
		/obj/effect/proc_holder/spell/self/howl/call_of_the_moon,
		/obj/effect/proc_holder/spell/invoked/projectile/purify,
		/obj/effect/proc_holder/spell/invoked/abyssor_bends,
		/obj/effect/proc_holder/spell/invoked/call_mossback,
		/obj/effect/proc_holder/spell/invoked/icebind,
		/obj/effect/proc_holder/spell/targeted/beasttame,
		/obj/effect/proc_holder/spell/invoked/shepherd,
		/obj/effect/proc_holder/spell/invoked/invisibility/miracle,
		/obj/effect/proc_holder/spell/invoked/blindness/miracle,
		/obj/effect/proc_holder/spell/invoked/bud,
		/obj/effect/proc_holder/spell/invoked/eoracurse,
		/obj/effect/proc_holder/spell/invoked/sacred_flame_rogue,
		/obj/effect/proc_holder/spell/invoked/shepherd,
		/obj/effect/proc_holder/spell/invoked/avert,
		/obj/effect/proc_holder/spell/targeted/abrogation,
		/obj/effect/proc_holder/spell/targeted/soulspeak,
		/obj/effect/proc_holder/spell/invoked/wheel,
		/obj/effect/proc_holder/spell/invoked/mockery,
		/obj/effect/proc_holder/spell/invoked/malum_flame_rogue,
		/obj/effect/proc_holder/spell/invoked/vigorousexchange,
		/obj/effect/proc_holder/spell/invoked/heatmetal,
		/obj/effect/proc_holder/spell/invoked/craftercovenant,
		/obj/effect/proc_holder/spell/invoked/hammerfall,
		/obj/effect/proc_holder/spell/targeted/churn,
		/obj/effect/proc_holder/spell/invoked/burden,
		/obj/effect/proc_holder/spell/invoked/projectile/fetch,
		/obj/effect/proc_holder/spell/aoe_turf/conjure/createbonfire5e,
		/obj/effect/proc_holder/spell/targeted/touch/summonrogueweapon/bladeofpsydon,
		/obj/effect/proc_holder/spell/invoked/findfamiliar,
		/obj/effect/proc_holder/spell/targeted/summonweapon,
		/obj/effect/proc_holder/spell/invoked/infestation5e,
		/obj/effect/proc_holder/spell/invoked/poisonspray5e,
		/obj/effect/proc_holder/spell/invoked/invisibility,
		/obj/effect/proc_holder/spell/self/message,
		/obj/effect/proc_holder/spell/self/light5e,
		/obj/effect/proc_holder/spell/invoked/appraise,
		/obj/effect/proc_holder/spell/invoked/decompose5e,
		/obj/effect/proc_holder/spell/invoked/blindness,
		/obj/effect/proc_holder/spell/invoked/rituos,
		/obj/effect/proc_holder/spell/invoked/raise_lesser_undead,
		/obj/effect/proc_holder/spell/invoked/projectile/profane,
		/obj/effect/proc_holder/spell/invoked/slowdown_spell_aoe,
		/obj/effect/proc_holder/spell/invoked/push_spell,
		/obj/effect/proc_holder/spell/targeted/lightninglure5e,
		/obj/effect/proc_holder/spell/targeted/encodethoughts5e,
		/obj/effect/proc_holder/spell/targeted/touch/darkvision,
		/obj/effect/proc_holder/spell/targeted/touch/prestidigitation,
		/obj/effect/proc_holder/spell/targeted/touch/orison,
	)
	
	// Cooldown check
	if(world.time < M.mind.last_spell_refund + 20 SECONDS)
		to_chat(M, span_warning("You must wait [round((M.mind.last_spell_refund + 20 SECONDS - world.time)/10)] seconds before refunding another spell!"))
		return

	// Get known spells that are in whitelist
	var/list/valid_spells = list()
	for(var/obj/effect/proc_holder/spell/S in M.mind.spell_list)
		if(S.type in refundable_spells)
			valid_spells[S.name] = S

	if(!valid_spells.len)
		to_chat(M, span_notice("No refundable spells available!"))
		return

	// Spell selection
	var/chosen_spell = input(M, "Choose a spell to refund", "Spell Refund") as null|anything in valid_spells
	if(!chosen_spell)
		return

	var/obj/effect/proc_holder/spell/selected = valid_spells[chosen_spell]
	
	// Confirmation
	if(alert(M, "Refund [selected.name] and regain [selected.cost] spell points?", "Confirm Refund", "Yes", "No") != "Yes")
		return

	// Perform refund
	M.mind.used_spell_points = max(0, M.mind.used_spell_points - selected.cost)
	M.mind.spell_list -= selected
	qdel(selected)
	
	// Apply cooldown
	M.mind.last_spell_refund = world.time
	
	to_chat(M, span_notice("Unlearned [chosen_spell] and regained [selected.cost] spell points."))
