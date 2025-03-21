/mob/living/carbon/human/verb/adjust_pixel_position()
	set name = "Adjust Pixel Position"
	set category = "IC"
	set desc = "Reposition nearby items (within 1 tile)"

	var/list/nearby_items = list()
	var/list/name_count = list() // Track duplicate names
	
	// Collect items with numbered names
	for(var/obj/I in view(1, src))
		if(I.loc != src)
			var/base_name = I.name
			if(!name_count[base_name])
				name_count[base_name] = 1
			else
				name_count[base_name]++
			
			// Create unique name with number
			var/display_name = "[base_name] ([name_count[base_name]])"
			nearby_items[display_name] = I // Store in associative list

	if(!length(nearby_items))
		to_chat(src, span_warning("No adjustable items nearby."))
		return

	// Sort items alphabetically for better organization
	var/list/sorted_names = sortList(nearby_items)
	
	var/chosen_name = input(src, "Select item to reposition:", "Pixel Adjustment") as null|anything in sorted_names
	if(!chosen_name || !(nearby_items[chosen_name] in view(1, src)))
		return

	var/obj/target = nearby_items[chosen_name]

	// Rest of the code remains the same
	var/new_x = input(src, "Enter X offset (-45 to +45):", "Pixel Adjustment", target.pixel_x) as text
	var/new_y = input(src, "Enter Y offset (-45 to +45):", "Pixel Adjustment", target.pixel_y) as text

	if(!isnum(text2num(new_x)))
		to_chat(src, span_warning("Invalid X coordinate."))
		return
	var/final_x = CLAMP(text2num(new_x), -45, 45)

	if(!isnum(text2num(new_y)))
		to_chat(src, span_warning("Invalid Y coordinate."))
		return
	var/final_y = CLAMP(text2num(new_y), -45, 45)

	target.pixel_x = final_x
	target.pixel_y = final_y
	target.transform = matrix()
	to_chat(src, span_notice("Set [chosen_name] position to X:[final_x], Y:[final_y] (Max ±45)."))
