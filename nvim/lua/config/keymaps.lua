local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Telescope keymaps
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>p", builtin.find_files, { desc = "Find files with Telescope" })
-- keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep with Telescope" })

-- File keymaps
keymap.set("n", "<leader>fs", ":w!<CR>", { desc = "Force save file" })
