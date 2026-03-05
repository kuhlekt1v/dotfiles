return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true,
            ts_config = {
                javascript = { "template_string" },
                typescript = { "template_string" },
                javascriptreact = { "template_string", "jsx_text", "jsx_attribute" },
                typescriptreact = { "template_string", "jsx_text", "jsx_attribute" },
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
        },
        config = function(_, opts)
            local autopairs = require("nvim-autopairs")
            autopairs.setup(opts)

            local Rule = require("nvim-autopairs.rule")
            local cond = require("nvim-autopairs.conds")

            autopairs.remove_rule("{", "javascriptreact")
            autopairs.remove_rule("{", "typescriptreact")

            autopairs.add_rules({
                Rule("{", "}", { "javascriptreact", "typescriptreact" })
                    :with_pair(cond.not_before_regex("{"))
                    :with_pair(cond.not_after_regex("}")),
            })

            local ok, cmp = pcall(require, "cmp")
            if ok then
                local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end
        end,
    },
}
