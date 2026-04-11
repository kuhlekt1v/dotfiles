local dap = require("dap")
require("dap-python").setup("./.venv/bin/python")

dap.adapters.python = {
    type = "server",
    host = "127.0.0.1",
    port = 5678,
}

--
-- To start Python az func
-- export FUNCTIONS_WORKER_PROCESS_COUNT=1
-- export languageWorkers__python__arguments="-m debugpy --listen 5678 --wait-for-client"
-- func start
--
-- Then start dap in file
--
dap.configurations.python = {
    {
        type = "python",
        request = "attach",
        name = "Attach Azure Functions",
        connect = {
            host = "127.0.0.1",
            port = 5678,
        },
        justMyCode = false,
    },
}
