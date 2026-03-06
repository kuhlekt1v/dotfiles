local wezterm = require("wezterm")
local act = wezterm.action
local use_lua_colors = false
local mux = wezterm.mux

local config = {}

-- Start in fullscreen
wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- Appearance
config.font = wezterm.font({ family = "Lilex Nerd Font Mono", weight = "Regular" })
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = { font_size = 13.0 }
config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.window_padding = {
	top = 10,
	bottom = 10,
	left = 10,
	right = 10,
}
config.animation_fps = 1
config.font_size = 18

-- Choose lua or toml color scheme
if use_lua_colors then
	config.colors = require("colors.koda-dark")
else
	config.color_scheme_dirs = { wezterm.config_dir .. "/colors" }
	config.color_scheme = "jellybeans-dark"
end

-- Leader key (tmux style)
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }

-- Pane navigation
config.keys = {
	{ key = "c", mods = "CTRL", action = act.SendString("\x0c") },
	{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },

	{ key = "h", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "j", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "l", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },

	{ key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	{ key = "m", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

	{ key = "w", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },

	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },

	{ key = "r", mods = "ALT", action = act.ReloadConfiguration },
}

return config
