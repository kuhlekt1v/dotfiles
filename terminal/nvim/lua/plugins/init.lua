return {
    { "echasnovski/mini.icons" },
    {
        "adelarsq/image_preview.nvim",
        event = "VeryLazy",
        config = function()
            require("image_preview").setup()
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("configs.nvimtree").setup()
        end,
        dependencies = {
            "adelarsq/image_preview.nvim",
        },
    },
    {
        "tris203/precognition.nvim",
        lazy = false,
        opts = {},
    },
    {
        "folke/which-key.nvim",
        opts = function(_, opts)
            -- Load NvChad defaults
            dofile(vim.g.base46_cache .. "whichkey")
            -- Extend NvChad defaults
            opts.icons = { group = "+ ", mappings = false }
            opts.sort = { "alphanum" }
            return opts
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },
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
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("configs.conform")
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        event = "VeryLazy",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            {
                "neovim/nvim-lspconfig",
                config = function()
                    require("configs.lsp")
                end,
            },
        },
    },

    {
        "mfussenegger/nvim-dap",
        dependencies = {
            -- Debugger UI
            {
                "rcarriga/nvim-dap-ui",
                config = function()
                    require("configs.dap-ui")
                end,
            },
            -- Required dependency of nvim-dap-ui
            "nvim-neotest/nvim-nio",

            -- Shows variable values inline a virtual text
            "theHamsta/nvim-dap-virtual-text",
            -- Automatically installs DAP debuggers
            -- Debuggers still need to be explicitly configured
            {
                "jay-babu/mason-nvim-dap.nvim",
                config = function()
                    require("configs.mason-dap")
                end,
            },
            -- Language-specifc debuggers
            {
                "mfussenegger/nvim-dap-python",
                ft = "python",
                config = function()
                    require("configs.dap-python")
                end,
            },
        },
        config = function()
            require("configs.dap")
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "https://github.com/nvim-lua/plenary.nvim",
        },
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        lazy = true,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-mini/mini.nvim",
        },
        ft = { "markdown", "copilot-chat", "codecompanion" },
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("configs.nvim-cmp").setup()
        end,
    },
    {
        "oskarnurm/koda.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- require("koda").setup({ transparent = true })
            vim.cmd("colorscheme koda")
        end,
    },
}
