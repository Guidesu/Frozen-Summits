/mob/living/carbon/human/proc/overwrite_cbt_music_to_bg3()
	set name = "Change cmusic to BG3 music"
	set category = "IC"
	set desc = "Replace your character's combat music with BG3 tracks"

	// Confirmation prompt
	var/choice = alert(src, "This will change your current class music to BG3 one, do you REALLY want to do that?", "Music Override Confirmation", "Yes", "No")
	if(choice != "Yes")
		to_chat(src, span_warning("Music change cancelled."))
		return

	// Define BG3 combat music list
	var/list/bg3_tracks = list(
		'sound/music/bg3_cbt_music_8.ogg',
		'sound/music/bg3_cbt_music_7.ogg',
		'sound/music/bg3_cbt_music_6.ogg',
		'sound/music/bg3_cbt_music_5.ogg',
		'sound/music/bg3_cbt_music_4.ogg',
		'sound/music/bg3_cbt_music_3.ogg',
		'sound/music/bg3_cbt_music_2.ogg',
		'sound/music/bg3_cbt_music_1.ogg'
	)
	
	// Overwrite THIS MOB'S combat music
	src.cmode_music = bg3_tracks
	to_chat(src, span_notice("Combat music overwritten to BG3 tracks!"))
