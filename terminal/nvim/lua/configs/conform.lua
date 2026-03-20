local M = {}

function M.setup()
    local uv = vim.uv or vim.loop

    -- Resolve local prettier first, fallback to global
    local function prettier_cmd()
        local local_bin = vim.fn.getcwd() .. "/node_modules/.bin/prettier"
        if uv.fs_stat(local_bin) then
            return local_bin
        end
        return "prettier"
    end

    require("conform").setup({
        formatters_by_ft = {
            lua = { "stylua" },

            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            astro = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },

            python = { "isort", "black" },

            cs = {"csharpier"},
        },

        formatters = {
            -- Python
            black = {
                prepend_args = { "--fast" },
            },

            isort = {
                prepend_args = { "--profile", "black" },
            },

            -- Smart prettier (local project version preferred)
            prettier = {
                command = prettier_cmd,
                args = { "--stdin-filepath", "$FILENAME" },
            },
        },

        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    })
end

return M
