return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				-- Dracula theme used with Catppuccin themes.
				theme = "dracula",
			},
		})
	end,
}
