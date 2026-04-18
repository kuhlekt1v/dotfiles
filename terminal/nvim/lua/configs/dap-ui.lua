local dap = require("dap")
local dapui = require("dapui")

dapui.setup({
  expand_lines = true,
  render = {
    max_value_lines = 100,
    indent = 1,
    wrap = true
  }
})

dap.listeners.after.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.after.launch.dapui_config = function()
    dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = nil
dap.listeners.before.event_exited.dapui_config = nil
