local smart_splits = require("smart-splits")

print("smartsplits loaded")

smart_splits.setup({
    default_amount = 5,
    multiplexer_integration = true,
    multiplexer = "wezterm",
})

local map = vim.keymap.set

-- navigation
map("n", "<C-h>", smart_splits.move_cursor_left)
map("n", "<C-j>", smart_splits.move_cursor_down)
map("n", "<C-k>", smart_splits.move_cursor_up)
map("n", "<C-l>", smart_splits.move_cursor_right)

-- resizing
map("n", "<A-h>", smart_splits.resize_left)
map("n", "<A-j>", smart_splits.resize_down)
map("n", "<A-k>", smart_splits.resize_up)
map("n", "<A-l>", smart_splits.resize_right)





