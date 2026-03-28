local M = {}

-- module state (kept across calls)
M._timer = nil
M._connected = false

-- refresh token (your existing implementation)
M.refresh_token = function()
    local az_resource = vim.env.AZ_RESOURCE
    if not az_resource or az_resource == "" then
        print("[Azure SQL] AZ_RESOURCE is not set. Skipping token refresh.")
        return false
    end

    local cmd = "az account get-access-token --resource "
        .. vim.fn.shellescape(az_resource)
        .. " --query accessToken -o tsv"

    local handle = io.popen(cmd)
    if not handle then
        print("[Azure SQL] Failed to execute az command")
        return false
    end

    local token = (handle:read("*a") or ""):gsub("%s+", "")
    handle:close()

    if token == "" then
        print("[Azure SQL] Failed to retrieve token (empty output)")
        return false
    end

    vim.env.AZURE_SQL_TOKEN = token
    return true
end

-- call this only when you intentionally want to connect
M.connect = function(opts)
    opts = opts or {}

    -- required env vars for building the connection string
    local host = vim.env.AZURE_SQL_HOST -- e.g. your-server.database.usgovcloudapi.net
    local db = vim.env.AZURE_SQL_DATABASE -- e.g. your-db

    if not host or host == "" then
        print("[Azure SQL] AZURE_SQL_HOST is not set.")
        return
    end
    if not db or db == "" then
        print("[Azure SQL] AZURE_SQL_DATABASE is not set.")
        return
    end

    -- refresh now (fail fast)
    if not M.refresh_token() then
        print("[Azure SQL] Token refresh failed; not establishing connection.")
        return
    end

    -- define the connection only after we have a token
    -- note: host may be database.windows.net OR database.usgovcloudapi.net depending on your tenant
    vim.g.dbs = vim.g.dbs or {}
    vim.g.dbs.azure = ("sqlserver://@%s:1433/%s?access_token=$AZURE_SQL_TOKEN"):format(host, db)

    M._connected = true
    print(("[Azure SQL] Connection configured for %s/%s"):format(host, db))

    -- start refresh timer once (every 45 minutes)
    if not M._timer then
        M._timer = vim.loop.new_timer()
        M._timer:start(
            45 * 60 * 1000, -- first refresh after 45 minutes
            45 * 60 * 1000, -- repeat every 45 minutes
            vim.schedule_wrap(function()
                if M._connected then
                    M.refresh_token()
                    -- optional: print a quiet message or none at all
                    -- print("[Azure SQL] Token refreshed (scheduled).")
                end
            end)
        )
    end

    -- optional: open DBUI right away
    if opts.open_ui then
        vim.cmd("DBUI")
    end
end

return M
