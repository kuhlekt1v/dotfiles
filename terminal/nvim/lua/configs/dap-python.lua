local dap = require("dap")
require("dap-python").setup("./.venv/bin/python") -- fallback, per-project can override

-- look for a project-local dap config
local project_dap = vim.fn.getcwd() .. "/.nvim/dap.lua"
if vim.fn.filereadable(project_dap) == 1 then
    dofile(project_dap)
end
