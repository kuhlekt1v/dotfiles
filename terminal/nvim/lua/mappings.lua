-- Load NvChad default mappings
require("nvchad.mappings")

local map = vim.keymap.set
local wk = require("which-key")

-- Which-key groups
wk.add({
    { "<leader><Tab>", group = "tab" },

    { "<leader>a", group = "ai" },
    { "<leader>ac", group = "copilot" },
    { "<leader>b", group = "buffers" },
    { "<leader>d", group = "debug" },
    { "<leader>e", group = "tree" },
    { "<leader>f", group = "file" },
    { "<leader>g", group = "goto" },
    { "<leader>l", group = "lsp" },
    { "<leader>m", group = "marks" },
    { "<leader>n", group = "number" },
    { "<leader>p", group = "workspace" },
    { "<leader>t", group = "telescope" },
    { "<leader>w", group = "which-key" },
    { "<leader>z", group = "lazygit" },
})

vim.keymap.del("n", "<leader>ch")
vim.keymap.del("n", "<leader>cm")
vim.keymap.del("n", "<leader>gt")
vim.keymap.del("n", "<leader>pt")
vim.keymap.del("n", "<leader>rn")

-- Basic
map("n", ";", ":", { desc = "command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "force quit" })

-- File
map("n", "<leader>fs", "<cmd>w<CR>", { desc = "save file" })

-- Line number
map("n", "<leader>nn", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>nr", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- Git
map("n", "<leader>z", "<cmd>LazyGit<CR>", { desc = "lazy" })

-- Telescope (extra)
map("n", "<leader>tm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>tp", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- Tabs
map("n", "<leader><Tab>n", "<cmd>tabnew<CR>", { desc = "new tab" })
map("n", "<leader><Tab>c", "<cmd>tabclose<CR>", { desc = "close tab" })
map("n", "<leader><Tab>]", "<cmd>tabnext<CR>", { desc = "next tab" })
map("n", "<leader><Tab>[", "<cmd>tabprevious<CR>", { desc = "previous tab" })

-- Buffers
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "New buffer" })

map("n", "<leader>bo", function()
    local current = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
            local bt = vim.api.nvim_get_option_value("buftype", { buf = buf })
            if bt == "" then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end
    end
end, { desc = "Close other buffers" })

map("n", "<leader>bx", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "Close current buffer" })

map("n", "<leader>bt", function()
    vim.o.showtabline = (vim.o.showtabline == 2) and 0 or 2
end, { desc = "Toggle tabline" })

-- Misc

map("n", "<leader>?", "<cmd>NvCheatsheet<CR>", { desc = "NvChad cheatsheet" })
