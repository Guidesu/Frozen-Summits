/mob/living/carbon/human/verb/gm_note()
	set name = "GM Note"
	set category = "IC"
	set desc = "Send an in-character report to Game Masters for your RP."

	// Get player input with RP context
	var/message = input(src, "Compose your IC report to the GM (provide relevant RP context):", "GM Communication") as message|null
	if(!message || length(message) < 10)
		to_chat(src, span_warning("The note needs more substance to be meaningful."))
		return

	// Send to admins with player context
	var/admin_msg = span_adminnotice("<b>GM NOTE:</b> [key_name(src)] [ADMIN_FLW(src)][ADMIN_SM(src)] (IC: [real_name]):\n[message]")
	message_admins(admin_msg)
	send2adminchat("GM Note from [key_name(src)] (IC: [real_name]): [message]")

	// IC emote
	visible_message(
		span_notice("[src] composes a formal note.")
	)
	
	// OOC confirmation
	to_chat(src, span_info("Your message has been delivered to the Game Masters."))
