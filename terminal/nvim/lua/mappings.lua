-- Load NvChad default mappings
require("nvchad.mappings")

local map = vim.keymap.set
local wk = require("which-key")
local dbui = require("utils.dbui")
local buffers = require("utils.buffers")

-- Which-key groups
wk.add({
    { "<leader><Tab>", group = "tab" },

    { "<leader>a", group = "ai" },
    { "<leader>ac", group = "copilot" },
    { "<leader>b", group = "buffers" },
    { "<leader>d", group = "debug & db" },
    { "<leader>dd", group = "dap" },
    { "<leader>db", group = "db" },
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
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>v")

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

map("n", "<leader>bo", function() buffers.close_other_buffers() end, { desc = "Close other buffers" })

map("n", "<leader>bx", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "Close current buffer" })

map("n", "<leader>bt", function()
    vim.o.showtabline = (vim.o.showtabline == 2) and 0 or 2
end, { desc = "Toggle tabline" })

-- DAP
map("n", "<leader>ddb", function()
    require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })
map("n", "<leader>ddc", function()
    require("dap").continue()
end, { desc = "Continue debug" })
map("n", "<leader>ddu", function()
    require("dapui").toggle()
end, { desc = "Toggle DAP UI" })
map("n", "<leader>ddr", function()
  require("dap").run_to_cursor()
end, { desc = "Run to cursor" })
map("n", "<leader>dds", function()
  require("dap").terminate()
end, { desc = "Stop debugging" })
map("n", "<leader>dde", function()
  require("dapui").eval()
end, { desc = "Eval variable under cursor" })

map("n", "<F1>", require("dap").continue)
map("n", "<F2>", require("dap").step_into)
map("n", "<F3>", require("dap").step_over)
map("n", "<F4>", require("dap").step_out)
map("n", "<F5>", require("dap").step_back)
map("n", "<F13>", require("dap").restart)

-- DB
map("n", "<leader>dbt", dbui.toggle, { desc = "Toggle DB UI" })
map("n", "<leader>dbo", "<cmd>DBUI<CR>", { desc = "Open DB UI" })
map("n", "<leader>dba", "<cmd>DBUIAddConnection<CR>", { desc = "Add DB connection" })
map("n", "<leader>dbf", "<cmd>DBUIFindBuffer<CR>", { desc = "Find Buffer in DB UI" })
map("n", "<leader>dbl", function() dbui.load_local_connections() end, { desc = "Load DB from env" })

-- Misc
map("n", "<leader>?", "<cmd>NvCheatsheet<CR>", { desc = "NvChad cheatsheet" })
map({ "n", "t" }, "<A-->", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
