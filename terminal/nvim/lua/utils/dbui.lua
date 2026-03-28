local M = {}

-- Closes DBUI window(s) by buffer filetype, otherwise opens DBUI.
M.toggle = function()
    -- Look for any window showing a dbui buffer
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "dbui" then
            -- close the window; force avoids "No write since last change" edge cases
            pcall(vim.api.nvim_win_close, win, true)
            return
        end
    end

    -- If no DBUI window is open, open it
    vim.cmd("DBUI")
end

return M
