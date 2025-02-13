/datum/anvil_recipe/weapons
	appro_skill = /datum/skill/craft/weaponsmithing  // inheritance yay !!
	craftdiff = 1
	i_type = "Weapons"

/// IRON WEAPONS

/datum/anvil_recipe/weapons/iron/sword
	name = "Sword"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron


/datum/anvil_recipe/weapons/bullets
	name = "Lead Bullets x5 (+s)"
	appro_skill = /datum/skill/craft/engineering
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/ammo_casing/caseless/rogue/bullet
	createditem_num = 4
	i_type = "Ammo"
	craftdiff = 0

/datum/anvil_recipe/weapons/shortsword_iron
	name = "Short sword"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron/short
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/messer
	name = "Messer"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron/messer
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/dagger
	name = "Dagger"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/huntingknife/idagger
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/weapons/ironflail
	name = "Flail"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/flail

/datum/anvil_recipe/weapons/ironflail/kusarifundo
	name = "kusari fundo (+1 iron ingot, 1 iron chain)"
	additional_items = list(/obj/item/ingot/iron,/obj/item/rope/chain)
	created_item = /obj/item/rogueweapon/flail/kusarifundo

/datum/anvil_recipe/weapons/iron/huntknife
	name = "Hunting knife"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/huntingknife
	createditem_num = 1

/datum/anvil_recipe/weapons/iron/zweihander
	name = "Zweihander (+2 Iron)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron, /obj/item/ingot/iron)
	created_item = /obj/item/rogueweapon/greatsword/zwei
	craftdiff = 3

/datum/anvil_recipe/weapons/iron/axe
	name = "Axe (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/stoneaxe/woodcut
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/cudgel
	name = "Cudgel (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace/cudgel
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/mace
	name = "Mace (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/spear
	name = "Spear (+1 Small Log)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear
	craftdiff = 0

/datum/anvil_recipe/weapons/iron/bardiche
	name = "Bardiche (+1 Iron, +1 Small Log)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/halberd/bardiche
	craftdiff = 2

/datum/anvil_recipe/weapons/bardiche/naginata
	name = "naginata (+1 steel ingot, 1 wooden staff)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/rogueweapon/woodstaff)
	created_item = /obj/item/rogueweapon/halberd/bardiche/naginata

/datum/anvil_recipe/weapons/iron/lucerne
	name = "Lucerne (+1 Iron, +1 Small Log)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/eaglebeak/lucerne
	craftdiff = 2

/datum/anvil_recipe/weapons/iron/polemace
	name = "Warclub (+1 Small Log)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden

/datum/anvil_recipe/weapons/iron/polemace/kanabo
	name = "kanabo (+1 iron ingot, 1 wooden club)"
	additional_items = list(/obj/item/ingot/iron,/obj/item/rogueweapon/mace/woodclub)
	created_item = /obj/item/rogueweapon/mace/goden/kanabo

/datum/anvil_recipe/weapons/iron/tossblade
	name = "Iron Tossblades (four)"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/huntingknife/throwingknife
/datum/anvil_recipe/weapons/iron/tossblade
	name = "Iron Tossblades 4x"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/huntingknife/throwingknife/iron
	craftdiff = 0
	createditem_num = 4

/// STEEL WEAPONS

/datum/anvil_recipe/weapons/steel/dagger
	name = "Dagger"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife/idagger/steel
	createditem_num = 1

/datum/anvil_recipe/weapons/steel/dagger/tanto
	name = "tanto"
	created_item = /obj/item/rogueweapon/huntingknife/idagger/steel/tanto

/datum/anvil_recipe/weapons/steel/daggerparrying
	name = "Parrying Dagger (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/huntingknife/idagger/steel/parrying
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/katar
	name = "Katar"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/katar
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/rapier
	name = "Rapier"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/rapier
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/cutlass
	name = "Cutlass"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/cutlass
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/swordshort
	name = "Steel Short Sword"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/short
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/falchion
	name = "Falchion"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/falchion
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/sword
	name = "Sword"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/sword/uchigatana
	name = "uchigatana"
	created_item = /obj/item/rogueweapon/sword/uchigatana

/datum/anvil_recipe/weapons/steel/saber
	name = "Sabre"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/sabre
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/flail
	name = "Flail"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/flail/sflail
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/bastardsword
	name = "Bastard Sword (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/battleaxe
	name = "Battle Axe (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/stoneaxe/battle
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/combatknife
	name = "Combat Knife (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/huntingknife/cleaver/combat
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/mace
	name = "Mace (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/mace/steel
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/mace/ararebo
	name = "arerebo (+1 stick)"
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace/cudgel/ararebo

/datum/anvil_recipe/weapons/steel/greatsword
	name = "Greatsword (+2 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/greatsword
	craftdiff = 4

/datum/anvil_recipe/weapons/greatsword/odachi
	name = "odachi (+2 steel ingots)"
	created_item = /obj/item/rogueweapon/greatsword/odachi

/datum/anvil_recipe/weapons/steel/steelzweihander
	name = "Zweihander (+2 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/greatsword/grenz
	craftdiff = 4

/datum/anvil_recipe/weapons/estoc
	name = "Estoc (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/estoc
	craftdiff = 4

/datum/anvil_recipe/weapons/steel/axe
	name = "Axe (+1 Stick)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/stoneaxe/woodcut/steel
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/pulaski
	name = "Pulaski axe (+1 Stick)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/stoneaxe/woodcut/pick

/datum/anvil_recipe/weapons/steel/billhook
	name = "Billhook (+1 Small Log)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear/billhook
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/halberd
	name = "Halberd (+1 Steel, +1 Small Log)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/halberd
	craftdiff = 4

/datum/anvil_recipe/weapons/steel/eaglebeak
	name = "Eagle's Beak (+1 Steel, +1 Small Log)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/eaglebeak
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/grandmace
	name = "Grand Mace (+1 Steel, +1 Small Log)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/steel
	craftdiff = 3

/datum/anvil_recipe/weapons/steel/tossblade
	name = "Steel Tossblades 4x"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife/throwingknife/steel
	craftdiff = 0
	createditem_num = 4

/datum/anvil_recipe/weapons/steel/fishspear
	name = "Fishing Spear (+1 Steel, +1 Small Log)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/fishspear
	craftdiff = 2

/// UPGRADED WEAPONS

//GOLD
/datum/anvil_recipe/weapons/decsword
	name = "Decorated Sword (+1 Gold)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/decorated
	craftdiff = 2

/datum/anvil_recipe/weapons/decsword
	name = "Decorated Sword (+1 Steel Sword)"
	req_bar = /obj/item/ingot/gold
	additional_items = list(/obj/item/rogueweapon/sword)
	created_item = /obj/item/rogueweapon/sword/decorated
	craftdiff = 2

/datum/anvil_recipe/weapons/decsaber
	name = "Decorated Sabre (+1 Gold)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/sabre/dec
	craftdiff = 2

/datum/anvil_recipe/weapons/decsaber
	name = "Decorated Sabre (+1 Steel Sabre)"
	req_bar = /obj/item/ingot/gold
	additional_items = list(/obj/item/rogueweapon/sword/sabre)
	created_item = /obj/item/rogueweapon/sword/sabre/dec
	craftdiff = 2

/datum/anvil_recipe/weapons/decrapier
	name = "Decorated Rapier (+1 Gold)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/rapier/dec
	craftdiff = 2

/datum/anvil_recipe/weapons/decrapier
	name = "Decorated Rapier (+1 Steel Rapier)"
	req_bar = /obj/item/ingot/gold
	additional_items = list(/obj/item/rogueweapon/sword/rapier)
	created_item = /obj/item/rogueweapon/sword/rapier/dec
	craftdiff = 2

// SILVER
/datum/anvil_recipe/weapons/silver/elfsaber
	name = "Elvish Saber (+1 Silver)"
	req_bar = /obj/item/ingot/silver
	additional_items = list(/obj/item/ingot/silver)
	created_item = /obj/item/rogueweapon/sword/sabre/elf
	craftdiff = 3

/datum/anvil_recipe/weapons/silver/elfdagger
	name = "Elvish Dagger"
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
	craftdiff = 3

/datum/anvil_recipe/weapons/silver/dagger
	name = "Silver Dagger"
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/huntingknife/idagger/silver
	craftdiff = 2

/datum/anvil_recipe/weapons/silver/sword
	name = "Silver Sword (+1 Silver)"
	req_bar = /obj/item/ingot/silver
	additional_items = list(/obj/item/ingot/silver)
	created_item = /obj/item/rogueweapon/sword/silver
	craftdiff = 3

/datum/anvil_recipe/weapons/silver/waraxe
	name = "Silver War Axe (+1 Silver, +1 Stick)"
	req_bar = /obj/item/ingot/silver
	additional_items = list(/obj/item/ingot/silver, /obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/stoneaxe/silver
	craftdiff = 3

/datum/anvil_recipe/weapons/silver/warhammer
	name = "Silver War Hammer (+1 Silver, +1 Stick)"
	req_bar = /obj/item/ingot/silver
	additional_items = list(/obj/item/ingot/silver, /obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace/silver
	craftdiff = 3

/datum/anvil_recipe/weapons/silver/tossblade
	name = "Silver Tossblades 4x"
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/rogueweapon/huntingknife/throwingknife/psydon
	craftdiff = 3
	createditem_num = 4

// ------ BRONZE ------

/datum/anvil_recipe/weapons/gladius
	name = "Gladius"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/rogueweapon/sword/gladius
	craftdiff = 2

/datum/anvil_recipe/weapons/bronze/spear
	name = "Bronze Spear (+1 Bronze, +1 Small Log)"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear/bronze
	craftdiff = 0

/// SHIELDS
/datum/anvil_recipe/weapons/steel/kiteshield
	name = "Kite Shield (+1 Steel, +1 Hide)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/natural/hide)
	created_item = /obj/item/rogueweapon/shield/tower/metal
	craftdiff = 3

/datum/anvil_recipe/weapons/iron/towershield
	name = "Tower Shield (+1 Small Log)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/shield/tower
	craftdiff = 2

/datum/anvil_recipe/weapons/steel/buckler
	name = "Buckler (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/natural/plankshort, /obj/item/natural/plankshort)
	created_item = /obj/item/rogueweapon/shield/buckler
	craftdiff = 2

/// CROSSBOWS
/datum/anvil_recipe/weapons/steel/xbow
	name = "Crossbow (+1 Small Log, +1 Fiber)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/natural/plank, /obj/item/natural/fibers)
	created_item = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow

/datum/anvil_recipe/weapons/iron/bolts
	name = "Crossbow Bolts 5x (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/ammo_casing/caseless/rogue/bolt
	createditem_num = 5
	i_type = "Ammo"

/// RANGED
/datum/anvil_recipe/weapons/iron/arrows
	name = "Arrows 5x (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/ammo_casing/caseless/rogue/arrow/iron
	createditem_num = 5
	i_type = "Ammo"
	craftdiff = 0

//Rarity
/datum/anvil_recipe/valuables/steel/execution
	name = "Execution Sword (+1 Steel, +1 Iron)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/iron, /obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long/exe
	i_type = "Weapons"

// ADAMANTINE

/datum/anvil_recipe/weapons/blackflamb
	name = "Flamberge"
	req_bar = /obj/item/ingot/adamantine
	additional_items = list(/obj/item/ingot/adamantine, /obj/item/roguegem)
	created_item = /obj/item/rogueweapon/sword/long/blackflamb
	craftdiff = 5


/datum/anvil_recipe/weapons/swarhammer
	name = "Warhammer (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/mace/warhammer/steel
	craftdiff = 2
	i_type = "Weapons"

/datum/anvil_recipe/weapons/warhammer
	name = "Warhammer (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace/warhammer
	i_type = "Weapons"
	craftdiff = 3

/datum/anvil_recipe/ammo/musketball
	name = "Musketballs 8x"
	appro_skill = /datum/skill/craft/blacksmithing
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/ammo_casing/caseless/rogue/bullet,
						/obj/item/ammo_casing/caseless/rogue/bullet,
						/obj/item/ammo_casing/caseless/rogue/bullet,
						/obj/item/ammo_casing/caseless/rogue/bullet,
						/obj/item/ammo_casing/caseless/rogue/bullet,
						/obj/item/ammo_casing/caseless/rogue/bullet,
						/obj/item/ammo_casing/caseless/rogue/bullet,
						/obj/item/ammo_casing/caseless/rogue/bullet
					)

	craftdiff = 1

//Kaizoku Smithing content. I humbly ask for help; A way in which only people with the trait "Kaizoku", being the ones able to make Kaizoku weapons and armor. In another hand,
//they cannot make most (exceptions; the objects that have no abyssariad alternative) armors and weapons.

/datum/anvil_recipe/weapons/sword_steel
	name = "Uchigatana zatana"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/uchigatana
	craftdiff = 2

/datum/anvil_recipe/weapons/odachi
	name = "Odachi zatana (3)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long/greatsword/odachi
	craftdiff = 4

/datum/anvil_recipe/weapons/tachi
	name = "Tachi zatana (2)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/sword/long/tachi
	craftdiff = 3

/datum/anvil_recipe/weapons/jiansword
	name = "Jian sword"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron/jian

/datum/anvil_recipe/weapons/daosword
	name = "Dao sword"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sword/iron/messer/dao

/datum/anvil_recipe/weapons/yuntoudao
	name = "Yuntoudao"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/falchion/yuntoudao
	craftdiff = 2

/datum/anvil_recipe/weapons/shortjian
	name = "Short Jian"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/short/jian
	craftdiff = 1

/datum/anvil_recipe/weapons/wakizashi
	name = "Wakisashi Zatana"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/short/wakizashi
	craftdiff = 1

/datum/anvil_recipe/weapons/piandao
	name = "Piandao"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/sword/sabre/piandao
	craftdiff = 2

/datum/anvil_recipe/weapons/decpiandao
	name = "Decorated piandao (+g)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/gold)
	created_item = /obj/item/rogueweapon/sword/sabre/piandao/dec
	craftdiff = 3

/datum/anvil_recipe/weapons/kanabo
	name = "Iron Kanabo Warclub (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/kanabo
	craftdiff = 2

/datum/anvil_recipe/weapons/tetsubo
	name = "Steel Tetsubo Warclub (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/steel/tetsubo
	craftdiff = 3

/datum/anvil_recipe/weapons/iararebo
	name = "Iron ararebo club (+s)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/mace/ararebo

/datum/anvil_recipe/weapons/sararebo
	name = "Steel Ararebo club (2)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/mace/steel/ararebo
	craftdiff = 2

/datum/anvil_recipe/weapons/kusarifundo
	name = "Kusarifundo (+c) (+s)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/rope/chain, /obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/flail/sflail/kusarifundo
	craftdiff = 2

/datum/anvil_recipe/weapons/kunai
	name = "Kunai"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/huntingknife/kunai
	craftdiff = 1

/datum/anvil_recipe/weapons/tanto
	name = "Tanto smallsword x2"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife/idagger/steel/tanto
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/weapons/kaiken
	name = "Kaiken knife x2"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife/idagger/steel/kaiken
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3

/datum/anvil_recipe/weapons/sai //not made of iron. Still Less damage tho.
	name = "Sai x2"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife/idagger/steel
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3

/datum/anvil_recipe/weapons/yari
	name = "yari x2 (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear/yari
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/weapons/katakama
	name = "Katakama Yari x2 (+w) (+i)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small, /obj/item/ingot/iron)
	created_item = /obj/item/rogueweapon/spear/yari/katakama

/datum/anvil_recipe/weapons/jumonji
	name = "Jumonji Yari (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear/billhook/jumonji
	craftdiff = 3

/datum/anvil_recipe/weapons/naginata
	name = "Traditional Naginata (2) (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/halberd/bardiche/naginata
	craftdiff = 2

/datum/anvil_recipe/weapons/tsukushi
	name = "Tsukushi Naginata x2 (2) (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/halberd/naginata/tsukushi
	craftdiff = 1
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/weapons/bisento
	name = "Bisento (3) (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/grown/log/tree/small,/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/eaglebeak/bisento
	craftdiff = 5

/datum/anvil_recipe/weapons/onobattle
	name = "Ono Battle Axe (2)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/rogueweapon/stoneaxe/battle/ono
	craftdiff = 3

/datum/anvil_recipe/weapons/changfu
	name = "changfu woodcutter (+s)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/stoneaxe/woodcut/changfu

//Unique few
/datum/anvil_recipe/weapons/jitte
	name = "Jitte Cudgel"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/mace/cudgel/jitte

/datum/anvil_recipe/weapons/otsuchi
	name = "Otsuchi warhammer (+l)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/mace/goden/otsuchi

/datum/anvil_recipe/weapons/kusarigama
	name = "Kusarigama (+c) (+s)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/rope/chain, /obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/flail/kusarigama

/datum/anvil_recipe/weapons/mancatcher
	name = "Mancatchers x2 (+w)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/rogueweapon/spear/mancatcher
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/weapons/onothrow
	name = "Ono throwing axe (2)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/stoneaxes/thrown/ono
	craftdiff = 3

/datum/anvil_recipe/weapons/tetsubishi
	name = "tetsubishi caltrop (2)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/tetsubishi
	craftdiff = 2

/datum/anvil_recipe/weapons/kama
	name = "Kama sickle (2)"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/sickle/kama
	craftdiff = 2
