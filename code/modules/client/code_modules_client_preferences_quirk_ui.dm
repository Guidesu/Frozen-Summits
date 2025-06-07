/datum/preferences/proc/ShowQuirkSelection(mob/user)
	// Opens a modern, recipe-book-inspired interactive browser UI for quirk selection.
	var/html = src.generate_quirk_html(user)
	winshow(user, "quirk_selection_window", TRUE)
	var/datum/browser/noclose/popup = new(user, "quirk_selection_browser", "<div align='center'>Quirk Selection</div>", 900, 650)
	popup.set_window_options("can_close=0")
	popup.set_content(html)
	popup.open(FALSE)

/datum/preferences/proc/generate_quirk_html(mob/user)
	// Modern HTML/CSS interactive menu for quirk selection, inspired by recipe_book
	var/all_quirks = GLOB.available_quirks // List of all quirk datums or ids, e.g. /datum/quirk/...
	var/selected_quirks = src.all_quirks
	var/search_query = "" // You can persist this for live search if you wish

	var/html = {"
	<!DOCTYPE html>
	<html lang='en'>
	<meta charset='UTF-8'>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Charm:wght@700&display=swap');
		body {
			font-family: 'Charm', cursive;
			font-size: 1em;
			color: #3e2723;
			background: #f7f1e1;
			margin: 0;
			padding: 0;
		}
		.quirk-menu-container {
			display: flex;
			height: 95vh;
		}
		.sidebar {
			width: 32%;
			padding: 20px;
			border-right: 2px solid #3e2723;
			overflow-y: auto;
			background: #f3e5ab;
		}
		.main-content {
			width: 68%;
			padding: 20px;
			overflow-y: auto;
			background: #fffefb;
		}
		.search-box {
			width: 100%;
			padding: 8px;
			margin-bottom: 15px;
			border: 1px solid #3e2723;
			border-radius: 6px;
			font-family: 'Charm', cursive;
		}
		.quirk-list {
			margin-top: 10px;
		}
		.quirk-link {
			display: block;
			padding: 6px 10px;
			margin-bottom: 5px;
			background: #e6d2b5;
			color: #3e2723;
			border: 1px solid #c2b280;
			border-radius: 5px;
			text-decoration: none;
			cursor: pointer;
			transition: background 0.2s;
		}
		.quirk-link.selected {
			background: #8b4513;
			color: white;
			border: 2px solid #3e2723;
			font-weight: bold;
		}
		.quirk-link:hover {
			background: #d2b48c;
		}
		.quirk-details {
			margin-top: 10px;
			padding: 14px;
			border-radius: 8px;
			border: 1px solid #bca678;
			background: #fffaf3;
		}
		.quirk-title {
			font-size: 1.2em;
			font-weight: bold;
			margin-bottom: 9px;
			color: #5b3412;
		}
		.select-btn {
			margin-top: 12px;
			padding: 7px 18px;
			background: #8b4513;
			color: #fff;
			border: 1px solid #3e2723;
			border-radius: 5px;
			cursor: pointer;
			font-family: 'Charm', cursive;
			font-size: 1em;
		}
		.select-btn.selected {
			background: #c8b080;
			color: #3e2723;
			cursor: default;
			border: 1px solid #a8a07a;
		}
		.current-list {
			margin-top: 20px;
			padding: 10px 0;
			border-top: 1px solid #8b4513;
		}
		.current-list span {
			display: inline-block;
			background: #e6d2b5;
			padding: 4px 12px;
			border-radius: 4px;
			margin: 2px;
			border: 1px solid #c2b280;
		}
		.remove-btn {
			margin-left: 7px;
			color: #b00;
			cursor: pointer;
			text-decoration: underline;
			font-size: 0.95em;
		}
	</style>
	<body>
		<h1 style='text-align:center;'>Quirk Selection</h1>
		<div class='quirk-menu-container'>
			<div class='sidebar'>
				<input type='text' class='search-box' id='searchInput' placeholder='Search quirks...' value='[search_query]'>
				<div class='quirk-list' id='quirkList'>
	"}
	// List quirks (filtered by search; for demo, no categories)
	for(var/quirk_path in all_quirks)
		var/datum/quirk/Q = all_quirks[quirk_path]
		if(!Q) continue
		var/quirk_id = "[quirk_path]"
		var/selected = (quirk_id in selected_quirks)
		html += "<a class='quirk-link[ selected ? " selected" : ""]' href='byond://?src=\\ref[src];action=view_quirk&quirk=[quirk_id]'>[Q.name]</a>"
	html += {"
				</div>
				<div class='current-list'>
					<b>Current Quirks:</b><br>
	"}
	var/has_any = 0
	for(var/quirk_id in selected_quirks)
		var/datum/quirk/Q = GLOB.available_quirks[quirk_id]
		if(Q)
			html += "<span>[Q.name]<a class='remove-btn' href='byond://?src=\\ref[src];action=remove_quirk&quirk=[quirk_id]' title='Remove'>&times;</a></span> "
			has_any = 1
	if(!has_any)
		html += "<i>None selected</i>"
	html += {"
				</div>
			</div>
			<div class='main-content' id='quirkDetails'>
	"}
	// Display selected quirk details (for demo, show first in list if none selected)
	var/active_quirk = src.tmp_active_quirk
	if(!active_quirk && all_quirks.len)
		active_quirk = all_quirks[all_quirks[1]]
	if(active_quirk)
		var/datum/quirk/Q = istype(active_quirk, /datum/quirk) ? active_quirk : GLOB.available_quirks[active_quirk]
		if(Q)
			var/already_has = (active_quirk in selected_quirks)
			html += "<div class='quirk-details'>"
			html += "<div class='quirk-title'>[Q.name]</div>"
			html += "<div>[Q.desc]</div>"
			html += "<button class='select-btn[ already_has ? " selected" : ""]' "
			if(!already_has)
				html += "onclick=\"window.location='byond://?src=\\ref[src];action=add_quirk&quirk=[Q.type]'\""
			html += ">"
			html += already_has ? "Selected" : "Add Quirk"
			html += "</button></div>"
		else
			html += "<div>No quirk selected.</div>"
	else
		html += "<div>No quirks available.</div>"
	html += {"
			</div>
		</div>
	<script>
	// Live search filtering for quirks
	let searchTimeout;
	document.getElementById('searchInput').addEventListener('keyup', function(e) {
		clearTimeout(searchTimeout);
		searchTimeout = setTimeout(function() {
			const query = document.getElementById('searchInput').value.toLowerCase();
			const quirkLinks = document.querySelectorAll('.quirk-link');
			let anyVisible = false;
			quirkLinks.forEach(function(link) {
				const name = link.textContent.toLowerCase();
				if(query === '' || name.includes(query)) {
					link.style.display = 'block';
					anyVisible = true;
				} else {
					link.style.display = 'none';
				}
			});
			// Optionally: Show a "No matches" message if nothing found
		}, 200);
	});
	</script>
	</body>
	</html>
	"}
	return html

/datum/preferences/Topic(href, href_list)
	. = ..()
	var/action = href_list["action"]
	if(!action) return

	switch(action)
		if("view_quirk")
			var/quirk_id = href_list["quirk"]
			if(quirk_id && (quirk_id in GLOB.available_quirks))
				src.tmp_active_quirk = quirk_id
				current_reader << browse(generate_quirk_html(current_reader), "window=quirk_selection_browser;size=900x650")
			return
		if("add_quirk")
			var/quirk_id = href_list["quirk"]
			if(quirk_id && !(quirk_id in src.all_quirks) && (quirk_id in GLOB.available_quirks))
				src.all_quirks += quirk_id
				src.tmp_active_quirk = quirk_id
				current_reader << browse(generate_quirk_html(current_reader), "window=quirk_selection_browser;size=900x650")
			return
		if("remove_quirk")
			var/quirk_id = href_list["quirk"]
			if(quirk_id && (quirk_id in src.all_quirks))
				src.all_quirks -= quirk_id
				src.tmp_active_quirk = null
				current_reader << browse(generate_quirk_html(current_reader), "window=quirk_selection_browser;size=900x650")
			return

// To use this menu, replace the old Configure Quirks link in ShowChoices with:
// <a href='?_src_=prefs;preference=quirk_menu'>Configure Quirks</a>
//
// And then in the preferences Topic, handle 'quirk_menu' by calling src.ShowQuirkSelection(user).