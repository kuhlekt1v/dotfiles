local dap = require("dap")
require("dap-python").setup("./.venv/bin/python")

dap.adapters.python = {
  type = "server",
  host = "127.0.0.1",
  port = 5678,
}

-- --- helper: wait for debugpy port ---
local function wait_for_port(port, timeout_ms)
  local uv = vim.loop
  local start = uv.now()

  while uv.now() - start < timeout_ms do
    local sock = uv.new_tcp()
    local connected = false

    sock:connect("127.0.0.1", port, function(err)
      if not err then
        connected = true
      end
    end)

    vim.wait(100)

    if connected then
      sock:close()
      return true
    end

    sock:close()
  end

  return false
end

-- --- persistent terminal buffer ---
_G.azure_func_term = _G.azure_func_term or nil

local function open_or_reuse_terminal()
  if not _G.azure_func_term or not vim.api.nvim_buf_is_valid(_G.azure_func_term) then
    vim.cmd("botright 15split | terminal")
    _G.azure_func_term = vim.api.nvim_get_current_buf()
  else
    vim.cmd("botright split")
    vim.api.nvim_set_current_buf(_G.azure_func_term)
  end
end

-- --- dap config ---
dap.configurations.python = {
  {
    type = "python",
    request = "attach",
    name = "Azure Functions (debugpy attach)",
    connect = {
      host = "127.0.0.1",
      port = 5678,
    },
    justMyCode = false,

    before = function()
      open_or_reuse_terminal()

      local cmd = table.concat({
        -- kill any previous func host (prevents port conflicts)
        "pkill -f 'func start' || true",

        -- your environment setup
        "pyenv shell 3.12",
        "source .venv/bin/activate",
        "export FUNCTIONS_WORKER_PROCESS_COUNT=1",
        "export languageWorkers__python__arguments='-m debugpy --listen 5678 --wait-for-client'",

        -- start azure functions
        "func start"
      }, " && ")

      -- send to terminal
      vim.fn.chansend(vim.b.terminal_job_id, cmd .. "\n")

      -- go back to previous window
      vim.cmd("wincmd p")

      -- wait until debugpy is actually ready
      local ok = wait_for_port(5678, 10000)

      if not ok then
        vim.notify("debugpy did not start in time", vim.log.levels.ERROR)
      end
    end,
  },
  {
    type = "python",
    request = "attach",
    name = "Python Module",

    connect = {
      host = "127.0.0.1",
      port = 5678,
    },

    justMyCode = false,

    before = function()
      open_or_reuse_terminal()

      local module = vim.fn.input("Module: ")

      local cmd = table.concat({
        "pkill -f debugpy || true",
        "source .venv/bin/activate",
        string.format(
          "python -m debugpy --listen 5678 --wait-for-client -m %s",
          module
        ),
      }, " && ")

      vim.fn.chansend(vim.b.terminal_job_id, cmd .. "\n")

      vim.cmd("wincmd p")

      local ok = wait_for_port(5678, 10000)

      if not ok then
        vim.notify("debugpy did not start in time", vim.log.levels.ERROR)
      end
    end,
  },
}
