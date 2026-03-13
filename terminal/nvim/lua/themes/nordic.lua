-- Nordic theme for NvChad's base46
-- credits to original theme https://github.com/AlexvZyl/nordic.nvim
-- "A Neovim colorscheme based on Nord, but Aurora > Frost."

local M = {}

M.base_30 = {
    white = "#C0C8D8",
    darker_black = "#1E222A",
    black = "#242933",

    black2 = "#2E3440",

    one_bg = "#222630",
    one_bg2 = "#2E3440",
    one_bg3 = "#3B4252",

    grey = "#434C5E",
    grey_fg = "#4C566A",
    grey_fg2 = "#60728A",

    light_grey = "#BBC3D4",

    red = "#BF616A",
    baby_pink = "#C5727A",
    line = "#2E3440",
    pink = "#B74E58",

    green = "#A3BE8C",
    vibrant_green = "#B1C89D",

    blue = "#81A1C1",
    nord_blue = "#5E81AC",
    seablue = "#50728A",

    yellow = "#EBCB8B",
    sun = "#EFD49F",

    purple = "#B48EAD",
    dark_purple = "#A97EA1",

    teal = "#88C0D0",
    orange = "#D08770",
    cyan = "#8FBCBB",

    statusline_bg = "#1E222A",
    lightbg = "#2E3440",
    pmenu_bg = "#8FBCBB",
    folder_bg = "#81A1C1",
}

M.base_16 = {
    -- Backgrounds (Polar Night)
    base00 = "#242933", -- default bg
    base01 = "#2E3440", -- lighter bg (status bars, line numbers)
    base02 = "#3B4252", -- selection bg
    base03 = "#434C5E", -- comments, invisibles
    -- Foregrounds (Snow Storm)
    base04 = "#4C566A", -- dark fg (status bars)
    base05 = "#C0C8D8", -- default fg (white0_reduce_blue)
    base06 = "#D8DEE9", -- light fg
    base07 = "#E5E9F0", -- lightest fg
    -- Frost + Aurora (syntax) — unchanged from original Nord mapping
    base08 = "#88C0D0", -- teal   → variables, XML tags
    base09 = "#D08770", -- orange → integers/booleans (more distinctive)
    base0A = "#EBCB8B", -- yellow → classes, bold
    base0B = "#A3BE8C", -- green  → strings
    base0C = "#8FBCBB", -- cyan   → support, regex, escape chars
    base0D = "#81A1C1", -- blue   → functions, methods
    base0E = "#B48EAD", -- purple → keywords, selectors
    base0F = "#D08770", -- orange → deprecated, embedded lang tags
}

M.polish_hl = {
    whichkey = {
        WhichKey = { fg = M.base_30.yellow },
        WhichKeyDesc = { fg = M.base_30.white },
        WhichKeyGroup = { fg = M.base_30.orange },
        WhichKeySeparator = { fg = M.base_30.grey_fg2 },
    },
    nvimtree = {
        NvimTreeNormal = { bg = M.base_30.black },
        NvimTreeNormalNC = { bg = M.base_30.black },
        NvimTreeFolderIcon = { fg = M.base_30.yellow },
        NvimTreeSpecialFile = { fg = M.base_30.purple },
        NvimTreeRootFolder = { fg = M.base_30.grey_fg, bold = true },
        NvimTreeCursorLine = { bg = M.base_30.one_bg3 },
    },
    statusline = {
        St_cwd_icon = { fg = M.base_30.one_bg, bg = M.base_30.yellow },
        St_cwd_sep = { fg = M.base_30.yellow, bg = M.base_30.statusline_bg },
    },
    treesitter = {
        ["@punctuation.bracket"] = { fg = M.base_30.white },
        ["@punctuation.delimiter"] = { fg = M.base_30.white },
    },
}

M.type = "dark"

M = require("base46").override_theme(M, "nordic")

return M
