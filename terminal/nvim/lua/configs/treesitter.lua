local options = {
    ensure_installed = {
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
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)

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
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt_local.foldlevel = 99
        vim.opt_local.foldlevelstart = 99
        vim.opt_local.foldenable = true
    end,
})
