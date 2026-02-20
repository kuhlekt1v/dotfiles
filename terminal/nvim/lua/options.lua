require("nvchad.options")

local o = vim.o

-- Line numbers
o.number = true

-- Indenting
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2

-- Line wrapping
o.wrap = true
o.breakindent = true
o.showbreak = string.rep(" ", 3)
o.linebreak = true

-- Remap for dealing with word wrapping
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
