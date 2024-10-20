return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")

		-- Basic setup
		npairs.setup({
			check_ts = true, -- Enable treesitter integration
			ts_config = {
				tsx = { "string", "template_string" }, -- Auto-pair for TSX.
			},
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
