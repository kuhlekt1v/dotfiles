local parsers = {
    "bash",
    "lua",
    "luadoc",
    "markdown",
    "printf",
    "python",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
    "typescript",
    "tsx",
}

require("nvim-treesitter").setup()

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "bash",
        "lua",
        "luadoc",
        "markdown",
        "python",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
        "typescript",
        "typescriptreact",
        "tsx",
        "tailwindcss",
    },
    callback = function()
        -- Treesitter highlighting
        pcall(vim.treesitter.start)

        -- Treesitter folding
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.wo.foldenable = true
    end,
})
