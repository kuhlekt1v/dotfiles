local default_on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- custom on_attach: disable formatting for Astro
local on_attach = function(client, bufnr)
    if client.name == "astro" then
        client.server_capabilities.documentFormattingProvider = false
    end
    default_on_attach(client, bufnr)
end

-- list of all servers configured.
lspconfig.servers = {
    "html",
    "cssls",
    "lua_ls",
    "pyright",
    "astro",
    "tailwindcss",
}

-- list of servers configured with default config
local default_servers = { "html", "cssls", "pyright", "tailwindcss", "astro" }

-- setup lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

-- lua_ls with custom settings
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                enable = false,
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
