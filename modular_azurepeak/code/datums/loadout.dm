GLOBAL_LIST_EMPTY(loadout_items)

/datum/loadout_item
	var/name = "Parent loadout datum"
	var/desc
	var/path


//HATS
/datum/loadout_item/shalal
	name = "Keffiyeh"
	path = /obj/item/clothing/head/roguetown/roguehood/shalal

/datum/loadout_item/wild_guard
	name = "Wild Guard mask"
	path = /obj/item/clothing/mask/rogue/wildguard

/datum/loadout_item/archercap
	name = "Archer's cap"
	path = /obj/item/clothing/head/roguetown/archercap

/datum/loadout_item/strawhat
	name = "Straw Hat"
	path = /obj/item/clothing/head/roguetown/strawhat

/datum/loadout_item/witchhat
	name = "Witch Hat"
	path = /obj/item/clothing/head/roguetown/witchhat

/datum/loadout_item/bardhat
	name = "Bard Hat"
	path = /obj/item/clothing/head/roguetown/bardhat

/datum/loadout_item/fancyhat
	name = "Fancy Hat"
	path = /obj/item/clothing/head/roguetown/fancyhat

/datum/loadout_item/smokingcap
	name = "Smoking Cap"
	path = /obj/item/clothing/head/roguetown/smokingcap

/datum/loadout_item/headband
	name = "Headband"
	path = /obj/item/clothing/head/roguetown/headband

/datum/loadout_item/buckled_hat
	name = "Buckled Hat"
	path = /obj/item/clothing/head/roguetown/puritan

/datum/loadout_item/folded_hat
	name = "Folded Hat"
	path = /obj/item/clothing/head/roguetown/bucklehat

/datum/loadout_item/duelist_hat
	name = "Duelist's Hat"
	path = /obj/item/clothing/head/roguetown/duelhat

/datum/loadout_item/hood
	name = "Hood"
	path = /obj/item/clothing/head/roguetown/roguehood

/datum/loadout_item/hijab
	name = "Hijab"
	path = /obj/item/clothing/head/roguetown/roguehood/shalal/hijab

/datum/loadout_item/heavyhood
	name = "Heavy Hood"
	path = /obj/item/clothing/head/roguetown/roguehood/shalal/heavyhood

/datum/loadout_item/takuhatsugasa
	name = "Takuhatsugasa Hat"
	path = /obj/item/clothing/head/roguetown/takuhatsugasa

/datum/loadout_item/torioigasa
	name = "Torioigasa Hat"
	path = /obj/item/clothing/head/roguetown/tengai/torioigasa

/datum/loadout_item/gasa
	name = "Gasa Hat"
	path = /obj/item/clothing/head/roguetown/tengai/gasa

//CLOAKS
/datum/loadout_item/tabard
	name = "Tabard"
	path = /obj/item/clothing/cloak/tabard

/datum/loadout_item/surcoat
	name = "Surcoat"
	path = /obj/item/clothing/cloak/stabard

/datum/loadout_item/jupon
	name = "Jupon"
	path = /obj/item/clothing/cloak/stabard/surcoat

/datum/loadout_item/cape
	name = "Cape"
	path = /obj/item/clothing/cloak/cape

/datum/loadout_item/halfcloak
	name = "Halfcloak"
	path = /obj/item/clothing/cloak/half

/datum/loadout_item/ridercloak
	name = "Rider Cloak"
	path = /obj/item/clothing/cloak/half/rider

/datum/loadout_item/raincloak
	name = "Rain Cloak"
	path = /obj/item/clothing/cloak/raincloak

/datum/loadout_item/furcloak
	name = "Fur Cloak"
	path = /obj/item/clothing/cloak/raincloak/furcloak

/datum/loadout_item/direcloak
	name = "direbear cloak"
	path = /obj/item/clothing/cloak/darkcloak/bear

/datum/loadout_item/lightdirecloak
	name = "light direbear cloak"
	path = /obj/item/clothing/cloak/darkcloak/bear/light


//SHOES
/datum/loadout_item/darkboots
	name = "Dark Boots"
	path = /obj/item/clothing/shoes/roguetown/boots

/datum/loadout_item/nobleboots
	name = "Noble Boots"
	path = /obj/item/clothing/shoes/roguetown/nobleboot

/datum/loadout_item/shortboots
	name = "Short Boots"
	path = /obj/item/clothing/shoes/roguetown/shortboots

/datum/loadout_item/ridingboots
	name = "Riding Boots"
	path = /obj/item/clothing/shoes/roguetown/ridingboots

//SHIRTS
/datum/loadout_item/longcoat
	name = "Longcoat"
	path = /obj/item/clothing/suit/roguetown/armor/longcoat

/datum/loadout_item/robe
	name = "Robe"
	path = /obj/item/clothing/suit/roguetown/shirt/robe

/datum/loadout_item/formalsilks
	name = "Formal Silks"
	path = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan

/datum/loadout_item/tunic
	name = "Tunic"
	path = /obj/item/clothing/suit/roguetown/shirt/tunic

/datum/loadout_item/dress
	name = "Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gen

/datum/loadout_item/bardress
	name = "Bar Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/dress

/datum/loadout_item/chemise
	name = "Chemise"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress

/datum/loadout_item/easternmonkgarb
	name = "Eastern Monk Garb"
	path = /obj/item/clothing/suit/roguetown/shirt/rags/monkgarb

/datum/loadout_item/kimono
	name = "Kimono"
	path = /obj/item/clothing/suit/roguetown/shirt/tunic/kimono

/datum/loadout_item/kamishimo
	name = "Kamishimo"
	path = /obj/item/clothing/suit/roguetown/shirt/tunic/kamishimo

/datum/loadout_item/easterntribalgarb
	name = "Eastern Tribal Loincloth"
	path = /obj/item/clothing/under/roguetown/kaizoku/tribal

/datum/loadout_item/maid_dress
	name = "Maid Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/undershirt/maid_dress

/datum/loadout_item/sexydress
	name = "Sexy Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy

/datum/loadout_item/straplessdress
	name = "Strapless Dress"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gen/strapless

/datum/loadout_item/straplessdress/alt
	name = "Strapless Dress, alt"
	path = /obj/item/clothing/suit/roguetown/shirt/dress/gen/strapless/alt

/datum/loadout_item/leathervest
	name = "Leather Vest"
	path = /obj/item/clothing/suit/roguetown/armor/leather/vest

/datum/loadout_item/nun_habit
	name = "Nun Habit"
	path = /obj/item/clothing/suit/roguetown/shirt/robe/nun
/datum/loadout_item/belldresblue
	name = "Blue bell dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress

/datum/loadout_item/belldressred
	name = "Red bell dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/red

/datum/loadout_item/belldressyellow
	name = "Yellow bell dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/yellow

/datum/loadout_item/belldresscyan
	name = "Cyan bell dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/cyan

/datum/loadout_item/belldresspurple
	name = "Purple bell dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/purple

/datum/loadout_item/belldressblack
	name = "Black bell dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/black

/datum/loadout_item/belldresswhite
	name = "Fancy white dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/white

/datum/loadout_item/belldressbaroness
	name = "Baroness dress"
	path = /obj/item/clothing/suit/roguetown/shirt/belldress/baroness

//PANTS
/datum/loadout_item/skirt
	name = "Skirt"
	path = /obj/item/clothing/under/roguetown/skirt

//ACCESSORIES
/datum/loadout_item/stockings
	name = "Stockings"
	path = /obj/item/clothing/under/roguetown/tights/stockings

/datum/loadout_item/silkstockings
	name = "Silk Stockings"
	path = /obj/item/clothing/under/roguetown/tights/stockings/silk

/datum/loadout_item/fishnet
	name = "Fishnet Stockings"
	path = /obj/item/clothing/under/roguetown/tights/stockings/fishnet

/datum/loadout_item/loincloth
	name = "Loincloth"
	path = /obj/item/clothing/under/roguetown/loincloth

/datum/loadout_item/spectacles
	name = "Spectacles"
	path = /obj/item/clothing/mask/rogue/spectacles

/datum/loadout_item/ragmask
	name = "Rag Mask"
	path = /obj/item/clothing/mask/rogue/ragmask

/datum/loadout_item/halfmask
	name = "Halfmask"
	path = /obj/item/clothing/mask/rogue/shepherd

/datum/loadout_item/pipe
	name = "Pipe"
	path = /obj/item/clothing/mask/cigarette/pipe

/datum/loadout_item/pipewestman
	name = "Westman Pipe"
	path = /obj/item/clothing/mask/cigarette/pipe/westman

/datum/loadout_item/feather
	name = "Feather"
	path = /obj/item/natural/feather

/datum/loadout_item/battleskirt
	name = "Battle Skirt"
	path = /obj/item/clothing/cloak/fauld/battleskirt

/datum/loadout_item/fauld
	name = "Fauld"
	path = /obj/item/clothing/cloak/fauld

/datum/loadout_item/hakama
	name = "Hakama"
	path = /obj/item/clothing/under/roguetown/tights/hakama

/datum/loadout_item/eyeband
	name = "Eyeband"
	path = /obj/item/clothing/mask/rogue/kaizoku/eyeband
//below are not clothes and may be valuable and well, clearly superior to having clothes but you only get one choice, and it's a 'loadout' so maybe its fine.
// Above clothing are usually hard to get on their own, some.

//ACCESSORIES
/datum/loadout_item/sring
	name = "Silver Ring"
	path = /obj/item/clothing/ring/silver

/datum/loadout_item/gring
	name = "Gold Ring"
	path = /obj/item/clothing/ring/gold

/datum/loadout_item/divine
	name = "Divine symbol"
	path = /obj/item/clothing/neck/roguetown/psicross

/obj/item/clothing/neck/roguetown/psicross
//ARMOR
/datum/loadout_item/ironmask
	name = "Iron Mask"
	path = /obj/item/clothing/mask/rogue/facemask

/datum/loadout_item/ironmask
	name = "Iron coif"
	path = /obj/item/clothing/neck/roguetown/chaincoif/iron

/datum/loadout_item/lbracers
	name = "Leather Bracers"
	path = /obj/item/clothing/wrists/roguetown/bracers/leather

/datum/loadout_item/collar
	name = "Collar"
	path = /obj/item/clothing/neck/roguetown/collar

/datum/loadout_item/bell_collar
	name = "Bell Collar"
	path = /obj/item/clothing/neck/roguetown/collar/bell_collar
