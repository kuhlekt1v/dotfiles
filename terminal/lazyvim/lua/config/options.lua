local opt = vim.opt

opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2 -- Number of spaces per tab
opt.softtabstop = 2 -- Insert 2 spaces when pressing tab
opt.shiftwidth = 2 -- Indent by 2 spaces
opt.number = true -- Show line numbers
opt.relativenumber = false

-- Set the leader key
vim.g.mapleader = " " -- Set the leader key to space
