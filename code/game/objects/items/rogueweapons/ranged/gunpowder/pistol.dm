/obj/item/gun/ballistic/arquebus_pistol
	name = "arquebus pistol"
	desc = "A small gunpowder weapon that shoots an armor piercing metal ball. While it has the same power as a regular handgonne, it is balanced to be used accurately in a single hand."
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "pistol"
	item_state = "pistol"
	force = 10
	possible_item_intents = list(/datum/intent/shoot/arquebus_pistol, /datum/intent/arc/arquebus_pistol, /datum/intent/mace/strike/wood)
	internal_magazine = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/arquebus
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_SMALL
	randomspread = 1
	spread = 0
	can_parry = TRUE
	pin = /obj/item/firing_pin
	minstr = 6
	walking_stick = FALSE
	cartridge_wording = "lead ball"
	load_sound = 'sound/foley/musketload.ogg'
	fire_sound = "sound/arquebus/arquefire.ogg"
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel
	bolt_type = BOLT_TYPE_NO_BOLT
	casing_ejector = FALSE
	//pickup_sound = 'sound/sheath_sounds/draw_from_holster.ogg'
	//sheathe_sound = 'sound/sheath_sounds/put_back_to_holster.ogg'
	slot_flags = ITEM_SLOT_HIP
	damfactor = 2
	var/reloaded = FALSE
	var/load_time = 50
	var/gunpowder = FALSE
	var/obj/item/ramrod/myrod = null
	var/spread_num = 10
	var/cocked = FALSE
	var/misfire_chance = 0
	/// Reload time, in SECONDS
	var/reload_time = 10
	weapon_embed_chance = 100 //this was here to make a weaker version of the gun, didn't do it, still keeping this here to be used
	damfactor = 5

/obj/item/gun/ballistic/arquebus_pistol/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = -10,"sy" = -8,"nx" = 13,"ny" = -8,"wx" = -8,"wy" = -7,"ex" = 7,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 30,"sturn" = -30,"wturn" = -30,"eturn" = 30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/datum/intent/shoot/arquebus_pistol
	chargetime = 8
	charging_slowdown = 5

/datum/intent/shoot/arquebus_pistol/can_charge()
	if(mastermob)
		return TRUE

/datum/intent/arc/arquebus_pistol
	chargetime = 10
	chargedrain = 5

/datum/intent/arc/arquebus_pistol/can_charge()
	if(mastermob)
		return TRUE

/obj/item/gun/ballistic/arquebus_pistol/Initialize()
	. = ..()
	myrod = new /obj/item/ramrod(src)


/obj/item/gun/ballistic/arquebus_pistol/shoot_live_shot(mob/living/user as mob|obj, pointblank = 0, mob/pbtarget = null, message = 1)
	fire_sound = pick("sound/arquebus/arquefire.ogg", "sound/arquebus/arquefire2.ogg", "sound/arquebus/arquefire3.ogg",
				"sound/arquebus/arquefire4.ogg", "sound/arquebus/arquefire5.ogg")
	. = ..()

/obj/item/gun/ballistic/arquebus_pistol/shoot_with_empty_chamber()
	if(cocked)
		playsound(src.loc, 'sound/foley/musketcock.ogg', 100, FALSE)
		cocked = FALSE
		icon_state = initial(icon_state)
		update_icon()

/obj/item/gun/ballistic/arquebus_pistol/attack_self(mob/living/user)
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

/obj/item/gun/ballistic/arquebus_pistol/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		if(cocked)
			if((loc == user) && (user.get_inactive_held_item() != src))
				return
			..()
		else
			to_chat(user, span_warning("I need to cock the pistol first!"))

/obj/item/gun/ballistic/arquebus_pistol/process_fire/(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
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
