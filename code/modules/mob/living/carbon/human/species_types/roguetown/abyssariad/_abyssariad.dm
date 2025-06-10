/mob/living/carbon/human/species/abyssariad
	race = /datum/species/abyssariad

/datum/species/abyssariad
	name = "foglander"
	id = "abyssariad"
	max_age = 1250 //The year Abyssariads have been created by Abyssor.
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT

/datum/species/abyssariad/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/abyssal)
	C.cmode_music = list('sound/music/kaizoku/combat/combat_changeling.ogg','sound/music/kaizoku/combat/combat_stormwarrior.ogg','sound/music/kaizoku/combat/combat_searaider.ogg','sound/music/kaizoku/combat/combat_oldtides.ogg','sound/music/kaizoku/combat/combat_decapitator.ogg','sound/music/kaizoku/combat/combat_emperor.ogg','sound/music/kaizoku/combat/combat_traditional.ogg','sound/music/kaizoku/combat/combat_navalretainers.ogg','sound/music/kaizoku/combat/combat_kyudo.ogg')


///mob/proc/banzai() //Don't have female 'Banzai' yells for that.
//	set name = "Banzai"
//	set category = "Noises"
//	emote("banzai")

/mob/proc/yoo()
	set name = "Yoo"
	set category = "Noises"
	emote("yoo")

/mob/proc/throatsing()
	set name = "Throatsing"
	set category = "Noises"
	emote("throatsing")

/mob/proc/birdcall()
	set name = "Birdcall"
	set category = "Noises"
	emote("birdcall")

/datum/species/abyssariad/after_creation(mob/living/carbon/C)
	..()
//	if(!C.has_language(/datum/language/abyssal))
	C.grant_language(/datum/language/abyssal)
	to_chat(C, "<span class='info'>I can speak Abyssal with ,j before my speech.</span>")

/datum/species/abyssariad/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/abyssal)

/datum/species/abyssariad/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/abyssariad/get_skin_list()
	return sortList(list(
	"skin1" = "ffe0d1",
	"skin2" = "fcccb3"
	))


/datum/species/abyssariad/get_hairc_list()
	return sortList(list(
	"black - nightsky" = "0a0707",
	"brown - treebark" = "362e25",
	"blonde - moonlight" = "dfc999",
	"red - autumn" = "a34332"
	))

/proc/clanfication(mob/living/carbon/human/H)
	var/index = findtext(H.real_name, " Clanless") //Find 'Clanless' where an 'Clanless' makes no sense to  exist.
	if(index)
		var/original_first_name = copytext(H.real_name, 1, index) //First name extraction.
		var/new_surname = H.dna.species.random_surname() //Generation of a generic clan surname for RP purposes.
		var/new_full_name = "[original_first_name][new_surname]" //Creates a new full name. "Firstname of Surname clan"
		H.change_name(new_full_name) //Applies the name.
		testing("[H.real_name] has been reassigned a surname: [new_full_name]") //Debuglog for information. Sometimes "(name) the of (surname) happens and I'M FUGGING GOING INSANE."

/datum/crafting_recipe/reinforcedarmor //3-tier,  medium armor. Requires troll horns.
	name = "Reinforced Tribal Armor"
	time = 8 SECONDS
	reqs = list(/obj/item/alch/bone = 5, /obj/item/alch/sinew = 2, /obj/item/natural/hide = 3, /obj/item/alch/horn = 1)
	result = /obj/item/clothing/suit/roguetown/armor/ceramic/reinforced
	category = CAT_NONE

/datum/crafting_recipe/reinforcedhelmet //3-tier, medium armor. Requires troll horns.
	name = "Reinforced Tribal Helmet"
	time = 8 SECONDS
	reqs = list(/obj/item/alch/bone = 3, /obj/item/alch/sinew = 2, /obj/item/natural/hide = 2, /obj/item/alch/horn = 1) //Costs less since it is a helmet. Still requires troll horns.
	result = /obj/item/clothing/head/roguetown/helmet/ceramic/reinforced
	category = CAT_NONE

/datum/crafting_recipe/mediumhelmet //2-tiers, medium armor. The materials can be adquired naturally by butchering.
	name = "Medium Tribal helmet"
	time = 4 SECONDS
	reqs = list(/obj/item/alch/bone = 2, /obj/item/alch/sinew = 1, /obj/item/natural/hide = 1, /obj/item/natural/cloth = 4)
	result = /obj/item/clothing/head/roguetown/helmet/ceramic/medium
	category = CAT_NONE


/datum/crafting_recipe/lighthelmet //1-tiers, light armor. The materials can be adquired naturally by butchering.
	name = "Light Tribal Helmet"
	time = 4 SECONDS
	reqs = list(/obj/item/alch/bone = 1, /obj/item/natural/cloth = 4)
	result = /obj/item/clothing/head/roguetown/helmet/ceramic
	category = CAT_NONE

/datum/crafting_recipe/lightarmor //1-tier, light armor. The materials can be adquired naturally by butchering.
	name = "Light Tribal Armor"
	time = 4 SECONDS
	reqs = list(/obj/item/alch/bone = 2, /obj/item/natural/cloth = 4)
	result = /obj/item/clothing/suit/roguetown/armor/ceramic/light
	category = CAT_NONE
/*
/datum/crafting_recipe/obsidian_club
	name = "Obsidian Club"
	time = 4 SECONDS
	reqs = list(/obj/item/grown/log/tree/lumber = 1, /obj/item/natural/stone =  4, /obj/item/ash = 1)
	result = /obj/item/rogueweapon/mace/ararebo/obsidian
	category = CAT_NONE

/datum/crafting_recipe/obsidian_spear
	name = "Obsidian Spear"
	time = 4 SECONDS
	reqs = list(/obj/item/grown/log/tree/lumber = 1, /obj/item/natural/cloth = 1, /obj/item/natural/stone =  2, /obj/item/ash = 1)
	result = /obj/item/rogueweapon/polearm/spear/stone/obsidian
	category = CAT_NONE
*/
