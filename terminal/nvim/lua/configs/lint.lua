local lint = require("lint")

lint.linters.mypy.cmd = vim.fn.getcwd() .. "/.venv/bin/python"
lint.linters.mypy.args = {
  "-m",
  "mypy",
}

lint.linters_by_ft = {
  python = { "mypy", "ruff" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
