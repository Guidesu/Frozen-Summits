
/// WOOD

/datum/crafting_recipe/roguetown/turfs/woodfloor
	name = "rustic wooden floor"
	result = /turf/open/floor/rogue/ruinedwood
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/woodfloor/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/woodplatform
	name = "wooden platform"
	result = /turf/open/floor/rogue/ruinedwood/platform
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/woodplatform/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/transparent/openspace))
		if(!istype(T, /turf/open/water))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/woodwall
	name = "wooden wall"
	result = /turf/closed/wall/mineral/rogue/wood
	reqs = list(/obj/item/natural/plank = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/woodwall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/fancywwall
	name = "fancy wooden wall"
	result = /turf/closed/wall/mineral/rogue/decowood
	reqs = list(/obj/item/natural/plank = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/fancywwall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/woodwindow
	name = "wooden murder hole"
	result = /turf/closed/wall/mineral/rogue/wood/window
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/woodwindow/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/woodfloorplank
	name = "wooden floor"
	result = /turf/open/floor/rogue/ruinedwood/spiral
	reqs = list(/obj/item/natural/plank = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/woodfloorplank/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue/dirt))
		if(!istype(T, /turf/open/transparent/openspace))
			if(!istype(T, /turf/open/floor/rogue/grass))
				return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/woodfloorchevron
	name = "patterned wooden floor"
	result = /turf/open/floor/rogue/ruinedwood/spiral
	reqs = list(/obj/item/natural/plankshort = 2)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/woodfloorchevron/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue/dirt))
		if(!istype(T, /turf/open/transparent/openspace))
			if(!istype(T, /turf/open/floor/rogue/grass))
				return
	return TRUE

/// STONE

/datum/crafting_recipe/roguetown/turfs/stonefloor
	name = "rustic stone floor"
	result = /turf/open/floor/rogue/cobble
	reqs = list(/obj/item/natural/stone = 1)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/stonefloor/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stoneplatform
	name = "stone platform"
	result = /turf/open/floor/rogue/blocks/platform
	reqs = list(/obj/item/natural/stone = 1,
				/obj/item/natural/fibers = 1)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/stoneplatform/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/transparent/openspace))
		if(!istype(T, /turf/open/water))
			return
		if(!istype(T, /turf/open/lava))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stoneblockfloor
	name = "block floor"
	result = /turf/open/floor/rogue/blocks
	reqs = list(/obj/item/natural/stoneblock = 1)
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/stoneblockfloor/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue/dirt))
		if(!istype(T, /turf/open/transparent/openspace))
			if(!istype(T, /turf/open/floor/rogue/grass))
				return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stoneherring
	name = "herringstone floor"
	result = /turf/open/floor/rogue/herringbone
	reqs = list(/obj/item/natural/stoneblock = 1)
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stoneherring/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue/dirt))
		if(!istype(T, /turf/open/transparent/openspace))
			if(!istype(T, /turf/open/floor/rogue/grass))
				return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stonewall
	name = "stone wall"
	result = /turf/closed/wall/mineral/rogue/stone
	reqs = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stonewall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/fancyswall
	name = "fancy stone wall"
	result = /turf/closed/wall/mineral/rogue/decostone
	reqs = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/fancyswall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/craftstone
	name = "craftstone wall"
	result = /turf/closed/wall/mineral/rogue/craftstone
	reqs = list(/obj/item/natural/stone = 3)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 4

/datum/crafting_recipe/roguetown/turfs/fancyswall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stonewindow
	name = "stone murder hole"
	result = /turf/closed/wall/mineral/rogue/stone/window
	reqs = list(/obj/item/natural/stoneblock = 2)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stonewindow/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

//fancier walls
/datum/crafting_recipe/roguetown/turfs/stonewallcraft
	name = "fancy stone block wall"
	result = /turf/closed/wall/mineral/rogue/craftstone
	reqs = list(/obj/item/natural/stoneblock = 3)
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stonewallcraft/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stonewallbrick
	name = "stone brick wall"
	result = /turf/closed/wall/mineral/rogue/stonebrick
	reqs = list(/obj/item/natural/stoneblock = 3)
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stonewallbrick/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/// WINDOWS

/datum/crafting_recipe/roguetown/turfs/roguewindow
	name = "wooden window"
	result = /obj/structure/roguewindow
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	craftsound = 'sound/foley/Building-01.ogg'
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/fancywindow/openclose
	name = "fancy window"
	result = /obj/structure/roguewindow/openclose
	reqs = list(
	  /obj/item/grown/log/tree/small = 2,
	  /obj/item/natural/stone = 1,
	  /obj/item/ash = 1,
	  /obj/item/natural/dirtclod = 1,
	)
	skillcraft = /datum/skill/craft/carpentry
	craftsound = 'sound/foley/Building-01.ogg'
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/reinforcedwindow/openclose
	name = "reinforced window"
	result = /obj/structure/roguewindow/openclose/reinforced
	reqs = list(
	  /obj/item/grown/log/tree/small = 2,
	  /obj/item/ingot/iron = 1,
	  /obj/item/ash = 1,
	  /obj/item/natural/dirtclod = 1,
	)
	skillcraft = /datum/skill/craft/blacksmithing
	craftsound = 'sound/items/bsmith1.ogg'
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 2

/// HAY, TWIG AND TENT

/datum/crafting_recipe/roguetown/turfs/hay
	name = "hay"
	result = /turf/open/floor/rogue/hay
	reqs = list(/obj/item/natural/chaff/wheat = 2)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "assemble"
	verbage = "assembles"
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/twig
	name = "twig floor"
	result = /turf/open/floor/rogue/twig
	reqs = list(/obj/item/grown/log/tree/stick = 2)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "assemble"
	verbage = "assembles"
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/twig/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue/dirt))
		if(!(istype(T, /turf/open/floor/rogue/grass) || istype(T, /turf/open/floor/rogue/grassred) || istype(T, /turf/open/floor/rogue/grassyel) || istype(T, /turf/open/floor/rogue/grasscold)))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/twigplatform
	name = "twig platform"
	result = /turf/open/floor/rogue/twig/platform
	reqs = list(/obj/item/grown/log/tree/stick = 3)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "assemble"
	verbage = "assembles"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/twigplatform/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/transparent/openspace))
		if(!istype(T, /turf/open/water))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/roofs
	name = "rooftop"
	result = /turf/open/floor/rogue/rooftop
	reqs = list(/obj/item/grown/log/tree/stick = 2)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "assemble"
	verbage = "assembles"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/roofs/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/transparent/openspace))
		if(!istype(T, /turf/open/water))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/tentwall
	name = "tent wall"
	result = /turf/closed/wall/mineral/rogue/tent
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/cloth = 1)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "set up"
	verbage = "sets up"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/tentwall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/tentdoor
	name = "tent door"
	result = /obj/structure/roguetent
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/cloth = 1)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "set up"
	verbage = "sets up"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/tentdoor/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return ..()

//Abyssariad Walls.
//Tier 'Plank' Abyssariad wall. Making a rough counterpart later.
/*
/datum/crafting_recipe/roguetown/turfs/woodwall/abyssal
	name = "wagoya joinwall"
	result = /turf/closed/wall/mineral/rogue/wood/abyssal
	reqs = list(/obj/item/natural/plank = 2)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/woodwindow/abyssal
	name = "wagoya murderhole"
	result = /turf/closed/wall/mineral/rogue/wood/abyssal/window
	reqs = list(/obj/item/natural/plank = 2)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 1
*/
//Abyssariad Walls.
//Tier 'Stone' Abyssariad wall. Making a Stoneblock counterpart later.

/datum/crafting_recipe/roguetown/turfs/stonewall/abyssal
	name = "ishigaki wall"
	result = /turf/closed/wall/mineral/rogue/stone
	reqs = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/stonewindow/abyssal
	name = "ishigaki murderhole"
	result = /turf/closed/wall/mineral/rogue/stone/window
	reqs = list(/obj/item/natural/stoneblock = 2)
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 1
