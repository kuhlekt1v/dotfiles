return {
	"pasky/claude.vim",
	lazy = false,
	config = function()
		local api_key = vim.env.ANTHROPIC_API_KEY
		if api_key then
			vim.g.claude_api_key = api_key
		else
			vim.notify("ANTHROPIC_API_KEY environment variable is not set", vim.log.levels.WARN)
		end

		vim.keymap.set("n", "<leader>ac", ":Claude<CR>", { desc = "Claude" })
		vim.keymap.set("n", "<leader>acc", ":ClaudeChat<CR>", { desc = "Chat", silent = true })
		vim.keymap.set("v", "<leader>aci", ":'<,'>ClaudeImplement ", { desc = "Implement" })
	end,
}
