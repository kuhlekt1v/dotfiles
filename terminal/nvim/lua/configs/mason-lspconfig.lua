local mason_lspconfig = require("mason-lspconfig")

-- Default capabilities for LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

-- Ensure these servers are installed (Mason package names)
mason_lspconfig.setup({
    ensure_installed = {
        "ts_ls",
        "tailwindcss",
        "lua_ls",
        "pyright",
        "omnisharp",
        "eslint",
    },
})

-- Configure TypeScript server
vim.lsp.config("ts_ls", {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
    end,
})


-- Configure Tailwind (only in projects with tailwind config)
vim.lsp.config("tailwindcss", {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "astro",
        "vue",
        "svelte",
    },
    root_markers = {
        "tailwind.config.js",
        "tailwind.config.ts",
        "tailwind.config.cjs",
        "postcss.config.js",
    },
    capabilities = capabilities,
})

-- Configure Lua
vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
        ".git",
    },
    capabilities = capabilities,
})

-- Configure Python
vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
    capabilities = capabilities,
})

-- Configure OmniSharp for C#
vim.lsp.config("omnisharp", {
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    filetypes = { "cs" },
    root_markers = { ".git", "*.sln", "*.csproj" },
    capabilities = capabilities,
})

vim.lsp.config("eslint", {
    cmd = { "vscode-eslint-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    root_markers = { ".eslintrc", ".eslintrc.js", "package.json", ".git" },
})

-- Enable servers for appropriate filetypes
vim.lsp.enable("ts_ls")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("omnisharp")
vim.lsp.enable("eslint")
