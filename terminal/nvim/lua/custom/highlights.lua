vim.o.winbar = "%=%f%m"

-- Active window winbar
vim.api.nvim_set_hl(0, "WinBar", {
    -- fg = "#faa0c5",
  fg = "#de92b1",
    bg = "NONE",
})

-- Inactive window winbar
vim.api.nvim_set_hl(0, "WinBarNC", {
    fg = "#434C5E",
    bg = "NONE",
})

vim.api.nvim_set_hl(0, "Normal", { bg = "#252933"})

-- Bufferline (tabufline) highlights for active/inactive buffers
-- Active buffer tab text color
-- vim.api.nvim_set_hl(0, "TbBufOn", {
--     fg = "#FF5FA2",  -- active buffer text color
-- })

-- Inactive buffer tabs text color
-- vim.api.nvim_set_hl(0, "TbBufOff", {
--     fg = "#A97889",  -- inactive buffer text color
-- })

-- Modified active buffer indicator text color
-- vim.api.nvim_set_hl(0, "TbBufOnModified", {
--     fg = "#FF5FA2",  -- modified active buffer text color (bright pink)
-- })

-- Close button on active buffer text color
-- vim.api.nvim_set_hl(0, "TbBufOnClose", {
--     fg = "#FF5FA2",  -- close button text color (bright pink)
-- }) 
