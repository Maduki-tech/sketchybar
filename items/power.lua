local power = SBar.add("item", "power", {
	position = "right",
	icon = {
		string = icons.power,
		background = {
			color = colors.yellow,
		},
	},
	label = {
		string = "?%",
	},
	update_freq = 100,
	popup = {
		align = "right",
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
