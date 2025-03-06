/datum/patron/divine
	name = null
	associated_faith = /datum/faith/divine
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal

/datum/patron/divine/astrata
	name = "Pelor"
	domain = "Sun, Healing, and Agriculture"
	desc = "The benevolent god of the Sun, Pelor radiates warmth and healing to all. Farmers and healers alike revere his light and are strengthened by his guidance."
	worshippers = "Clerics of the Light, Healers, Farmers"
	confess_lines = list(
		"PELOR IS MY LIGHT!",
		"PELOR BRINGS PEACE!",
		"I SERVE THE GLORY OF THE SUN!",
	)
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/revive


/datum/patron/divine/lathander
	name = "Lathander"
	domain = "Dawn, Renewal, and Vitality"
	desc = "Lathander is the god of dawn, renewal, and life, representing the promise of new beginnings and the resilience of the human spirit. His followers believe that light can overcome darkness, and that with each sunrise, there is an opportunity to grow, heal, and bring hope to the world. Most of the times. Merchants and Travellers worship them due to him protecting them over their travels."
	worshippers = "Merchants, Farmers, travelers, Hopeful Souls"
	confess_lines = list(
	"LATHANDER IS MY DAWN!",
	"EVERY DAY IS A NEW HOPE!",
	"THE LIGHT SHALL TRIUMPH OVER DARKNESS!",
	"LATHANDER GUIDES ME TO PEACE!")
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/revive

/datum/patron/divine/noc
	name = "Mystra"
	domain = "Magic and Mysticism"
	desc = "Mystra is the living embodiment of all magic and arcane power within the universe. As the Goddess of Magic, she governs the weave of magic that connects all things, and her influence permeates both the natural and mystical realms. Mystra's divine presence maintains the delicate balance of magic, ensuring it flows freely yet remains controlled, for it is through her power that reality itself is shaped. She is the keeper of the Weave, the framework through which all magic is channeled and manipulated, both by mortals and immortals alike. Mystra’s guidance has fostered great civilizations and advanced arcane knowledge, yet she also serves as a reminder of the potential dangers of unchecked magical forces."
	worshippers = "Wizards and Scholars"
	mob_traits = list(TRAIT_NIGHT_OWL, TRAIT_NOCSIGHT)
	t1 = /obj/effect/proc_holder/spell/invoked/blindness/miracle
	t2 = /obj/effect/proc_holder/spell/invoked/invisibility/miracle
	confess_lines = list(
		"THE WEAVE CONNECTS ALL THAT IS!",
		"IN MYSTRA'S LIGHT, MAGIC THRIVES!",
		"MAGIC IS THE SONG OF THE UNIVERSE!",
	)

/datum/patron/divine/selune
	name = "Selûne"
	domain = "Moon, Stars, and Navigation"
	desc = "Selûne, the Lady of Silver, presides over the moon and stars, guiding travelers and dreamers. She represents light and hope against the darkness and constantly struggles against her sister, Shar, who seeks to plunge the world into eternal shadow."
	worshippers = "Navigators, Dreamers, Celestial Guides, and Sailors"
	mob_traits = list(TRAIT_NIGHT_OWL, TRAIT_NOCSIGHT)
	t1 = /obj/effect/proc_holder/spell/invoked/blindness/miracle
	t2 = /obj/effect/proc_holder/spell/invoked/invisibility/miracle
	confess_lines = list(
		"SELÛNE, GUIDE MY PATH!",
		"FOR SELÛNE, I LIGHT THE NIGHT!",
		"IN SELÛNE'S NAME, I BANISH THE SHADOW!"
	)


/datum/patron/divine/dendor
	name = "Silvanus"
	domain = "Earth and Nature"
	desc = "The Oak Father of the wilderness, Silvanus represents nature in all its forms. He presides over the balance of the land and life itself."
	worshippers = "Druids, Beasts, Madmen"
	mob_traits = list(TRAIT_KNEESTINGER_IMMUNITY)
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/targeted/beasttame
	t3 = /obj/effect/proc_holder/spell/targeted/conjure_glowshroom
	t4 = /obj/effect/proc_holder/spell/self/howl/call_of_the_moon
	confess_lines = list(
		"Silvanus PROVIDES!",
		"THE TREEFATHER BRINGS BOUNTY!",
		"I ANSWER THE CALL OF THE WILD!",
	)


/datum/patron/divine/chauntea
	name = "Chauntea"
	domain = "Agriculture, Harvest, and Fertility"
	desc = "Chauntea, also known as the Great Mother, is the goddess of agriculture, harvest, and fertility, revered by farmers, gardeners, and those who cherish the natural bounty of the earth. Her teachings revolve around nurturing life, protecting the natural cycles, and honoring the earth."
	worshippers = "Farmers, Gardeners, Homesteaders, Nurturers, Environmentalists"
	confess_lines = list(
	"CHAUNTEA PROVIDES OUR HARVEST!",
	"THE EARTH IS A SACRED GIFT!",
	"THE CYCLES OF LIFE ARE BLESSED!",
	"CHAUNTEA, GUIDE US IN FERTILITY AND ABUNDANCE!")
	mob_traits = list(TRAIT_KNEESTINGER_IMMUNITY)
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/targeted/beasttame
	t3 = /obj/effect/proc_holder/spell/targeted/conjure_glowshroom


/datum/patron/divine/abyssor
	name = "Umberlee"
	domain = "The Sea, Storms, and Tides"
	desc = "The Queen of the Depths, Umberlee is feared and respected by those who sail. She commands the fury of the seas. "
	worshippers = "Men of the Sea, Primitive Aquatics"
	mob_traits = list(TRAIT_ABYSSOR_SWIM, TRAIT_SEA_DRINKER)
	t0 = /obj/effect/proc_holder/spell/invoked/projectile/purify
	t1 = /obj/effect/proc_holder/spell/invoked/abyssor_bends
	t2 = /obj/effect/proc_holder/spell/invoked/abyssheal
	t3 = /obj/effect/proc_holder/spell/invoked/call_mossback
	t4 = /obj/effect/proc_holder/spell/invoked/icebind

	confess_lines = list(
		"UMBERLEE COMMANDS THE WAVES!",
		"THE OCEAN'S FURY IS UMBERLEE'S WILL!",
		"I AM DRAWN BY THE PULL OF THE TIDE!",
	)

/datum/patron/divine/ravox
	name = "Tyr"
	domain = "Justice, Glory, Battle"
	desc = "Tyr, the Maimed God, stands for justice and law. He is known for his unwavering sense of right and wrong and often inspires warriors with a sense of duty."
	worshippers = "Warriors, Sellswords & those who seek Justice"
	confess_lines = list(
		"TYR IS JUSTICE!",
		"THROUGH STRIFE, GRACE!",
		"THE DRUMS OF JUSTICE BEAT IN MY CHEST!")
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/shepherd
	t3 = /obj/effect/proc_holder/spell/invoked/revive

/datum/patron/divine/bahamut
	name = "Bahamut"
	domain = "Justice, Honor, and Protection"
	desc = "Bahamut, the platinum dragon, is the god of justice, honor, and protection, revered by those who seek to defend the innocent and uphold truth. He believes that true strength lies in righteousness and compassion, urging his followers to stand as shields against evil. Bahamut’s teachings promote fairness, duty, and sacrifice for the greater good."
	worshippers = "Knights, Paladins, Dragons of Good, Protectors of the Weak"
	confess_lines = list(
	"BAHAMUT GRANTS ME STRENGTH!",
	"JUSTICE SHALL ALWAYS PREVAIL!",
	"WITH HONOR, I SERVE THE WEAK!",
	"THE PLATINUM DRAGON PROTECTS US ALL!")
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/shepherd
	t3 = /obj/effect/proc_holder/spell/invoked/revive


/datum/patron/divine/necra
	name = "Kelemvor"
	domain = "Death and the Afterlife"
	desc = "Kelemvor oversees the passage of souls, guiding them into the afterlife. He is fair and seeks to maintain balance, respected by mortals as the judge of the dead."
	worshippers = "The Dead, Mourners, Gravekeepers"
	mob_traits = list(TRAIT_SOUL_EXAMINE)
	t1 = /obj/effect/proc_holder/spell/invoked/avert
	t2 = /obj/effect/proc_holder/spell/targeted/abrogation
	t3 = /obj/effect/proc_holder/spell/targeted/soulspeak
	confess_lines = list(
		"ALL SOULS FIND THEIR WAY TO KELEMVOR!",
		"THE JUDGE IS OUR FINAL REPOSE!",
		"I FEAR NOT DEATH, AS IT AWAITS ME!",
	)

/datum/patron/divine/xylix
	name = "Tymora"
	domain = "Trickery, Freedom and Inspiration"
	desc = "Tymora is the goddess of good luck in the Faerûnian pantheon. Her followers seek to revel in life's pleasures, from games of chance to the pursuit of inspiration. Known for her trickery and penchant for unpredictability, she is a god of those who dance to their own beat."
	worshippers = "Gamblers, Bards, Artists, and the Silver-Tongued"
	mob_traits = list(TRAIT_XYLIX)
	t1 = /obj/effect/proc_holder/spell/invoked/wheel
	t2 = /obj/effect/proc_holder/spell/invoked/mockery
	confess_lines = list(
		"FORTUNE FAVORS THE BOLD!",
		"TYMORA IS MY GODDESS!",
		"LADY LUCK IS WITH ME!",
	)

/datum/patron/divine/pestra
	name = "Ilmater"
	domain = "Endurance, Mercy, and Suffering"
	desc = "Ilmater, the Crying God, protects the oppressed and persecuted, bearing the suffering of others to alleviate their pain. His followers are compassionate and self-sacrificing, willing to take on the burdens of others to ease their suffering."
	worshippers = "Healers, Martyrs, Mercy-Givers, and the Oppressed"
	mob_traits = list(TRAIT_EMPATH, TRAIT_ROT_EATER)
	t0 = /obj/effect/proc_holder/spell/invoked/diagnose
	t1 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/attach_bodypart
	t4 = /obj/effect/proc_holder/spell/invoked/cure_rot
	confess_lines = list(
		"ILMATER, BEAR MY BURDENS!",
		"FOR ILMATER, I SUFFER FOR OTHERS!",
		"IN ILMATER'S NAME, I EASE THE PAIN!!",
	)

/datum/patron/divine/malum
	name = "Moradin"
	domain = "Creation, Fire, and Crafting"
	desc = "Moradin, the Soul Forger, is the dwarven god of creation and craftsmanship. He values hard work and skill above all else."
	worshippers = "Smiths, Miners, Engineers"
	t0 = /obj/effect/proc_holder/spell/invoked/malum_flame_rogue
	t1 = /obj/effect/proc_holder/spell/invoked/vigorousexchange
	t2 = /obj/effect/proc_holder/spell/invoked/heatmetal
	t3 = /obj/effect/proc_holder/spell/invoked/craftercovenant
	t4 = /obj/effect/proc_holder/spell/invoked/hammerfall
	confess_lines = list(
		"MORADIN IS MY MUSE!",
		"TRUE VALUE IS IN THE TOIL!",
		"I AM AN INSTRUMENT OF CREATION!",
	)

//Eora content from Stonekeep

/datum/patron/divine/eora
	name = "Sune"
	domain = "Love, Life and Beauty"
	desc = "Sune is the goddess of beauty and love, her followers cherishing the values of compassion and charm. She inspires the arts and romantic love."
	worshippers = "Lovers, the romantically inclined, and Doting Grandparents"
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/bud
	t2 = /obj/effect/proc_holder/spell/invoked/eoracurse
	t3 = null
	confess_lines = list(
		"SUNE INSPIRES LOVE!",
		"HER BEAUTY SHINES IN ALL THINGS!",
		"I LOVE YOU, EVEN AS YOU TRESPASS AGAINST ME!",
	)
