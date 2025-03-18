
/obj/effect/landmark/mapGenerator/rogue/cave
	mapGeneratorType = /datum/mapGenerator/cave
	endTurfX = 128
	endTurfY = 128
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/cave
	modules = list(/datum/mapGeneratorModule/cave,/datum/mapGeneratorModule/cavedirt,/datum/mapGeneratorModule/cavebeach)

/datum/mapGeneratorModule/cave
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt/road,/turf/open/water,/turf/open/floor/rogue/volcanic)
	spawnableAtoms = list(/obj/item/natural/stone = 19,/obj/structure/roguerock=5,/obj/item/natural/rock = 3, /obj/structure/glowshroom = 4)
	allowed_areas = list(/area/rogue/under/cave/spider,/area/rogue/indoors/cave,/area/rogue/under/cavewet,/area/rogue/under/cave,/area/rogue/under/cavelava)

/datum/mapGeneratorModule/cavedirt
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	spawnableAtoms = list(/obj/structure/flora/rogueshroom=20,/obj/structure/roguerock=20,/obj/structure/flora/roguegrass = 14,/obj/structure/closet/dirthole/closed/loot=6,/obj/item/natural/stone = 24,/obj/item/natural/rock = 8, /obj/structure/glowshroom = 10)
	allowed_areas = list(/area/rogue/under/cave/spider,/area/rogue/indoors/cave,/area/rogue/under/cavewet,/area/rogue/under/cave,/area/rogue/under/cavelava,/area/rogue/under/underdark
)

/datum/mapGeneratorModule/cavebeach
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/water/ocean)
	spawnableAtoms = list(/obj/structure/roguerock=20, /obj/structure/glowshroom = 3)
	allowed_areas = list(/area/rogue/outdoors/beach)

/obj/effect/landmark/mapGenerator/rogue/cave/lava
	mapGeneratorType = /datum/mapGenerator/cave/lava

/datum/mapGenerator/cave/lava
	modules = list(/datum/mapGeneratorModule/cave,/datum/mapGeneratorModule/cavedirt/lava)

/datum/mapGeneratorModule/cavedirt/lava
	spawnableTurfs = list(/turf/open/lava=2,/turf/open/floor/rogue/dirt/road=30)


/obj/effect/landmark/mapGenerator/rogue/cave/spider
	mapGeneratorType = /datum/mapGenerator/cave/spider
	endTurfX = 64
	endTurfY = 64
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/cave/spider
	modules = list(/datum/mapGeneratorModule/cavespider,/datum/mapGeneratorModule/cave,/datum/mapGeneratorModule/cavedirt)

/datum/mapGeneratorModule/cavespider
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	spawnableAtoms = list(/obj/structure/spider/stickyweb=10)
	allowed_areas = list(/area/rogue/under/cave/spider)

// Underdark

/obj/effect/landmark/mapGenerator/rogue/underdark
	mapGeneratorType = /datum/mapGenerator/underdark
	endTurfX = 200
	endTurfY = 200
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/underdark
	modules = list(/datum/mapGeneratorModule/underdark)

/datum/mapGeneratorModule/underdark
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt,/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(
		/obj/item/natural/stone = 10,
		/obj/structure/roguerock = 5,
		/obj/structure/flora/rogueshroom = 20,
		/obj/structure/flora/rogueshroom/big = 10,
		/obj/structure/flora/roguegrass = 15,
		/obj/structure/closet/dirthole/closed/loot = 10,
		/obj/item/natural/rock = 3,
		/obj/item/natural/artifact = 2,
		/obj/structure/leyline = 2,
		/obj/structure/voidstoneobelisk = 2,
		/obj/structure/glowshroom = 5,
		/obj/structure/flora/roguegrass/herb/underdark/random = 25)
	allowed_areas = list(/area/rogue/under/underdark)

/* /datum/mapGeneratorModule/underdarkwater // Doesnt work, somehow.
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/water/river,/turf/open/water/cleanshallow,/turf/open/water/swamp)
	spawnableAtoms = list(
		/obj/structure/flora/roguegrass/herb/waterorb = 25)
	allowed_areas = list(/area/rogue/under/underdark)
 */
