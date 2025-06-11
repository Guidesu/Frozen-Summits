

#define COMSIG_HOSTILE_PRE_ATTACKINGTARGET "hostile_pre_attackingtarget"
	#define COMPONENT_HOSTILE_NO_PREATTACK (1<<0) //cancel the attack, only works before attack happens



#define COMSIG_ATOM_HULK_ATTACK "hulk_attack"					//from base of atom/attack_hulk(): (/mob/living/carbon/human)

	//End positions

#define COMSIG_ATOM_SING_PULL "atom_sing_pull"					//from base of atom/singularity_pull(): (S, current_size)

#define COMSIG_ATOM_RAD_PROBE "atom_rad_probe"					//from proc/get_rad_contents(): ()
	#define COMPONENT_BLOCK_RADIATION 1
#define COMSIG_ATOM_RAD_CONTAMINATING "atom_rad_contam"			//from base of datum/radiation_wave/radiate(): (strength)
	#define COMPONENT_BLOCK_CONTAMINATION 1
#define COMSIG_ATOM_RAD_WAVE_PASSING "atom_rad_wave_pass"		//from base of datum/radiation_wave/check_obstructions(): (datum/radiation_wave, width)
  #define COMPONENT_RAD_WAVE_HANDLED 1

#define COMSIG_ITEM_HIT_RESPONSE "item_hit_response"
#define COMSIG_ITEM_ATTACK_TURF "item_attack_turf"
