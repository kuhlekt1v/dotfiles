local wezterm = require("wezterm")

local config = {
	color_scheme = "Catppuccin Mocha",
	tab_bar_at_bottom = false,
	use_fancy_tab_bar = false,
	font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
	font_size = 14,
}

return config
