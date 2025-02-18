SBar.add("item", {
	position = "left",
	icon = {
		drawing = false,
	},
	label = {
		drawing = false,
	},
	padding_left = 0,
})

SBar.add("event", "aerospace_workspace_change")

local function add_space(i)
	local space = SBar.add("space", "space." .. i, {
		space = i,
		icon = {
			drawing = true,
			string = i,
			padding_left = 10,
			padding_right = 10,
			font = {
				family = settings.font.numbers,
				style = settings.font.style_map["Semibold"],
				size = settings.font_4x,
			},
		},
		label = {
			drawing = false,
			padding_left = 0,
		},
		background = {
			padding_left = 0,
			padding_right = 5,
			corner_radius = 100,
			border_width = 1,
			shadow = true,
		},
		shadow = true,
	})

	return space
end

-- Setting for active space
local function subscribe_to_space_events(space, workspace)
	space:subscribe("aerospace_workspace_change", function(env)
		local selected = env.FOCUSED_WORKSPACE == workspace
		space:set({
			icon = { highlight = selected, highlight_color = colors.white },
			label = { highlight = selected },
			background = { border_color = selected and colors.white or colors.black },
		})
	end)
end

local function parse_string_to_table(s)
	local result = {}
	for line in s:gmatch("[^\r\n]+") do
		table.insert(result, line)
	end
	return result
end

local file = io.popen("aerospace list-workspaces --all")
if file == nil then
	return
end
local result = file:read("*a")
file:close()

local workspaces = parse_string_to_table(result)
for _, workspace in ipairs(workspaces) do
	local space = add_space(workspace)
	subscribe_to_space_events(space, workspace)
end
