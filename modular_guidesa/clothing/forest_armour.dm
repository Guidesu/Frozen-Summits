/obj/item/clothing/suit/roguetown/armor/leather/hide/warden
	name = "forestry armor"
	desc = "A light armor worn by the Wardens of Neverwinter. Far more durable than leather."
	icon = 'icons/roguetown/clothing/special/warden.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/warden.dmi'
	icon_state = "foresthide"

/obj/item/clothing/suit/roguetown/armor/plate/druidic_plate
	name = "wood druidic plate"
	desc = "Woven by song and tool of the oldest druids."
	armor = list("blunt" = 100, "slash" = 20, "stab" = 40, "piercing" = 100, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST, BCLASS_PICK, BCLASS_SMASH)
	icon = 'icons/roguetown/clothing/special/race_armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/race_armor.dmi'
	icon_state = "welfchest"
	item_state = "welfchest"
	max_integrity = 500
	smeltresult = /obj/item/rogueore/coal
	smelt_bar_num = 4
	blocksound = SOFTHIT
	armor_class = ARMOR_CLASS_MEDIUM

/obj/item/clothing/suit/roguetown/armor/plate/elven_plate/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/item_equipped_movement_rustle, SFX_WOOD_ARMOR)


/obj/item/clothing/cloak/wardencloak
	name = "warden cloak"
	desc = "A cloak worn by the Veteran Warden of the forest."
	icon_state = "wardencloak"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	inhand_mod = TRUE

/obj/item/clothing/cloak/forrestercloak
	name = "forrester cloak"
	desc = "A cloak worn by the wardens of the forest."
	icon_state = "forestcloak"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	inhand_mod = TRUE

/obj/item/clothing/cloak/forrestercloak/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete/roguetown/cloak)


/obj/item/clothing/shoes/roguetown/boots/leather/druidic_boots
	name = "wood druidic boots"
	desc = "The living trunks still blossom in the spring. They let water through, but it is never cold."
	armor = list("blunt" = 80, "slash" = 10, "stab" = 10, "piercing" = 80, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	icon = 'icons/roguetown/clothing/special/race_armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/race_armor.dmi'
	icon_state = "welfshoes"
	item_state = "welfshoes"


/obj/item/clothing/gloves/roguetown/druidic_gloves
	name = "wood druidic gloves"
	desc = "The insides are lined with soft, living leaves and soil. They wick away moisture easily."
	icon = 'icons/roguetown/clothing/special/race_armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/race_armor.dmi'
	icon_state = "welfhand"
	item_state = "welfhand"
	armor = list("blunt" = 80, "slash" = 10, "stab" = 20, "piercing" = 100, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_SMASH, BCLASS_PICK)
	resistance_flags = FIRE_PROOF
	blocksound = SOFTHIT
	max_integrity = 200


/obj/item/clothing/head/roguetown/helmet/heavy/druidic_helm
	name = "wood druidic helm"
	desc = "An assembly of woven trunk, kept alive by ancient song, now twisted and warped for battle and scorn."
	body_parts_covered = FULL_HEAD | NECK
	armor = list("blunt" = 100, "slash" = 40, "stab" = 20, "piercing" = 100, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	icon = 'icons/roguetown/clothing/special/race_armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/race_armor.dmi'
	icon_state = "welfhead"
	item_state = "welfhead"
	block2add = FOV_BEHIND
	bloody_icon = 'icons/effects/blood64.dmi'
	smeltresult = /obj/item/rogueore/coal
	max_integrity = 300
	blocksound = SOFTHIT

/obj/item/clothing/head/roguetown/helmet/bascinet/antler
	name = "wardens's helmet"
	desc = "A strange helmet adorned with antlers worn by the warden of the forest."
	icon = 'icons/roguetown/clothing/special/warden.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/warden64.dmi'
	bloody_icon = 'icons/effects/blood64.dmi'
	icon_state = "wardenhelm"
	adjustable = CAN_CADJUST
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/roguetown/helmet/bascinet/antler/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "wardenhelm_raised"
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


/obj/item/clothing/head/roguetown/helmet/heavy/goat
	name = "helm of the goat"
	desc = "A strange helmet adorned with goat horns and skull."
	icon = 'icons/roguetown/clothing/special/warden.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/warden.dmi'
	bloody_icon = 'icons/effects/blood64.dmi'
	icon_state = "skullmet_goat"
	item_state = "skullmet_goat"
	body_parts_covered = FULL_HEAD | NECK
	armor = list("blunt" = 100, "slash" = 40, "stab" = 20, "piercing" = 100, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	icon = 'icons/roguetown/clothing/special/race_armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/race_armor.dmi'
	block2add = FOV_BEHIND
	bloody_icon = 'icons/effects/blood64.dmi'
	smeltresult = /obj/item/rogueore/coal
	max_integrity = 300
	blocksound = SOFTHIT

/obj/item/clothing/head/roguetown/helmet/heavy/bear
	name = "helm of the bear"
	desc = "A strange helmet adorned with a skull of a bear"
	icon = 'icons/roguetown/clothing/special/warden.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/warden.dmi'
	bloody_icon = 'icons/effects/blood64.dmi'
	icon_state = "skullmet_goat"
	body_parts_covered = FULL_HEAD | NECK
	armor = list("blunt" = 100, "slash" = 40, "stab" = 20, "piercing" = 100, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	icon = 'icons/roguetown/clothing/special/race_armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/race_armor.dmi'
	icon_state = "skullmet_bear"
	item_state = "skullmet_bear"
	block2add = FOV_BEHIND
	bloody_icon = 'icons/effects/blood64.dmi'
	smeltresult = /obj/item/rogueore/coal
	max_integrity = 300
	blocksound = SOFTHIT

/obj/item/clothing/head/roguetown/helmet/heavy/wolf
	name = "helm of the wolf"
	desc = "A strange helmet adorned with a skull of a wolf."
	icon = 'icons/roguetown/clothing/special/warden.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/warden.dmi'
	bloody_icon = 'icons/effects/blood64.dmi'
	icon_state = "skullmet_volf"
	item_state = "skullmet_volf"
	body_parts_covered = FULL_HEAD | NECK
	armor = list("blunt" = 100, "slash" = 40, "stab" = 20, "piercing" = 100, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	icon = 'icons/roguetown/clothing/special/race_armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/race_armor.dmi'
	block2add = FOV_BEHIND
	bloody_icon = 'icons/effects/blood64.dmi'
	smeltresult = /obj/item/rogueore/coal
	max_integrity = 300
	blocksound = SOFTHIT
