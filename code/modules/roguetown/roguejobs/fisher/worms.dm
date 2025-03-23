/obj/item
	var/baitchance = 0
	var/baitpenalty = 100 // Using this as bait will incurr a penalty to fishing chance. 100 makes it useless as bait. Lower values are better, but Never make it past 10.
	var/isbait = FALSE	// Is the item in question bait to be used?
	var/list/freshfishloot = null
	var/list/seafishloot = null
	var/list/mudfishloot = null
	var/list/fishloot = null
	var/list/cageloot = null
/obj/item/natural/worms
	name = "worm"
	desc = "The favorite bait of the courageous fishermen who venture these dark waters."
	icon_state = "worm1"
	throwforce = 10
	baitpenalty = 10
	baitchance = 75
	isbait = TRUE
	color = "#985544"
	w_class = WEIGHT_CLASS_TINY
	freshfishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/carp = 225,
		/obj/item/reagent_containers/food/snacks/fish/sunny = 325,
		/obj/item/reagent_containers/food/snacks/fish/salmon = 190,
		/obj/item/reagent_containers/food/snacks/fish/eel = 140,
		/obj/item/grown/log/tree/stick = 3,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/natural/cloth = 1,
		/obj/item/ammo_casing/caseless/rogue/arrow = 1,
		/obj/item/clothing/ring/gold = 1,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //That's not a fish...?
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 1,
		/obj/item/reagent_containers/glass/bottle/rogue = 1,	
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 20,			
	)
	seafishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/cod = 190,
		/obj/item/reagent_containers/food/snacks/fish/plaice = 210,
		/obj/item/reagent_containers/food/snacks/fish/sole = 340,
		/obj/item/reagent_containers/food/snacks/fish/angler = 140,
		/obj/item/reagent_containers/food/snacks/fish/lobster = 150,
		/obj/item/reagent_containers/food/snacks/fish/bass = 210,
		/obj/item/reagent_containers/food/snacks/fish/clam = 40,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 20,
		/obj/item/grown/log/tree/stick = 3,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/natural/cloth = 1,
		/obj/item/ammo_casing/caseless/rogue/arrow = 1,
		/obj/item/clothing/ring/gold = 1,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //That's not a fish...?
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 1,
		/obj/item/reagent_containers/glass/bottle/rogue = 1,	
		/mob/living/carbon/human/species/goblin/npc/sea = 25,
	)
	mudfishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/mudskipper = 200,
		/obj/item/natural/worms/leech = 50,
		/obj/item/clothing/ring/gold = 1,
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 25,				
	)	
	cageloot = list(/obj/item/trash/applecore = 50,
					/obj/item/grown/log/tree/stick = 2, //Single stick
					/obj/item/reagent_containers/food/snacks/fish/oyster = 214,
					/obj/item/reagent_containers/food/snacks/fish/shrimp = 214,
					/obj/item/reagent_containers/food/snacks/fish/crab = 214,
					/obj/item/reagent_containers/food/snacks/fish/lobster = 214,
					/obj/item/natural/bundle/stick = 15, //Bundle of sticks
					/obj/item/natural/stone = 30, //Easy for stones to trigger the traps accidentally
					/obj/item/clothing/head/roguetown/helmet/tricorn = 15,
					/obj/item/clothing/head/roguetown/helmet/bandana = 15,
					/obj/item/clothing/head/roguetown/roguehood = 15,
					/obj/item/clothing/under/roguetown/loincloth/brown = 15,
					/obj/item/clothing/shoes/roguetown/sandals = 15,
					/obj/item/clothing/shoes/roguetown/simpleshoes = 15,
					/obj/item/clothing/gloves/roguetown/fingerless = 15,
					/obj/item/clothing/gloves/roguetown/leather = 15,
					/obj/item/reagent_containers/syringe = 1, //These are terrifyingly powerful.
					/obj/item/reagent_containers/glass/cup/wooden = 27,
					/obj/item/ammo_casing/caseless/rogue/arrow = 35,
					/obj/item/customlock = 35,
					/obj/item/storage/belt/rogue/pouch/coins/poor = 25,
					/obj/item/shard = 1, //Bait is smaller
					/obj/item/natural/cloth = 15,
					/obj/item/kitchen/spoon = 1,
					/obj/item/restraints/legcuffs/beartrap = 25,
					/obj/item/clothing/ring/copper = 35, //lowered chance of rings, too small to trigger a trap reliably, but still here for gacha
					/obj/item/clothing/ring/topazc = 10,
					/obj/item/clothing/ring/emeraldc = 10,
					/obj/item/clothing/ring/sapphirec = 10,
					/obj/item/clothing/ring/silver = 15,
					/obj/item/clothing/ring/topazs = 3,
					/obj/item/clothing/ring/emeralds = 3
	)
	drop_sound = 'sound/foley/dropsound/food_drop.ogg'
	var/amt = 1

/obj/item/natural/worms/grubs
	name = "grub"
	desc = "Bait for the desperate, or the daring."
	baitpenalty = 5
	baitchance = 100
	isbait = TRUE
	color = null
	freshfishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/carp = 200,
		/obj/item/reagent_containers/food/snacks/fish/sunny = 305,
		/obj/item/reagent_containers/food/snacks/fish/salmon = 210,
		/obj/item/reagent_containers/food/snacks/fish/eel = 160,
		/obj/item/grown/log/tree/stick = 3,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/natural/cloth = 1,
		/obj/item/ammo_casing/caseless/rogue/arrow = 1,
		/obj/item/clothing/ring/gold = 1,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //That's not a fish...?
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 1,
		/obj/item/reagent_containers/glass/bottle/rogue = 1,
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 20,				
	)
	seafishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/cod = 230,
		/obj/item/reagent_containers/food/snacks/fish/plaice = 180,
		/obj/item/reagent_containers/food/snacks/fish/sole = 250,
		/obj/item/reagent_containers/food/snacks/fish/angler = 170,
		/obj/item/reagent_containers/food/snacks/fish/lobster = 180,
		/obj/item/reagent_containers/food/snacks/fish/bass = 230,
		/obj/item/reagent_containers/food/snacks/fish/clam = 50,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 40,
		/obj/item/grown/log/tree/stick = 3,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/natural/cloth = 1,
		/obj/item/ammo_casing/caseless/rogue/arrow = 1,
		/obj/item/clothing/ring/gold = 1,
		/obj/item/reagent_containers/food/snacks/smallrat = 1, //That's not a fish...?
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 1,
		/obj/item/reagent_containers/glass/bottle/rogue = 1,		
		/mob/living/carbon/human/species/goblin/npc/sea = 25,

	)
	mudfishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/mudskipper = 200,
		/obj/item/natural/worms/leech = 50,
		/obj/item/clothing/ring/gold = 1,
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 25,				
	)	
	cageloot = list(/obj/item/trash/applecore = 325, //Lowering it since putting a trap up and waiting for it is significantly more time consuming
		/obj/item/reagent_containers/food/snacks/fish/oyster = 214,
		/obj/item/reagent_containers/food/snacks/fish/shrimp = 214,
		/obj/item/reagent_containers/food/snacks/fish/crab = 214,
		/obj/item/reagent_containers/food/snacks/fish/lobster = 214,
		/obj/item/natural/bundle/stick = 214,
		/obj/item/natural/stone = 214,
		/obj/item/clothing/head/roguetown/helmet/tricorn = 35,
		/obj/item/clothing/head/roguetown/helmet/bandana = 35,
		/obj/item/clothing/head/roguetown/roguehood = 35,
		/obj/item/clothing/under/roguetown/loincloth/brown = 35,
		/obj/item/clothing/shoes/roguetown/sandals = 35,
		/obj/item/clothing/shoes/roguetown/simpleshoes = 35,
		/obj/item/clothing/gloves/roguetown/fingerless = 35,
		/obj/item/clothing/gloves/roguetown/leather = 35,
		/obj/item/reagent_containers/syringe = 1,
		/obj/item/reagent_containers/glass/cup/wooden = 45,
		/obj/projectile/bullet/reusable/bolt = 30,
		/obj/item/ammo_casing/caseless/rogue/arrow = 30,
		/obj/item/customlock = 30,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 45,
		/obj/item/kitchen/spoon = 15,
		/obj/item/restraints/legcuffs/beartrap = 45,
		/obj/item/clothing/ring/copper = 20,
		/obj/item/clothing/ring/topazc = 3,
		/obj/item/clothing/ring/emeraldc = 2,
		/obj/item/clothing/ring/sapphirec = 2,
		/obj/item/clothing/ring/silver = 10,
		/obj/item/clothing/ring/topazs = 2,
		/obj/item/clothing/ring/emeralds = 2
	)
/obj/item/natural/worms/grubs/attack_right(mob/user)
	return

/obj/item/natural/worms/Initialize()
	. = ..()
	dir = rand(0,8)
