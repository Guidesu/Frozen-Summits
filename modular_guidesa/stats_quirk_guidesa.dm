//-----------------------------------

////////////////////////
///  STRENGTH QUIRKS ///
////////////////////////

/datum/quirk/strong
	name = "Stats: Strong"
	desc = "I possess exceptional strength, making heavy lifting and physical tasks much easier for me. (+2 Strenght)"
	value = 2

/datum/quirk/strong/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("strength", 2)

/datum/quirk/weak
	name = "Stats: Weak"
	desc = "I lack physical strength, struggling with tasks requiring brute force. (-2 Strenght)"
	value = -2

/datum/quirk/weak/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("strength", -2)

////////////////////////////
///  PERCEPTION QUIRKS   ///
////////////////////////////

/datum/quirk/keen_eyes
	name = "Stats: Keen Eyes"
	desc = "I have sharp eyesight and a heightened sense of awareness. (+ 2 Perception)"
	value = 2

/datum/quirk/keen_eyes/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("perception", 2)

/datum/quirk/unobservant
	name = "Stats: Unobservant"
	desc = "I struggle to notice things around me, often missing important details. (- 2 Perception)"
	value = -2

/datum/quirk/unobservant/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("perception", -2)

///////////////////////////////
///  INTELLIGENCE QUIRKS	///
///////////////////////////////

/datum/quirk/genius
	name = "Stats: Genius"
	desc = "I have an extraordinary intellect, excelling at problem-solving and learning. (+ 2 Intelligence)"
	value = 2

/datum/quirk/genius/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("intelligence", 2)

/datum/quirk/dimwitted
	name = "Stats: Dimwitted"
	desc = "I struggle with intellectual challenges and learning new things. (- 2 Intelligence)"
	value = -2

/datum/quirk/dimwitted/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("intelligence", -2)

///////////////////////////////
///  CONSTITUTION QUIRKS	///
///////////////////////////////

/datum/quirk/resilient
	name = "Stats: Resilient"
	desc = "I have an incredibly tough constitution, allowing me to endure harsh conditions. (+ 2 Constitution)"
	value = 2

/datum/quirk/resilient/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("constitution", 2)

/datum/quirk/frail
	name = "Stats: Frail"
	desc = "My constitution is weak, making me susceptible to injuries and illnesses. (- 2 Constitution)"
	value = -2

/datum/quirk/frail/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("constitution", -2)

/////////////////////////////
///  ENDURANCE QUIRKS	///
/////////////////////////////

/datum/quirk/stamina_boost
	name = "Stats: Enduring"
	desc = "I can keep going when others would give up, rarely tiring. (+ 2 Endurance)"
	value = 2

/datum/quirk/stamina_boost/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("endurance", 2)

/datum/quirk/exhausted
	name = "Stats: Exhausted"
	desc = "I tire easily, unable to keep up with physically demanding tasks for long. (- 2 Endurance)"
	value = -2

/datum/quirk/exhausted/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("endurance", -2)

////////////////////////
///  SPEED QUIRKS   ///
////////////////////////

/datum/quirk/quick
	name = "Stats: Quick"
	desc = "I am faster than average, able to move swiftly when needed. (+ 2 Speed)"
	value = 2

/datum/quirk/quick/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("speed", 2)

/datum/quirk/slow
	name = "Stats: Slow"
	desc = "I move slower than most, often lagging behind. (- 2 Speed)"
	value = -2

/datum/quirk/slow/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("speed", -2)

///////////////////////////////
///  FORTUNE (LUCK) QUIRKS  ///
///////////////////////////////

/datum/quirk/lucky
	name = "Stats: Lucky"
	desc = "Fortune seems to smile upon me, with good outcomes happening more often. (+ 2 Fortune)"
	value = 2

/datum/quirk/lucky/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("fortune", 2)

/datum/quirk/unlucky
	name = "Stats: Unlucky"
	desc = "Bad luck seems to follow me wherever I go, with things going wrong unexpectedly. (- 2 Fortune)"
	value = -2

/datum/quirk/unlucky/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("fortune", -2)




///////////////////////////
///  STRENGTH QUIRKS	///
///////////////////////////

/datum/quirk/very_strong
	name = "Stats: Very Strong"
	desc = "I possess extraordinary strength, allowing me to accomplish incredible feats of physical power. (+4 Strength)"
	value = 4

/datum/quirk/very_strong/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("strength", 4)

/datum/quirk/very_weak
	name = "Stats: Very Weak"
	desc = "I am extremely lacking in physical strength, struggling even with simple physical tasks. (-4 Strength)"
	value = -4

/datum/quirk/very_weak/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("strength", -4)

///////////////////////////////
///  PERCEPTION QUIRKS	  ///
///////////////////////////////

/datum/quirk/hawk_eyes
	name = "Stats: Hawk Eyes"
	desc = "I have exceptional eyesight and perception, noticing details most would miss. (+4 Perception)"
	value = 6

/datum/quirk/hawk_eyes/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("perception", 4)

/datum/quirk/oblivious
	name = "Stats: Oblivious"
	desc = "I am completely unaware of my surroundings, missing even the most obvious details. (-4 Perception)"
	value = -4

/datum/quirk/oblivious/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("perception", -4)

///////////////////////////////
///  INTELLIGENCE QUIRKS	///
///////////////////////////////

/datum/quirk/brilliant
	name = "Stats: Brilliant"
	desc = "I have an exceptionally sharp mind, capable of solving the most complex problems. (+4 Intelligence)"
	value = 6

/datum/quirk/brilliant/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("intelligence", 4)

/datum/quirk/foolish
	name = "Stats: Foolish"
	desc = "I struggle profoundly with intellectual challenges and logical reasoning. (-4 Intelligence)"
	value = -4

/datum/quirk/foolish/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("intelligence", -4)

///////////////////////////////
///  CONSTITUTION QUIRKS	///
///////////////////////////////

/datum/quirk/ironclad
	name = "Stats: Ironclad"
	desc = "I have an incredibly robust constitution, shrugging off harm with ease. (+4 Constitution)"
	value = 6

/datum/quirk/ironclad/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("constitution", 4)

/datum/quirk/fragile
	name = "Stats: Fragile"
	desc = "I have a particularly frail constitution, suffering greatly from minor injuries or illnesses. (-4 Constitution)"
	value = -4

/datum/quirk/fragile/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("constitution", -4)

/////////////////////////////
///  ENDURANCE QUIRKS	///
/////////////////////////////

/datum/quirk/unstoppable
	name = "Stats: Unstoppable"
	desc = "I possess unmatched endurance, able to keep going endlessly. (+4 Endurance)"
	value = 6

/datum/quirk/unstoppable/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("endurance", 4)

/datum/quirk/exhausted_permanently
	name = "Stats: Permanently Exhausted"
	desc = "I am perpetually fatigued, barely able to sustain any physical activity. (-4 Endurance)"
	value = -4

/datum/quirk/exhausted_permanently/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("endurance", -4)

///////////////////////////
///  SPEED QUIRKS	  ///
///////////////////////////

/datum/quirk/lightning_fast
	name = "Stats: Lightning Fast"
	desc = "I am extraordinarily quick, moving with near superhuman speed. (+4 Speed)"
	value = 6

/datum/quirk/lightning_fast/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("speed", 4)

/datum/quirk/sluggish
	name = "Stats: Sluggish"
	desc = "I am exceedingly slow, unable to keep up with others. (-4 Speed)"
	value = -4

/datum/quirk/sluggish/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("speed", -4)

///////////////////////////////
///  FORTUNE (LUCK) QUIRKS  ///
///////////////////////////////

/datum/quirk/serendipitous
	name = "Stats: Serendipitous"
	desc = "Fortune favors me greatly, with everything seeming to go my way. (+4 Fortune)"
	value = 8

/datum/quirk/serendipitous/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("fortune", 4)

/datum/quirk/cursed
	name = "Stats: Cursed"
	desc = "Misfortune is my constant companion, with disaster always lurking nearby. (-4 Fortune)"
	value = -4

/datum/quirk/cursed/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.change_stat("fortune", -4)






