local uv = vim.uv or vim.loop

-- Try to resolve local prettier first, fallback to global
local function prettier_cmd()
    local local_bin = vim.fn.getcwd() .. "/node_modules/.bin/prettier"
    if uv.fs_stat(local_bin) then
        return local_bin
    end
    return "prettier" -- fallback to global if no local version
end

local options = {

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
    },

    formatters = {
        -- Python
        black = {
            prepend_args = {
                "--fast",
                -- Uncomment below if problems with imports reformatting.
                -- "--line-length",
                -- "80"
            },
        },
        isort = {
            prepend_args = {
                "--profile",
                "black",
            },
        },

        -- Smart prettier
        prettier = {
            command = prettier_cmd,
            args = { "--stdin-filepath", "$FILENAME" },
        },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

require("conform").setup(options)
