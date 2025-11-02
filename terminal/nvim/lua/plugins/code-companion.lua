return {
    {
        "olimorris/codecompanion.nvim",
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "j-hui/fidget.nvim",
        },
        cmd = {
            "CodeCompanion",
            "CodeCompanionChat",
            "CodeCompanionActions",
        },

        config = function()
            require("codecompanion").setup({
                strategies = {
                    chat = {
                        adapter = "copilot",
                    },

                    inline = {
                        adapter = "copilot",
                    },
                },
            })

            local progress = require("fidget.progress")
            local handles = {}
            local group = vim.api.nvim_create_augroup("CodeCompanionFidget", {})

            vim.api.nvim_create_autocmd("User", {
                pattern = "CodeCompanionRequestStarted",
                group = group,
                callback = function(e)
                    handles[e.data.id] = progress.handle.create({
                        title = "Code Companion",
                        message = "Thinking...",
                        lsp_client = { name = e.data.adapter.formatted_name },
                    })
                end,
            })

            vim.api.nvim_create_autocmd("User", {
                pattern = "CodeCompanionRequestFinished",
                group = group,
                callback = function(e)
                    local h = handles[e.data.id]
                    if h then
                        h.message = e.data.status == "success" and "Done" or "Failed"
                        h:finish()
                        handles[e.data.id] = nil
                    end
                end,
            })
        end,
    },
}
