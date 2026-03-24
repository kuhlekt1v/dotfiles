-- Diagnostics display config
vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

-- LSP keybindings via LspAttach (works with native vim.lsp API)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
    callback = function(event)
        local bufnr = event.buf
        local map = vim.keymap.set

        -- ESLint fix on save (mirrors VSCode)
        if vim.lsp.get_client_by_id(event.data.client_id).name == "eslint" then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
            })
        end

        -- LSP navigation
        map("n", "<leader>gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "LSP go to declaration" })
        map("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP go to definition" })
        map("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "LSP go to implementation" })
        map("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP show references" })
        map("n", "<leader>lk", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP hover" })

        -- LSP actions
        map("n", "<leader>lc", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP code action" })
        map("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP rename" })

        -- Diagnostics
        map("n", "<leader>d[", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Diagnostic previous" })
        map("n", "<leader>d]", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Diagnostic next" })
        map("n", "<leader>df", vim.diagnostic.open_float, { buffer = bufnr, desc = "Diagnostic float" })
        map("n", "<leader>dl", vim.diagnostic.setloclist, { buffer = bufnr, desc = "Diagnostic loclist" })

        -- Workspace management
        map("n", "<leader>pa", vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = "Add workspace folder" })
        map(
            "n",
            "<leader>pr",
            vim.lsp.buf.remove_workspace_folder,
            { buffer = bufnr, desc = "Remove workspace folder" }
        )
        map("n", "<leader>pl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { buffer = bufnr, desc = "List workspace folders" })

        -- Type definition
        map("n", "<leader>pd", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Go to type definition" })
    end,
})
