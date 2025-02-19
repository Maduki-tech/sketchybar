SBar.default({
	updates = "when_shown",
	icon = {
		font = {
			family = settings.font.text,
			style = settings.font.style_map["Bold"],
			size = settings.font_4x,
		},
		background = {
			height = settings.layout_4x,
			corner_radius = 100,
			border_width = 1,
			border_color = colors.white,
		},
		color = colors.white,
		padding_left = 10,
		padding_right = 10,
	},
	label = {
		font = {
			family = settings.font.text,
			style = settings.font.style_map["Bold"],
			size = settings.font_3x,
		},
		color = colors.white,
		padding_left = settings.layout_1x,
		padding_right = settings.layout_1x,
	},
	background = {
		height = settings.layout_4x,
		color = colors.bg1,
		corner_radius = 100,
	},
	padding_right = 4,
	padding_left = 4,
	scroll_texts = true,
})
