/datum/anvil_recipe/armor
	appro_skill = /datum/skill/craft/armorsmithing
	i_type = "Armor"
	craftdiff = 1

//For the sake of keeping the code modular with the introduction of new metals, each recipe has had it's main resource added to it's datum
//This way, we can avoid having to name things in strange ways and can simply have iron/cuirass, stee/cuirass, adamantine/cuirass->
//-> and not messy names like ibreastplate and hplate

// --------- IRON RECIPES -----------

/datum/anvil_recipe/armor/iron/chainmail
	name = "Chainmail"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/iron

/datum/anvil_recipe/armor/iron/chaincoif
	name = "Chain Coif"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/neck/roguetown/chaincoif/iron
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/iron/gorget
	name = "Gorget"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/neck/roguetown/gorget
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/iron/breastplate
	name = "Breastplate (+1 Iron)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/half/iron

/datum/anvil_recipe/armor/iron/chainglove
	name = "Chain Gauntlets"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/gloves/roguetown/chain/iron
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/iron/chainleg
	name = "Chain Chausses"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/under/roguetown/chainlegs/iron
	craftdiff = 0

/datum/anvil_recipe/armor/iron/mask
	name = "Iron Mask"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/facemask
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/iron/wildguard
	name = "Wild guard Mask"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/wildguard
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/iron/boot
	name = "Plated Boots"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor/iron
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/iron/skullcap
	name = "Skullcap"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/head/roguetown/helmet/skullcap

/datum/anvil_recipe/armor/iron/studded
	name = "Studded Leather Armor (+Leather Armor)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/clothing/suit/roguetown/armor/leather)
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/studded

/datum/anvil_recipe/armor/studdedbikini
	name = "Studded Leather Bikini (+Leather Bikini)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/clothing/suit/roguetown/armor/leather)
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/studded/bikini

/datum/anvil_recipe/armor/lbrigandine
	name = "Light Brigandine (+1 Cloth)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine/light
	i_type = "Armor"

/datum/anvil_recipe/armor/splintarms
	name = "Brigandine Rerebraces (+1 Cloth)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/cloth)
	created_item = /obj/item/clothing/wrists/roguetown/splintarms
	i_type = "Armor"

/datum/anvil_recipe/armor/splintlegs
	name = "Brigandine Chausses (+1 Cloth)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/cloth)
	created_item = /obj/item/clothing/under/roguetown/splintlegs
	i_type = "Armor"
/*
/datum/anvil_recipe/armor/helmetgoblin
	name = "Goblin Helmet (+1 Iron)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron)
	created_item = /obj/item/clothing/head/roguetown/helmet/goblin
	craftdiff = 2

/datum/anvil_recipe/armor/plategoblin
	name = "Goblin Mail (+1 Iron)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/goblin
	craftdiff = 2
*/
// --------- STEEL RECIPES -----------

/datum/anvil_recipe/armor/steel/haubergeon
	name = "Haubergeon"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail
	craftdiff = 2

/datum/anvil_recipe/armor/steel/chainkini
	name = "Chainmail Bikini (+1 Cloth)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/bikini

/datum/anvil_recipe/armor/steel/hauberk
	name = "Hauberk (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	craftdiff = 3

/datum/anvil_recipe/armor/steel/halfplate
	name = "Half-Plate Armour (+2 Steel, +1 Hide)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel,/obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate
	craftdiff = 3

/datum/anvil_recipe/armor/steel/fullplate
	name = "Full-Plate Armour (+3 Steel, +1 Hide)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/full
	craftdiff = 4

/datum/anvil_recipe/armor/steel/platebikini
	name = "Half-Plate Bikini (+1 Steel, +1 Hide)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/bikini
	craftdiff = 3

/datum/anvil_recipe/armor/steel/fullplatebikini
	name = "Full-Plate Bikini (+2 Steel, +1 Hide)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/full/bikini
	craftdiff = 4

/datum/anvil_recipe/armor/steel/coatplates
	name = "Coat Of Plates (+1 Steel, +1 Hide)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates
	craftdiff = 2

/datum/anvil_recipe/armor/steel/steel/brigandine
	name = "Brigandine (+1 Steel, +2 Cloth)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/natural/cloth, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine
	craftdiff = 3

/datum/anvil_recipe/armor/steel/chaincoif
	name = "Chain Coif"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/chaincoif
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/steel/fullchaincoif
	name = "Full Chain Coif"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/chaincoif/full
	craftdiff = 2

/datum/anvil_recipe/armor/steel/chainglove
	name = "Chain Gauntlets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/chain
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/steel/plateglove
	name = "Plate Gauntlets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/plate
	createditem_num = 1
	craftdiff = 3

/datum/anvil_recipe/armor/steel/chainleg
	name = "Chain Chausses"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/chainlegs
	craftdiff = 2

/datum/anvil_recipe/armor/steel/brayette
	name = "Brayette"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/brayette

/datum/anvil_recipe/armor/steel/chainskirt
	name = "Chain Skirt"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/chainlegs/skirt

/datum/anvil_recipe/armor/steel/plateskirt
	name = "Plated Skirt (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/under/roguetown/platelegs/skirt
	craftdiff = 2

/datum/anvil_recipe/armor/steel/platelegs
	name = "Plated Chausses (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/under/roguetown/platelegs
	craftdiff = 2

/datum/anvil_recipe/armor/stee/cuirass
	name = "Cuirass (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/half
	craftdiff = 3

/datum/anvil_recipe/armor/steel/scalemail
	name = "Scalemail (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/scale
	craftdiff = 3

/datum/anvil_recipe/armor/steel/platebracer
	name = "Plate Bracers"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/wrists/roguetown/bracers
	createditem_num = 1

/datum/anvil_recipe/armor/steel/helmetnasal
	name = "Nasal Helmet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet
	craftdiff = 2

/datum/anvil_recipe/armor/steel/helmethorned
	name = "Horned Helmet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/horned
	craftdiff = 2

/datum/anvil_recipe/armor/steel/helmetwinged
	name = "Winged Helmet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/winged
	craftdiff = 2

/datum/anvil_recipe/armor/steel/helmetkettle
	name = "Kettle Helmet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/kettle
	craftdiff = 2

/datum/anvil_recipe/armor/steel/bevor
	name = "Bevor"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/bevor
	craftdiff = 2

/datum/anvil_recipe/armor/steel/sgorget
	name = "Steel gorget"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/gorget/steel
	craftdiff = 2

/datum/anvil_recipe/armor/steel/helmetsall
	name = "Sallet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/sallet
	craftdiff = 2

/datum/anvil_recipe/armor/steel/helmetsallv
	name = "Sallet Visored (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/sallet/visored
	craftdiff = 2

/datum/anvil_recipe/armor/steel/helmetbuc
	name = "Bucket Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
	craftdiff = 2

/datum/anvil_recipe/armor/steel/helmetpig
	name = "Pigface Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface
	craftdiff = 2

/datum/anvil_recipe/armor/helmetvolf
	name = "Volf Face Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/volfplate
	craftdiff = 3
	i_type = "Armor"

/datum/anvil_recipe/armor/steel/bascinet
	name = "Bascinet Helmet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/bascinet
	craftdiff = 2

/datum/anvil_recipe/armor/steel/helmetknight
	name = "Knight's Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/knight
	craftdiff = 3

/datum/anvil_recipe/armor/steel/savoyard
	name = "Savoyard Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/guard
	craftdiff = 3

/datum/anvil_recipe/armor/steel/barredhelm
	name = "Barred Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/sheriff
	craftdiff = 3

/datum/anvil_recipe/armor/steel/plateboot
	name = "Plated Boots"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/steel/mask
	name = "Steel Mask"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/mask/rogue/facemask/steel
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/steel/astratahelm
	name = "Astrata Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/astratahelm
	craftdiff = 3


/datum/anvil_recipe/armor/steel/necrahelm
	name = "Necra Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/necrahelm
	craftdiff = 3

/datum/anvil_recipe/armor/steel/nochelm
	name = "Mystra Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/nochelm
	craftdiff = 3

/datum/anvil_recipe/armor/steel/dendorhelm
	name = "Silvanus Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/dendorhelm
	craftdiff = 3

/datum/anvil_recipe/armor/steel/frogmouth
	name = "Froggemund Helmet (+2 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/frogmouth
	craftdiff = 3

/datum/anvil_recipe/armor/steel/belt
	name = "Steel Plated Belt"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/storage/belt/rogue/leather/steel
	craftdiff = 2

// --------- SILVER RECIPES-----------

/datum/anvil_recipe/armor/silver/belt
	name = "Silver Plated Belt"
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/storage/belt/rogue/leather/plaquesilver
	craftdiff = 3

// --------- GOLD RECIPES-----------

/datum/anvil_recipe/armor/gold/belt
	name = "Gold Plated Belt"
	req_bar = /obj/item/ingot/gold
	created_item = /obj/item/storage/belt/rogue/leather/plaquegold
	craftdiff = 3

/datum/anvil_recipe/armor/gold/mask
	name = "Gold Mask"
	req_bar = /obj/item/ingot/gold
	created_item = /obj/item/clothing/mask/rogue/facemask/goldmask
	craftdiff = 3

// --------- ADAMANTINE RECIPES-----------

/datum/anvil_recipe/armor/adamantine/cuirass
	name = "Adamantine Cuirass (+1 B.Steel)"
	req_bar = /obj/item/ingot/adamantine
	additional_items = list(/obj/item/ingot/adamantine)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/adamantine_half_plate
	craftdiff = 5

/datum/anvil_recipe/armor/adamantine/platechest
	name = "Adamantine Plate Armor (+3 B.Steel)"
	req_bar = /obj/item/ingot/adamantine
	additional_items = list(/obj/item/ingot/adamantine, /obj/item/ingot/adamantine, /obj/item/ingot/adamantine)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/adamantine_full_plate
	craftdiff = 5

/datum/anvil_recipe/armor/adamantine/platelegs
	name = "Adamantine Plate Chausses (+1 B.Steel)"
	req_bar = /obj/item/ingot/adamantine
	additional_items = list(/obj/item/ingot/adamantine)
	created_item = /obj/item/clothing/under/roguetown/platelegs/adamantine
	craftdiff = 5

/datum/anvil_recipe/armor/adamantine/bucket
	name = "Adamantine Bucket Helmet (+1 B.Steel)"
	req_bar = /obj/item/ingot/adamantine
	additional_items = list(/obj/item/ingot/adamantine)
	created_item = /obj/item/clothing/head/roguetown/helmet/adamantine/bucket
	craftdiff = 5

/datum/anvil_recipe/armor/adamantine/plategloves
	name = "Adamantine Plate Gauntlets"
	req_bar = /obj/item/ingot/adamantine
	created_item = /obj/item/clothing/gloves/roguetown/adamantine/plategloves
	craftdiff = 5

/datum/anvil_recipe/armor/adamantine/plateboots
	name = "Adamantine Plate Boots"
	req_bar = /obj/item/ingot/adamantine
	created_item = /obj/item/clothing/shoes/roguetown/boots/adamantine/plateboots
	craftdiff = 5


/datum/anvil_recipe/armor/lbrigandine
	name = "Light Brigandine (+1 Cloth)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine/light
	i_type = "Armor"


/datum/anvil_recipe/armor/helmetvolf
	name = "Volf Face Helmet (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/volfplate
	craftdiff = 3
	i_type = "Armor"


/datum/anvil_recipe/armor/iron/splintarms
	name = "Brigandine Rerebraces (+1 Cloth)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/cloth)
	created_item = /obj/item/clothing/wrists/roguetown/splintarms


/datum/anvil_recipe/armor/iron/splintlegs
	name = "Brigandine Chausses (+1 Cloth)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/cloth)
	created_item = /obj/item/clothing/under/roguetown/splintlegs

//Kaizoku Smithing content. I humbly ask for help; A way in which only people with the trait "Kaizoku", being the ones able to make Kaizoku weapons and armor. In another hand,
//they cannot make most (exceptions; the objects that have no abyssariad alternative) armors and weapons.

//'armor'
/datum/anvil_recipe/armor/nanbando
	name = "Barbarian half-plate (3)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/nanbando
	craftdiff = 3

/datum/anvil_recipe/armor/nanbandocuirass
	name = "Barbarian Cuirass"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/cuirass/nanbando
	craftdiff = 2

/datum/anvil_recipe/armor/nanbandofull
	name = "Barbarian Fullplate (4)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/full/nanbando
	craftdiff = 4

/datum/anvil_recipe/armor/steeltatami
	name = "Steel foldeable armor"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami
	craftdiff = 2

// huh. We can make these uniquely then. Since we can't make the iron chainmail for the european counterparts?... why?
/datum/anvil_recipe/armor/irontatami
	name = "Iron foldeable armor"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/iron/tatami
	craftdiff = 2
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/armor/kusari
	name = "Chainmail Robe (2)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari
	craftdiff = 3

/datum/anvil_recipe/armor/imirror
	name = "Iron disk chestplate (3)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/ingot/iron)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/mirror/iron
	craftdiff = 1

/datum/anvil_recipe/armor/mirror
	name = "Steel disk chestplate (3)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/mirror
	craftdiff = 3

/datum/anvil_recipe/armor/oyoroi
	name = "Compact great armor (3) (c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi
	craftdiff = 3

/datum/anvil_recipe/armor/oyoroigusoku //costier version. Only really viable if you got what to waste.
	name = "Full great armor (4) (2c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/cloth, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/oyoroigusoku
	craftdiff = 3

/datum/anvil_recipe/armor/sanmaido
	name = "Three-plate cuirass"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/cuirass/sanmaido
	craftdiff = 2

/datum/anvil_recipe/armor/kikko
	name = "Turtleshell leather armor (2h)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/hide, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/studded/kikko
	craftdiff = 1

/obj/item/clothing/suit/roguetown/armor/rattan //cheaper on iron, but has many sticks. Proper for this armor's context.
/datum/anvil_recipe/armor/iplate
	name = "Iron-woven Rattan armor (2) (4s)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = /obj/item/clothing/suit/roguetown/armor/rattan
	craftdiff = 1

/datum/anvil_recipe/armor/kikkoarmor //cheaper brigadine with hide.
	name = "Turtleshell Full Armor (2) (2h)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/natural/hide, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt/abyssariad
	craftdiff = 3

//'feet'
/datum/anvil_recipe/armor/kusaritabi
	name = "Chainmail footwear x2"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor/light/kusaritabi
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/armor/suneate
	name = "Plated shin-guards"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor/suneate
	craftdiff = 3

//'gloves'
/datum/anvil_recipe/armor/kikkotekko
	name = "Turtleshell gauntlets x2"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/chain/kikko
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/ikikkotekko
	name = "Turtleshell gauntlets x2"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/gloves/roguetown/chain/iron/kikko
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/lamellaetekko
	name = "Lamellae gauntlets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/plate/lamellaetekko
	craftdiff = 3

//'hats'
/datum/anvil_recipe/armor/hachigane
	name = "Hachigane x2"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/head/roguetown/helmet/skullcap/hachigane
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/armor/rattanhelmet
	name = "Iron Woven Rattan Helmet x2 (3s)"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/head/roguetown/helmet/skullcap/rattan
	additional_items = list(/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	createmultiple = TRUE
	createditem_num = 1

/obj/item/clothing/head/roguetown/helmet/visored/abyssalchampion
/datum/anvil_recipe/armor/abyssalchampion
	name = "Newfangled Myrmidon Helmet (3)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/abyssalchampion)
	craftdiff = 4

/datum/anvil_recipe/armor/helmetbuc
	name = "Sohei Heavy Headwear"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/head/roguetown/helmet/heavy/bucket/soheidemon)
	craftdiff = 2

/datum/anvil_recipe/armor/zunari
	name = "Zamurai's helmet (2)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/zunari)
	craftdiff = 3

/datum/anvil_recipe/armor/zijinguan
	name = "Plumed Footsoldier helmet x2"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/zijinguan
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/jingasa
	name = "Conical Ashigaru helmet x2"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/jingasa
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/toseikabuto
	name = "Tosei-kabuto"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/sallet/tosei_kabuto
	craftdiff = 2

/datum/anvil_recipe/armor/toseikabutov
	name = "Visored tosei-kabuto (2)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/sallet/tosei_kabuto)
	craftdiff = 3

//'mask'
/datum/anvil_recipe/armor/imenpo
	name = "Iron faceguard"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/kaizoku/menpo
	craftdiff = 0

/datum/anvil_recipe/armor/himenpo
	name = "Iron half-faceguard x2"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/kaizoku/menpo/half
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/smenpo
	name = "Steel faceguard"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/steel/half)
	craftdiff = 2

/datum/anvil_recipe/armor/hsmenpo
	name = "Steel half-faceguard x2"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/steel)
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/itribalfish
	name = "Iron fishpeople mask x2"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/kaizoku/menpo/facemask
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/stribalfish
	name = "Steel fishpeople mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/steel)
	craftdiff = 2

/datum/anvil_recipe/armor/ctengu
	name = "Birdpeople champion mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/colourable/tengu)
	craftdiff = 2

/datum/anvil_recipe/armor/ckitsune
	name = "Foxpeople champion mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/colourable/kitsune)
	craftdiff = 2

/datum/anvil_recipe/armor/coni
	name = "Ogrepeople champion mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/facemask/steel)
	craftdiff = 2

//'neck'
/datum/anvil_recipe/armor/shood
	name = "Karuta hood x2"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/ihood
	name = "Chainmail hood x2"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/neck/roguetown/chaincoif/iron/kusari_zukin
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

//'pants'
/datum/anvil_recipe/armor/ihaidate
	name = "Foldable Thighguards x2"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/under/roguetown/chainlegs/iron/haidate_tatami
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/shaidate
	name = "Plate Thighguards x2"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/chainlegs/sendan
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/superhaidate
	name = "Plated Trousers x2"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/platelegs/yoroihakama
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3

//'wrists'
/datum/anvil_recipe/armor/kote //Protects more limbs, so it is costier.
	name = "Armored Sleeve"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/wrists/roguetown/bracers/kote
	craftdiff = 4

/datum/anvil_recipe/armor/weeper
	name = "Weeper Bracers x2"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/wrists/roguetown/bracers/mountainstar
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3
