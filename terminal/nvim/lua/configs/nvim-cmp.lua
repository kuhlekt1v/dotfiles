local M = {}

function M.setup()
    local cmp = require("cmp")

    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            -- Enter always inserts a newline
            ["<CR>"] = cmp.mapping(function(fallback)
                fallback()
            end, { "i", "s" }),

            -- Shift-Enter confirms completion
            ["<S-CR>"] = cmp.mapping(function(fallback)
                if cmp.visible() and cmp.get_selected_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end, { "i", "s" }),

            -- Tab / Shift-Tab cycle through suggestions
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp", group_index = 2 },
            { name = "copilot", group_index = 2 },
            { name = "luasnip", group_index = 2 },
            { name = "buffer", group_index = 2 },
            { name = "path", group_index = 2 },
            { name = "nvim_lua", group_index = 2 },
        }),
    })
end

return M
