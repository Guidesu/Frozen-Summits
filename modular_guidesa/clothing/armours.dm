/obj/item/clothing/head/roguetown/helmet/bascinet/klapp
	name = "klapp helm"
	desc = "A formidable steel helm crowned with a distinctive clapping visor. While its articulated faceplate grants superior protection, the narrow vision slits turn the world into a shadowy tunnel. The visor's distinctive 'klapp' when snapped shut echoes like a portent of doom on the battlefield. Favored by those who value survival over awareness, its ominous silhouette has become synonymous with the relentless advance of heavily-armored shock troops."
	icon_state = "klappvisier"
	item_state = "klappvisier"
	adjustable = CAN_CADJUST
	emote_environment = 3
	body_parts_covered = FULL_HEAD
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	block2add = FOV_BEHIND
	smeltresult = /obj/item/ingot/steel
	smelt_bar_num = 2

/obj/item/clothing/head/roguetown/helmet/bascinet/etruscan/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "klappvisier_raised"
			body_parts_covered = HEAD|EARS|HAIR
			flags_inv = HIDEEARS|HIDEHAIR
			flags_cover = null
			emote_environment = 0
			update_icon()
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = null
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			emote_environment = 3
			update_icon()
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()

/datum/anvil_recipe/armor/steel/klapp
	name = "Klapp Helm"
	appro_skill = /datum/skill/craft/armorsmithing
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = 	/obj/item/clothing/head/roguetown/helmet/bascinet/klapp
	craftdiff = 2



