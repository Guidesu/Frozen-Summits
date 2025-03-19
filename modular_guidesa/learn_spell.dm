/mob/verb/learn_spellcasting()
	set name = "Learn Spellcasting"
	set category = "IC"
	set desc = "Gain the ability to learn new spells through study"
	
	var/mob/M = usr
	if(!M.mind)
		to_chat(M, span_warning("You need a conscious mind to learn spellcasting!"))
		return
	
	// Check if already has learnspell ability
	var/obj/effect/proc_holder/spell/self/learnspell/existing = locate() in M.mind.spell_list
	if(existing)
		to_chat(M, span_notice("You already possess the knowledge to learn spells through study."))
		return
	
	// Check requirements
	if(!ishuman(M))
		to_chat(M, span_warning("Your form cannot comprehend arcane formulae!"))
		return
	
	// Create and add the spell
	var/obj/effect/proc_holder/spell/self/learnspell/new_ability = new()
	M.mind.AddSpell(new_ability)
	
	// Feedback
	to_chat(M, span_notice("Arcane knowledge floods your mind! You can now study spellbooks to learn magic."))

