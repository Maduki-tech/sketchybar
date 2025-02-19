local calendar = SBar.add("item", "calendar", {
	position = "center",
	icon = {
		string = icons.calendar,
		background = {
			color = colors.blue,
		},
	},
	update_freq = 1,
	click_script = "open -a 'Calendar'",
	shadow = true,
})

calendar:subscribe({ "force", "routine", "system_woke" }, function()
	calendar:set({
		label = os.date("%d/%b | %H:%M"),
	})
end)
