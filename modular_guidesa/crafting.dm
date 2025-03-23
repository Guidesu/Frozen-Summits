/mob/verb/crafting_compendium()
	set name = "Crafting Compendium"
	set category = "IC"
	set desc = "View all available crafting recipes"

	show_crafting_compendium()

/mob/proc/show_crafting_compendium()
	var/dat = {"
	<html>
	<head>
		<title>Crafting Compendium</title>
		<style>
			body {
				font-family: Verdana, sans-serif;
				background: #272727;
				color: #E8E8E8;
			}
			h1 {
				color: #FFA500;
				text-align: center;
			}
			h2 {
				color: #66CC66;
				border-bottom: 1px solid #444;
				padding-bottom: 5px;
			}
			table {
				width: 100%;
				border-collapse: collapse;
				margin: 10px 0;
			}
			th {
				background: #363636;
				padding: 8px;
				text-align: left;
			}
			td {
				padding: 8px;
				border-bottom: 1px solid #444;
				vertical-align: top;
			}
			.reqs {
				color: #88B0D0;
			}
			.tools {
				color: #D0A060;
			}
			.chems {
				color: #C060C0;
			}
			.craft-btn {
				background: #446644;
				color: #CCFFCC;
				padding: 3px 6px;
				border-radius: 3px;
				text-decoration: none;
			}
			.craft-btn.disabled {
				background: #444444;
				color: #888888;
				cursor: not-allowed;
			}
			.status-msg {
				color: #FF6666;
				margin: 5px 0;
			}
		</style>
	</head>
	<body>
	<h1>📜 Crafting Compendium</h1>
	"}

	// Organize recipes by skill category
	var/list/skill_categories = list()
	for(var/datum/crafting_recipe/R in GLOB.crafting_recipes)
		// Skip recipes player hasn't learned
		if(!R.always_availible && !(R.type in mind?.learned_recipes))
			continue
		
		var/category_name = "General"
		if(R.skillcraft)
			var/datum/skill/S = R.skillcraft
			category_name = initial(S.name)
		
		if(!skill_categories[category_name])
			skill_categories[category_name] = list()
		skill_categories[category_name] += R

	// Build category sections
	for(var/category in skill_categories)
		dat += "<h2>🔧 [category] Recipes</h2>"
		dat += "<table>"
		dat += "<tr><th width='25%'>Recipe</th><th width='75%'>Requirements</th></tr>"
		
		for(var/datum/crafting_recipe/R in skill_categories[category])
			// Build requirement strings
			var/req_text = ""
			for(var/path in R.reqs)
				var/atom/A = path
				req_text += "<span class='reqs'>[R.reqs[path]]x [initial(A.name)]</span>, "
			
			var/tool_text = ""
			for(var/path in R.tools)
				if(ispath(path, /obj/item))
					var/obj/item/I = path
					tool_text += "<span class='tools'>[initial(I.name)]</span>, "
				else
					tool_text += "<span class='tools'>[path]</span>, "
			
			var/chem_text = ""
			for(var/path in R.chem_catalysts)
				var/datum/reagent/RG = path
				chem_text += "<span class='chems'>[R.chem_catalysts[path]]u [initial(RG.name)]</span>, "
			
			// Clean up trailing commas
			req_text = length(req_text) ? copytext(req_text, 1, -2) : "None"
			tool_text = length(tool_text) ? "Tools: " + copytext(tool_text, 1, -2) : ""
			chem_text = length(chem_text) ? "Chemicals: " + copytext(chem_text, 1, -2) : ""


			dat += {"
			<tr>
				<td><b>[R.name]</b></td>
				<td>
					[req_text]<br>
					[tool_text]<br>
					[chem_text]
				</td>
			</tr>
			"}
		
		dat += "</table>"

	dat += "</body></html>"
	src << browse(dat, "window=crafting_compendium;size=800x600")
