return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "VeryLazy",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = false, -- disable ghost text
                    auto_trigger = true,
                    accept = "<S-CR>",
                },
                panel = {
                    enabled = false,
                },
                filetypes = {
                    markdown = true,
                    help = true,
                    html = true,
                    javascript = true,
                    typescript = true,
                    python = true,
                    ["*"] = true,
                },
            })
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "diff", "markdown" } } },
        },
        cmd = {
            "CopilotChat",
            "CopilotChatExplain",
            "CopilotChatTests",
            "CopilotChatReview",
            "CopilotChatRefactor",
            "CopilotChatFixError",
            "CopilotChatBetterNamings",
            "CopilotChatCommit",
            "CopilotChatReset",
            "CopilotChatToggle",
            "CopilotChatModels",
            "CopilotChatAgents",
        },
        opts = {
            question_header = "## User ",
            answer_header = "## Copilot ",
            error_header = "## Error ",
            -- model = "gpt-4.1",
            prompts = {
                -- Code related prompts
                Explain = "Please explain how the following code works.",
                Review = "Please review the following code and provide suggestions for improvement.",
                Tests = "Please explain how the selected code works, then generate unit tests for it.",
                Refactor = "Please refactor the following code to improve its clarity and readability.",
                FixCode = "Please fix the following code to make it work as intended.",
                FixError = "Please explain the error in the following text and provide a solution.",
                BetterNamings = "Please provide better names for the following variables and functions.",
                Documentation = "Please provide documentation for the following code.",
                SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
                SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
                -- Text related prompts
                Summarize = "Please summarize the following text.",
                Spelling = "Please correct any grammar and spelling errors in the following text.",
                Wording = "Please improve the grammar and wording of the following text.",
                Concise = "Please rewrite the following text to make it more concise.",
            },
            mappings = {
                -- Use tab for completion
                complete = {
                    detail = "Use @<Tab> or /<Tab> for options.",
                    insert = "<Tab>",
                },
                -- Close the chat
                close = {
                    normal = "q",
                    insert = "<C-c>",
                },
                -- Reset the chat buffer
                reset = {
                    normal = "<C-x>",
                    insert = "<C-x>",
                },
                -- Submit the prompt to Copilot
                submit_prompt = {
                    normal = "<CR>",
                    insert = "<C-CR>",
                },
                -- Accept the diff
                accept_diff = {
                    normal = "<C-y>",
                    insert = "<C-y>",
                },
                -- Show help
                show_help = {
                    normal = "g?",
                },
            },
        },
        config = function(_, opts)
            local chat = require("CopilotChat")

            local hostname = io.popen("hostname"):read("*a"):gsub("%s+", "")
            local user = hostname or vim.env.USER or "User"
            opts.question_header = "  " .. user .. " "
            opts.answer_header = "  Copilot "
            -- Override the git prompts message
            opts.prompts.Commit = {
                prompt = '> #git:staged\n\nWrite commit message with commitizen convention. Write clear, informative commit messages that explain the "what" and "why" behind changes, not just the "how".',
            }

            chat.setup(opts)

            local select = require("CopilotChat.select")
            vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
                chat.ask(args.args, { selection = select.visual })
            end, { nargs = "*", range = true })

            -- Inline chat with Copilot
            vim.api.nvim_create_user_command("CopilotChatInline", function(args)
                chat.ask(args.args, {
                    selection = select.visual,
                    window = {
                        layout = "float",
                        relative = "cursor",
                        width = 1,
                        height = 0.4,
                        row = 1,
                    },
                })
            end, { nargs = "*", range = true })

            -- Restore CopilotChatBuffer
            vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
                chat.ask(args.args, { selection = select.buffer })
            end, { nargs = "*", range = true })

            -- Custom buffer for CopilotChat
            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = "copilot-*",
                callback = function()
                    vim.opt_local.relativenumber = true
                    vim.opt_local.number = true
                end,
            })
        end,
    },
}
