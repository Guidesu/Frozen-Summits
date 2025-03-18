//intent datums ฅ^•ﻌ•^ฅ

/datum/intent/mace/strike
	name = "strike"
	blade_class = BCLASS_BLUNT
	attack_verb = list("strikes", "hits")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	chargetime = 0
	penfactor = 15
	swingdelay = 0
	icon_state = "instrike"
	item_d_type = "blunt"

/datum/intent/mace/smash
	name = "smash"
	blade_class = BCLASS_SMASH
	attack_verb = list("smashes")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	penfactor = 80
	damfactor = 1.1
	swingdelay = 10
	icon_state = "insmash"
	item_d_type = "blunt"

/datum/intent/mace/rangedthrust
	name = "thrust"
	blade_class = BCLASS_STAB
	attack_verb = list("thrusts")
	animname = "stab"
	icon_state = "instab"
	reach = 2
	chargetime = 1
	recovery = 30
	warnie = "mobwarning"
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = 25
	damfactor = 0.9
	item_d_type = "stab"

//blunt objs ฅ^•ﻌ•^ฅ

/obj/item/rogueweapon/mace
	force = 20
	force_wielded = 25
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	name = "mace"
	desc = "Helps anyone fall asleep."
	icon_state = "mace"
	icon = 'icons/roguetown/weapons/32.dmi'
	item_state = "mace_greyscale"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	sharpness = IS_BLUNT
	//dropshrink = 0.75
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_HIP | ITEM_SLOT_BACK
	associated_skill = /datum/skill/combat/maces
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/iron
	gripped_intents = list(/datum/intent/mace/strike,/datum/intent/mace/smash)
	parrysound = list('sound/combat/parry/parrygen.ogg')
	swingsound = BLUNTWOOSH_MED
	minstr = 7
	wdefense = 2
	wbalance = -1
	blade_dulling = DULLING_BASHCHOP

/obj/item/rogueweapon/mace/church
	force = 25
	force_wielded = 30
	name = "bell ringer"
	desc = "This heavy hammer is used to ring the church's bell."
	icon_state = "churchmace"
	wbalance = -1
	smeltresult = /obj/item/ingot/steel
	blade_dulling = DULLING_BASH
	wdefense = 3

/obj/item/rogueweapon/mace/steel
	force = 25
	force_wielded = 32
	name = "steel mace"
	desc = "This steel mace is objectively superior to an iron one."
	icon_state = "smace"
	wbalance = -1
	smeltresult = /obj/item/ingot/steel
	blade_dulling = DULLING_BASH
	wdefense = 3
	smelt_bar_num = 2

/obj/item/rogueweapon/mace/silver
	name = "silver war hammer"
	desc = "A light war hammer forged of silver."
	icon_state = "silverhammer"
	force = 24
	gripped_intents = null
	possible_item_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	wdefense = 4
	smeltresult = /obj/item/ingot/silver
	smelt_bar_num = 2
	is_silver = TRUE

/obj/item/rogueweapon/mace/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,
"sx" = -15,
"sy" = -12,
"nx" = 9,
"ny" = -11,
"wx" = -11,
"wy" = -11,
"ex" = 1,
"ey" = -12,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = 90,
"sturn" = -90,
"wturn" = -90,
"eturn" = 90,
"nflip" = 0,
"sflip" = 8,
"wflip" = 8,
"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,
"sx" = -15,
"sy" = -1,
"nx" = 10,
"ny" = 0,
"wx" = -13,
"wy" = -1,
"ex" = 2,
"ey" = -1,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = 0,
"sturn" = 0,
"wturn" = 0,
"eturn" = 0,
"nflip" = 0,
"sflip" = 8,
"wflip" = 8,
"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
	return ..()

/obj/item/rogueweapon/mace/woodclub
	force = 15
	force_wielded = 18
	name = "wooden club"
	desc = "A primitive cudgel carved of a stout piece of treefall."
	icon_state = "club1"
	//dropshrink = 0.75
	wbalance = 0
	wdefense = 1
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/mace/strike/wood, /datum/intent/mace/smash/wood)
	smeltresult = /obj/item/ash
	minstr = 7
	resistance_flags = FLAMMABLE

/obj/item/rogueweapon/mace/woodclub/New()
	..()
	icon_state = "club[rand(1,2)]"

/datum/intent/mace/strike/wood
	hitsound = list('sound/combat/hits/blunt/woodblunt (1).ogg', 'sound/combat/hits/blunt/woodblunt (2).ogg')
	penfactor = 10

/datum/intent/mace/smash/wood
	hitsound = list('sound/combat/hits/blunt/woodblunt (1).ogg', 'sound/combat/hits/blunt/woodblunt (2).ogg')
	penfactor = 20


/obj/item/rogueweapon/mace/cudgel
	name = "cudgel"
	desc = "A stubby little club for brigands."
	force = 25
	icon_state = "cudgel"
	force_wielded = 25
	gripped_intents = list(/datum/intent/mace/strike,/datum/intent/mace/smash)
	smeltresult = /obj/item/ash
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_NORMAL
	wbalance = 0
	minstr = 7
	wdefense = 3
	resistance_flags = FLAMMABLE

/obj/item/rogueweapon/mace/cudgel/ararebo
	force = 15
	force_wielded = 20
	name = "ararebo"
	icon_state = "ararebo"
	desc = "A short, iron-capped club. The spikes cause it to inflict bleeding wounds."
	gripped_intents = null
	smeltresult = /obj/item/ingot/iron
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_NORMAL
	sharpness = IS_SHARP
	max_integrity = 300
	wbalance = 0
	minstr = 7
	wdefense = 3

/obj/item/rogueweapon/mace/cudgel/justice
	name = "'Justice'"
	desc = "The icon of the right of office of the Marshal. While mostly ceremonial in design, it serves it's purpose in dishing out some much needed justice."
	force = 30
	icon_state = "justice"
	force_wielded = 30
	gripped_intents = list(/datum/intent/mace/strike,/datum/intent/mace/smash)
	smeltresult = /obj/item/ingot/steel
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_NORMAL
	wbalance = 4
	minstr = 7
	wdefense = 5

/obj/item/rogueweapon/mace/cudgel/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -8,"sy" = -7,"nx" = 10,"ny" = -7,"wx" = -1,"wy" = -8,"ex" = 1,"ey" = -7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 91,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -3,"sy" = -4,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 70,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 1,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/mace/wsword
	name = "wooden sword"
	desc = "This wooden sword is great for training."
	force = 5
	force_wielded = 8
	icon_state = "wsword"
	//dropshrink = 0.75
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/mace/strike/wood, /datum/intent/mace/smash/wood)
	smeltresult = /obj/item/ash
	minstr = 7
	wdefense = 5
	wbalance = 0
	associated_skill = /datum/skill/combat/swords
	resistance_flags = FLAMMABLE


/obj/item/rogueweapon/mace/wsword/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,
"sx" = -15,
"sy" = -12,
"nx" = 9,
"ny" = -11,
"wx" = -11,
"wy" = -11,
"ex" = 1,
"ey" = -12,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = 90,
"sturn" = -90,
"wturn" = -90,
"eturn" = 90,
"nflip" = 0,
"sflip" = 8,
"wflip" = 8,
"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,
"sx" = -15,
"sy" = -1,
"nx" = 10,
"ny" = 0,
"wx" = -13,
"wy" = -1,
"ex" = 2,
"ey" = -1,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = 0,
"sturn" = 0,
"wturn" = 0,
"eturn" = 0,
"nflip" = 0,
"sflip" = 8,
"wflip" = 8,
"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/mace/goden
	force = 15
	force_wielded = 30
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash, /datum/intent/mace/rangedthrust)
	name = "Goedendag"
	desc = "Good morning."
	icon_state = "goedendag"
	icon = 'icons/roguetown/weapons/64.dmi'
	sharpness = IS_BLUNT
	//dropshrink = 0.75
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	associated_skill = /datum/skill/combat/maces
	smeltresult = /obj/item/ash
	parrysound = "parrywood"
	swingsound = BLUNTWOOSH_MED
	minstr = 10
	wdefense = 3
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	dropshrink = 0.6
	bigboy = TRUE
	gripsprite = TRUE

/obj/item/rogueweapon/mace/goden/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/mace/goden/kanabo
	force = 20
	force_wielded = 35
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	name = "kanabo"
	desc = "A heavy two handed club, reinforced with an iron sleeve."
	icon_state = "kanabo"
	icon = 'icons/roguetown/weapons/64.dmi'
	sharpness = IS_BLUNT
	//dropshrink = 0.75
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	associated_skill = /datum/skill/combat/maces
	smeltresult = /obj/item/ingot/iron
	parrysound = "parrywood"
	swingsound = BLUNTWOOSH_MED
	max_integrity = 400
	minstr = 12//Favored weapon of the Oni
	wdefense = 3
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE

/obj/item/rogueweapon/mace/goden/steel
	name = "grand mace"
	desc = "Good morning, sire."
	icon_state = "polemace"
	force = 15
	force_wielded = 35
	smeltresult = /obj/item/ingot/steel
	smelt_bar_num = 2

/obj/item/rogueweapon/mace/spiked
	icon_state = "spiked_club"

/obj/item/rogueweapon/mace/steel/morningstar
	icon_state = "morningstar"

/obj/item/rogueweapon/mace/warhammer
	force = 20
	possible_item_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash, /datum/intent/mace/warhammer/pick)
	gripped_intents = null
	name = "warhammer"
	desc = "Made to punch through armor and skull alike."
	icon_state = "iwarhammer"
	wbalance = -1
	smeltresult = /obj/item/ingot/iron
	blade_dulling = DULLING_BASH
	wdefense = 3

/obj/item/rogueweapon/mace/warhammer/steel
	force = 25
	possible_item_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash, /datum/intent/mace/warhammer/pick, /datum/intent/mace/warhammer/stab)
	name = "steel warhammer"
	desc = "A fine steel warhammer, makes a satisfying sound when paired with a knight's helm."
	icon_state = "swarhammer"
	smeltresult = /obj/item/ingot/steel
	wdefense = 4

/obj/item/rogueweapon/mace/warhammer/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -9,"sy" = -8,"nx" = 9,"ny" = -7,"wx" = -7,"wy" = -8,"ex" = 3,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 3,"sy" = -7,"nx" = -6,"ny" = -3,"wx" = 3,"wy" = -4,"ex" = 4,"ey" = -3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -44,"sturn" = 45,"wturn" = 47,"eturn" = 33,"nflip" = 8,"sflip" = 0,"wflip" = 0,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
	return ..()



/datum/intent/mace/warhammer/stab
	name = "thrust"
	icon_state = "instab"
	blade_class = BCLASS_STAB
	attack_verb = list("thrusts", "stabs")
	animname = "stab"
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	no_early_release = TRUE
	penfactor = 20
	damfactor = 0.8
	item_d_type = "stab"

/datum/intent/mace/warhammer/pick
	name = "pick"
	icon_state = "inpick"
	blade_class = BCLASS_PICK
	attack_verb = list("picks", "impales")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	chargetime = 14
	misscost = 1
	no_early_release = TRUE
	penfactor = 80
	damfactor = 0.9
	item_d_type = "stab"

///////////////////////////////////////////////////////////////////
// Part of Kaizoku project that is still yet to be finished.     //
// The Demo usage is meant for Stonekeep and Warmongers.		 //
// If the usage for other sources is desired, before it finishes,//
// ask monochrome9090 for permission. Respect the artists's will.//
// If you want this quality content, COMMISSION me instead. 	 //
// For this project, requirements are low, and mostly lore-based.//
// I just do not desire for the kara-turs to be butchered.	 //
///////////////////////////////////////////////////////////////////

/obj/item/rogueweapon/mace/goden/otsuchi
	force = 10
	force_wielded = 25
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	name = "otsuchi"
	desc = "A wooden greathammer of kara-tur make, heavy enough to give any warrior pause. Often used by Yamabushi warriors."
	icon_state = "otsuchi"
	icon = 'icons/roguetown/kaizoku/weapons/64.dmi'
	sharpness = IS_BLUNT
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	associated_skill = /datum/skill/combat/axes
	smeltresult = /obj/item/ash
	swingsound = BLUNTWOOSH_HUGE
	max_integrity = 250
	minstr = 10
	wdefense = 3
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE

/obj/item/rogueweapon/mace/goden/kanabo
	name = "kanabo"
	desc = "A heavy two handed club, reinforced with an iron sleeve. Most commonly seen in the hands of Onis and Yamabushis."
	icon_state = "kanabo"
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/smash) //Can't spear people, but can make them bleed due to spikes.
	sharpness = IS_SHARP
	icon = 'icons/roguetown/kaizoku/weapons/64.dmi'
	parrysound = "parrywood"
	swingsound = BLUNTWOOSH_MED
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	slowdown = 1

/obj/item/rogueweapon/mace/goden/kanabo/dustcurse/dropped()
	. = ..()
	name = "Dustcurse kanabo"
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	minstr = 0 //asset solely to be used by NPCs. This will not be found on the hands of players.
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/mace/goden/steel/tetsubo
	name = "tetsubo"
	desc = "A heavier variant of the kanabo, fitted with a steel sleeve bearing menacing spikes and favored by Ogre Warlords. Requires immense strength to use, but hits like a raging bull."
	icon_state = "tetsubo"
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/smash) //Can't spear people, but can make them bleed due to spikes.
	sharpness = IS_SHARP
	icon = 'icons/roguetown/kaizoku/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64

/obj/item/rogueweapon/mace/goden/steel/tetsubo/dustcurse/dropped()
	. = ..()
	name = "Dustcurse tetsubo"
	minstr = 0 //asset solely to be used by NPCs. This will not be found on the hands of players.
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/mace/ararebo
	name = "ararebo"
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	icon_state = "ararebo"
	desc = "A large, iron-capped club used by kara-turs as a armor-breaking tool. Most suitable to breach Grezenholftean cuirass while still holding a shield in the off-hand."

/obj/item/rogueweapon/mace/ararebo/dustcurse/dropped()
	. = ..()
	name = "Dustcurse ararebo"
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/mace/ararebo/obsidian
	name = "obsidian club"
	icon_state = "obsidian_club"
	desc = "A large, wooden club with sharp flakes of obsidian embedded into it. Its appearance is similar to a flanged mace, but it inflicts deep cuts."
	max_integrity = 150
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_NORMAL
	sharpness = IS_SHARP
	wbalance = -1
	minstr = 0
	wdefense = 3

/obj/item/rogueweapon/mace/steel/ararebo
	name = "steel ararebo"
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	icon_state = "sararebo"
	desc = "A large, steel-capped club used by kara-turs as a armor-breaking tool. Most suitable to breach Grezenholftean cuirass while still holding a shield in the off-hand."

/obj/item/rogueweapon/mace/steel/ararebo/dustcurse/dropped()
	. = ..()
	name = "Dustcurse steel ararebo"
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/mace/cudgel/rungu
	force = 15
	force_wielded = 20
	name = "rungu club"
	desc = "A more well defined, chiseled and ashed wooden club that can be throw at enemies. Used by abyssal warriors."
	icon_state = "rungu"
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	wbalance = 0
	wdefense = 1
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 150
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/mace/strike/wood, /datum/intent/mace/smash/wood)
	smeltresult = /obj/item/ash
	minstr = 0
	throwforce = 25

/obj/item/rogueweapon/mace/cudgel/jitte
	name = "jitte"
	desc = "An kara-tur Ashigaru guard weapon. The hook along the shaft allows the club to arrest a blade that has been parried, increasing the defensive utility of a otherwise simple baton."
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	icon_state = "jitte"
	wdefense = 4
