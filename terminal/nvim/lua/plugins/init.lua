return {
    { "echasnovski/mini.icons" },

    -- UI / Navigation
    {
        "tris203/precognition.nvim",
        lazy = false,
        opts = {},
    },

    {
        "nvchad/base46",
        lazy = true,
        build = function()
            require("base46").load_all_highlights()
        end,
        -- Add this:
        config = function()
            require("base46").load_all_highlights()
        end,
    },

    {
        "folke/which-key.nvim",
        opts = function(_, opts)
            dofile(vim.g.base46_cache .. "whichkey")
            opts.icons = { group = "+ ", mappings = false }
            opts.sort = { "alphanum" }
            return opts
        end,
    },

    -- Image preview
    {
        "adelarsq/image_preview.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "adelarsq/image_preview.nvim" },
        config = function()
            require("configs.nvimtree").setup()
        end,
    },

    -- Smart pane navigation (works with wezterm)
    {
        "mrjones2014/smart-splits.nvim",
        lazy = false,
        config = function()
            require("configs.smart-splits")
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    -- Linting
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },

    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    -- Formatting
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("configs.conform")
        end,
    },

    -- LSP
    {
        "mason-org/mason-lspconfig.nvim",
        event = "BufReadPre", -- load before buffers are read, not VeryLazy
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            {
                "neovim/nvim-lspconfig",
                config = function()
                    require("configs.lsp")
                end,
            },
        },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    -- Debugging
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("configs.dap")
        end,
        dependencies = {

            -- UI
            {
                "rcarriga/nvim-dap-ui",
                config = function()
                    require("configs.dap-ui")
                end,
            },

            "nvim-neotest/nvim-nio",

            -- virtual text
            { "theHamsta/nvim-dap-virtual-text", opts = {} },

            -- mason dap
            {
                "jay-babu/mason-nvim-dap.nvim",
                config = function()
                    require("configs.mason-dap")
                end,
            },

            -- python dap
            {
                "mfussenegger/nvim-dap-python",
                ft = "python",
                config = function()
                    require("configs.dap-python")
                end,
            },
        },
    },

    -- Git
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Markdown rendering
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown" },
        -- ft = { "markdown", "copilot-chat" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-mini/mini.nvim",
        },
    },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("configs.nvim-cmp").setup()
        end,
    },

    -- Colorscheme
    -- {
    --     "oskarnurm/koda.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.cmd("colorscheme koda")
    --     end,
    -- },

    -- Copilot Chat
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",

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

        keys = {
            { "<leader>acp", desc = "Prompt actions" },
            { "<leader>ace", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
            { "<leader>act", "<cmd>CopilotChatTests<cr>", desc = "Generate tests" },
            { "<leader>acr", "<cmd>CopilotChatReview<cr>", desc = "Review code" },
            { "<leader>acR", "<cmd>CopilotChatRefactor<cr>", desc = "Refactor code" },
            { "<leader>acn", "<cmd>CopilotChatBetterNamings<cr>", desc = "Better naming" },
            { "<leader>acf", "<cmd>CopilotChatFixError<cr>", desc = "Fix diagnostic" },
            { "<leader>acm", "<cmd>CopilotChatCommit<cr>", desc = "Generate commit message" },
            { "<leader>acl", "<cmd>CopilotChatReset<cr>", desc = "Clear chat history" },
            { "<leader>acv", "<cmd>CopilotChatToggle<cr>", desc = "Toggle chat" },
            { "<leader>ac?", "<cmd>CopilotChatModels<cr>", desc = "Select model" },
            { "<leader>aca", "<cmd>CopilotChatAgents<cr>", desc = "Select agent" },
        },

        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-treesitter/nvim-treesitter",
                opts = { ensure_installed = { "diff", "markdown" } },
            },
        },

        config = function()
            require("configs.copilot").setup()
        end,
    },
}
