/datum/crafting_recipe/roguetown/arcana
	structurecraft = /obj/effect/roguerune
	subtype_reqs = TRUE
	skillcraft = /datum/skill/magic/arcane

/datum/crafting_recipe/roguetown/arcana/bag_of_holding
	name = "bag of holding"
	result = /obj/item/storage/backpack/rogue/bag_of_holding
	reqs = list(/obj/item/storage/backpack/rogue/backpack = 1,
				/obj/item/rogueore/mithral = 1,
				/obj/item/rogueore/gold = 1,
				/obj/item/roguegem = 1)
	tools = list(/obj/item/needle)
	verbage_simple = "enchant"
	verbage = "enchants"
	craftdiff = 4
