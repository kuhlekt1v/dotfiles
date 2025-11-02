-- Load NvChad defaults
require("nvchad.mappings")

local map = vim.keymap.set
local wk = require("which-key")

wk.add({
    { "<leader><Tab>", group = "tab" },
    { "<leader>c", group = "AI" },
    { "<leader>co", group = "Copilot" },
    { "<leader>cc", group = "Code Companion" },
    { "<leader>b", group = "buffers" },
    { "<leader>d", group = "diagnostics" },
    { "<leader>e", group = "Focus nvimtree" },
    { "<leader>E", group = "Toggle nvimtree" },
    { "<leader>f", group = "file" },
    { "<leader>p", group = "lsp" },
    { "<leader>t", group = "telescope" },
    { "<leader>tg", group = "telescope git" },
    { "<leader>tn", group = "telescope nvchad" },
    { "<leader>w", group = "which-key" },
})

-- Remove NvChad defaults.
vim.keymap.del("n", "<leader>x")
vim.keymap.del("n", "<leader>ch")
vim.keymap.del("n", "<leader>cm")
vim.keymap.del("n", "<leader>fa")
vim.keymap.del("n", "<leader>fb")
vim.keymap.del("n", "<leader>ff")
vim.keymap.del("n", "<leader>fh")
vim.keymap.del("n", "<leader>fo")
vim.keymap.del("n", "<leader>fw")
vim.keymap.del("n", "<leader>fz")
vim.keymap.del("n", "<leader>gt")
vim.keymap.del("n", "<leader>th")
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>ma")
vim.keymap.del("n", "<leader>pt")
-- vim.keymap.del("n", "<leader>wa")
-- vim.keymap.del("n", "<leader>wl")
-- vim.keymap.del("n", "<leader>wr")
vim.keymap.del("n", "<leader>rn")
vim.keymap.del("n", "<leader>e")

-- Basic remaps
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Force quit" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- NvimTree
map("n", "<leader>EC", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse all in nvim-tree" })
-- Cheatsheet
map("n", "<leader>?", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatshet" })

map("n", "<leader>db", function()
    require("dap").toggle_breakpoint()
end, { desc = "Toggle DAP Breakpoint" })
map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", { desc = "Toggle DAP UI" })
map("n", "<leader>ds", "<cmd> DapContinue <CR>", { desc = "Start or continue DAP" })
map("n", "<leader>dr", function()
    require("dap-python").test_method()
end, { desc = "Run DAP Python test method" })

-- Diagnostics
map("n", "<leader>d[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "diagnostic previous" })
map("n", "<leader>d]", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "diagnostic next" })
map("n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "diagnostic float" })
map("n", "<leader>dl", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "diagnostic loclist" })

-- Telescope
map("n", "<leader>ta", function()
    require("telescope.builtin").find_files({
        hidden = true,
        no_ignore = true,
    })
end, { desc = "telescope find all files" })
map("n", "<leader>tb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>tf", "<cmd>Telescope find_files<CR>", { desc = "telescope find files" })
map("n", "<leader>th", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>tm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>to", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>tr", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>tt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>tz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })

-- Telescope Git
map("n", "<leader>tgc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>tgs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })

-- Telescope NvChad
map("n", "<leader>tnt", function()
    require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- File
map("n", "<leader>fs", "<cmd>w<CR>", { desc = "file save" })
map({ "n", "x" }, "<leader>fm", function()
    require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })

-- LazyGit
map("n", "<leader>l", "<cmd>LazyGit<CR>", { desc = "lazy git" })

-- Tabs
map("n", "<leader><Tab>c", ":tabclose<CR>", { desc = "tab close" })
map("n", "<leader><Tab>n", ":tabnew<CR>", { desc = "tab new" })
map("n", "<leader><Tab>]", ":tabnext<CR>", { desc = "tab next" })
map("n", "<leader><Tab>[", ":tabprevious<CR>", { desc = "tab previous" })

-- LSP
map("n", "<leader>pl", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
map("n", "<leader>pa", vim.lsp.buf.add_workspace_folder, { desc = "LSP add workspace folder" })
map("n", "<leader>pl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "LSP list workspace folders" })
map("n", "<leader>pr", vim.lsp.buf.remove_workspace_folder, { desc = "LSP remove workspace folder" })
map("n", "<leader>pd", vim.lsp.buf.type_definition, { desc = "LSP go to type definition" })

-- Buffers
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "new" })

map("n", "<leader>ba", function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_get_option_value("buftype", { buf = buf }) == "" then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end, { desc = "close all" })

map("n", "<leader>bo", function()
    local current = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if
            buf ~= current
            and vim.api.nvim_buf_is_loaded(buf)
            and vim.api.nvim_get_option_value("buftype", { buf = buf }) == ""
        then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end, { desc = "close others" })

map("n", "<leader>bx", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "close current" })

-- Code Companion
map("n", "<leader>cca", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion - Actions Palette" })

-- Copilot
map("n", "<leader>cop", function()
    require("CopilotChat").select_prompt({
        context = {
            "buffers",
        },
    })
end, { desc = "CopilotChat - Prompt actions" })

-- Code related commands
map("n", "<leader>coe", "<cmd>CopilotChatExplain<cr>", { desc = "CopilotChat - Explain code" })
map("n", "<leader>cot", "<cmd>CopilotChatTests<cr>", { desc = "CopilotChat - Generate tests" })
map("n", "<leader>cor", "<cmd>CopilotChatReview<cr>", { desc = "CopilotChat - Review code" })
map("n", "<leader>coR", "<cmd>CopilotChatRefactor<cr>", { desc = "CopilotChat - Refactor code" })
map("n", "<leader>con", "<cmd>CopilotChatBetterNamings<cr>", { desc = "CopilotChat - Better Naming" })

-- Custom input for CopilotChat
map("n", "<leader>coi", function()
    local input = vim.fn.input("Ask Copilot: ")
    if input ~= "" then
        vim.cmd("CopilotChat " .. input)
    end
end, { desc = "CopilotChat - Ask input" })

-- Generate commit message based on the git diff
map(
    "n",
    "<leader>com",
    "<cmd>CopilotChatCommit<cr>",
    { desc = "CopilotChat - Generate commit message for all changes" }
)
map("n", "<leader>coq", function()
    local input = vim.fn.input("Quick Chat: ")
    if input ~= "" then
        require("CopilotChat").ask(input, {
            selection = require("CopilotChat.select").buffer,
        })
    end
end, { desc = "CopilotChat - Quick chat" })

-- Fix the issue with diagnostic
map("n", "<leader>cof", "<cmd>CopilotChatFixError<cr>", { desc = "CopilotChat - Fix Diagnostic" })
-- Clear buffer and chat history
map("n", "<leader>col", "<cmd>CopilotChatReset<cr>", { desc = "CopilotChat - Clear buffer and chat history" })
-- Toggle Copilot Chat Vsplit
map("n", "<leader>cov", "<cmd>CopilotChatToggle<cr>", { desc = "CopilotChat - Toggle" })
-- Copilot Chat Models
map("n", "<leader>co?", "<cmd>CopilotChatModels<cr>", { desc = "CopilotChat - Select Models" })
-- Copilot Chat Agents
map("n", "<leader>coa", "<cmd>CopilotChatAgents<cr>", { desc = "CopilotChat - Select Agents" })
-- Visual mode mappings
map("x", "<leader>cop", function()
    require("CopilotChat").select_prompt()
end, { desc = "CopilotChat - Prompt actions" })
map("x", "<leader>cov", ":CopilotChatVisual", { desc = "CopilotChat - Open in vertical split" })
map("x", "<leader>cox", ":CopilotChatInline", { desc = "CopilotChat - Inline chat" })

-- Toggle nvim-tree

map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus nvim-tree" })
map("n", "<leader>E", function()
    local api = require("nvim-tree.api")
    local view = require("nvim-tree.view")

    if view.is_visible() then
        api.tree.close()
        vim.cmd("wincmd p") -- return focus to previous window
    else
        api.tree.open()
        api.tree.focus()
    end
end)
