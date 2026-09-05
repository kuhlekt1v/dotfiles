local dap = require("dap")
local dapui = require("dapui")


dapui.setup({
  expand_lines = false,
  controls = {
    enabled = false,
  },
  layouts = {
  {
      elements = {
        {id = "scopes", size = 0.35},
        {id = "stacks", size = 0.25},
        {id = "breakpoints", size = 0.20},
        {id = "watches", size = 0.20},
      },
      size = 40,
      position = "left",
    },
  -- {
  --     elements = {
  --       {id = "repl", size = 1.0},
  --     },
  --       size = 10,
  --       position = "bottom",
  --   },
  },
  render = {
    max_value_lines = 10,
    indent = 1,
    wrap = true,
  },
})

dap.listeners.after.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.after.launch.dapui_config = function()
    dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = nil
dap.listeners.before.event_exited.dapui_config = nil
