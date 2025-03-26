/obj/effect/proc_holder/spell/targeted/woundlick
	action_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Soothing Lick"
	overlay_state = "rune2"
	range = 1
	sound = 'sound/misc/mat/guymouth (1).ogg'
	charge_max = 10 SECONDS
	miracle = FALSE
	devotion_cost = 0

/obj/effect/proc_holder/spell/targeted/woundlick/cast(list/targets, mob/user)
	if(iscarbon(targets[1]))
		var/mob/living/carbon/target = targets[1]
		if(!do_after(user, 3 SECONDS, target = target))  // Shorter, friendlier interaction
			return
		
		// Apply healing reagents
		target.reagents.add_reagent(/datum/reagent/medicine/healthpot, 15)
		target.reagents.add_reagent(/datum/reagent/medicine/stimu, 10)
		target.reagents.add_reagent(/datum/reagent/water, 5)
		
		// Friendly messages
		target.visible_message(
			span_green("[user] gently licks [target]'s wounds with a healing touch!"),
			span_nicegreen("A warm, soothing sensation spreads through your wounds as [user] tends to them!")
		)
		
		// Minor healing effect
		target.adjustBruteLoss(-5)
		target.adjustFireLoss(-5)
