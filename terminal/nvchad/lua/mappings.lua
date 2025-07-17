require("nvchad.mappings")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
local map = vim.keymap.set

-- Remove NvChad defaults.
vim.keymap.del("n", "<leader>x")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- DAP
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle DAP Breakpoint" })
map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", { desc = "Toggle DAP UI" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue DAP" })

map("n", "<leader>dpr", function()
    require("dap-python").test_method()
end, { desc = "Run DAP Python test method" })

-- Misc.
map("n", "<leader>fs", "<cmd>w<CR>", { desc = "file save" })
map("n", "<leader>l", "<cmd>LazyGit<CR>", { desc = "lazy git" })

-- Buffer
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "new" })
map("n", "<leader>ba", function()
    -- Close all buffers
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_get_option_value("buftype", { buf = buf }) == "" then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end, { desc = "close all" })
map("n", "<leader>bo", function()
    -- Close all other buffers except current
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

-- === Register Buffer Group in Which-Key (New Spec) ===
vim.defer_fn(function()
    local present, wk = pcall(require, "which-key")
    if present then
        wk.add({
            { "<leader>b", group = "Buffers" },
        })
    end
end, 100)
