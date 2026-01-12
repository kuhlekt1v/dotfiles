-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}
M.base46 = {
    theme = "koda", -- previously used "aylin", "ashes"
}

M.nvdash = {
    load_on_startup = true,
    buttons = {
        { txt = "  Find File", keys = "tf", cmd = "Telescope find_files" },
        { txt = "  Recent Files", keys = "to", cmd = "Telescope oldfiles" },
        { txt = "󰈭  Find Word", keys = "tw", cmd = "Telescope live_grep" },
        { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
        { txt = "  Mappings", keys = "?", cmd = "NvCheatsheet" },

        { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

        {
            txt = function()
                local stats = require("lazy").stats()
                local ms = math.floor(stats.startuptime) .. " ms"
                return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
            end,
            hl = "NvDashFooter",
            no_gap = true,
        },

        { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    },
}

return M
