local apple = SBar.add("item", "apple", {
	icon = {
		string = icons.apple,
		background = {
			color = colors.bg1,
			corner_radius = 100,
		},
	},
	label = {
		drawing = false,
	},
	popup = {
		align = "left",
	},
	background = {
		corner_radius = 100,
		shadow = true,
	},
	shadow = true,
})

local popup_width = 230

local sketchybar = SBar.add("item", "apple.sketchybar", {
	position = "popup." .. apple.name,
	icon = {
		align = "left",
		string = icons.reload,
	},
	label = {
		align = "left",
		string = "Reload Sketchybar",
	},
	width = popup_width,
})

local activity = SBar.add("item", "apple.activity", {
	position = "popup." .. apple.name,
	icon = {
		align = "left",
		string = icons.activity,
	},
	label = {
		align = "left",
		string = "Activity Monitor",
	},
	width = popup_width,
})

local sleep = SBar.add("item", "apple.sleep", {
	position = "popup." .. apple.name,
	icon = {
		align = "left",
		string = icons.sleep,
	},
	label = {
		align = "left",
		string = "Sleep Mode",
	},
	width = popup_width,
})

local function hide_details()
	apple:set({
		popup = {
			drawing = false,
		},
	})
end

local function toggle_details()
	local should_draw = apple:query().popup.drawing == "off"

	if should_draw then
		apple:set({
			popup = {
				drawing = true,
			},
		})
	else
		hide_details()
	end
end

local function reload_sketchybar()
	hide_details()
	SBar.exec("sketchybar --reload")
end

local function open_activity()
	hide_details()
	SBar.exec("open -a 'Activity Monitor'")
end

local function sleep_mode()
	hide_details()
	SBar.exec("pmset displaysleepnow")
end

apple:subscribe("mouse.clicked", toggle_details)
apple:subscribe("mouse.exited.global", hide_details)

sleep:subscribe("mouse.clicked", sleep_mode)
activity:subscribe("mouse.clicked", open_activity)
sketchybar:subscribe("mouse.clicked", reload_sketchybar)
