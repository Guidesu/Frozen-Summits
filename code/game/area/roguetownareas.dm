GLOBAL_LIST_EMPTY(chosen_music)

GLOBAL_LIST_INIT(roguetown_areas_typecache, typecacheof(/area/rogue/indoors/town,/area/rogue/outdoors/town,/area/rogue/under/town)) //hey

/area/rogue
	name = "frozen summit"
	icon_state = "rogue"
	has_gravity = STANDARD_GRAVITY
	ambientsounds = null
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = TRUE
	power_equip = TRUE
	power_light = TRUE
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	requires_power = FALSE
//	var/previous_ambient = ""
	var/town_area = FALSE
	var/keep_area = FALSE
	var/warden_area = FALSE
	var/underdark_area = FALSE
	var/church_area = FALSE

/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.church_area == TRUE) && HAS_TRAIT(guy, TRAIT_VAMPIRIC_CURSE ) && guy.z == 3 && !guy.has_status_effect(/datum/status_effect/buff/vampnerf)) //vampires
		guy.apply_status_effect(/datum/status_effect/buff/vampnerf)


/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.town_area == TRUE) && HAS_TRAIT(guy, TRAIT_GUARDSMAN) && guy.z == 3 && !guy.has_status_effect(/datum/status_effect/buff/guardbuffone)) //man at arms
		guy.apply_status_effect(/datum/status_effect/buff/guardbuffone)

/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.warden_area == TRUE) && HAS_TRAIT(guy, TRAIT_WOODSMAN) && !guy.has_status_effect(/datum/status_effect/buff/wardenbuff)) // Warden
		guy.apply_status_effect(/datum/status_effect/buff/wardenbuff)

/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.underdark_area == TRUE) && HAS_TRAIT(guy, TRAIT_UNDERDARKLING) && !guy.has_status_effect(/datum/status_effect/buff/underdarkbuff)) // Warden
		guy.apply_status_effect(/datum/status_effect/buff/underdarkbuff)

/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.town_area == TRUE) && HAS_TRAIT(guy, TRAIT_ANTIGUARDSMAN) && guy.z == 3 && !guy.has_status_effect(/datum/status_effect/buff/antiguardbuffone)) //man at arms
		guy.apply_status_effect(/datum/status_effect/buff/antiguardbuffone)

/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.warden_area == TRUE) && HAS_TRAIT(guy, TRAIT_ANTIWOODSMAN) && !guy.has_status_effect(/datum/status_effect/buff/antiwardenbuff)) // Warden
		guy.apply_status_effect(/datum/status_effect/buff/antiwardenbuff)

/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.underdark_area == TRUE) && HAS_TRAIT(guy, TRAIT_ANTIUNDERDARKLING) && !guy.has_status_effect(/datum/status_effect/buff/antiunderdarkbuff)) // Warden
		guy.apply_status_effect(/datum/status_effect/buff/antiunderdarkbuff)

/area/rogue/Entered(mob/living/carbon/human/guy)

	. = ..()
	if((src.keep_area == TRUE) && HAS_TRAIT(guy, TRAIT_KNIGHTSMAN) && guy.z == 3 && !guy.has_status_effect(/datum/status_effect/buff/knightbuff)) //man at arms
		guy.apply_status_effect(/datum/status_effect/buff/knightbuff)

/area/rogue/indoors
	name = "indoors rt"
	icon_state = "indoors"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'
	soundenv = 2
	plane = INDOOR_PLANE
	converted_type = /area/rogue/outdoors



/area/rogue/indoors/banditcamp
	name = "bandit camp indoors"
	droning_sound = 'sound/music/area/banditcamp.ogg'
	droning_sound_dusk = 'sound/music/area/banditcamp.ogg'
	droning_sound_night = 'sound/music/area/banditcamp.ogg'

/area/rogue/indoors/cave
	name = "latejoin cave"
	icon_state = "cave"
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	soundenv = 8

/area/rogue/indoors/cave/late/can_craft_here()
	return FALSE


///// OUTDOORS AREAS //////

/area/rogue/outdoors
	name = "outdoors hamlet"
	icon_state = "outdoors"
	outdoors = TRUE
	ambientrain = RAIN_OUT
//	ambientsounds = list('sound/ambience/wamb.ogg')
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'
	converted_type = /area/rogue/indoors/shelter
	soundenv = 16


/area/rogue/outdoors/banditcamp
	name = "bandit camp outdoors"
	droning_sound = 'sound/music/area/banditcamp.ogg'
	droning_sound_dusk = 'sound/music/area/banditcamp.ogg'
	droning_sound_night = 'sound/music/area/banditcamp.ogg'

/area/rogue/indoors/shelter
	icon_state = "shelter"
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'

/area/rogue/outdoors/mountains
	name = "mountains"
	icon_state = "mountains"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'
	warden_area = TRUE
	soundenv = 17
	converted_type = /area/rogue/indoors/shelter/mountains

/area/rogue/indoors/shelter/mountains
	icon_state = "mountains"
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'

/area/rogue/outdoors/mountains/deception
	name = "deception"
	icon_state = "deception"
	first_time_text = "THE CANYON OF DECEPTION"

/area/rogue/outdoors/mountains/decap
	name = "mt decapitation"
	icon_state = "decap"
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush/hell = 20)
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "MOUNT DECAPITATION"
	ambush_times = list("night","dawn","dusk","day")
	converted_type = /area/rogue/indoors/shelter/mountains/decap
/area/rogue/indoors/shelter/mountains/decap
	icon_state = "decap"
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null


/area/rogue/outdoors/mountains/decap/stepbelow
	name = "mt decapitation inner"
	icon_state = "decap"
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush/hell = 20)
	droning_sound = 'sound/music/area/decap_deeper.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "FIRE MOUNTAIN"
	ambush_times = list("night","dawn","dusk","day")
	converted_type = /area/rogue/indoors/shelter/mountains/decap

/area/rogue/under/underdark
	name = "underdark"
	icon_state = "cave"
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/dungeon2.ogg'
	first_time_text = "THE UNDERDARK"
	underdark_area = TRUE
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/dirt/road,
				/turf/open/floor/rogue/naturalstone)
	ambush_mobs = list(
				/mob/living/carbon/human/species/elf/dark/npc/basic/ambush = 30,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 20,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 5,
				/mob/living/simple_animal/hostile/retaliate/rogue/cavetroll = 5)
	converted_type = /area/rogue/indoors/shelter

/area/rogue/under/underdark/harrowhall
	name = "harrowhall"
	icon_state = "spidercave"
	first_time_text = "HARROWHALL"
	droning_sound = 'sound/music/area/underworlddrone.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1

/area/rogue/under/underdark/dungeon
	name = "underdark dungeon"
	icon_state = "spidercave"
	first_time_text = "THE UNDERDARK"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/dungeon2.ogg'
	converted_type = /area/rogue/indoors/shelter

/area/rogue/outdoors/rtfield
	name = "azure basin"
	icon_state = "rtfield"
	soundenv = 19
	ambush_times = list("night")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 30,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 50)
	first_time_text = "FROZEN FIELDS"
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'
	converted_type = /area/rogue/indoors/shelter/rtfield

/area/rogue/outdoors/crags
	name = "crags"
	icon_state = "rtfield"
	soundenv = 19
	ambush_times = list("night")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 30,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 50)
	first_time_text = "The Mountainous Crags"
	droning_sound = 'sound/ambience/d&d_mountain_01.ogg'
	droning_sound_dusk = 'sound/ambience/d&d_mountain_02.ogg'
	droning_sound_night = 'sound/ambience/d&d_mountain_01.ogg'
	converted_type = /area/rogue/indoors/shelter/rtfield


/area/rogue/indoors/shelter/rtfield
	icon_state = "rtfield"
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'


/area/rogue/outdoors/woods
	name = "wilderness"
	icon_state = "woods"
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/ambience/grove.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/ambience/grove_night.ogg'
	soundenv = 15
	warden_area = TRUE
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 40,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush = 30)
	first_time_text = "THE SOUTHERN WOODS"
	converted_type = /area/rogue/indoors/shelter/woods


/area/rogue/outdoors/shadow_fell
	name = "shadow cursed lands"
	icon_state = "woods"
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/ambience/shadowfell.ogg'
	droning_sound_dusk = null
	droning_sound = 'sound/ambience/shadowfell.ogg'
	soundenv = 15
	warden_area = TRUE
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 40,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush = 30)
	first_time_text = "THE UNSEELIE SWAMPS"


/area/rogue/indoors/shelter/woods
	icon_state = "woods"
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'


/area/rogue/outdoors/river
	name = "river"
	icon_state = "river"
	warden_area = TRUE
	ambientsounds = AMB_RIVERDAY
	ambientnight = AMB_RIVERNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'
	converted_type = /area/rogue/indoors/shelter/woods

/area/rogue/outdoors/bog
	name = "bog"
	icon_state = "bog"
	warden_area = TRUE
	ambientsounds = AMB_BOGDAY
	ambientnight = AMB_BOGNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/bog.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass,
				/turf/open/water)
	//Minotaurs too strong for the lazy amount of places this area covers
	ambush_mobs = list(
				/mob/living/carbon/human/species/skeleton/npc/ambush = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 60,
				/mob/living/simple_animal/hostile/retaliate/rogue/bogtroll = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/spider = 40,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 30)
	first_time_text = "THE TERRORBOG"
	converted_type = /area/rogue/indoors/shelter/bog

/area/rogue/indoors/shelter/bog
	icon_state = "bog"
	droning_sound = 'sound/music/area/bog.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/outdoors/bog/dense
	name = "dense bog"

/area/rogue/outdoors/beach
	name = "coast"
	icon_state = "beach"
	warden_area = TRUE
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'
	converted_type = /area/rogue/under/lake

/area/rogue/outdoors/beach/forest
	name = "coastforest"
	icon_state = "beach"
	icon_state = "woods"
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'
	soundenv = 15
	ambush_times = list("night","dusk")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 30,
				/mob/living/carbon/human/species/human/northern/searaider/ambush = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush/sea = 40)
	first_time_text = "THE NORTHERN RIVER"
	converted_type = /area/rogue/indoors/shelter/woods

//// UNDER AREAS (no indoor rain sound usually)

// these don't get a rain sound because they're underground
/area/rogue/under
	name = "basement"
	icon_state = "under"
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'
	soundenv = 8
	plane = INDOOR_PLANE
	converted_type = /area/rogue/outdoors/exposed
/area/rogue/outdoors/exposed
	icon_state = "exposed"
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'

/area/rogue/under/cave
	name = "cave"
	warden_area = TRUE
	icon_state = "cave"
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 20,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 5)
	converted_type = /area/rogue/outdoors/caves
/area/rogue/outdoors/caves
	icon_state = "caves"
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/cavewet
	name = "cavewet"
	icon_state = "cavewet"
	warden_area = TRUE
	first_time_text = "The Undersea"
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/carbon/human/species/skeleton/npc = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/goblin/npc/sea = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/cavetroll = 15)
	converted_type = /area/rogue/outdoors/caves

/area/rogue/under/cavewet/bogcaves
	first_time_text = "The upper Underdark"

/area/rogue/under/cave/spider
	icon_state = "spider"
	first_time_text = "ARAIGNÉE"
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/spider = 100)
	droning_sound = 'sound/music/area/spidercave.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/spidercave
/area/rogue/outdoors/spidercave
	icon_state = "spidercave"
	droning_sound = 'sound/music/area/spidercave.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/spiderbase
	name = "spiderbase"
	ambientsounds = AMB_BASEMENT
	ambientnight = AMB_BASEMENT
	icon_state = "spiderbase"
	droning_sound = 'sound/music/area/spidercave.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/spidercave
/area/rogue/outdoors/spidercave
	icon_state = "spidercave"
	droning_sound = 'sound/music/area/spidercave.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/cavelava
	name = "cavelava"
	icon_state = "cavelava"
	first_time_text = "MOUNT DECAPITATION"
	ambientsounds = AMB_CAVELAVA
	ambientnight = AMB_CAVELAVA
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/skeleton/npc = 10,
				/mob/living/carbon/human/species/goblin/npc/hell = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 5)
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/decap
/area/rogue/outdoors/exposed/decap
	icon_state = "decap"
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/lake
	name = "underground lake"
	icon_state = "lake"
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_GEN

/area/rogue/under/cave/dungeon1
	name = "smalldungeon1"
	icon_state = "spider"
	droning_sound = 'sound/music/area/dungeon.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1

/area/rogue/under/cave/dragonden
	name = "dragonnest"
	icon_state = "under"
	first_time_text = "DEN OF DRAGONS"
	droning_sound = 'sound/music/area/dragonden.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1

/area/rogue/under/cave/goblinfort
	name = "goblinfort"
	icon_state = "spidercave"
	first_time_text = "GOBLIN FORTRESS"
	droning_sound = 'sound/music/area/dungeon2.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1

/area/rogue/under/cave/scarymaze
	name = "hauntedlabyrinth"
	icon_state = "spidercave"
	first_time_text = "CURSED LABYRINTH"
	droning_sound = 'sound/music/area/dungeon2.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1

/area/rogue/under/cave/undeadmanor
	name = "skelemansion"
	icon_state = "spidercave"
	first_time_text = "ABANDONED MANOR"
	droning_sound = 'sound/music/area/dungeon2.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1

/area/rogue/outdoors/dungeon1
	name = "smalldungeonoutdoors"
	icon_state = "spidercave"
	droning_sound = 'sound/music/area/dungeon.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/cave/mazedungeon
	name = "mazedungeon"
	icon_state = "under"
	first_time_text = "TEMPLE OF THE SHATTERED GOD"
	droning_sound = 'sound/music/area/dungeon2.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1

/area/rogue/under/cave/orcdungeon
	name = "orcdungeon"
	icon_state = "under"
	first_time_text = "OLD RUIN"
	droning_sound = 'sound/music/area/dungeon.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1

/area/rogue/under/cave/dukecourt
	name = "dukedungeon"
	icon_state = "duke"
	first_time_text = "FORGOTTEN COURT"
	droning_sound = 'sound/music/area/dungeon2.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1

//////
/////
////     TOWN AREAS
////
///
//



/area/rogue/indoors/town
	name = "indoors"
	icon_state = "town"
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'
	converted_type = /area/rogue/outdoors/exposed/town
	town_area = TRUE


/area/rogue/outdoors/exposed/town
	icon_state = "town"
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'

/area/rogue/outdoors/exposed/town/keep
	name = "Keep"
	icon_state = "manor"
	droning_sound = 'sound/music/area/manorgarri.ogg'
	keep_area = TRUE
	town_area = TRUE

/area/rogue/indoors/town/manor
	name = "Manor"
	icon_state = "manor"
	droning_sound = 'sound/music/area/manorgarri.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/manorgarri
	first_time_text = "THE MANOR"
	keep_area = TRUE

/area/rogue/outdoors/exposed/manorgarri
	icon_state = "manorgarri"
	droning_sound = 'sound/music/area/manorgarri.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	keep_area = TRUE

/area/rogue/indoors/town/magician
	name = "Wizard's Tower"
	icon_state = "magician"
	spookysounds = SPOOKY_MYSTICAL
	spookynight = SPOOKY_MYSTICAL
	droning_sound = 'sound/music/area/magiciantower.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/magiciantower
	keep_area = TRUE

/area/rogue/outdoors/exposed/magiciantower
	icon_state = "magiciantower"
	droning_sound = 'sound/music/area/magiciantower.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	keep_area = TRUE

/area/rogue/indoors/town/shop
	name = "Shop"
	icon_state = "shop"
	droning_sound = 'sound/music/area/shop.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/shop
/area/rogue/outdoors/exposed/shop
	icon_state = "shop"
	droning_sound = 'sound/music/area/shop.ogg'

/area/rogue/indoors/town/physician
	name = "Physician"
	icon_state = "physician"
	droning_sound = 'sound/music/area/shop.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/bath
	name = "Baths"
	icon_state = "bath"
	droning_sound = 'sound/music/area/bath.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/bath
/area/rogue/outdoors/exposed/bath
	icon_state = "bath"
	droning_sound = 'sound/music/area/bath.ogg'

/area/rogue/indoors/town/garrison
	name = "Garrison"
	icon_state = "garrison"
	droning_sound = 'sound/music/area/manorgarri.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/manorgarri
	keep_area = TRUE

/area/rogue/indoors/town/cell
	name = "dungeon cell"
	icon_state = "cell"
	spookysounds = SPOOKY_DUNGEON
	spookynight = SPOOKY_DUNGEON
	droning_sound = 'sound/music/area/manorgarri.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/manorgarri
	keep_area = TRUE


/area/rogue/indoors/town/tavern
	name = "tavern"
	icon_state = "tavern"
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	droning_sound = 'sound/ambience/barday.ogg'
	droning_sound_dusk = 'sound/ambience/bardusk.ogg'
	droning_sound_night = 'sound/ambience/barnight.ogg'
	converted_type = /area/rogue/outdoors/exposed/tavern

/area/rogue/outdoors/exposed/tavern
	icon_state = "tavern"
	droning_sound = 'sound/music/jukeboxes/tavern1.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/jukeboxes/tavern2.ogg'

/area/rogue/indoors/town/church
	name = "church"
	icon_state = "church"
	droning_sound = 'sound/music/area/church.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/church
	church_area = TRUE
/area/rogue/outdoors/exposed/church
	icon_state = "church"
	droning_sound = 'sound/music/area/church.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	church_area = TRUE
/area/rogue/indoors/town/church/chapel
	icon_state = "chapel"
	first_time_text = "THE HOUSE OF THE PANTHEON"
	church_area = TRUE
/area/rogue/indoors/town/fire_chamber
	name = "incinerator"
	icon_state = "fire_chamber"

/area/rogue/indoors/town/fire_chamber/can_craft_here()
	return FALSE

/area/rogue/indoors/town/warehouse
	name = "dock warehouse import"
	icon_state = "warehouse"

/area/rogue/indoors/town/warehouse/can_craft_here()
	return FALSE

/area/rogue/indoors/town/vault
	name = "vault"
	icon_state = "vault"
	keep_area = TRUE

/area/rogue/indoors/town/vault/can_craft_here()
	return FALSE

/area/rogue/indoors/town/entrance
	first_time_text = "Frozen Summit"
	icon_state = "entrance"

/area/rogue/indoors/town/dwarfin
	name = "dwarven quarter"
	icon_state = "dwarfin"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "The Dwarven Quarter"
	converted_type = /area/rogue/outdoors/exposed/dwarf
/area/rogue/outdoors/exposed/dwarf
	icon_state = "dwarf"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

///// outside

/area/rogue/outdoors/town
	name = "outdoors"
	icon_state = "town"
	soundenv = 16
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'
	converted_type = /area/rogue/indoors/shelter/town
	first_time_text = "THE HAMLET OF FROZEN SUMMIT"
	town_area = TRUE

/area/rogue/indoors/shelter/town
	icon_state = "town"
	droning_sound = 'sound/ambience/cityday.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'


/area/rogue/outdoors/town/sargoth
	name = "outdoors"
	icon_state = "sargoth"
	soundenv = 16
	droning_sound = 'sound/music/area/sargoth.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/indoors/shelter/town/sargoth
	first_time_text = "SARGOTH"
/area/rogue/indoors/shelter/town/sargoth
	icon_state = "sargoth"
	droning_sound = 'sound/music/area/sargoth.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "SARGOTH"

/area/rogue/outdoors/town/roofs
	name = "roofs"
	icon_state = "roofs"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/field.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'
	soundenv = 17
	converted_type = /area/rogue/indoors/shelter/town/roofs

/area/rogue/outdoors/town/roofs/keep
	name = "Keep Rooftops"
	icon_state = "manor"
	keep_area = TRUE
	town_area = TRUE

/area/rogue/indoors/shelter/town/roofs
	icon_state = "roofs"
	droning_sound = 'sound/music/area/field.ogg'
	droning_sound_dusk = 'sound/ambience/citydusk.ogg'
	droning_sound_night = 'sound/ambience/citynight.ogg'

/area/rogue/outdoors/town/dwarf
	name = "dwarven quarter"
	icon_state = "dwarf"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "The Dwarven Quarter"
	soundenv = 16
	converted_type = /area/rogue/indoors/shelter/town/dwarf
/area/rogue/indoors/shelter/town/dwarf
	icon_state = "dwarf"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/// under


/area/rogue/under/town
	name = "basement"
	icon_state = "town"
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/under/town
/area/rogue/outdoors/exposed/under/town
	icon_state = "town"
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/town/sewer
	name = "sewer"
	icon_state = "sewer"
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_RATS
	spookynight = SPOOKY_RATS
	droning_sound = 'sound/music/area/sewers.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambientrain = RAIN_SEWER
	soundenv = 21
	converted_type = /area/rogue/outdoors/exposed/under/sewer
/area/rogue/outdoors/exposed/under/sewer
	icon_state = "sewer"
	droning_sound = 'sound/music/area/sewers.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/town/caverogue
	name = "miningcave (Hamlet)"
	icon_state = "caverogue"
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/exposed/under/caves
/area/rogue/outdoors/exposed/under/caves
	icon_state = "caves"
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/under/town/basement
	name = "basement"
	icon_state = "basement"
	ambientsounds = AMB_BASEMENT
	ambientnight = AMB_BASEMENT
	spookysounds = SPOOKY_DUNGEON
	spookynight = SPOOKY_DUNGEON
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	soundenv = 5
	town_area = TRUE
	converted_type = /area/rogue/outdoors/exposed/under/basement

/area/rogue/under/town/basement/keep
	name = "keep basement"
	icon_state = "basement"
	keep_area = TRUE
	town_area = TRUE

/area/rogue/outdoors/exposed/under/basement
	icon_state = "basement"
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

// underworld
/area/rogue/underworld
	name = "underworld"
	icon_state = "underworld"
	droning_sound = 'sound/music/area/underworlddrone.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "The Forest of Repentence"
