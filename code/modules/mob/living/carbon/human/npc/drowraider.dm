GLOBAL_LIST_INIT(drow_quotes, world.file2list("strings/rt/drowraiderlines.txt")) // Idle quotes! These files are, line by line, spoken verbatim as if they were copy pasted. Languages apply, if needed.
GLOBAL_LIST_INIT(drow_aggro, world.file2list("strings/rt/drowraideraggrolines.txt")) // Enemy spotted quotes!

/mob/living/carbon/human/species/elf/dark/npc // Makes a child type of the species mob
	aggressive=1 // Makes them hostile
	mode = AI_IDLE // Enables AI and waits for special circumstances
	faction = list("darkseldarine") // Assigns them to a 'team', so they dont kill eachother.
	ambushable = FALSE // Makes them not trigger random ambushes
	dodgetime = 30
	flee_in_pain = TRUE // Makes them run away and play combat safe when health is low
	possible_rmb_intents = list()
	var/is_silent = FALSE /// Determines whether or not we will scream our funny lines at people.


/mob/living/carbon/human/species/elf/dark/npc/ambush // Use this for ambush NPCs so they wander around. Just use npc if placing in an event area or dungeon.
	aggressive=1

	wander = TRUE // Makes them roam randomly when idle

/mob/living/carbon/human/species/elf/dark/npc/retaliate(mob/living/L) // Makes them aggressive toward entities not in their faction that they can see
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(!is_silent && target != newtarg)
			say(pick(GLOB.drow_aggro)) // Battle cries!
			linepoint(target) // Points at their aggro target

/mob/living/carbon/human/species/elf/dark/npc/should_target(mob/living/L) // Makes them ignore entities that are unconscious or dead
	if(L.stat != CONSCIOUS)
		return FALSE
	. = ..()

/mob/living/carbon/human/species/elf/dark/npc/Initialize()
	. = ..()
	set_species(/datum/species/elf/dark)
	spawn(10)
		after_creation()
	//addtimer(CALLBACK(src, PROC_REF(after_creation)), 10)

/mob/living/carbon/human/species/elf/dark/npc/after_creation() // Applies traits and procs to the NPC once it has initialized.
	..()
	job = "Drow Slaver" // Flavor. Can show up in known people, probably?
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC) // So their stats dont vary over time 
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC) // So they dont get hungry and lose stats, as they cant eat
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC) // So they can wear heavy armor
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) // Same as above
	equipOutfit(new /datum/outfit/job/roguetown/human/species/elf/dark/npc)
	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes) // This is so you can apply custom eye colors.
	if(organ_eyes)
		organ_eyes.accessory_colors = pick("#a71d9b#a71d9b", "#a71d2f#a71d2f", "#75a5d1#75a5d1") // For some reason the color hex needs to be doubles to account for both eyes.
	update_hair() // Applies hair details after the loadout is applied.

/mob/living/carbon/human/species/elf/dark/npc/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle)
		return
	next_idle = world.time + rand(30, 70)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc) && wander)
		if(prob(20))
			var/turf/T = get_step(loc,pick(GLOB.cardinals))
			if(!istype(T, /turf/open/transparent/openspace))
				Move(T)
		else
			face_atom(get_step(src,pick(GLOB.cardinals)))
	if(!wander && prob(10))
		face_atom(get_step(src,pick(GLOB.cardinals)))
	if(!is_silent && prob(2))
		say(pick(GLOB.drow_quotes))
	if(!is_silent && prob(2))
		emote(pick("yawn","grumble","mumble"))

/mob/living/carbon/human/species/elf/dark/npc/handle_combat() // If they spot a target, their AI switches to hunting. This makes them do behaviors when this happens.
	if(mode == AI_HUNT)
		if(prob(50)) // ignores is_silent because they should at least still be able to scream at people!
			emote("rage")
	. = ..()

/// This version stays quiet and doesn't yell. Great for admin spawn events if you don't want to destroy your players' chat logs!
/mob/living/carbon/human/species/elf/dark/npc/silent
	is_silent = TRUE

/datum/outfit/job/roguetown/human/species/elf/dark/npc/pre_equip(mob/living/carbon/human/H) // Their possible loadouts. Extremely customizable!
	H.gender = MALE
	if(prob(20)) // Lolthsworn dogma decrees women are sacred. Less likely to be found in the field like this.
		H.gender = FEMALE
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather // Default wrist equipment.
	if(prob(50)) // On a 50% chance their wrist equipment is different.
		wrists = /obj/item/clothing/wrists/roguetown/bracers
	armor = /obj/item/clothing/suit/roguetown/armor/leather
	if(prob(50)) // Another coinflip.
		armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
		if(prob(50)) // Coinflip of a coinflip.
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail
			if(prob(50)) // To go even further beyond.
				armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	shirt = /obj/item/clothing/suit/roguetown/shirt/shadowshirt
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants 
	if(prob(50))
		pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/helmet/leather
		if(prob(50))
			head = /obj/item/clothing/neck/roguetown/chaincoif/iron
			if(prob(10) && H.gender == FEMALE) // Example for gender specific attire. Perhaps more useful for passive NPCs?
				head = /obj/item/clothing/head/roguetown/nyle
	if(prob(40))
		neck = /obj/item/clothing/neck/roguetown/bevor
	if(prob(50))
		gloves = /obj/item/clothing/gloves/roguetown/leather
	H.STASPD = 10 // Their stats can be determined here.  Can be used to scale difficulty of an NPC class.
	H.STACON = rand(10,12) //so their limbs dont pop off like a skeleton's
	H.STAEND = 15
	H.STAPER = 10 // You can, in fact, sneak by them
	H.STAINT = 1 // They arent going to be learning skills or casting magic, are they?
	H.STASTR = rand(14,16) // Variable strangth!
	r_hand = /obj/item/rogueweapon/sword/rapier 
	if(prob(10))
		r_hand = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish/drow // 10% chance they have a silver dagger instead of a rapier.
	l_hand = /obj/item/rogueweapon/huntingknife/idagger/steel/parrying // Parrying!
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	H.dna.features["mcolor"] = pick("9796a9", "897489", "938f9c", "737373", "6a616d", "5f5f70", "2f2f38") // For randomized skin tones.
	if(H.gender == FEMALE) // Made a new helper for applying specific hairstyles to NPCs. Need the datum of chosen hairstyles. Colors go after the styles. Can be a list, or can be a single color.
		H.set_hairstyle(pick(
		/datum/sprite_accessory/hair/head/antenna,
		/datum/sprite_accessory/hair/head/beehive,
		/datum/sprite_accessory/hair/head/beehive2,
		/datum/sprite_accessory/hair/head/braided), pick("#181a1d","#201616","#2b201b","#1d1b2b","#dee9ed","#f4f4f4"))
	else
		H.set_hairstyle(pick(
		/datum/sprite_accessory/hair/head/braided,
		/datum/sprite_accessory/hair/head/lowbraid,
		/datum/sprite_accessory/hair/head/lowbun,
		/datum/sprite_accessory/hair/head/manbun), pick("#181a1d","#201616","#2b201b","#1d1b2b","#dee9ed","#f4f4f4"))
	H.name = (H.gender == MALE) ? pick(GLOB.elfd_names_male) : pick(GLOB.elfd_names_female) // This allows for unique elf names, so we dont get drow named Jean-Luc, for example.
	H.real_name = H.name // Applies the name to their real name. In case their face is covered. Name is overridden by disguise, real_name is not.
