local power = SBar.add("item", "power", {
	position = "right",
	icon = {
		string = icons.power,
		background = {
			color = colors.yellow,
			corner_radius = 100,
			border_width = 1,
			border_color = colors.white,
		},
	},
	label = {
		string = "?%",
	},
	update_freq = 100,
	background = {
		corner_radius = 100,
		border_width = 1,
		border_color = colors.white,
	},
})

power:subscribe({ "routine", "power_source_change", "system_woke" }, function()
	SBar.exec("pmset -g batt", function(info)
		local found, _, charge = info:find("(%d+)%%")
		local label = "?%"

		if found then
			label = tonumber(charge) .. "%"
		end

		power:set({
			label = label,
		})
	end)
end)
