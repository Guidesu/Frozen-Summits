/datum/intent/axe/chop/scythe
	reach = 2

/datum/intent/spear/cut/bardiche/scythe
	reach = 2

/datum/intent/sword/chop/falx
	penfactor = 40


/obj/item
	var/toggle_state = null

/obj/item/rogueweapon/mace/goden/steel/ravox
	name = "Tempus' duelist maul"
	desc = "Engraved with Tempus' war hymns, this maul settles disputes through honorable combat. 'Battle reveals truth' echoes in its strikes."
	icon_state = "ravoxhammer"
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)

/obj/item/rogueweapon/flail/necraflail
	name = "Kelemvor's soul flail"
	desc = "Each tooth represents a soul judged by Kelemvor. The flail's rattle warns of mortality's inevitability."
	icon_state = "necraflail"

/obj/item/rogueweapon/whip/xylix
	name = "cackle lash"
	desc = "The chimes of this whip are said to sound as the trickster's laughter itself."
	icon_state = "xylixwhip"
	force = 24

/obj/item/rogueweapon/huntingknife/idagger/steel/holysee
	name = "Selûne's eclipse dagger"
	desc = "Forged during a celestial alignment, its silver-gold blade channels both Selûne's moonlight and Lathander's dawn."
	force = 25
	max_integrity = 200
	icon_state = "gsdagger"


/obj/item/rogueweapon/huntingknife/idagger/steel/pestrasickle
	name = "Talona's Ppague sickle"
	desc = "The Mistress of Poison's blessing turns its edge septic. Harvests rot as easily as crops."
	icon_state = "pestrasickle"
	max_integrity = 200

/obj/item/rogueweapon/halberd/holysee
	name = "Lathander's dawn halberd"
	desc = "This gilded polearm glows with the Sun Lord's unwavering light, burning away shadowy corruption."
	icon_state = "gsspear"
	force = 20
	force_wielded = 35

/obj/item/rogueweapon/halberd/bardiche/scythe
	name = "Chauntea's Scythe"
	desc = "The Earth Mother's blessing strengthens its curve - made to reap blighted growth for new life."
	icon_state = "dendorscythe"
	gripped_intents = list(/datum/intent/spear/thrust/eaglebeak, /datum/intent/spear/cut/bardiche/scythe, /datum/intent/axe/chop/scythe, SPEAR_BASH)


/obj/item/rogueweapon/katar/abyssor
	name = "Umberlee's Abyssal Claw"
	desc = "A gift from the Bitch Queen, its salt-crusted edge drags victims to watery depths."
	icon_state = "abyssorclaw"
	force = 20


/obj/item/rogueweapon/knuckles // no actual sprite for this yet so its just the basis for the eora knuckles + for later futureproofing
	name = "iron knuckles"
	desc = "A mean looking pair of iron knuckles."
	force = 15
	possible_item_intents = list(/datum/intent/knuckles/strike,/datum/intent/knuckles/smash)
	icon = 'icons/roguetown/weapons/32.dmi'
	gripsprite = FALSE
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_SMALL
	parrysound = list('sound/combat/parry/pugilism/unarmparry (1).ogg','sound/combat/parry/pugilism/unarmparry (2).ogg','sound/combat/parry/pugilism/unarmparry (3).ogg')
	max_blade_int = 150
	max_integrity = 300
	swingsound = list('sound/combat/wooshes/punch/punchwoosh (1).ogg','sound/combat/wooshes/punch/punchwoosh (2).ogg','sound/combat/wooshes/punch/punchwoosh (3).ogg')
	associated_skill = /datum/skill/combat/unarmed
	throwforce = 12
	wdefense = 4
	wbalance = 1
	blade_dulling = DULLING_BASHCHOP
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/steel

/obj/item/rogueweapon/knuckles/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.2,"sx" = -7,"sy" = -4,"nx" = 7,"ny" = -4,"wx" = -3,"wy" = -4,"ex" = 1,"ey" = -4,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 110,"sturn" = -110,"wturn" = -110,"eturn" = 110,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.1,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/datum/intent/knuckles
	clickcd = 8

/datum/intent/knuckles/strike
	name = "punch"
	blade_class = BCLASS_BLUNT
	attack_verb = list("punches", "clocks")
	hitsound = list('sound/combat/hits/punch/punch_hard (1).ogg', 'sound/combat/hits/punch/punch_hard (2).ogg', 'sound/combat/hits/punch/punch_hard (3).ogg')
	chargetime = 0
	penfactor = 15
	swingdelay = 0
	icon_state = "inpunch"
	item_d_type = "blunt"


/datum/intent/knuckles/smash
	name = "smash"
	blade_class = BCLASS_SMASH
	attack_verb = list("smashes")
	hitsound = list('sound/combat/hits/punch/punch_hard (1).ogg', 'sound/combat/hits/punch/punch_hard (2).ogg', 'sound/combat/hits/punch/punch_hard (3).ogg')
	penfactor = 40
	damfactor = 1.1
	swingdelay = 6
	icon_state = "insmash"
	item_d_type = "blunt"


/obj/item/rogueweapon/knuckles/eora
	name = "Sune's caress"
	desc = "Some times call for a more intimate approach."
	force = 20
	icon_state = "eoraknuckle"

/obj/item/rogueweapon/sword/long/malumflamm
	name = "Moradin's flamberge"
	desc = "This sword's creation took a riddle in its own making. A great sacrifice for perfect quality."
	icon_state = "malumflamberge"
	max_integrity = 200 

/obj/item/rogueweapon/sword/long/exe/astrata
	name = "Tyr's solar judgement"
	desc = "The Even-Handed's justice flows through this blade. Its light reveals guilt and sears falsehood."
	icon_state = "astratasword"
	max_integrity = 200
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/sword/strike, /datum/intent/sword/chop)

/obj/item/rogueweapon/sword/sabre/nockhopesh
	name = "Mystra's khopesh"
	desc = "The Lady of Mysteries enchanted this curved blade with trapped moonlight, cutting through magical wards."
	icon_state = "nockhopesh"
	wdefense = 7
	force = 25
	possible_item_intents = list(/datum/intent/sword/cut/sabre, /datum/intent/sword/thrust, /datum/intent/sword/chop/falx)
	max_integrity = 200

/obj/item/rogueweapon/shield/tower/holysee
	name = "Helm's bastion"
	desc = "The Vigilant One's sigil adorns this tower shield. Its aura strengthens nearby allies' resolve."
	icon_state = "gsshield"
	wdefense = 13
	max_integrity = 300
	coverage = 80
	wlength = WLENGTH_NORMAL
	resistance_flags = null
	flags_1 = CONDUCT_1
	force = 20
	blade_dulling = DULLING_BASH
	sellprice = 30

/obj/item/rogueweapon/shield/tower/holysee/dark
	icon_state = "gsshielddark"


////////////////////
/// HOLY SILVER WEAPONS
////////////////////


/obj/item/rogueweapon/stoneaxe/silver/holy_mace
	name = "silver waraxe of Moradin"
	desc = "A silvered waraxe with a hammerhead. Crafted by Moradin's faithful to smite the unrighteous."
	icon_state = "psyaxe"
	wdefense = 5
	max_blade_int = 450

/obj/item/rogueweapon/mace/silver/holy_mace
	name = "silver mace of Ilmater"
	desc = "A blunt instrument for ending suffering quickly. Its spherical head bears Ilmater's bleeding heart symbol."
	icon = 'icons/roguetown/weapons/64.dmi'
	icon_state = "psymace"
	smeltresult = /obj/item/ingot/silver
	is_silver = TRUE
	wdefense = 5
	max_integrity = 250
	dropshrink = 0.75

/obj/item/rogueweapon/huntingknife/idagger/silver/holy_dagger
	name = "silver dagger of Sune"
	desc = "A delicate silver blade with rose-shaped crossguard. Leaves beauty even in fatal wounds."
	icon_state = "psydagger"
	sellprice = 70
	max_blade_int = 100
	max_integrity = 210
	wdefense = 3

/obj/item/rogueweapon/spear/psyspear
	name = "silver spear of Lathander"
	desc = "A morningstar-patterned spearhead crowns this weapon. Glows faintly at sunrise."
	icon_state = "psyspear"
	is_silver = TRUE
	max_blade_int = 150
	wdefense = 6

/obj/item/rogueweapon/halberd/psyhalberd
	name = "silver halberd of Helm"
	desc = "A watchful eye motif adorns its blade. Never dulls against oathbreakers."
	max_blade_int = 250
	icon_state = "psyhalberd"
	is_silver = TRUE
	wdefense = 7
	smeltresult = /obj/item/ingot/silver

/obj/item/rogueweapon/greatsword/psygsword
	name = "silver greatsword of Tyr"
	desc = "A massive blade weighted with balanced scales. Cuts through deception."
	icon_state = "psygsword"
	max_blade_int = 350
	wdefense = 6
	is_silver = TRUE
	smeltresult = /obj/item/ingot/silver

/obj/item/rogueweapon/sword/psysword
	name = "silver sword of Mystra"
	desc = "Runecarved silver blade humming with residual Weave energy. Disrupts magical defenses."
	icon_state = "psysword"
	icon = 'icons/roguetown/weapons/64.dmi'
	max_blade_int = 200
	wdefense = 5
	is_silver = TRUE
	smeltresult = /obj/item/ingot/silver
