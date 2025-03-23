/datum/statpack/5e/arcane_prodigy
	name = "Arcane Prodigy"
	desc = "The whispers of the Weave fuel your intellect, yet your mortal shell falters beneath its weight."
	stat_array = list(STAT_INTELLIGENCE = 4, STAT_PERCEPTION = 2, STAT_CONSTITUTION = -3, STAT_STRENGTH = -2, STAT_FORTUNE = -1)

/datum/statpack/5e/berserker
	name = "Berserker's Fury"
	desc = "The bloodsong drowns out all thought—only violence remains."
	stat_array = list(STAT_STRENGTH = 4, STAT_ENDURANCE = 3, STAT_INTELLIGENCE = -3, STAT_PERCEPTION = -2, STAT_FORTUNE = -2)


/datum/statpack/5e/cursed_wanderer
	name = "Cursed Wanderer"
	desc = "Fortune smiles... and then laughs. Your path is paved with both gold and thorns."
	stat_array = list(STAT_FORTUNE = 4, STAT_STRENGTH = -2, STAT_CONSTITUTION = -2, STAT_PERCEPTION = -1, STAT_ENDURANCE = -1)


/datum/statpack/5e/stalwart
	name = "Stalwart Defender"
	desc = "You stand unbroken, a bastion against chaos—yet the world moves swiftly beyond your guard."
	stat_array = list(STAT_CONSTITUTION = 3, STAT_ENDURANCE = 3, STAT_SPEED = -3, STAT_PERCEPTION = -2)


/datum/statpack/5e/fey_touched
	name = "Fey-Touched"
	desc = "The glamor of the Feywild dances in your veins—beware its mercurial whims."
	stat_array = list(STAT_SPEED = 3, STAT_FORTUNE = 3, STAT_INTELLIGENCE = -2, STAT_CONSTITUTION = -2, STAT_PERCEPTION = list(-1, 2)) // Perception fluctuates whimsically



/datum/statpack/5e/oathsworn
	name = "Oathsworn"
	desc = "Your oath is your strength—and your chains."
	stat_array = list(STAT_STRENGTH = 2, STAT_ENDURANCE = 2, STAT_CONSTITUTION = 2, STAT_INTELLIGENCE = -2, STAT_FORTUNE = -2)


/datum/statpack/5e/oracle
	name = "Wretched Oracle"
	desc = "The future is an open book... and its pages are written in your blood."
	stat_array = list(STAT_PERCEPTION = 4, STAT_FORTUNE = 2, STAT_INTELLIGENCE = -3, STAT_CONSTITUTION = -3)



/datum/statpack/5e/shadowdancer
	name = "Shadowdancer"
	desc = "The night is your ally—but even allies demand a price."
	stat_array = list(STAT_SPEED = 4, STAT_PERCEPTION = 2, STAT_CONSTITUTION = -2, STAT_FORTUNE = -2, STAT_STRENGTH = -1)


/datum/statpack/5e/dragonkin
	name = "Dragonkin Scion"
	desc = "The blood of dragons roars within you—yet mortal frailty lingers."
	stat_array = list(STAT_STRENGTH = 3, STAT_CONSTITUTION = 3, STAT_INTELLIGENCE = -2, STAT_FORTUNE = -2, STAT_PERCEPTION = -1)


/datum/statpack/5e/lycanthropic_rage
	name = "Lycanthropic Rage"
	desc = "The beast within grants terrible power - moon-touched strength and preternatural resilience, but each transformation erodes your connection to civilization... and fortune itself."
	stat_array = list(
		STAT_STRENGTH = 4,
		STAT_SPEED = 3,
		STAT_ENDURANCE = 3,
		STAT_CONSTITUTION = 2,
		STAT_INTELLIGENCE = -3,
		STAT_PERCEPTION = -2,  // Enhanced senses but poor focus
		STAT_FORTUNE = -4	   // Cursed existence
	)
