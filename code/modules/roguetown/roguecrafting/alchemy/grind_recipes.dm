/datum/alch_grind_recipe
	var/picky = TRUE // if TRUE: the item path MUST MATCH, and cannot be a subtype.
	var/valid_input = null //the typepath that, when ground, makes an output
	var/list/valid_outputs = list() //List of [Itempath = amnt?1] to be created always
	var/list/bonus_chance_outputs = list() //List of [Itempath = chance/100] to create sometimes.

/datum/alch_grind_recipe/meat //More chance at extra Sinew
	valid_input = /obj/item/reagent_containers/food/snacks/rogue/meat/steak
	valid_outputs = list(/obj/item/alch/sinew = 1)
	bonus_chance_outputs = list(/obj/item/alch/sinew = 50,/obj/item/alch/viscera = 25)

/datum/alch_grind_recipe/chickencutlet //More chance at extra Viscera
	valid_input = /obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet
	valid_outputs = list(/obj/item/alch/sinew = 1)
	bonus_chance_outputs = list(/obj/item/alch/sinew = 25,/obj/item/alch/viscera = 50)

/datum/alch_grind_recipe/fishmince //Chance at intact tail bone
	valid_input = /obj/item/reagent_containers/food/snacks/rogue/meat/mince/fish
	valid_outputs = list(/obj/item/alch/viscera = 1)
	bonus_chance_outputs = list(/obj/item/alch/sinew = 25,/obj/item/alch/bone = 50)

/datum/alch_grind_recipe/sinew
	valid_input = /obj/item/alch/sinew
	valid_outputs = list(/obj/item/alch/viscera = 1)
	bonus_chance_outputs = list(/obj/item/alch/viscera = 75)

//Runes -> dust
/datum/alch_grind_recipe/fire_rune
	valid_input = /obj/item/rune/spell/fire_rune
	valid_outputs = list(/obj/item/alch/firedust = 2)
	bonus_chance_outputs = list(/obj/item/alch/firedust = 33)

/datum/alch_grind_recipe/water_rune
	valid_input = /obj/item/rune/spell/water_rune
	valid_outputs = list(/obj/item/alch/waterdust = 2)
	bonus_chance_outputs = list(/obj/item/alch/waterdust = 33)

/datum/alch_grind_recipe/air_rune
	valid_input = /obj/item/rune/spell/air_rune
	valid_outputs = list(/obj/item/alch/airdust = 2)
	bonus_chance_outputs = list(/obj/item/alch/airdust = 33)

/datum/alch_grind_recipe/earth_rune
	valid_input = /obj/item/rune/spell/earth_rune
	valid_outputs = list(/obj/item/alch/earthdust = 2)
	bonus_chance_outputs = list(/obj/item/alch/earthdust = 33)

/datum/alch_grind_recipe/blank_rune
	valid_input = /obj/item/rune/spell/blank_rune
	valid_outputs = list(/obj/item/alch/runedust = 2)
	bonus_chance_outputs = list(/obj/item/alch/runedust = 33)

//Objects -> dusts
/datum/alch_grind_recipe/crow //Dunno who was high enough to make a wild animal only give airdust when grinded, but I fixed it. - Blue
	valid_input = /obj/item/reagent_containers/food/snacks/crow
	valid_outputs = list(/obj/item/alch/viscera = 1)
	bonus_chance_outputs = list(/obj/item/alch/airdust = 33,/obj/item/alch/sinew = 25)

/datum/alch_grind_recipe/nbone
	valid_input = /obj/item/natural/bone
	valid_outputs = list( /obj/item/alch/bonemeal = 2)
	bonus_chance_outputs = list(/obj/item/alch/bonemeal = 50)

/datum/alch_grind_recipe/bone
	valid_input = /obj/item/alch/bone
	valid_outputs = list( /obj/item/alch/bonemeal = 2)
	bonus_chance_outputs = list(/obj/item/alch/bonemeal = 50)

/datum/alch_grind_recipe/horn
	valid_input = /obj/item/alch/horn
	valid_outputs = list(/obj/item/alch/earthdust = 1,/obj/item/alch/bonemeal = 2)
	bonus_chance_outputs = list(/obj/item/alch/earthdust = 66)

/datum/alch_grind_recipe/fish
	picky = FALSE
	valid_input = /obj/item/reagent_containers/food/snacks/fish
	valid_outputs = list(/obj/item/alch/waterdust = 1)
	bonus_chance_outputs = list(/obj/item/alch/bonemeal = 50)

/datum/alch_grind_recipe/swampweed
	valid_input = /obj/item/reagent_containers/food/snacks/grown/rogue/sweetleaf
	valid_outputs = list(/obj/item/alch/swampdust = 1)
	bonus_chance_outputs = list(/obj/item/alch/earthdust = 33)

/datum/alch_grind_recipe/swampweed_dried
	valid_input = /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry
	valid_outputs = list(/obj/item/alch/swampdust = 1)
	bonus_chance_outputs = list(/obj/item/alch/earthdust = 50,/obj/item/alch/swampdust = 50)

/datum/alch_grind_recipe/westleach
	valid_input = /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed
	valid_outputs = list(/obj/item/alch/tobaccodust = 1)
	bonus_chance_outputs = list(/obj/item/alch/airdust = 33)

/datum/alch_grind_recipe/dry_westleach
	valid_input = /obj/item/reagent_containers/food/snacks/grown/rogue/sweetleafdry
	valid_outputs = list(/obj/item/alch/tobaccodust = 1)
	bonus_chance_outputs = list(/obj/item/alch/airdust = 50,/obj/item/alch/tobaccodust = 50)

/datum/alch_grind_recipe/fyritius
	valid_input = /obj/item/reagent_containers/food/snacks/grown/rogue/fyritius
	valid_outputs = list(/obj/item/alch/firedust = 1)

/datum/alch_grind_recipe/poppy
	valid_input = /obj/item/reagent_containers/food/snacks/grown/rogue/poppy
	valid_outputs = list(/obj/item/reagent_containers/powder/ozium = 1)
	bonus_chance_outputs = list(/obj/item/alch/airdust =33,/obj/item/alch/earthdust = 33)

/datum/alch_grind_recipe/seeds
	picky = FALSE
	valid_input = /obj/item/seeds
	valid_outputs = list(/obj/item/alch/seeddust = 1)
	bonus_chance_outputs = list(/obj/item/alch/airdust =25,/obj/item/alch/earthdust = 25)

/datum/alch_grind_recipe/seedsherb
	picky = FALSE
	valid_input = /obj/item/herbseed
	valid_outputs = list(/obj/item/alch/seeddust = 1)
	bonus_chance_outputs = list(/obj/item/alch/airdust =25,/obj/item/alch/earthdust = 25)

/datum/alch_grind_recipe/ozium
	valid_input = /obj/item/reagent_containers/powder/ozium
	valid_outputs = list(/obj/item/alch/ozium = 1)
	bonus_chance_outputs = list(/obj/item/alch/airdust =25,/obj/item/alch/ozium = 25)

//Ores -> dust
/datum/alch_grind_recipe/gold_ore
	valid_input = /obj/item/rogueore/gold
	valid_outputs = list(/obj/item/alch/golddust = 1)
	bonus_chance_outputs = list(/obj/item/alch/golddust = 33)

/datum/alch_grind_recipe/silver_ore
	valid_input = /obj/item/rogueore/silver
	valid_outputs = list(/obj/item/alch/silverdust = 1)
	bonus_chance_outputs = list(/obj/item/alch/silverdust = 33)

/datum/alch_grind_recipe/iron_ore
	valid_input = /obj/item/rogueore/iron
	valid_outputs = list(/obj/item/alch/irondust = 1)
	bonus_chance_outputs = list(/obj/item/alch/irondust = 33)

/datum/alch_grind_recipe/copper_ore
	valid_input = /obj/item/rogueore/copper
	valid_outputs = list(/obj/item/alch/copperdust = 1)
	bonus_chance_outputs = list(/obj/item/alch/copperdust = 33)

/datum/alch_grind_recipe/coal_ore
	valid_input = /obj/item/rogueore/coal
	valid_outputs = list(/obj/item/alch/coaldust = 1)
	bonus_chance_outputs = list(/obj/item/alch/coaldust = 33)

/datum/alch_grind_recipe/nrock
	valid_input = /obj/item/natural/stone
	valid_outputs = list(/obj/item/alch/rocksalt = 1)
	bonus_chance_outputs = list(/obj/item/alch/rocksalt = 20)

/datum/alch_grind_recipe/gold_bar
	valid_input = /obj/item/ingot/gold
	valid_outputs = list(/obj/item/alch/golddust = 1)
	bonus_chance_outputs = list(/obj/item/alch/golddust = 33)

/datum/alch_grind_recipe/silver_bar
	valid_input = /obj/item/ingot/silver
	valid_outputs = list(/obj/item/alch/silverdust = 1)
	bonus_chance_outputs = list(/obj/item/alch/silverdust = 33)

/datum/alch_grind_recipe/iron_bar
	valid_input = /obj/item/ingot/iron
	valid_outputs = list(/obj/item/alch/irondust = 1)
	bonus_chance_outputs = list(/obj/item/alch/irondust = 33)

//Gems -> Powder

/datum/alch_grind_recipe/ruby
	valid_input = /obj/item/roguegem
	valid_outputs = list(/obj/item/alch/gred = 1,/obj/item/alch/firedust = 1)
	bonus_chance_outputs = list(/obj/item/alch/gred = 50,/obj/item/alch/firedust = 25)

/datum/alch_grind_recipe/emerald
	valid_input = /obj/item/roguegem/green
	valid_outputs = list(/obj/item/alch/ggreen = 1,/obj/item/alch/earthdust = 1)
	bonus_chance_outputs = list(/obj/item/alch/ggreen = 50,/obj/item/alch/earthdust = 25)

/datum/alch_grind_recipe/quartz
	valid_input = /obj/item/roguegem/blue
	valid_outputs = list(/obj/item/alch/gblue = 1,/obj/item/alch/magicdust = 1)
	bonus_chance_outputs = list(/obj/item/alch/gblue = 50,/obj/item/alch/magicdust = 25)

/datum/alch_grind_recipe/topaz
	valid_input = /obj/item/roguegem/yellow
	valid_outputs = list(/obj/item/alch/gyellow = 1,/obj/item/alch/airdust = 1)
	bonus_chance_outputs = list(/obj/item/alch/gyellow = 50,/obj/item/alch/airdust = 25)

/datum/alch_grind_recipe/sapphire
	valid_input = /obj/item/roguegem/violet
	valid_outputs = list(/obj/item/alch/gviolet = 1,/obj/item/alch/waterdust = 1)
	bonus_chance_outputs = list(/obj/item/alch/gviolet = 50,/obj/item/alch/waterdust = 25)

/datum/alch_grind_recipe/amethyst
	valid_input = /obj/item/roguegem/amethyst
	valid_outputs = list(/obj/item/alch/gamethyst = 1,/obj/item/alch/magicdust = 1)
	bonus_chance_outputs = list(/obj/item/alch/gamethyst = 50,/obj/item/alch/transisdust = 25)

/datum/alch_grind_recipe/diamond
	valid_input = /obj/item/roguegem/diamond
	valid_outputs = list(/obj/item/alch/gdiamond = 1,/obj/item/alch/feaudust = 1)
	bonus_chance_outputs = list(/obj/item/alch/gdiamond = 50,/obj/item/alch/feaudust = 25)

//Herb -> Herbseed
/datum/alch_grind_recipe/atropa_seed
	valid_input = /obj/item/alch/atropa
	valid_outputs = list(/obj/item/herbseed/atropa = 1)

/datum/alch_grind_recipe/matricaria_seed
	valid_input = /obj/item/alch/matricaria
	valid_outputs = list(/obj/item/herbseed/matricaria = 1)

/datum/alch_grind_recipe/symphitum_seed
	valid_input = /obj/item/alch/symphitum
	valid_outputs = list(/obj/item/herbseed/symphitum = 1)

/datum/alch_grind_recipe/taraxacum_seed
	valid_input = /obj/item/alch/taraxacum
	valid_outputs = list(/obj/item/herbseed/taraxacum = 1)

/datum/alch_grind_recipe/euphrasia_seed
	valid_input = /obj/item/alch/euphrasia
	valid_outputs = list(/obj/item/herbseed/euphrasia = 1)

/datum/alch_grind_recipe/paris_seed
	valid_input = /obj/item/alch/paris
	valid_outputs = list(/obj/item/herbseed/paris = 1)

/datum/alch_grind_recipe/calendula_seed
	valid_input = /obj/item/alch/calendula
	valid_outputs = list(/obj/item/herbseed/calendula = 1)

/datum/alch_grind_recipe/mentha_seed
	valid_input = /obj/item/alch/mentha
	valid_outputs = list(/obj/item/herbseed/mentha = 1)

/datum/alch_grind_recipe/urtica_seed
	valid_input = /obj/item/alch/urtica
	valid_outputs = list(/obj/item/herbseed/urtica = 1)

/datum/alch_grind_recipe/salvia_seed
	valid_input = /obj/item/alch/salvia
	valid_outputs = list(/obj/item/herbseed/salvia = 1)

/datum/alch_grind_recipe/hypericum_seed
	valid_input = /obj/item/alch/hypericum
	valid_outputs = list(/obj/item/herbseed/hypericum = 1)

/datum/alch_grind_recipe/benedictus_seed
	valid_input = /obj/item/alch/benedictus
	valid_outputs = list(/obj/item/herbseed/benedictus = 1)

/datum/alch_grind_recipe/valeriana_seed
	valid_input = /obj/item/alch/valeriana
	valid_outputs = list(/obj/item/herbseed/valeriana = 1)

/datum/alch_grind_recipe/artemisia_seed
	valid_input = /obj/item/alch/artemisia
	valid_outputs = list(/obj/item/herbseed/artemisia = 1)

/datum/alch_grind_recipe/transistus
	valid_input = list(/obj/item/alch/artemisia,/obj/item/alch/benedictus,/obj/item/alch/hypericum,/obj/item/alch/salvia,/obj/item/alch/atropa,/obj/item/alch/taraxacum)
	valid_outputs = list(/obj/item/alch/transisdust = 1)

// Frozen Summit Herbs

/datum/alch_grind_recipe/roguemorsel_seed
	valid_input = /obj/item/alch/roguemorsel
	valid_outputs = list(/obj/item/herbseed/roguemorsel = 1)

/datum/alch_grind_recipe/balsam_seed
	valid_input = /obj/item/alch/balsam
	valid_outputs = list(/obj/item/herbseed/balsam = 1)

/datum/alch_grind_recipe/weavemoss_seed
	valid_input = /obj/item/alch/weavemoss
	valid_outputs = list(/obj/item/herbseed/weavemoss = 1)

/datum/alch_grind_recipe/nightorchid_seed
	valid_input = /obj/item/alch/nightorchid
	valid_outputs = list(/obj/item/herbseed/nightorchid = 1)

/datum/alch_grind_recipe/tongueofmadness_seed
	valid_input = /obj/item/alch/tongueofmadness
	valid_outputs = list(/obj/item/herbseed/tongueofmadness = 1)

/datum/alch_grind_recipe/timmask_Seed
	valid_input = /obj/item/alch/timmask
	valid_outputs = list(/obj/item/herbseed/timmask = 1)

/datum/alch_grind_recipe/nightlight_seed
	valid_input = /obj/item/alch/nightlight
	valid_outputs = list(/obj/item/herbseed/nightlight = 1)

/datum/alch_grind_recipe/bonecap_seed
	valid_input = /obj/item/alch/bonecap
	valid_outputs = list(/obj/item/herbseed/bonecap = 1)

/datum/alch_grind_recipe/bluecap_seed
	valid_input = /obj/item/alch/bluecap
	valid_outputs = list(/obj/item/herbseed/bluecap = 1)

/datum/alch_grind_recipe/bullywug_seed
	valid_input = /obj/item/alch/bullywug
	valid_outputs = list(/obj/item/herbseed/bullywug = 1)

/datum/alch_grind_recipe/torchstalk_seed
	valid_input = /obj/item/alch/torchstalk
	valid_outputs = list(/obj/item/herbseed/torchstalk = 1)

/datum/alch_grind_recipe/firelichen_seed
	valid_input = /obj/item/alch/firelichen
	valid_outputs = list(/obj/item/herbseed/firelichen = 1)

/datum/alch_grind_recipe/waterorb_seed
	valid_input = /obj/item/alch/waterorb
	valid_outputs = list(/obj/item/herbseed/waterorb = 1)
