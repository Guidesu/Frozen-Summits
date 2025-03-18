/datum/patron/neutral
	name = null
	associated_faith = /datum/faith/neutral
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal

/datum/patron/neutral/talona
	name = "Talona"
	domain = "Disease, Poison, Decay and Medicine"
	desc = "The Lady of Poison, Talona represents both the natural decay of life and the spread of sickness. She is seen both as a curse and a purifier."
	worshippers = "The Sick, Phyicians, Apothecaries"
	mob_traits = list(TRAIT_EMPATH, TRAIT_ROT_EATER)
	t0 = /obj/effect/proc_holder/spell/invoked/diagnose
	t1 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t2 = /obj/effect/proc_holder/spell/invoked/projectile/sickness
	t3 = /obj/effect/proc_holder/spell/invoked/attach_bodypart
	t4 = /obj/effect/proc_holder/spell/invoked/cure_rot


	confess_lines = list(
		"TALONA'S TOUCH IS INESCAPABLE!",
		"DECAY IS A CONTINUATION OF LIFE!!",
		"MY AFFLICTION IS MY TESTAMENT!"
	)

/datum/patron/neutral/oghma
	name = "Oghma"
	domain = "Knowledge, Inspiration, and Invention"
	desc = "Oghma is the god of inspiration, invention, and knowledge-sharing. He accepts followers of all moral alignments, encouraging them to pursue knowledge in all its forms, as long as they spread that knowledge for the betterment of others."
	worshippers = "Bards, Scholars, Scribes, and Inventors"
	confess_lines = list(
		"OGHMA, INSPIRE MY MIND!",
		"FOR OGHMA, I SEEK WISDOM!",
		"IN OGHMA'S NAME, I SHARE KNOWLEDGE!"
	)

/datum/patron/neutral/corellon
	name = "Corellon Larethian"
	domain = "Elves, Art, and Magic"
	desc = "Corellon Larethian, the creator of the elven race, embodies the elven ideals of art, magic, and nature. He is revered as a god of beauty and creativity, inspiring his followers to pursue excellence in these fields."
	worshippers = "Elves, Artists, Mages, and Nature Lovers"
	confess_lines = list(
		"CORELLON, INSPIRE MY ART!",
		"FOR CORELLON, I HONOR THE ELVES!",
		"IN CORELLON'S NAME, I EMBRACE BEAUTY!"
	)

/datum/patron/neutral/garl
	name = "Garl Glittergold"
	domain = "Trickery, Humor, and Gemcraft"
	desc = "Garl Glittergold, known as the Watchful Protector, is the patron god of gnomes. He embodies humor, gem-cutting, and trickery, and his followers often approach life with curiosity, laughter, and creativity."
	worshippers = "Gnomes, Tricksters, Jewelers, and Gemcutters"
	confess_lines = list(
		"GARL, GRANT ME WIT!",
		"FOR GARL, I SPREAD LAUGHTER!",
		"IN GARL'S NAME, I CRAFT WITH JOY!"
	)

/datum/patron/neutral/yondalla
	name = "Yondalla"
	domain = "Hearth, Family, and Halflings"
	desc = "Yondalla is the mother of the halfling pantheon, embodying protection, kindness, and community. Her followers are encouraged to protect home and family, finding joy in a simple, peaceful life."
	worshippers = "Halflings, Protectors, Caregivers, and Community Leaders"
	confess_lines = list(
		"YONDALLA, PROTECT MY HOME!",
		"FOR YONDALLA, I GUARD MY FAMILY!",
		"IN YONDALLA'S NAME, I FOSTER PEACE!"
	)

/datum/patron/neutral/elistraee
	name = "Eilistraee"
	domain = "Freedom, Beauty, and the good-hearted Drows"
	desc = "Eilistraee is the Dark Maiden, the goddess of freedom, beauty, and the good-aligned Drow. She stands as a beacon of redemption for Drow, promoting harmony and compassion between races."
	worshippers = "Drow, Artists, Musicians, and Freedom Fighters"
	confess_lines = list(
		"EILISTRAEE, INSPIRE MY SONG!",
		"FOR EILISTRAEE, I BRING HARMONY!",
		"IN EILISTRAEE'S NAME, I DEFY FATE AND HATE!",
		"IN HER NAME, I FORSAKE THE SPIDER QUEEN!"
	)

/datum/patron/neutral/talos
	name = "Talos"
	domain = "Storms, Destruction, Chaos, And the primal destructive nature of nature."
	desc = "Talos is the uncaring and destructive force of nature, ruling storms and natural disasters. His followers embrace the unpredictability of life, reveling in chaos and the power of destruction."
	worshippers = "Barbarians, Pirates, Storm Priests, and Anarchists"
	confess_lines = list(
		"TALOS, BRING THE STORM!",
		"FOR TALOS, I SPREAD CHAOS!",
		"IN TALOS'S NAME, I WREAK HAVOC!"
	)

/datum/patron/neutral/semuanya  
	name = "Semuanya"  
	domain = "Survival, Instinct, and Lizardfolk"  
	desc = "Semuanya is the distant and enigmatic god of survival and preservation worshipped by the lizardfolk. He teaches his followers to focus on survival above all else, avoiding unnecessary conflicts and emotional entanglements. To lizardfolk, Semuanya represents the pure instinct to endure and thrive in a hostile world."  
	worshippers = "Lizardfolk, Survivalists, and Pragmatists"  
	confess_lines = list(
		"SEMUANYA PRESERVES US!",  
		"SURVIVAL IS ALL THAT MATTERS!",  
		"ENDURE AND THRIVE IN HIS NAME!"  
	)
