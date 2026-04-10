local dap = require("dap")
require("dap-python").setup("./.venv/bin/python") -- fallback, per-project can override

-- Azure Functions debugging configurations
table.insert(dap.configurations.python, {
    type = "python",
    request = "attach",
    name = "Azure Functions - Attach",
    connect = {
        host = "localhost",
        port = 5678,
    },
    pathMappings = {
        {
            localRoot = "${workspaceFolder}",
            remoteRoot = ".",
        },
    },
    justMyCode = false,
})

table.insert(dap.configurations.python, {
    type = "python",
    request = "launch",
    name = "Azure Functions - Launch & Debug",
    program = "func",
    args = { "start" },
    console = "integratedTerminal",
    cwd = "${workspaceFolder}",
    justMyCode = false,
    env = {},
})

-- look for a project-local dap config
local project_dap = vim.fn.getcwd() .. "/.nvim/dap.lua"
if vim.fn.filereadable(project_dap) == 1 then
    dofile(project_dap)
end
