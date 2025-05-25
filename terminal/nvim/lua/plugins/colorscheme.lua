-- return {
-- 	{ "catppuccin/nvim", name = "catppuccin" },
-- 	{
-- 		"LazyVim/LazyVim",
-- 		opts = {
-- 			colorscheme = "catppuccin-mocha",
-- 			priority = 1000,
-- 		},
-- 	},
-- }
--
--
-- return {
-- 	{ "EdenEast/nightfox.nvim" },
-- 	{
-- 		"LazyVim/LazyVim",
-- 		opts = {
-- 			priority = 1000,
-- 			colorscheme = "carbonfox",
-- 		},
-- 	},
-- }
--
--
return {
	{
		"rktjmp/lush.nvim",
		lazy = false, -- Load immediately if needed
	},
	{
		"metalelf0/jellybeans-nvim",
		lazy = false, -- Load immediately
		priority = 1000, -- Ensure it's loaded before setting the colorscheme
		config = function()
			vim.cmd("colorscheme jellybeans-nvim")
		end,
	},
}
--
--
-- return {
-- 	{
-- 		"wtfox/jellybeans.nvim",
-- 		lazy = false,
-- 		priority = 1000,
-- 		opts = {},
-- 	},
-- }
--
-- local g = vim.g
-- return {
-- 	"rafamadriz/neon",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		g.neon_style = "default"
-- 		g.neon_transparent = false
-- 		g.neon_italic_keyword = true
-- 		g.neon_italic_function = true
--
-- 		vim.cmd([[colorscheme neon]])
-- 	end,
-- }
