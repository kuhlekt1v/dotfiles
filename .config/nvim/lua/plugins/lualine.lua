local colors = {
	red2 = "#be5046",
	yellow = "#e5c07b",
	fg = "#abb2bf",
	gray1 = "#828997",
	gray2 = "#2c323c",
	gray3 = "#3e4452",
	black = "#282828",
	red1 = "#EE5396",
	green = "#25be6a",
	blue = "#78A9FF",
	purple = "#BE95FF",
	cyan = "#33B1FF",
	white = "#dfdfe0",
	orange = "#3DDBD9",
	pink = "#FF7EB6",
	bg = "#0c0c0c",
}

local onedark_custom = {
	normal = {
		a = { fg = colors.bg, bg = colors.green, gui = "bold" },
		b = { fg = colors.fg, bg = colors.gray3 },
		c = { fg = colors.fg, bg = colors.bg },
	},
	command = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
	insert = { a = { fg = colors.bg, bg = colors.blue, gui = "bold" } },
	visual = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
	terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = "bold" } },
	replace = { a = { fg = colors.bg, bg = colors.red1, gui = "bold" } },
	inactive = {
		a = { fg = colors.gray1, bg = colors.bg, gui = "bold" },
		b = { fg = colors.gray1, bg = colors.bg },
		c = { fg = colors.gray1, bg = colors.bg },
	},
}

return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					-- Dracula theme used with Catppuccin themes.
					-- theme = "dracula",
					theme = onedark_custom,
				},
			})
		end,
	},
}
