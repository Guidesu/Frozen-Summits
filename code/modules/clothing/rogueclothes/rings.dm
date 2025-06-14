

/obj/item/clothing/ring
	name = "ring"
	desc = ""
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	icon_state = ""
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/armorsmithing
	drop_sound = 'sound/foley/coinphy (1).ogg'

/obj/item/clothing/ringP  /////////////////////// cast focus ring for acolytes and shit.
	parent_type = /obj/item/clothing/neck/roguetown/psicross
	name = "psi ring"
	desc = "a blessed psi ring, for the religious type"
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	icon_state = "castring"
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/ring/lantern
	parent_type = /obj/item/flashlight/flare/torch/lantern // Inherits parents properties from lantern
	name = "alchemist ring"
	icon_state = "lanternR"
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	desc = "flick of the thumb portable flame"
	light_range = 4 // standard torch range
	on = FALSE
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_HIP
	force = 5
	on_damage = 5
	produce_heat = 1500
	heat = 1000
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing
	fuel = 9999 
	sellprice = 30

/obj/item/clothing/ring/lantern/MiddleClick(mob/living/user, params)
	if (!on)
		on = TRUE
		to_chat(user, "<span class='notice'>With a flick of the thumb, you strike a flame.</span>")
	..()

/obj/item/clothing/ring/silver
	name = "silver ring"
	icon_state = "ring_s"
	sellprice = 33

/obj/item/clothing/ring/copper
	name = "copper ring"
	icon_state = "ring_c"
	sellprice = 15

/obj/item/clothing/ring/gold
	name = "gold ring"
	icon_state = "ring_g"
	sellprice = 45
/*
/obj/item/clothing/ring/active
	var/active = FALSE
	desc = "Unfortunately, like most magic rings, it must be used sparingly. (Right-click me to activate)"
	var/cooldowny
	var/cdtime
	var/activetime
	var/activate_sound

/obj/item/clothing/ring/active/attack_right(mob/user)
	if(loc != user)
		return
	if(cooldowny)
		if(world.time < cooldowny + cdtime)
			to_chat(user, span_warning("Nothing happens."))
			return
	user.visible_message(span_warning("[user] twists the [src]!"))
	if(activate_sound)
		playsound(user, activate_sound, 100, FALSE, -1)
	cooldowny = world.time
	addtimer(CALLBACK(src, PROC_REF(demagicify)), activetime)
	active = TRUE
	update_icon()
	activate(user)

/obj/item/clothing/ring/active/proc/activate(mob/user)
	user.update_inv_wear_id()

/obj/item/clothing/ring/active/proc/demagicify()
	active = FALSE
	update_icon()
	if(ismob(loc))
		var/mob/user = loc
		user.visible_message(span_warning("The ring settles down."))
		user.update_inv_wear_id()


/obj/item/clothing/ring/active/nomag
	name = "ring of null magic"
	icon_state = "ruby"
	activate_sound = 'sound/magic/antimagic.ogg'
	cdtime = 10 MINUTES
	activetime = 30 SECONDS
	sellprice = 100

/obj/item/clothing/ring/active/nomag/update_icon()
	..()
	if(active)
		icon_state = "rubyactive"
	else
		icon_state = "ruby"

/obj/item/clothing/ring/active/nomag/activate(mob/user)
	. = ..()
	AddComponent(/datum/component/anti_magic, TRUE, FALSE, FALSE, ITEM_SLOT_RING, INFINITY, FALSE)

/obj/item/clothing/ring/active/nomag/demagicify()
	. = ..()
	var/datum/component/magcom = GetComponent(/datum/component/anti_magic)
	if(magcom)
		magcom.RemoveComponent()
*/
//gold rings
/obj/item/clothing/ring/emerald
	name = "emerald ring"
	icon_state = "g_ring_emerald"
	desc = "A beautiful golden ring with a polished Emerald set into it."
	sellprice = 195

/obj/item/clothing/ring/ruby
	name = "ruby ring"
	icon_state = "g_ring_ruby"
	desc = "A beautiful golden ring with a polished Ruby set into it."
	sellprice = 255

/obj/item/clothing/ring/topaz
	name = "topaz ring"
	icon_state = "g_ring_topaz"
	desc = "A beautiful golden ring with a polished Topaz set into it."
	sellprice = 180

/obj/item/clothing/ring/quartz
	name = "quartz ring"
	icon_state = "g_ring_quartz"
	desc = "A beautiful golden ring with a polished Quartz set into it."
	sellprice = 245

/obj/item/clothing/ring/sapphire
	name = "sapphire ring"
	icon_state = "g_ring_sapphire"
	desc = "A beautiful golden ring with a polished Sapphire set into it."
	sellprice = 200

/obj/item/clothing/ring/diamond
	name = "diamond ring"
	icon_state = "g_ring_diamond"
	desc = "A beautiful golden ring with a polished Diamond set into it."
	sellprice = 270

/obj/item/clothing/ring/signet
	name = "Signet Ring"
	icon_state = "signet"
	desc = "A large golden ring engraved with the Symbol of Ao."
	sellprice = 135

//silver rings
/obj/item/clothing/ring/emeralds
    name = "emerald ring"
    icon_state = "s_ring_emerald"
    sellprice = 155

/obj/item/clothing/ring/rubys
    name = "ruby ring"
    icon_state = "s_ring_ruby"
    sellprice = 215

/obj/item/clothing/ring/topazs
    name = "topaz ring"
    icon_state = "s_ring_topaz"
    sellprice = 140

/obj/item/clothing/ring/quartzs
    name = "quartz ring"
    icon_state = "s_ring_quartz"
    sellprice = 205

/obj/item/clothing/ring/sapphires
    name = "sapphire ring"
    icon_state = "s_ring_sapphire"
    sellprice = 160

/obj/item/clothing/ring/diamonds
    name = "diamond ring"
    icon_state = "s_ring_diamond"
    sellprice = 230

// Copper Rings

/obj/item/clothing/ring/emeraldc
	name = "emerald ring"
	icon_state = "c_ring_emerald"
	sellprice = 110

/obj/item/clothing/ring/rubyc
	name = "ruby ring"
	icon_state = "c_ring_ruby"
	sellprice = 155

/obj/item/clothing/ring/topazc
	name = "topaz ring"
	icon_state = "c_ring_topaz"
	sellprice = 105

/obj/item/clothing/ring/quartzc
	name = "quartz ring"
	icon_state = "c_ring_quartz"
	sellprice = 150

/obj/item/clothing/ring/sapphirec
	name = "sapphire ring"
	icon_state = "c_ring_sapphire"
	sellprice = 115

/obj/item/clothing/ring/diamondc
	name = "diamond ring"
	icon_state = "c_ring_diamond"
	sellprice = 170


// Copper Rings

/obj/item/clothing/ring/emeraldc
	name = "emerald ring"
	icon_state = "c_ring_emerald"
	sellprice = 110

/obj/item/clothing/ring/rubyc
	name = "ruby ring"
	icon_state = "c_ring_ruby"
	sellprice = 155

/obj/item/clothing/ring/topazc
	name = "topaz ring"
	icon_state = "c_ring_topaz"
	sellprice = 105

/obj/item/clothing/ring/quartzc
	name = "quartz ring"
	icon_state = "c_ring_quartz"
	sellprice = 150

/obj/item/clothing/ring/sapphirec
	name = "sapphire ring"
	icon_state = "c_ring_sapphire"
	sellprice = 115

/obj/item/clothing/ring/diamondc
	name = "diamond ring"
	icon_state = "c_ring_diamond"
	sellprice = 170

/*
/obj/item/clothing/ring/dragon_ring
	name = "Dragon Ring"
	icon_state = "dragonring"
	desc = "Carrying the likeness of a dragon, this glorious ring hums with a subtle energy."
	sellprice = 666
	var/active_item

/obj/item/clothing/ring/dragon_ring/equipped(mob/living/user)
	. = ..()
	if(active_item)
		return
	else
		active_item = TRUE
		to_chat(user, span_notice("Here be dragons."))
		user.change_stat("strength", 2)
		user.change_stat("constitution", 2)
		user.change_stat("endurance", 2)
		return

/obj/item/clothing/ring/dragon_ring/dropped(mob/living/user)
	..()
	if(active_item)
		to_chat(user, span_notice("Gone is thy hoard."))
		user.change_stat("strength", -2)
		user.change_stat("constitution", -2)
		user.change_stat("endurance", -2)
		active_item = FALSE
		return */

