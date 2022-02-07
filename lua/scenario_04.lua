
local _ = wesnoth.textdomain 'wesnoth-AOI_Rework'
local T = wml.tag
local on_event = wesnoth.require("on_event")

local random_spawns = {
	{
		{"Young Ogre", "Ogre", "Great Ogre", "none"},
		{"Orcish Grunt", "Orcish Marauder", "more", "Orcish Warlord"},
		{"Goblin Spearman", "more", "more", "more"},
		{"Goblin Spearman", "Goblin Rouser", "none", "none"},
		{"Orcish Leader", "Orcish Ruler", "Orcish Sovereign", "none"},
	},
	{
		{"Orcish Shaman", "Orcish Warlock", "Orcish Sorcerer", "none"},
		{"Orcish Slinger", "Orcish Hunter", "more", "none"},
		{"Orcish Serf", "Orcish Foreman", "Orcish Overseer", "none"},
		{"Goblin Spearman", "more", "more", "more"},
	},
	{
		{"Orcish Shaman", "Orcish Warlock", "Orcish Sorcerer", "more"},
		{"Orcish Archer", "Orcish Crossbowman", "Orcish Slurbow", "more"},
		{"Orcish Serf", "Orcish Foreman", "more", "Orcish Overseer"},
	},
	{
		{"Young Ogre", "Ogre", "more", "none"},
		{"Orcish Slinger", "Orcish Hunter", "none", "Orcish Stalker"},
		{"Orcish Archer", "Orcish Crossbowman", "Orcish Slurbow", "none"},
		{"Orcish Serf", "Orcish Foreman", "more", "Orcish Overseer"},
	},
	{
		{"Orcish Archer", "Orcish Crossbowman", "more", "Orcish Slurbow"},
		{"Orcish Assassin", "Orcish Slayer", "none", "Orcish Nightblade"},
		{"Wolf Rider", "Goblin Pillager", "Goblin Cutthroat", "none"},
	},
	{
		{"Naga Fighter", "Naga Warrior", "more", "Naga Myrmidon"},
		{"Saurian Augur", "Saurian Oracle", "Saurian Prophet", "none"},
		{"Wolf Rider", "Goblin Knight", "more", "none"},
	},
	{
		{"Troll Whelp", "Troll", "Troll Warrior", "none"},
		{"Orcish Archer", "Orcish Crossbowman", "Orcish Slurbow", "none"},
		{"Saurian Skirmisher", "more", "Saurian Ambusher", "more"},
	},
	{
		{"Orcish Grunt", "Orcish Warrior", "more", "none"},
		{"Saurian Skirmisher", "Saurian Ambusher", "more", "none"},
		{"Saurian Augur", "Saurian Oracle", "none", "none"},
		{"Goblin Spearman", "more", "more", "more"},
		{"Goblin Spearman", "more", "Orcish Leader", "Orcish Ruler"},
	},
	{
		{"Orcish Serf", "Orcish Foreman", "none", "none"},
		{"Orcish Archer", "Orcish Crossbowman", "more", "Orcish Slurbow"},
		{"Troll Whelp", "Troll", "Troll Warrior", "none"},
	},
	{
		{"Orcish Assassin", "Orcish Slayer", "more", "none"},
		{"Goblin Cavalry", "Goblin Lancer", "more", "Hellwolf Rider"},
		{"Saurian Augur", "Saurian Soothsayer", "none", "none"},
	},
	{
		{"Wolf Rider", "Goblin Pillager", "more", "none"},
		{"Saurian Skirmisher", "Saurian Spearthrower", "more", "more"},
		{"Orcish Leader", "Orcish Ruler", "Orcish Sovereign", "Orcish High Warlord"},
	},
	{
		{"Goblin Cavalry", "none", "more", "none"},
		{"Orcish Slinger", "Orcish Hunter", "more", "Orcish Stalker"},
	},
	{
		{"Orcish Grunt", "Orcish Marauder", "more", "Orcish Subjugator"},
		{"Orcish Archer", "Orcish Crossbowman", "more", "none"},
		{"Troll", "more", "more", "none"},
	},
	{
		{"Goblin Spearman", "more", "more", "more"},
		{"Orcish Shaman", "Orcish Warlock", "Orcish Sorcerer", "none"},
		{"Troll Whelp", "Troll Hero", "more", "none"},
	},
}

local function get_spawn_types(num_units, max_gold, unit_pool)
	local gold_left = max_gold
	local units_left = num_units
	local current_types = {}
	while gold_left > 0 and units_left > 0 do
		local unit_group = mathx.random(#unit_pool)
		local unit_rank = 1
		local unit_type = wesnoth.unit_types[unit_pool[unit_group][unit_rank]]
		table.insert(current_types, { group = unit_group, type =  unit_type})
		gold_left = gold_left - unit_type.cost
		units_left = units_left - 1
	end
	-- Upgrade units, eigher by replacing them with better units or by duplicating them.
	for next_rank = 2,4 do
		local next_types = {}
		for i,v in ipairs(current_types) do
			local advanceto = unit_pool[v.group][next_rank] or ""
			local unit_type = wesnoth.unit_types[advanceto]
			if unit_type then
				local upgrade_cost = math.ceil((unit_type.cost - v.type.cost) * 1.25)
				if gold_left >= upgrade_cost then
					gold_left = gold_left - upgrade_cost
					table.insert(next_types, { group = v.group, type = unit_type})
				else
					table.insert(next_types, { group = v.group, type = v.type})
				end
			elseif advanceto == "more" then
				local upgrade_cost = v.type.cost + 2
				if gold_left >= upgrade_cost then
					gold_left = gold_left - upgrade_cost
					table.insert(next_types, { group = v.group, type = v.type})
				end
				table.insert(next_types, { group = v.group, type = v.type})
			else
				table.insert(next_types, { group = v.group, type = v.type})
			end
		end
		current_types = next_types
	end
	--spend remaining gold
	local min_cost = 100
	for i,v in ipairs(unit_pool) do
		min_cost = math.min(min_cost, wesnoth.unit_types[v[1]].cost)
	end
	while gold_left >= min_cost do
		local possible_groups = {}
		for i,v in ipairs(unit_pool) do
			local unit_type = wesnoth.unit_types[v[1]]
			if unit_type.cost <= gold_left then
				table.insert(possible_groups, { group = i, type = unit_type})
			end
		end
		local index = mathx.random(#possible_groups)
		table.insert(current_types, possible_groups[index])
		gold_left = gold_left - possible_groups[index].type.cost
	end
	local res = {}
	for i,v in ipairs(current_types) do
		table.insert(res, v.type.id)
	end
	return res
end

-- creates the 'timed_spawn' wml array.
-- @a num_spawns: the total number of times units get spawned
-- @a interval: the number of turns between 2 spawns
-- @a base_gold_amount, gold_increment: used to calculate the amount of gold available for each timed spawn
-- @a units_amount, gold_per_unit_amount: used to calculate the number of units spawned in each timed spawn
local function create_timed_spawns(interval, num_spawns, base_gold_amount, gold_increment, units_amount, gold_per_unit_amount)
	local configure_gold_factor = ((wml.variables["enemey_gold_factor"] or 0) + 100)/100
	local random_spawn_numbers = {}
	for i = 1, #random_spawns do
		table.insert(random_spawn_numbers, i)
	end
	mathx.shuffle(random_spawn_numbers)
	local final_turn = math.ceil(((num_spawns - 1) * interval + 40 + mathx.random(2,4))/2)
	local end_spawns = 0
	for spawn_number = 1, num_spawns do
		local turn = 3 + (spawn_number - 1) * interval
		local gold = base_gold_amount + (turn - 3) * gold_increment
		if spawn_number > 1 then
			-- foruma taken from original Dark forecast, TODO: find easier formula.
			local unit_gold = (turn - 3) * gold_increment + math.min(mathx.random(base_gold_amount), mathx.random(base_gold_amount))
			local gold_per_unit = gold_per_unit_amount + turn / 1.5
			local units = unit_gold / gold_per_unit + units_amount + mathx.random(-1, 2)
			if mathx.random(5) == 5 then
				units = units - 1
			end
			-- end complicated formula
			turn = turn + mathx.random(-1, 1)
			-- reduce gold and units for spawns after the final spawn
			if turn >= final_turn then
				units = units / (end_spawns + 3)
				gold = gold / (end_spawns + 4)
				end_spawns = end_spawns + 1
				-- we only want two spawns after the final turn.
				if end_spawns > 2 then
					break
				end
			end
			wml.variables[string.format("timed_spawn[%d]", spawn_number - 1)] = {
				units = math.ceil(units),
				turn = turn,
				gold = mathx.round(gold * configure_gold_factor),
				pool_num = random_spawn_numbers[spawn_number],
			}
		else
			wml.variables[string.format("timed_spawn[%d]", spawn_number - 1)] = {
				units = units_amount + 1,
				turn = turn,
				gold = gold,
				pool_num = random_spawn_numbers[spawn_number],
			}
		end
	end
	wml.variables["final_turn"] = final_turn
end

-- @a unittypes: a array of strings
-- @a x,y: the location where to spawn the units on the map.
local function place_units(unittypes, x, y)
	for i,v in ipairs(unittypes) do
		local u = wesnoth.units.create { type = v, generate_name = true, side = 4 }
		-- give the unit less moves on its first turn.
		u.status.slowed = true
		u:add_modification("object", {
			duration = "turn end",
			T.effect {
				apply_to = "movement",
				increase = "-50%",
			}
		})
		local dst_x, dst_y = wesnoth.paths.find_vacant_hex(x, y, u)
		u:to_map(dst_x, dst_y)
		wesnoth.add_known_unit(v)
		wesnoth.map.set_owner(dst_x, dst_y, 1)
	end
end

local function final_spawn()
	local spawns_left = wml.variables["fixed_spawn.length"]
	if spawns_left == 0 then
		return
	end
	local spawn_index = mathx.random(spawns_left) - 1
	local spawn = wml.variables[string.format("fixed_spawn[%d]", spawn_index)]
	wml.variables[string.format("fixed_spawn[%d]", spawn_index)] = nil
	local types = {}
	for tag in wml.child_range(spawn, "type") do
		table.insert(types, tag.type)
	end
	place_units(types, spawn.x, spawn.y)
end

-- convert all 'veteran' units from side 4 to the more aggressive side 3
-- this must happen before the new units are created from spawns.
on_event("new turn", function()
	for i, unit in ipairs(wesnoth.units.find_on_map { side = 4 }) do
		unit.side = 3
	end
end)

on_event("prestart", function()
	local leaders = wesnoth.units.find_on_map { side = "1,2", canrecruit= true}
	if #leaders < 2 then
		create_timed_spawns(5, 11, 50, 5, 4, 21)
	else
		create_timed_spawns(4, 11, 90, 4, 5, 23)
	end
end)

-- the regular spawns:
--   when they appear is defined in the 'timed_spawn' wml array. which is created at prestart
--   which unit types get spawned is defined in the 'main_spawn' wml array which is also spawned at prestart
on_event("new turn", function()
	local next_spawn = wml.variables["timed_spawn[0]"]
	if next_spawn == nil then
		return
	end
	if wesnoth.current.turn ~= next_spawn.turn then
		return
	end
	wml.variables["timed_spawn[0]"] = nil
	-- wave 1
	local unit_types = get_spawn_types(next_spawn.units, next_spawn.gold, random_spawns[next_spawn.pool_num])
	local spawn_areas = {{"15", "4"}, {"39", "42"}, {"28", "4"}, {"54", "2"}, {"66", "2"}, {"74", "16"}, {"73", "44"}, {"48", "43"}, {"75", "6"}, {"61", "43"}}
	local spawn_area = spawn_areas[mathx.random(#spawn_areas)]
	local locations_in_area = wesnoth.map.find { x = spawn_area[1], y = spawn_area[2], radius=1, include_borders=false }
	local chosen_location = locations_in_area[mathx.random(#locations_in_area)]
	place_units(unit_types, chosen_location[1], chosen_location[2])
	-- wave 2
	local unit_types2 = get_spawn_types(next_spawn.units, next_spawn.gold, random_spawns[next_spawn.pool_num])
	local spawn_areas2 = {{"15", "4"}, {"39", "42"}, {"28", "4"}, {"54", "2"}, {"66", "2"}, {"74", "16"}, {"73", "44"}, {"48", "43"}, {"75", "6"}, {"61", "43"}}
	local spawn_area2 = spawn_areas2[mathx.random(#spawn_areas2)]
	local locations_in_area2 = wesnoth.map.find { x = spawn_area2[1], y = spawn_area2[2], radius=1, include_borders=false }
	local chosen_location2 = locations_in_area2[mathx.random(#locations_in_area2)]
	place_units(unit_types2, chosen_location2[1], chosen_location2[2])
	-- wave 3
	local unit_types3 = get_spawn_types(next_spawn.units, next_spawn.gold, random_spawns[next_spawn.pool_num])
	local spawn_areas3 = {{"15", "4"}, {"39", "42"}, {"28", "4"}, {"54", "2"}, {"66", "2"}, {"74", "16"}, {"73", "44"}, {"48", "43"}, {"75", "6"}, {"61", "43"}}
	local spawn_area3 = spawn_areas3[mathx.random(#spawn_areas3)]
	local locations_in_area3 = wesnoth.map.find { x = spawn_area3[1], y = spawn_area3[2], radius=1, include_borders=false }
	local chosen_location3 = locations_in_area3[mathx.random(#locations_in_area3)]
	place_units(unit_types3, chosen_location3[1], chosen_location3[2])
end)

-- on turn 'final_turn' the first 'final spawn' appears
on_event("new turn", function()
	if wesnoth.current.turn ~= wml.variables["final_turn"] then
		return
	end
	wesnoth.wml_actions.music {
		name = "battle.ogg",
		ms_before = 200,
		immediate = true,
		append = true,
	}
	final_spawn()
	wesnoth.scenario.turns = wesnoth.current.turn + 12
	wesnoth.wml_actions.message {
		side="1,2",
		canrecruit=true,
		message= _ "The last and most powerful of these creatures are almost upon us. I feel that if we can finish them off in time, we shall be victorious.",
	}

	wml.variables["next_final_spawn"] = wesnoth.current.turn + mathx.random(1,2)
end)

-- after the first final spawn, spawn a new final spawn every 1 or 2 turns.
on_event("new turn", function()
	if wesnoth.current.turn ~= wml.variables["next_final_spawn"] then
		return
	end
	final_spawn()
	wml.variables["next_final_spawn"] = wesnoth.current.turn + mathx.random(1,2)
end)

-- The victory condition: win when there are no enemy unit after the first final spawn appeared.
on_event("die", function()
	if wesnoth.current.turn < wml.variables["final_turn"] then
		return
	end
	if wesnoth.wml_conditionals.have_unit { side = "3,4"} then
		return
	end
	wesnoth.wml_actions.music {
		name = "victory.ogg",
		play_once = true,
		immediate = true,
	}
	wesnoth.wml_actions.message {
		speaker = "narrator",
		message = _"The screams and pleas for mercy are finally silenced, as you remove your blood soaked blade from the last of the rebels. There will be no more resistance from the local scum. Your reign has finally earned stability.",
		image ="wesnoth-icon.png",
	}
	wesnoth.wml_actions.endlevel {
		result = "victory",
	}
end)

-- initilize the 'fixed_spawn' and 'main_spawn'
on_event("prestart", function()
	local fixed_spawn = function(x, y, ...)
		local res = { x = x, y = y }
		for i,v in ipairs {...} do
			table.insert(res, T.type { type = v })
		end
		return res
	end
	wml.array_access.set("fixed_spawn", {
		fixed_spawn(1, 15, "Goblin Cutthroat", "Direwolf Rider", "Direwolf Rider"),
		fixed_spawn(5, 1, "Orcish High Warlord", "Orcish Nightblade", "Orcish Nightblade"),
		fixed_spawn(1, 7, "Orcish Sorcerer", "Goblin Impaler", "Goblin Impaler", "Goblin Impaler", "Ogre", "Goblin Chieftain", "Goblin Impaler", "Goblin Impaler", "Goblin Impaler"),
		fixed_spawn(11, 15, "Great Troll", "Orcish Marauder", "Orcish Fireline", "Orcish Nightblade"),
	})
end)

-- add start event
on_event("start", function()
	wesnoth.wml_actions.message {
		speaker = "Erlornas",
		message = _ "<i>(Looks over the vast waters plunged into the darkness of hundreds of enemy ships mooring to the rocky shores)</i>",
	}
	wesnoth.wml_actions.message {
		speaker = "Erlornas",
		message = _ "<i>(There is peace in his heart as if he poured out all his regret last night and he no longer feels afraid of meeting the inevitable death)</i>",
	}
	wesnoth.wml_actions.message {
		speaker = "Erlornas",
		message = _ "<i>(Orcs who come out of their ships begin to climb towards him, and he only kisses the ring which were his gift from the lady of heart, returning her that kiss from the days before)</i>",
	}
	wesnoth.wml_actions.message {
		speaker = "Erlornas",
		message = _ "<i>(With confidence written on his calm face, he draws his sword from the scabbard and looks at his companions one last time before this last march)</i>",
	}
	wesnoth.wml_actions.message {
		speaker = "Erlornas",
		message = _ "<i>(He puts his golden helmet on his head and, holding his sword to his chest, he rushes fearlessly into impenetrable darkness carrying his thunderous battle hymn, which leads the Irdya Elves to fight one last time, and around them shone the golden glow of the pure light of the Wesmere heir's soul that will be their guide for the last time to fight the beasts born to hate)</i>",
	}
end)