local M = {}

M._timer = nil
M._connected = false
M._disabled = false -- set true after any fatal error; requires manual reconnect

local function stop_timer()
    if M._timer then
        pcall(function()
            M._timer:stop()
            M._timer:close()
        end)
        M._timer = nil
    end
end

local function disable(reason)
    M._disabled = true
    M._connected = false
    stop_timer()
    if reason and reason ~= "" then
        print("[Azure SQL] Disabled: " .. reason .. " (run <leader>dba to retry)")
    else
        print("[Azure SQL] Disabled (run <leader>dba to retry)")
    end
end

-- Load KEY=VALUE pairs from a .env-style file into vim.env (no shell eval)
M.load_env_file = function(path)
    local f = io.open(path, "r")
    if not f then
        return false
    end

    for line in f:lines() do
        line = line:gsub("^%s+", ""):gsub("%s+$", "")
        if line ~= "" and not line:match("^#") then
            local k, v = line:match("^([A-Za-z_][A-Za-z0-9_]*)=(.*)$")
            if k then
                v = v:gsub('^"(.*)"$', "%1"):gsub("^'(.*)'$", "%1")
                vim.env[k] = v
            end
        end
    end

    f:close()
    return true
end

-- Find a project env file (checks cwd)
M.load_project_env = function()
    -- Default to .nvimenv; allow override via env var
    local envfile = vim.env.NVIM_ENV_FILE
    if not envfile or envfile == "" then
        envfile = ".nvenv"
    end

    local cwd = vim.fn.getcwd()
    local p = cwd .. "/" .. envfile

    if M.load_env_file(p) then
        print("[Azure SQL] Loaded env: " .. p)
        return true
    end

    print("[Azure SQL] No project env file found (" .. envfile .. ") in " .. cwd)
    return false
end

M.refresh_token = function()
    if M._disabled then
        -- fail fast: do nothing until user explicitly reconnects
        return false
    end

    local az_resource = vim.env.AZ_RESOURCE
    if not az_resource or az_resource == "" then
        disable("AZ_RESOURCE is not set")
        return false
    end

    local cmd = "az account get-access-token --resource "
        .. vim.fn.shellescape(az_resource)
        .. " --query accessToken -o tsv 2>&1"

    local handle = io.popen(cmd)
    if not handle then
        disable("Failed to execute az command")
        return false
    end

    local out = (handle:read("*a") or ""):gsub("%s+", "")
    handle:close()

    if out == "" then
        disable("Failed to retrieve token (empty output)")
        return false
    end

    if out:match("^ERROR:") or out:find("az login", 1, true) then
        disable("Azure CLI error while fetching token: " .. out)
        return false
    end

    vim.env.AZURE_SQL_TOKEN = out
    -- only mark connected if we've previously configured the connection
    return true
end

M.connect = function(opts)
    opts = opts or {}

    -- allow manual reconnect after a failure
    M._disabled = false

    if opts.load_env ~= false then
        local ok = M.load_project_env()
        if not ok then
            disable("Missing project .env file")
            return
        end
    end

    local host = vim.env.AZURE_SQL_HOST
    local db = vim.env.AZURE_SQL_DATABASE

    if not host or host == "" then
        disable("AZURE_SQL_HOST is not set")
        return
    end
    if not db or db == "" then
        disable("AZURE_SQL_DATABASE is not set")
        return
    end

    if not M.refresh_token() then
        -- refresh_token() already disabled/stopped timer with a reason
        return
    end

    vim.g.dbs = vim.g.dbs or {}
    vim.g.dbs.azure = ("sqlserver://@%s:1433/%s?access_token=$AZURE_SQL_TOKEN"):format(host, db)

    M._connected = true
    print(("[Azure SQL] Connection configured for %s/%s"):format(host, db))

    if not M._timer then
        M._timer = vim.loop.new_timer()
        M._timer:start(
            45 * 60 * 1000,
            45 * 60 * 1000,
            vim.schedule_wrap(function()
                if M._connected and not M._disabled then
                    local ok = M.refresh_token()
                    if not ok then
                        -- refresh_token() disables + stops timer
                        return
                    end
                end
            end)
        )
    end

    if opts.open_ui then
        vim.cmd("DBUI")
    end
end

return M
