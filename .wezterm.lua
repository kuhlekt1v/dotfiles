local wezterm = require("wezterm")

local config = {
	color_scheme = "carbonfox",
	tab_bar_at_bottom = false,
	use_fancy_tab_bar = false,
	font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
	font_size = 14,
	color_schemes = {
		["Catppuccin Mocha Custom"] = {
			foreground = "#D9E0EE",
			background = "#161616",
			cursor_bg = "#F5E0DC",
			cursor_border = "#F5E0DC",
			cursor_fg = "#161616",
			selection_bg = "#F5E0DC",
			selection_fg = "#161616",
			ansi = { "#6E6C7E", "#F28FAD", "#ABE9B3", "#FAE3B0", "#96CDFB", "#F5C2E7", "#89DCEB", "#D9E0EE" },
			brights = { "#988BA2", "#F28FAD", "#ABE9B3", "#FAE3B0", "#96CDFB", "#F5C2E7", "#89DCEB", "#D9E0EE" },
		},
	},
}

return config
