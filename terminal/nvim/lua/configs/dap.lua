local dap = require("dap")

local js_debug_path =
    vim.fn.stdpath("data")
    .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

-- Windows cmd.exe from WSL
local cmd = "/mnt/c/WINDOWS/System32/cmd.exe"

-- Chrome launched specifically for debugging.
-- This uses a separate Chrome profile so your normal Chrome
-- instance does not interfere with the remote debugging port.
local function start_chrome(url)
    vim.fn.jobstart({
        cmd,
        "/C",
        "start",
        "",
        "chrome.exe",
        "--remote-debugging-port=9222",
        "--user-data-dir=C:\\tmp\\nvim-chrome-debug",
        url,
    }, {
        detach = true,
    })
end

-- JavaScript/TypeScript Chrome debugger
dap.adapters["pwa-chrome"] = {
    type = "server",
    host = "127.0.0.1",
    port = "${port}",
    executable = {
        command = "node",
        args = {
            js_debug_path,
            "${port}",
        },
    },
}

dap.configurations.typescriptreact = {
    {
        type = "pwa-chrome",
        request = "attach",
        name = "Chrome → Vite :5173",

        address = "127.0.0.1",
        port = 9222,

        webRoot = "${workspaceFolder}",
        sourceMaps = true,
        enableContentValidation = false,

        before = function()
            start_chrome("http://localhost:5173")
        end,
    },

    {
        type = "pwa-chrome",
        request = "attach",
        name = "Chrome → Vite :3000",

        address = "127.0.0.1",
        port = 9222,

        webRoot = "${workspaceFolder}",
        sourceMaps = true,
        enableContentValidation = false,

        before = function()
            start_chrome("http://localhost:3000")
        end,
    },
}
