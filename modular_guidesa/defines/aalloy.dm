#define CTYPE_ANCIENT "a"

/obj/item/roguecoin/aalloy
	name = "psilen"
	desc = "Withered empires can never endure."
	icon_state = "a1"
	sellprice = 0
	base_type = CTYPE_ANCIENT
	plural_name = "psila"

/obj/item/roguecoin/aalloy/pile/Initialize()
	. = ..()
	set_quantity(rand(4,19))

/obj/item/roguecoin/gold/virtuepile/Initialize()
	. = ..()
	set_quantity(rand(8,12))

/obj/item/needle/aalloy
	name = "decrepit needle"
	icon_state = "aneedle"
	desc = "This decrepit old needle doesn't seem helpful for much."
	stringamt = 5
	maxstring = 5
