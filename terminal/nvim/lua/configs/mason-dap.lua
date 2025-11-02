require("mason").setup()
require("mason-nvim-dap").setup({
    ensure_installed = { "js", "python" },
    automatic_setup = true,
})
