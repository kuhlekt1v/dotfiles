vim.o.winbar = "%=%f%m"

-- Active window winbar
vim.api.nvim_set_hl(0, "WinBar", {
    fg = "#d9ba73",
    bg = "NONE",
})

-- Inactive window winbar
vim.api.nvim_set_hl(0, "WinBarNC", {
    fg = "#606060", -- light grey
    bg = "NONE",
})
