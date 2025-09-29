require("nvchad.options")

-- add yours here!

local o = vim.o

-- Line numbers
o.number = true

-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

-- Line wrapping
o.wrap = true
o.breakindent = true
o.showbreak = string.rep(" ", 3)
o.linebreak = true

-- Remap for d ealing with word wrapping.
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- o.cursorlineopt ='both' -- to enable cursorline!
