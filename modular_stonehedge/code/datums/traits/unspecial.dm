//BE SPECIAL converted most to regular quirk traits for consistency in characters -- vide noir.
//Will need rebalancing costs and stuff.

/datum/quirk/greaternightvision
	name = "(Virtue) Darkvision"
	desc = "I can easily see in the dark."
	value = 2

/datum/quirk/greaternightvision/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(!eyes)
		return
	eyes.see_in_dark = 7
	eyes.lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	eyes.Insert(H)
	ADD_TRAIT(H, TRAIT_NOCSIGHT, TRAIT_GENERIC)






/datum/quirk/werewolfeyes
	name = "(Organs) Moonlight Eyes (White Eyes)"
	desc = "I can easily see in the dark with my eyes."
	value = 5

/datum/quirk/werewolfeyes/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(H,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/werewolf
	eyes.Insert(H)
	ADD_TRAIT(H, TRAIT_NOCSIGHT, TRAIT_GENERIC)








/datum/quirk/werewolfeyes_green
	name = "(Organs) Moonlight Eyes (Green Eyes)"
	desc = "I can easily see in the dark with my eyes."
	value = 5

/datum/quirk/werewolfeyes_green/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(H,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/werewolf/green
	eyes.Insert(H)
	ADD_TRAIT(H, TRAIT_NOCSIGHT, TRAIT_GENERIC)



/datum/quirk/werewolfeyes_blue
	name = "(Organs) Moonlight Eyes (Blue Eyes)"
	desc = "I can easily see in the dark with my eyes."
	value = 5

/datum/quirk/werewolfeyes_blue/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(H,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/werewolf/blue
	eyes.Insert(H)
	ADD_TRAIT(H, TRAIT_NOCSIGHT, TRAIT_GENERIC)

/datum/quirk/werewolfeyes_yellow
	name = "(Organs) Moonlight Eyes (Yellow Eyes)"
	desc = "I can easily see in the dark with my eyes."
	value = 5

/datum/quirk/werewolfeyes_yellow/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(H,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/werewolf/yellow
	eyes.Insert(H)
	ADD_TRAIT(H, TRAIT_NOCSIGHT, TRAIT_GENERIC)

/datum/quirk/werewolfeyes_brown
	name = "(Organs) Moonlight Eyes (Brown Eyes)"
	desc = "I can easily see in the dark with my eyes."
	value = 5

/datum/quirk/werewolfeyes_brown/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(H,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/werewolf/brown
	eyes.Insert(H)
	ADD_TRAIT(H, TRAIT_NOCSIGHT, TRAIT_GENERIC)


/datum/quirk/undeadeyes
	name = "(Organs) Cursed Eyes (White Eyes)"
	desc = "I can easily see in the dark with my undead eyes."
	value = 5

/datum/quirk/undeadeyes/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(H,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/zombie
	eyes.Insert(H)
	ADD_TRAIT(H, TRAIT_NOCSIGHT, TRAIT_GENERIC)




/datum/quirk/undeadeyes_red
	name = "(Organs) Cursed Eyes (Red Eyes)"
	desc = "I can easily see in the dark with my undead eyes."
	value = 5

/datum/quirk/undeadeyes_red/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(H,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/zombie/red
	eyes.Insert(H)
	ADD_TRAIT(H, TRAIT_NOCSIGHT, TRAIT_GENERIC)




/datum/quirk/tongue_animal
	name = "(Organs) Animal Tongue"
	desc = "I have a tongue that allows me to make animal noises."
	value = 0


/datum/quirk/tongue_animal/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/tongue/tongue = H.getorganslot(ORGAN_SLOT_TONGUE)
	if(tongue)
		tongue.Remove(H,1)
		QDEL_NULL(tongue)
	tongue = new /obj/item/organ/tongue/wild_tongue
	tongue.Insert(H)


//-----------------------------------


/datum/quirk/curseofcain
	name = "(Virtue) Flawed Immortality"
	desc = "I don't need to eat or breathe anymore... Is this normal?"
	value = 5

/datum/quirk/curseofcain/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBREATH, TRAIT_GENERIC)
	H.change_stat("endurance", 2)

/datum/quirk/deadened
	name = "(Virtue) Deadened"
	desc = "Ever since <b>it</b> happened, I've never been able to feel anything. Inside or out."
	value = 0

/datum/quirk/deadened/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_NOMOOD, TRAIT_GENERIC)

/datum/quirk/value
	name = "(Virtue) Skilled Appraiser"
	desc = "I know how to estimate an item's value, more or less."
	value = 1

/datum/quirk/value/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)

/datum/quirk/night_owl
	name = "(Virtue) Night Owl"
	desc = "I've always preferred the night."
	value = 2

/datum/quirk/night_owl/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_NIGHT_OWL, TRAIT_GENERIC)

/datum/quirk/beautiful
	name = "(Virtue) Beautiful"
	desc = "My face is a work of art"
	value = 1

/datum/quirk/beautiful/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)

//positive
/datum/quirk/duelist
	name = "(Weapons/Skills) Sword Training"
	desc = "I sword training and stashed a short sword."
	value = 1

/datum/quirk/duelist/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.special_items["Short Sword"] = /obj/item/rogueweapon/sword/short

/datum/quirk/fence
	name = "(Weapons/Skills) Fencer"
	desc = "I have trained in agile sword fighting. I dodge more easily and have stashed my rapier nearby"
	value = 3

/datum/quirk/fence/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.special_items["Rapier"] = /obj/item/rogueweapon/sword/rapier

/datum/quirk/training2
	name = "(Weapons/Skills) Mace Training"
	desc = "I have mace training and stashed a mace."
	value = 1

/datum/quirk/training2/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
	H.mind.special_items["Mace"] = /obj/item/rogueweapon/mace/spiked

/datum/quirk/training4
	name = "(Weapons/Skills) Polearms Training"
	desc = "I have polearm training and stashed a spear."
	value = 1

/datum/quirk/training4/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.special_items["Spear"] = /obj/item/rogueweapon/spear

/datum/quirk/training5
	name = "(Weapons/Skills) Knife Training"
	desc = "I have knife training and stashed a dagger."
	value = 1

/datum/quirk/training5/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.special_items["Dagger"] = /obj/item/rogueweapon/huntingknife/idagger/steel/parrying

/datum/quirk/training6
	name = "(Weapons/Skills) Axe Training"
	desc = "I have axe training, including woodchopping. and stashed a hatchet"
	value = 1

/datum/quirk/training6/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/lumberjacking, 3, TRUE)
	H.mind.special_items["Axe"] = /obj/item/rogueweapon/stoneaxe/woodcut


/datum/quirk/training8
	name = "(Weapons/Skills) Shield Training"
	desc = "I have shield training and stashed a shield."
	value = 2

/datum/quirk/training8/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 3, TRUE)
	H.mind.special_items["Shield"] = /obj/item/rogueweapon/shield/wood

/datum/quirk/training9
	name = "(Weapons/Skills) Unarmed Training"
	desc = "I have unarmed training and stashed a katar."
	value = 5

/datum/quirk/training9/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.special_items["Katar"] = /obj/item/rogueweapon/katar

/datum/quirk/greenthumb
	name = "(Skill/Tools) Green Thumb"
	desc = "I've always been rather good at tending to plants, and I have a hoe stashed in a tree. (Raises skill to journeyman)"
	value = 1

/datum/quirk/greenthumb/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 3, TRUE)
	H.mind.special_items["Hoe"] = /obj/item/rogueweapon/hoe // I too respect a humble farmer.

/datum/quirk/mtraining1
	name = "(Skill/Tools) Medical Training"
	desc = "I have basic medical training and stashed some med supplies alongside a broom to clean some blood."
	value = 2

/datum/quirk/mtraining1/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
	H.mind.special_items["Patch Kit"] = /obj/item/storage/fancy/ifak
	H.mind.special_items["Surgery Kit"] = /obj/item/storage/fancy/skit
	H.mind.special_items["Broom"] = /obj/item/broom


/datum/quirk/training10
	name = "(Weapons/Skills) Bow Training"
	desc = "I have journeyman bow training and stashed a bow."
	value = 2

/datum/quirk/training10/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 3, TRUE)
	H.mind.special_items["Bow"] = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
	H.mind.special_items["Quiver"] = /obj/item/quiver/arrows

/datum/quirk/mule
	name = "(Weapons/Skills) Mule"
	desc = "I've been dealing drugs and I have a stash hidden away"
	value = 2

/datum/quirk/mule/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.special_items["Stash One"] = /obj/item/storage/backpack/rogue/satchel/mule
	H.mind.special_items["Stash Two"] = /obj/item/storage/backpack/rogue/satchel/mule
	H.mind.special_items["Dagger"] = /obj/item/rogueweapon/huntingknife/idagger
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)

/datum/quirk/bookworm
	name = "(Skills) Bookworm"
	desc = "I love books and I became quite skillfull at reading and writing."
	value = 1

/datum/quirk/bookworm/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)

/datum/quirk/arsonist
	name = "(Weapons/Skills) Arsonist"
	desc = "I like seeing things combust and burn. I have hidden around two firebobms"
	value = 2

/datum/quirk/arsonist/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.special_items["Firebomb One"] = /obj/item/bomb
	H.mind.special_items["Firebomb Two"] = /obj/item/bomb
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)

/datum/quirk/pineapple
	name = "(Weapons/Skills)No safeword."
	desc = "I enjoy whipping people until they squirm and whine, I am skilled at using whips, and have a hidden one somewhere."
	value = 3

/datum/quirk/pineapple/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.special_items["Whip"] = /obj/item/rogueweapon/whip
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 4, TRUE)


/datum/quirk/spring_in_my_step
	name = "(Vitue) Spring in my Step"
	desc = "My legs are quite strong and where most have to climb, I can jump higher and not fall."
	value = 2

/datum/quirk/spring_in_my_step/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_ZJUMP, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOFALLDAMAGE1, TRAIT_GENERIC)

/datum/quirk/impervious
	name = "(Combat) Impervious"
	desc = "I've spent years shoring up my weakspots, and have become difficult to wound with critical blows."
	value = 5
/datum/quirk/impervious/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)


/datum/quirk/thief
	name = "(Skills) Thief"
	desc = "Life's not easy around here, but I've made mine a little easier by taking things of others. I am a great at picking pockets."
	value = 2

/datum/quirk/thief/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/stealing, 5, TRUE)

/*/datum/quirk/languagesavant
	name = "(Language) Polyglot"
	desc = "I have always picked up on languages easily."
	value = 4

/datum/quirk/languagesavant/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.grant_language(/datum/language/dwarvish)
	H.grant_language(/datum/language/elvish)
	H.grant_language(/datum/language/hellspeak)
	H.grant_language(/datum/language/celestial)
	H.grant_language(/datum/language/orcish)
	H.grant_language(/datum/language/draconic)*/

/datum/quirk/civilizedbarbarian
	name = "(Combat) Tavern Brawler"
	desc = "I am a barstool warrior. Improvised weapons are more effective in my hands."
	value = 5

/datum/quirk/civilizedbarbarian/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC) //Need to make trait improve hitting people with chairs, mugs, goblets.

/datum/quirk/mastercraftsmen
	name = "(Skills) Jack of all trades"
	desc = "I've always had steady hands. I'm experienced enough in most fine craftsmanship to make a career out of it, if I can procure my own tools."
	value = 3

/datum/quirk/mastercraftsmen/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/traps, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/tanning, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)


/datum/quirk/masterbuilder
	name = "(Skills) Practiced Builder"
	desc = "I have experience in putting up large structures and foundations for buildings. I can even use a sawmill if I can find one, and I have a handcart and two sacks hidden away for transporting my construction materials."
	value = 1 // I have a lot of respect for people who actually bother making buildings that will be deleted within an hour or two.

/datum/quirk/masterbuilder/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 3, TRUE) // Needed to install things like levers in a house. This unfortunately means construction workers can make illegal firearms.
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE) // Pretty sure some crafting stations use this. Also stone axes and whatever other basic tools they need.
	H.mind.special_items["Handcart"] = /obj/structure/handcart //TO-DO: Implement sawmill and the trait to use it. Giving them a handcart to move materials with.
	H.mind.special_items["Sack 1"] = /obj/item/storage/roguebag
	H.mind.special_items["Sack 2"] = /obj/item/storage/roguebag


/datum/quirk/mastersmith
	name = "(Skills) Practiced Smith"
	desc = "I am a metalworker by trade, and I have the tools for my practice stashed away." //play a proper smith if you want starting smith gear.
	value = 3 // Armor-making. Weapon-making. Everyone wants the gamer gear.

/datum/quirk/mastersmith/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/weaponsmithing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/armorsmithing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/engineering, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/smelting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.special_items["Hammer"] = /obj/item/rogueweapon/hammer/claw // works same as normal hammer.
	H.mind.special_items["Tongs"] = /obj/item/rogueweapon/tongs
	H.mind.special_items["Coal"] = /obj/item/rogueore/coal


/datum/quirk/bleublood
	name = "(Flavor) Noble Lineage"
	desc = "I am of noble blood."
	value = 1

/datum/quirk/bleublood/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)

/datum/quirk/richpouch
	name = "(Flavor) Rich Pouch"
	desc = "I have a pouch full of coins."
	value = 1

/datum/quirk/richpouch/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/pouch = new /obj/item/storage/belt/rogue/pouch/coins/rich(get_turf(H))
	H.put_in_hands(pouch, forced = TRUE)

/datum/quirk/swift
	name = "(Virtue) Speedster"
	desc = "I am very athletic and fast. I can also dodge anything as long as I am not weighted down by medium or heavier armor."
	value = 5

/datum/quirk/swift/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)
	H.change_stat("speed", 3)

/datum/quirk/gourmand
	name = "(Virtue) Gourmand"
	desc = "I can eat even the most spoiled, raw, or toxic food and water as if they were delicacies. I'm even immune to the berry poison some folk like to coat their arrows with."
	value = 2

/datum/quirk/gourmand/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_NASTY_EATER, TRAIT_GENERIC)

/datum/quirk/backproblems
	name = "(Virtue) Giant"
	desc = "I've always been called a giant (atleast among my kin). I am valued for my stature, but, this world made for smaller folk has forced me to move cautiously."
	value = 0

/datum/quirk/backproblems/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("strength", 3)
	H.change_stat("constitution", 2)
	H.change_stat("speed", -2)
	H.transform = H.transform.Scale(1.25, 1.25)
	H.transform = H.transform.Translate(0, (1.1))
	H.update_transform()

/datum/quirk/backproblems_2
	name = "(Virtue) Giant (Extra)"
	desc = "I've always been called a giant (atleast among my kin). I am valued for my stature, but, this world made for smaller folk has forced me to move cautiously."
	value = 0

/datum/quirk/backproblems_2/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("strength", 3)
	H.change_stat("constitution", 2)
	H.change_stat("speed", -2)
	H.transform = H.transform.Scale(1.25, 1.25)
	H.transform = H.transform.Translate(0, (1.1))
	H.update_transform()

//negative
/datum/quirk/nimrod
	name = "(Flaw) Nimrod"
	desc = "In the past I learned slower than my peers, and I tend to be clumsy."
	value = -8

/datum/quirk/nimrod/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("speed", -2)
	H.change_stat("intelligence", -4)

/datum/quirk/nopouch
	name = "(Flaw) No Pouch"
	desc = "I lost my pouch recently, I'm without a zenny.."
	value = -5

/datum/quirk/nopouch/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/pouch = locate(/obj/item/storage/belt/rogue/pouch) in H
	if(H.wear_neck == pouch)
		H.wear_neck = null
	if(H.beltl == pouch)
		H.beltl = null
	if(H.beltr == pouch)
		H.beltr = null
	qdel(pouch)

/datum/quirk/hussite
	name = "(Flaw) Cursed"
	desc = "You are unabled to be healed by faithfuls due to a curse from a demon, fae or other entity, and people know you are cursed."
	value = -8

/datum/quirk/hussite/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	GLOB.excommunicated_players += H.real_name

/datum/quirk/bounty
	name = "(Flaw) Hunted Man"
	desc = "Someone put a bounty on my head!"
	value = -8

/datum/quirk/bounty/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/reason = ""
	var/employer = "unknown employer"
	var/employer_gender
	if(prob(65))
		employer_gender = MALE
	else
		employer_gender = FEMALE
	if(employer_gender == MALE)
		employer = pick(list("Baron", "Lord", "Nobleman", "Prince"))
	else
		employer = pick(list("Duchess", "Lady", "Noblelady", "Princess"))
	employer = "[employer] [random_human_name(employer_gender, FALSE, FALSE)]"
	var/amount = rand(40,100)
	switch(rand(1,8))
		if(1)
			reason = "murder"
		if(2)
			reason = "kinslaying"
		if(3)
			reason = "besmirching a noble's name"
		if(4)
			reason = "treason"
		if(5)
			reason = "arson"
		if(6)
			reason = "heresy"
		if(7)
			reason = "robbing a noble"
		if(8)
			reason = "burglary"
	add_bounty(H.real_name, amount, FALSE, reason, employer)
	to_chat(H, span_notice("Whether I done it or not, I have been accused of [reason], and the [employer] put a bounty on my head!"))

/datum/quirk/outlaw
	name = "(Flaw) Known Outlaw"
	desc = "Whether for crimes I did or was accused of, I have been declared an outlaw!"
	value = 0

/datum/quirk/outlaw/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	make_outlaw(H.real_name, TRUE)

/datum/quirk/sillyvoice
	name = "(Flaw) Annoying"
	desc = "People really hate my voice for some reason."
	value = -4

/datum/quirk/sillyvoice/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_COMICSANS, TRAIT_GENERIC)
	H.dna.add_mutation(WACKY)

/datum/quirk/unlucky
	name = "(Flaw) Unlucky"
	desc = "Ever since you knocked over that glass vase, you just feel... off"
	value = -8

/datum/quirk/unlucky/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.STALUC = rand(1, 10)


/datum/quirk/jesterphobia
	name = "(Flaw) Jesterphobic"
	desc = "I have a severe, irrational fear of Jesters"
	value = -4

/datum/quirk/jesterphobia/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_JESTERPHOBIA, TRAIT_GENERIC)

/datum/quirk/dweakness
	name = "(Flaw) Deceiving Weakness"
	desc = "People think i am weak... THINK."
	value = -4

/datum/quirk/dweakness/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)

/datum/quirk/wild_night
	name = "(Flaw) Wild Night"
	desc = "I don't remember what I did last night, and now I'm lost!"
	value = -8

/datum/quirk/wild_night/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/turf/location = get_spawn_turf_for_job("Pilgrim")
	H.forceMove(location)
	grant_lit_torch(H)

/datum/quirk/atrophy
	name = "(Flaw) Atrophy"
	desc = "When growing up I could barely feed myself... this left me weak and fragile"
	value = -6

/datum/quirk/atrophy/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("strength", -2)
	H.change_stat("constitution", -2)
	H.change_stat("endurance", -2)

/datum/quirk/nude_sleeper
	name = "(Flaw) Picky Sleeper"
	desc = "I just can't seem to fall asleep unless I'm <i>truly</i> comfortable... this makes me vulnerable"
	value = -15 //Sleeping people are already rather vulnerable. Having to take off literally everything is more than just bothersome.

/datum/quirk/nude_sleeper/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("endurance", 2) //since sleeping naked will probably get you sick or some shit.
	H.change_stat("constitution", 2)
	ADD_TRAIT(H, TRAIT_NUDE_SLEEPER, TRAIT_GENERIC)

// disgustingly hooking into quirks to provide a convenient way to become a vampire
/datum/quirk/vampire
	name = "(Flavor/Mechanic) Blood Sucker"
	desc = "You need blood to survive, depending if you are merely an beast folk that needs blood to survive or a mutated human, you are not truly a vampire, of course others might think you are. (To gain the undead trait, and all the benefits of being a vampire, select the correct virtue alongside this quirk.)"
//	desc = "You've existed long before the gods existed, you know the truth and have no reason to worship them. You are faithless. After attaining power, Levishth has cursed your people, bringing bad omens where ever you go. For this reason, the people of Stonehedge have shunned you and discriminated against you, there is no possible way an antediluvian will ever hold a position of power in Stonehedge, let alone be welcomed. Levishth has only shown favor to one antediluvian, rewarding them with the title of Vampire Lord, and gifting them powers far beyond that of a regular nitecreacher. Your pale skin, fangs, and eerie eyes are EASILY identifable features, so it is best to stay covered at all times in public areas."

/datum/quirk/vampire/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/antagonist/vampire/new_antag = new /datum/antagonist/vampirelord/lesser/secret()
	H.mind.add_antag_datum(new_antag)
	H.mind.special_items["Crimson Medallion"] = /obj/item/clothing/mask/rogue/collar/medallion

/datum/antagonist/vampirelord/lesser/secret
	ashes = FALSE

/datum/antagonist/vampirelord/lesser/secret/roundend_report()
	return

/datum/antagonist/vampirelord/lesser/secret/move_to_spawnpoint()
	return

/*
/datum/quirk/werewolf
	name = "Cursed Lineage (Werewolf)"
	desc = "Cursed with lycanthropy but driven by a heart that resists darkness, you walk the line between beast and person, harnessing the primal power and keen senses of the wolf to protect rather than destroy, perhaps guided by Selûne's blessing or Mielikki's wisdom, striving to master your dual nature while society's fear and misunderstanding shadow your every step. (You are a werewolf but NOT an ANTAGONIST. DO NOT BITE PEOPLE WITHOUT A VERY GOOD REASON.)"

/datum/quirk/werewolf/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/antagonist/werewolf/new_antag = new /datum/antagonist/werewolf/secret()
	H.mind.add_antag_datum(new_antag)

/datum/antagonist/werewolf/secret/roundend_report()
	return
*/

/datum/quirk/elvishtalker
	name = "(Language) Knows Elvish"
	desc = "I learned to speak elvish in my time here."
	value = 1

/datum/quirk/elvishtalker/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.grant_language(/datum/language/elvish)

/datum/quirk/lupinetalker
	name = "(Language) Knows Lupine"
	desc = "I learned to speak lupine in my time here."
	value = 1

/datum/quirk/lupinetalker/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.grant_language(/datum/language/canilunzt)

/datum/quirk/beasttalker //More costly cause also gives werewolf chat
	name = "(Language) Knows Beastish"
	desc = "I learned to speak the beast tongue in my time here."
	value = 3

/datum/quirk/beasttalker/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.grant_language(/datum/language/beast)


/datum/quirk/orcishtalker
	name = "(Language) Knows Orcish"
	desc = "I learned to speak orcish in my time here."
	value = 1

/datum/quirk/orcishtalker/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.grant_language(/datum/language/orcish)

/datum/quirk/dwarvishtalker
	name = "(Language) Knows Dwarvish"
	desc = "I learned to speak dwarvish in my time here."
	value = 1

/datum/quirk/dwarvishtalker/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.grant_language(/datum/language/dwarvish)

/datum/quirk/selfaware
	name = "(Virtue) Self-Aware"
	desc = "I know the extent of my wounds to a terrifying scale."
	value = 1
	mob_trait = TRAIT_SELF_AWARE
	medical_record_text = "Patient demonstrates an uncanny knack for self-diagnosis."

/datum/quirk/clothing_stasher
	name = "(Clothing) Clothing stasher"
	desc = "You have a few clothing stashed away, the majority of it are from loadout. (This Quirk gives you access to the tree to almost all the loadout items, but be careful that it will bloat the tree.)"


/datum/quirk/clothing_stasher/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.special_items["Black Collar"] = /obj/item/clothing/mask/rogue/collar/black
	H.mind.special_items["Spiked Collar"] = /obj/item/clothing/mask/rogue/collar/spiked
	H.mind.special_items["Cyan Collar"] = /obj/item/clothing/mask/rogue/collar
	H.mind.special_items["glasses"] = /obj/item/clothing/mask/rogue/spectacles/glasses
	H.mind.special_items["Crimson Medallion"] = /obj/item/clothing/mask/rogue/collar/medallion
	H.mind.special_items["Exotic Bra"] = /obj/item/clothing/suit/roguetown/shirt/exoticsilkbra
	H.mind.special_items["Golden anklets"] = /obj/item/clothing/shoes/roguetown/anklets
	H.mind.special_items["Keffiyeh"] = /obj/item/clothing/head/roguetown/roguehood/shalal
	H.mind.special_items["Archer's Cap"] = /obj/item/clothing/head/roguetown/archercap
	H.mind.special_items["Straw Hat"] = /obj/item/clothing/head/roguetown/strawhat
	H.mind.special_items["Witch Hat"] = /obj/item/clothing/head/roguetown/witchhat
	H.mind.special_items["Bard's Hat"] = /obj/item/clothing/head/roguetown/bardhat
	H.mind.special_items["Fancy Hat"] = /obj/item/clothing/head/roguetown/fancyhat
	H.mind.special_items["Smoking Cap"] = /obj/item/clothing/head/roguetown/smokingcap
	H.mind.special_items["Headband"] = /obj/item/clothing/head/roguetown/headband
	H.mind.special_items["Buckled Hat"] = /obj/item/clothing/head/roguetown/puritan
	H.mind.special_items["Folded Hat"] = /obj/item/clothing/head/roguetown/bucklehat
	H.mind.special_items["Duelist's Hat"] = /obj/item/clothing/head/roguetown/duelhat
	H.mind.special_items["Hood"] = /obj/item/clothing/head/roguetown/roguehood
	H.mind.special_items["Takuhatsugasa Hat"] = /obj/item/clothing/head/roguetown/takuhatsugasa
	H.mind.special_items["Torioigasa Hat"] = /obj/item/clothing/head/roguetown/tengai/torioigasa
	H.mind.special_items["Gasa Hat"] = /obj/item/clothing/head/roguetown/tengai/gasa

	H.mind.special_items["Tabard"] = /obj/item/clothing/cloak/tabard
	H.mind.special_items["Surcoat"] = /obj/item/clothing/cloak/stabard
	H.mind.special_items["Jupon"] = /obj/item/clothing/cloak/stabard/surcoat
	H.mind.special_items["Cape"] = /obj/item/clothing/cloak/cape
	H.mind.special_items["Halfcloak"] = /obj/item/clothing/cloak/half
	H.mind.special_items["Rider's Cloak"] = /obj/item/clothing/cloak/half/rider
	H.mind.special_items["Rain Cloak"] = /obj/item/clothing/cloak/raincloak
	H.mind.special_items["Fur Cloak"] = /obj/item/clothing/cloak/raincloak/furcloak
	H.mind.special_items["Direbear Cloak"] = /obj/item/clothing/cloak/darkcloak/bear
	H.mind.special_items["Light Direbear Cloak"] = /obj/item/clothing/cloak/darkcloak/bear/light

	H.mind.special_items["Dark Boots"] = /obj/item/clothing/shoes/roguetown/boots
	H.mind.special_items["Noble Boots"] = /obj/item/clothing/shoes/roguetown/nobleboot
	H.mind.special_items["Short Boots"] = /obj/item/clothing/shoes/roguetown/shortboots
	H.mind.special_items["Riding Boots"] = /obj/item/clothing/shoes/roguetown/ridingboots

	H.mind.special_items["Longcoat"] = /obj/item/clothing/suit/roguetown/armor/longcoat
	H.mind.special_items["Robe"] = /obj/item/clothing/suit/roguetown/shirt/robe
	H.mind.special_items["Formal Silks"] = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	H.mind.special_items["Tunic"] = /obj/item/clothing/suit/roguetown/shirt/tunic
	H.mind.special_items["Dress"] = /obj/item/clothing/suit/roguetown/shirt/dress/gen
	H.mind.special_items["Bar Dress"] = /obj/item/clothing/suit/roguetown/shirt/dress
	H.mind.special_items["Chemise"] = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress
	H.mind.special_items["Eastern Monk Garb"] = /obj/item/clothing/suit/roguetown/shirt/rags/monkgarb
	H.mind.special_items["Kimono"] = /obj/item/clothing/suit/roguetown/shirt/tunic/kimono
	H.mind.special_items["Kamishimo"] = /obj/item/clothing/suit/roguetown/shirt/tunic/kamishimo
	H.mind.special_items["Eastern Tribal Loincloth"] = /obj/item/clothing/under/roguetown/kaizoku/tribal
	H.mind.special_items["Maid Dress"] = /obj/item/clothing/suit/roguetown/shirt/undershirt/maid_dress
	H.mind.special_items["Sexy Dress"] = /obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy
	H.mind.special_items["Strapless Dress"] = /obj/item/clothing/suit/roguetown/shirt/dress/gen/strapless
	H.mind.special_items["Alternate Strapless Dress"] = /obj/item/clothing/suit/roguetown/shirt/dress/gen/strapless/alt
	H.mind.special_items["Leather Vest"] = /obj/item/clothing/suit/roguetown/armor/leather/vest
	H.mind.special_items["Nun's Habit"] = /obj/item/clothing/suit/roguetown/shirt/robe/nun
	H.mind.special_items["Blue Bell Dress"] = /obj/item/clothing/suit/roguetown/shirt/belldress
	H.mind.special_items["Red Bell Dress"] = /obj/item/clothing/suit/roguetown/shirt/belldress/red
	H.mind.special_items["Yellow Bell Dress"] = /obj/item/clothing/suit/roguetown/shirt/belldress/yellow
	H.mind.special_items["Cyan Bell Dress"] = /obj/item/clothing/suit/roguetown/shirt/belldress/cyan
	H.mind.special_items["Purple Bell Dress"] = /obj/item/clothing/suit/roguetown/shirt/belldress/purple
	H.mind.special_items["Black Bell Dress"] = /obj/item/clothing/suit/roguetown/shirt/belldress/black
	H.mind.special_items["Fancy White Dress"] = /obj/item/clothing/suit/roguetown/shirt/belldress/white
	H.mind.special_items["Baroness Dress"] = /obj/item/clothing/suit/roguetown/shirt/belldress/baroness
	H.mind.special_items["Dress Strapped"] = /obj/item/clothing/suit/roguetown/shirt/dress_strapped


	H.mind.special_items["Stockings"] = /obj/item/clothing/under/roguetown/tights/stockings
	H.mind.special_items["Silk Stockings"] = /obj/item/clothing/under/roguetown/tights/stockings/silk
	H.mind.special_items["Fishnet Stockings"] = /obj/item/clothing/under/roguetown/tights/stockings/fishnet
	H.mind.special_items["Loincloth"] = /obj/item/clothing/under/roguetown/loincloth
	H.mind.special_items["Spectacles"] = /obj/item/clothing/mask/rogue/spectacles
	H.mind.special_items["Rag Mask"] = /obj/item/clothing/mask/rogue/ragmask
	H.mind.special_items["Halfmask"] = /obj/item/clothing/mask/rogue/shepherd
	H.mind.special_items["Pipe"] = /obj/item/clothing/mask/cigarette/pipe
	H.mind.special_items["Westman Pipe"] = /obj/item/clothing/mask/cigarette/pipe/westman
	H.mind.special_items["Feather"] = /obj/item/natural/feather
	H.mind.special_items["Battle Skirt"] = /obj/item/clothing/cloak/fauld/battleskirt
	H.mind.special_items["Fauld"] = /obj/item/clothing/cloak/fauld
	H.mind.special_items["Hakama"] = /obj/item/clothing/under/roguetown/tights/hakama
	H.mind.special_items["Eyeband"] = /obj/item/clothing/mask/rogue/kaizoku/eyeband

	H.mind.special_items["Silver Ring"] = /obj/item/clothing/ring/silver
	H.mind.special_items["Gold Ring"] = /obj/item/clothing/ring/gold
	H.mind.special_items["Divine Symbol"] = /obj/item/clothing/neck/roguetown/psicross

	H.mind.special_items["Iron Mask"] = /obj/item/clothing/mask/rogue/facemask
	H.mind.special_items["Iron Coif"] = /obj/item/clothing/neck/roguetown/chaincoif/iron
	H.mind.special_items["Leather Bracers"] = /obj/item/clothing/wrists/roguetown/bracers/leather
	H.mind.special_items["Collar"] = /obj/item/clothing/neck/roguetown/collar
	H.mind.special_items["Bell Collar"] = /obj/item/clothing/neck/roguetown/collar/bell_collar


/datum/quirk/magic_potential
	name = "(Spells) Magical Potential"
	desc = "You being born with magical blood, or learning through books, you know the way of arcane and have your trusty book with you, its more like a old book that you can't really use anymore, need get an actual new one. Precious and valuable, you would kill anyone if they touched this book, by Mystra spectral balls! (Do not pick this if you join a role with magic power, it is buggy.)"
	value = 3

/datum/quirk/magic_potential/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.mind.adjust_skillrank_up_to((/datum/skill/magic/arcane), 2, TRUE)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	H.mind.special_items["Heirloom Magical Book"] = /obj/item/book/granter/spellbook


/datum/quirk/paladin
	name = "(Faith) Paladin Potential"
	desc = "One of the gods favor you and has given you holy potential of a paladin, you have a special ability if you are from the main non-evil pantheon. (Do not pick this if you join a role with faith power, it is buggy.)"
	value = 3

/datum/quirk/paladin/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	H.mind.adjust_skillrank_up_to((/datum/skill/magic/holy), 2, TRUE)
	C.grant_spells_templar(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/quirk/novitae
	name = "(Faith) Neophyte of the Faith"
	desc = "One of the gods favor you and has given you holy potential of a neophyte, you are not as skilled as other people. (Do not pick this if you join a role with faith power or the other quirk. It is buggy)"
	value = 1

/datum/quirk/novitae/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	H.mind.adjust_skillrank_up_to((/datum/skill/magic/holy), 1, TRUE)
	C.grant_spells_churchling(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)



/datum/quirk/nymphomaniac
	name = "(Kinky) Nymphomaniac"
	desc = "My nymphomania does not really helps, it makes me aroused. At least i good on the bed with it"
	value = -3 // this thing really really sucks to have. I watched someone suffer all round with it.

/datum/quirk/nymphomaniac/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.add_curse(/datum/curse/baotha, TRUE)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)




/datum/quirk/hypersensitivity
	name = "(Kinky) Hypersensitivity"
	desc = "I am so senstiive even my pants are enough to constantly arouse me... I must not wear pants or wear things that don't touch my groin. Atleast my experiences with certain things make me good in bed."
	value = -3 // this thing really really sucks to have. I watched someone suffer all round with it.

/datum/quirk/hypersensitivity/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.add_curse(/datum/curse/nympho, TRUE)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)



/datum/quirk/loveless
	name = "(Flaw) Loveless"
	desc = "I am unable to show any kind of affection or love, whether carnal or platonic."
	value = -3

/datum/quirk/loveless/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.add_curse(/datum/curse/eora, TRUE)

/datum/quirk/pacifist
	name = "(Flaw) Pacifist"
	desc = "Violence disgusts me. I cannot bring myself to wield any kind of physical weapon."
	value = -6

/datum/quirk/pacifist/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_PACIFISM, TRAIT_GENERIC)



/datum/quirk/helltalker
	name = "(Language) Knows Hellspeak"
	desc = "I learned to speak hellish in my time here."
	value = 1

/datum/quirk/helltalker/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.grant_language(/datum/language/hellspeak)

/datum/quirk/celestialtalker
	name = "(Language) Knows Celestial"
	desc = "I learned to speak celestial in my time here."
	value = 1

/datum/quirk/celestialtalker/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.grant_language(/datum/language/celestial)

/datum/quirk/draconicspeaker
	name = "(Language) Knows Draconic"
	desc = "I learned to speak Draconic in my time here."
	value = 1

/datum/quirk/draconicspeaker/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.grant_language(/datum/language/draconic)


