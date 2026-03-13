vim.o.winbar = "%=%f%m"

-- Active window winbar
vim.api.nvim_set_hl(0, "WinBar", {
    fg = "#EBCB8B",
    bg = "NONE",
})

-- Inactive window winbar
vim.api.nvim_set_hl(0, "WinBarNC", {
    fg = "#434C5E",
    bg = "NONE",
})

vim.api.nvim_set_hl(0, "Normal", { bg = "#252933"}) 
