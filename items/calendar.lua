local calendar = SBar.add("item", "calendar", {
	position = "center",
	icon = {
		string = icons.calendar,
		background = {
			color = colors.blue,
			corner_radius = 100,
			border_width = 1,
			border_color = colors.white,
			shadow = true,
		},
	},
	update_freq = 1,
	click_script = "open -a 'Calendar'",
	background = {
		corner_radius = 100,
		border_width = 1,
		border_color = colors.white,
	},
	shadow = true,
})

calendar:subscribe({ "force", "routine", "system_woke" }, function()
	calendar:set({
		label = os.date("%d/%b | %H:%M"),
	})
end)
