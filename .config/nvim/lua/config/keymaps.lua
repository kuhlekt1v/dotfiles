local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Telescope keymaps
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>p", builtin.find_files, { desc = "Find files with Telescope" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep with Telescope" })

-- File keymaps
keymap.set("n", "<leader>fs", ":w!<CR>", { desc = "Force save file" })

-- Copilot quick chat keymap
keymap.set("n", "<leader>ccq", function()
	local input = vim.fn.input("Quick Chat: ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
	end
end, { desc = "CopilotChat - Quick chat" })

keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Toggles local troubleshoot" })
