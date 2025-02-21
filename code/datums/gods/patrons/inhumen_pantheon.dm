/datum/patron/inhumen
	name = null
	associated_faith = /datum/faith/inhumen
	undead_hater = FALSE
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	confess_lines = list(
		"AO IS THE DEMIURGE!",
		"THE DIVINE ARE WORTHLESS COWARDS!",
		"THE DIVINE ARE DECEIVERS!",
	)

/datum/patron/inhumen/zizo
	name = "Myrkul"
	domain = "Death, the Dead, and the Afterlife"
	desc = "Myrkul is the god of death, the dead, and the afterlife. His followers believe that death is the ultimate end and that only through embracing it can one gain true power. Myrkul teaches that destruction is inevitable and that those who embrace it can shape the future by controlling death itself. The cult of Myrkul seeks to extinguish life, plunging the world into a state of eternal decay, where death rules supreme."
	worshippers = "Necromancers, Warlocks, and the Undead"
	mob_traits = list(TRAIT_CABAL)
	t1 = /obj/effect/proc_holder/spell/invoked/projectile/profane/miracle
	t2 = /obj/effect/proc_holder/spell/invoked/raise_lesser_undead/miracle
	t3 = /obj/effect/proc_holder/spell/invoked/rituos/miracle
	confess_lines = list(
		"THE DEAD SHALL RISE TO RULE!",
		"IN DEATH, WE ARE ETERNAL!",
		"MYRKUL BRINGS THE END!",
	)

/datum/patron/inhumen/graggar
	name = "Bhaal"
	domain = "Murder, Bloodshed, and Death"
	desc = "Bhaal is the god of murder, bloodshed, and death. His followers revel in the chaos of violent acts and believe that through the destruction of life, they can achieve ultimate power. The cult of Bhaal teaches that death is the true form of liberation, and only by embracing the slaughter of the weak can one become truly strong."
	worshippers = "Bloodthirsty Warriors, Prisoners, Murderers and the Cruel"
	mob_traits = list(TRAIT_HORDE, TRAIT_ORGAN_EATER)
	confess_lines = list(
		"BHAAL IS THE BLOOD OF THE WORLD!",
		"THROUGH VIOLENCE, DIVINITY!",
		"IN BLOOD, WE ASCEND!",
	)

/datum/patron/inhumen/bane
	name = "Bane"
	domain = "Tyranny, Fear, and Oppression"
	desc = "Bane is the god of tyranny, fear, and oppression, the embodiment of strength through domination and control. A ruthless god who teaches that only the strong should rule and that fear is the greatest weapon one can wield. His followers believe that true power comes not from kindness or mercy, but from the unyielding rule of those who can impose their will over others. Bane’s creed is one of total domination, where the weak are subjugated, and only the strong can thrive. To follow Bane is to embrace fear as a tool to bring about a new world order, where those who defy his will are crushed beneath the weight of his power."
	worshippers = "Tyrants, Soldiers, Dictators, Fearmongers, Warlocks, and Conquerors"
	confess_lines = list(
	"BANE DEMANDS YOUR FEAR!",
	"THE STRONG RULE THROUGH TYRANNY!",
	"SUBMISSION IS STRENGTH!",
	"FEAR IS THE PATH TO POWER!",
	"ONLY THROUGH CONQUEST CAN WE TRULY RULE!")


/datum/patron/inhumen/matthios
	name = "Mask"
	domain = "Robbery, Redistribution of Wealth, and Commerce"
	desc = "Mask is the god of shadows, thieves, and deception. His followers operate in the darkness, stealing from those who hold power and manipulating others for personal gain. Mask teaches that all wealth, power, and influence are ripe for the taking, and only those bold enough to steal it deserve it. His cults are often involved in covert operations, heists, and political intrigue, seeking to disrupt the established order and sow chaos for their own gain."
	worshippers = "Highwaymen, Robbers, Downtrodden Peasants, Merchants"
	mob_traits = list(TRAIT_COMMIE, TRAIT_SEEPRICES_SHITTY)
	t0 = /obj/effect/proc_holder/spell/invoked/appraise
	t1 = /obj/effect/proc_holder/spell/invoked/transact
	t2 = /obj/effect/proc_holder/spell/invoked/equalize
	t3 = /obj/effect/proc_holder/spell/invoked/churnwealthy
	confess_lines = list(
		"MASK IS THE MASTER OF SHADOWS!",
		"BETRAYAL IS THE TRUEST LOYALTY!",
		"STEAL FROM THE WEALTHY!",
	)

/datum/patron/inhumen/tiamat
	name = "Tiamat"
	domain = "Greed, Tyranny, and Dragons"
	desc = "Tiamat, the Many-Mawed, is the dragon goddess of greed and tyranny, eternally plotting to gain dominion over all. Her followers are fanatical, pursuing wealth and power in her name."
	worshippers = "Dragons, Tyrants, Fanatics, and Treasure Seekers"
	mob_traits = list(TRAIT_COMMIE)
	confess_lines = list(
	"TIAMAT DEMANDS TREASURE!",
	"POWER IS OUR DESTINY!",
	"BOW TO THE FIVE-HEADED QUEEN!",
	"ALL WEALTH BELONGS TO TIAMAT!")
	t0 = /obj/effect/proc_holder/spell/invoked/appraise
	t1 = /obj/effect/proc_holder/spell/invoked/transact
	t2 = /obj/effect/proc_holder/spell/invoked/equalize
	t3 = /obj/effect/proc_holder/spell/invoked/churnwealthy


/datum/patron/inhumen/baotha
	name = "Sharess"
	domain = "Hedonism, Pleasure, and Excess"
	desc = "Sharess, once a goddess of joy and revelry, embraces the darker side of indulgence. Where Sune represents creation and nurturing, Sharess embodies the desire to consume, to live for the fleeting moments of pleasure, regardless of the consequences. Her worshipers revel in excess, seeking to gratify their every desire. Sharess teaches her followers to abandon restraint, embrace decadence, and pursue their passions at all costs. The pursuit of hedonistic pleasure is paramount, and she offers no forgiveness for those who hold back."
	worshippers = "Perverts, Gamblers, Drunkards, and Bards"
	mob_traits = list(TRAIT_DEPRAVED, TRAIT_CRACKHEAD)
	confess_lines = list(
		"SHARES DEMANDS PLEASURE!",
		"LIVE, LAUGH, LOVE!",
		"SHARESS IS MY JOY!",
	)
	t0 = /obj/effect/proc_holder/spell/invoked/projectile/profane/miracle
	t1 = /obj/effect/proc_holder/spell/invoked/projectile/fetch
	t2 = /obj/effect/proc_holder/spell/invoked/bud
	t3 = /obj/effect/proc_holder/spell/invoked/eoracurse

/datum/patron/inhumen/lolth
	name = "Lolth"
	domain = "Chaos, Darkness, and Deception"
	desc = "Lolth, the Queen of Spiders, is the dark patroness of deception, chaos, and the webs of manipulation that bind the world. A former god of order and justice, Lolth turned her back on the natural balance to pursue a reign of fear and dominance. She teaches her followers that only by embracing chaos can true power be attained. Lolth’s worshippers are trained in the arts of treachery and seduction, ruling through fear, lies, and unrelenting ambition. In the darkness, where loyalty is fleeting and survival depends on cunning, Lolth’s word is law. She thrives on the corruption of the strong and the destruction of any semblance of order."
	worshippers = "Drow, Assassins, Spies, and Traitors"
	confess_lines = list(
	"LOLTH WEAVES THE WEB OF DEATH!",
	"LOLTH TESTS ME!",
	"THE SPIDER QUEEN DEMANDS FEAR!",
	"BETRAYAL IS MY BLESSING!")
	t1 = /obj/effect/proc_holder/spell/targeted/spiderconjur
	t2 = /obj/effect/proc_holder/spell/invoked/invisibility/miracle
	t3 = /obj/effect/proc_holder/spell/invoked/infestation5e

/datum/patron/inhumen/shar
	name = "Shar"
	domain = "Loss, Darkness, and Despair"
	desc = "Shar is the goddess of darkness, loss, and despair, embracing the emptiness of the void and offering solace only through isolation and detachment. Her followers shun light and warmth, believing true strength lies in accepting the harsh reality of life’s darkness and rejecting attachment. Shar's creed denies the healing powers of love and light, teaching that only solitude and acceptance of life’s cruel nature can bring enlightenment."
	worshippers = "Loners, Betrayed Souls, Nihilists, Assassins"
	confess_lines = list(
	"SHAR EMBRACES ME IN DARKNESS!",
	"ONLY THROUGH LOSS CAN WE GROW!",
	"DESPAIR IS MY SALVATION!",
	"SHAR HOLDS THE TRUTH OF THE VOID!"
)
	t1 = /obj/effect/proc_holder/spell/invoked/invisibility/miracle
	t2 = /obj/effect/proc_holder/spell/invoked/blindness
	t3 = /obj/effect/proc_holder/spell/invoked/avert

/datum/patron/inhumen/gruumsh  
	name = "Gruumsh"
	domain = "God of War, Conquest, and Orcs"  
	desc = "Gruumsh, the One-Eye, is the warlike patron of orcs and the embodiment of brutal conquest and victory at all costs. His eternal hatred for the elven pantheon drives his followers to ceaseless conflict, with no room for mercy or compromise. To worship Gruumsh is to embrace strength through savagery and to live for the glory of battle."  
	worshippers = "Orcs, Barbarians, Raiders, and Conquerors"  
	confess_lines = list(  
		"GRUUMSH WILL CRUSH ALL FOES!",  
		"FOR GRUUMSH, I WILL CONQUER!",  
		"IN GRUUMSH'S NAME, I CLAIM VICTORY!"  
	)
	t1 = /obj/effect/proc_holder/spell/invoked/longstrider
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/push_spell

/datum/patron/inhumen/maglubiyet
	name = "Maglubiyet"
	domain = "Goblins, Order, War"
	desc = "Maglubiyet is the chief deity of goblins, hobgoblins, and Dekanter goblins as well as an exarch of Bane. He's a god of war who rules over all goblinoids with an iron fist"
	worshippers = "Goblins , Hobgoblins , Worgs"
	confess_lines = list(
		"MAGLUBIYET	CONQUERS ALL!",
		"FOR THE HIGH CHIEFTAIN!",
		"MAGLUBIYET IS THE BATTLE LORD!"
	)
	t1 = /obj/effect/proc_holder/spell/targeted/beasttame
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/shepherd

/datum/patron/inhumen/dagon
	name = "Dagon"
	domain = "The Deep Sea , The Abyss , Dreams"
	desc = "The Primordial Demon Lord Dagon dwells in the 89th level of the Abyss. His true motives are a mystery, even to the ones that worship him."
	worshippers = "Sea Hags, Kuo-toa , Krakens and sentient sea-creatures"
	confess_lines = list(
		"THE WAVES WILL RUN RED WITH BLOOD",
		"I SERVE DAGON AND THE DEEP ONES!",
		"I'a! Dagon! I'a! Dagon! I'a! Dagon!")
	mob_traits = list(TRAIT_ABYSSOR_SWIM, TRAIT_SEA_DRINKER)
	t0 = /obj/effect/proc_holder/spell/invoked/projectile/purify
	t1 = /obj/effect/proc_holder/spell/invoked/abyssor_bends
	t2 = /obj/effect/proc_holder/spell/invoked/abyssheal
	t3 = /obj/effect/proc_holder/spell/invoked/call_mossback
	t4 = /obj/effect/proc_holder/spell/invoked/icebind

/datum/patron/inhumen/malar
	name = "Malar"
	domain = "Nature , Savagery"
	desc = "Malar is a lesser deity of hunting, stalking, bloodlust, and bestial savagery. In his more favorable aspects, he is worshiped by those who identify with the wild natures, as well as the grace and amorality of predators."
	worshippers = "Druids, Werebeasts, Rangers, Barbarians"
	mob_traits = list(TRAIT_KNEESTINGER_IMMUNITY)
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/targeted/beasttame
	t3 = /obj/effect/proc_holder/spell/targeted/conjure_glowshroom
	t4 = /obj/effect/proc_holder/spell/self/howl/call_of_the_moon
	confess_lines = list(
		"Nothing can tame me!",
		"Malar is my master!",
		"I ANSWER THE CALL OF THE WILD HUNT!",
	)
	
/* Frozen Summit EDIT - Back to the main pantheon 
/datum/patron/inhumen/eora
	name = "Eora"
	domain = "Goddess of Degeneracy, Debauchery and Addiction"
	desc = "The Fallen Daughter of Psydon, once used to be a goddess of love and family but has now fallen from grace as she leads mortals to hedonism."
	worshippers = "Drunkards, Junkies, Gamblers and Bards"
	confess_lines = list(
		"EORA BRINGS ME PLEASURE!",
		"EORA BRINGS ME LUCK!",
		"EORA IS MY HAPPINESS!",
	)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
*/ 
