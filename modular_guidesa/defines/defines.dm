// Stasis helpers

#define adjust_silence(duration) adjust_timed_status_effect(duration, /datum/status_effect/silenced)
#define adjust_silence_up_to(duration, up_to) adjust_timed_status_effect(duration, /datum/status_effect/silenced, up_to)
#define set_silence(duration) set_timed_status_effect(duration, /datum/status_effect/silenced)
#define set_silence_if_lower(duration) set_timed_status_effect(duration, /datum/status_effect/silenced, TRUE)


/datum/skill/combat/slings
	name = "Slings"
	desc = "Alongside perception, increases the speed you ready a sling and have it ready to shoot. Does not influence damage or chance to hit."
	dreams = list(
	"...you recall an old maxim you read in a dusty tome within the archives: if you can throw, you can sling...",
	"...the perched archers ruthlessly repel the peasant rebellion. Hope for fairness is almost forlorn, until with a soft crack, a hailing of iron bullets clatter against the foe's helmets...",
	"...your arm tires from the toils of practice. Swinging rapidly has left your arm numb. With weary eyes, you glance aside to witness a hunter practice their craft with a brief overhand toss. Absorbing the technique, you mimic it, and effortlessly cast a powerful stone square onto the target..."
	)


/obj/projectile
	var/npc_damage_mult = 1 // Multiplicative bonus damage.

///from base of atom/hitby(atom/movable/AM, skipcatch, hitpush, blocked, datum/thrownthing/throwingdatum)
///from base of atom/attackby(): (/obj/item, /mob/living, params)
#define COMSIG_ATOM_ATTACKBY "atom_attackby"
///from base of atom/examine(): (/mob, list/examine_text)
#define COMSIG_ATOM_EXAMINE "atom_examine"
///from base of atom/examine_tags(): (/mob, list/examine_tags)
#define COMSIG_ATOM_EXAMINE_TAGS "atom_examine_tags"
///from base of atom/examine_more(): (/mob, examine_list)
#define COMSIG_ATOM_EXAMINE_MORE "atom_examine_more"

/obj/item/proc/get_altdetail_color() //this is for extra layers on clothes
	return altdetail_color

/obj/item/proc/get_altdetail_tag() //this is for extra layers on clothes
	return altdetail_tag


/mob/proc/on_cmode()
	return


/// Called after obj is repaired (needle/hammer for items). Do not call unless obj_broken is true to avoid breaking armor.


/obj
	var/last_peeled_limb
	var/peel_count = 0
	var/peel_threshold = 3
	var/altdetail_tag
	var/altdetail_color
	var/improvised = FALSE //if TRUE, this item is not a proper weapon, but rather a makeshift one. It will not be able to be repaired by normal means.
	var/always_destroy = FALSE


/datum/component/psyblessed
	var/is_blessed
	var/pre_blessed
	var/added_force
	var/added_blade_int
	var/added_int
	var/added_def
	var/silver

/datum/component/psyblessed/Initialize(preblessed = FALSE, force, blade_int, int, def, makesilver)
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine))
	pre_blessed = preblessed
	force = added_force
	added_blade_int = blade_int
	added_int = int
	added_def = def
	silver = makesilver
	if(pre_blessed)
		apply_bless()
		
/datum/component/psyblessed/proc/on_examine(datum/source, mob/user, list/examine_list)
	if(!is_blessed)
		examine_list += span_info("<font color = '#cfa446'>This object may be blessed by the lingering shard of COMET SYON. Until then, its impure alloying of silver-and-steel cannot blight inhumen foes on its own.</font>")
	if(is_blessed)
		examine_list += span_info("<font color = '#46bacf'>This object has been blessed by COMET SYON.</font>")
		if(silver)
			examine_list += span_info("It has been imbued with <b>silver</b>.")

/datum/component/psyblessed/proc/try_bless()
	if(!is_blessed)
		apply_bless()
		play_effects()
		return TRUE
	else
		return FALSE

/datum/component/psyblessed/proc/play_effects()
	if(isitem(parent))
		var/obj/item/I = parent
		playsound(I, 'sound/magic/holyshield.ogg', 100)
		I.visible_message(span_notice("[I] glistens with power as dust of COMET SYON lands upon it!"))

/datum/component/psyblessed/proc/apply_bless()
	if(isitem(parent))
		var/obj/item/I = parent
		is_blessed = TRUE
		I.force += added_force
		if(I.force_wielded)
			I.force_wielded += added_force
		if(I.max_blade_int)
			I.max_blade_int += added_blade_int
			I.blade_int = I.max_blade_int
		I.max_integrity += added_int
		I.obj_integrity = I.max_integrity
		I.wdefense += added_def
		if(silver)
			I.is_silver = silver
			I.smeltresult = /obj/item/ingot/silver
		I.name = "blessed [I.name]"
		I.AddComponent(/datum/component/metal_glint)
