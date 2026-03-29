local M = {}
M.load_local_connections = function()
    local dbs = {}
    local env_path = vim.fn.getcwd() .. "/.env"

    -- Check if .env exists
    if vim.fn.filereadable(env_path) == 1 then
        for _, line in ipairs(vim.fn.readfile(env_path)) do
            -- Ignore comments and empty lines
            if not line:match("^%s*#") and line:match("=") then
                local key, value = line:match("^%s*([%w_]+)%s*=%s*(.+)%s*$")

                if key and value and key:match("^DBUI_") then
                    -- Remove quotes if present
                    value = value:gsub("^['\"](.*)['\"]$", "%1")

                    -- Example. convert DBUI_SALES → sales
                    local name = key:gsub("^DBUI_", ""):lower()
                    dbs[name] = value
                end
            end
        end
    end

    -- Optional debug warning
    if next(dbs) == nil then
        vim.notify("No DBUI_* entries found in .env", vim.log.levels.WARN)
    end

    vim.g.dbs = dbs
end

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
