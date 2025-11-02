local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.after.launch.dapui_config = function()
    dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = nil
dap.listeners.before.event_exited.dapui_config = nil
