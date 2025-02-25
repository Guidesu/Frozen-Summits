/obj/item/gun/ballistic/arquebus
	name = "arquebus rifle"
	desc = "A gunpowder weapon that shoots an armor piercing metal ball."
	icon = 'icons/roguetown/weapons/arquebus.dmi'
	icon_state = "arquebus"
	item_state = "arquebus"
	force = 10
	force_wielded = 15
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	possible_item_intents = list(/datum/intent/shoot/arquebus_pistol, /datum/intent/arc/arquebus_pistol, /datum/intent/mace/strike/wood)
	internal_magazine = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/arquebus
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_LONG
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	randomspread = 1
	spread = 0
	var/cocked = FALSE
	var/misfire_chance = 0
	/// Reload time, in SECONDS
	var/reload_time = 10
	weapon_embed_chance = 100 //this was here to make a weaker version of the gun, didn't do it, still keeping this here to be used
	damfactor = 5
	can_parry = TRUE
	pin = /obj/item/firing_pin
	minstr = 6
	walking_stick = TRUE
	experimental_onback = TRUE
	cartridge_wording = "musketball"
	load_sound = 'sound/foley/musketload.ogg'
	fire_sound = 'sound/arquebus/arquefire.ogg'
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel
	bolt_type = BOLT_TYPE_NO_BOLT
	casing_ejector = FALSE
	//pickup_sound = 'sound/sheath_sounds/draw_from_holster.ogg'
	//sheathe_sound = 'sound/sheath_sounds/put_back_to_holster.ogg'
	var/spread_num = 10
	damfactor = 2
	var/reloaded = FALSE
	var/load_time = 50
	var/gunpowder = FALSE
	var/obj/item/ramrod/myrod = null
	var/gunchannel

/obj/item/gun/ballistic/arquebus/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 6,"nx" = 7,"ny" = 6,"wx" = -2,"wy" = 3,"ex" = 1,"ey" = 3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -43,"sturn" = 43,"wturn" = 30,"eturn" = -30, "nflip" = 0, "sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -2,"nx" = -5,"ny" = -1,"wx" = -8,"wy" = 2,"ex" = 8,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 1,"nturn" = -45,"sturn" = 45,"wturn" = 0,"eturn" = 0,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onback")
				return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)

/obj/item/gun/ballistic/arquebus/Initialize()
	. = ..()
	myrod = new /obj/item/ramrod(src)


/obj/item/gun/ballistic/arquebus/shoot_live_shot(mob/living/user as mob|obj, pointblank = 0, mob/pbtarget = null, message = 1)
	fire_sound = pick("sound/arquebus/arquefire.ogg", "sound/arquebus/arquefire2.ogg", "sound/arquebus/arquefire3.ogg",
				"sound/arquebus/arquefire4.ogg", "sound/arquebus/arquefire5.ogg")
	. = ..()

/obj/item/gun/ballistic/arquebus/shoot_with_empty_chamber()
	if(cocked)
		playsound(src.loc, 'sound/foley/musketcock.ogg', 100, FALSE)
		cocked = FALSE
		icon_state = initial(icon_state)
		update_icon()

/obj/item/gun/ballistic/arquebus/attack_self(mob/living/user)
	if(chambered)
		..()
	else
		if(!cocked)
			to_chat(user, span_info("I ready the arquebus to be fired..."))
			if(user.mind)
				var/skill = user.mind.get_skill_level(/datum/skill/combat/firearms)
				if(skill)
					reload_time = reload_time / skill
			if(move_after(user, reload_time SECONDS, target = user))
				playsound(user, 'sound/foley/musketcock.ogg', 100, FALSE)
				cocked = TRUE
	update_icon()

/obj/item/gun/ballistic/arquebus/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		if(cocked)
			if((loc == user) && (user.get_inactive_held_item() != src))
				return
			..()
		else
			to_chat(user, span_warning("I need to cock the pistol first!"))

/obj/item/gun/ballistic/arquebus/process_fire/(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(user.mind)
		var/skill = user.mind.get_skill_level(/datum/skill/combat/firearms)
		if(skill)
			misfire_chance = max(0, misfire_chance - (skill * 2))
			spread = max(3, spread / skill)
	if(prob(misfire_chance))
		to_chat(user, span_warning("The [name] misfires!"))
		explosion(src, light_impact_range = 2, heavy_impact_range = 1, smoke = TRUE, soundin = 'sound/misc/explode/bomb.ogg')
		qdel(src)
		return
	cocked = FALSE
	icon_state = initial(icon_state)
	var/dir = get_dir(src, target)
	var/datum/effect_system/smoke_spread/smoke = new
	smoke.set_up(1, get_step(src, dir))
	smoke.start()
	..()

/obj/item/ammo_box/magazine/internal/arquebus
	name = "arquebus internal magazine"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet
	caliber = "runeball"
	max_ammo = 1
	start_empty = TRUE
