local x
return {
    { "echasnovski/mini.icons" },

    {
      "nemanjamalesija/ts-expand-hover.nvim",
      ft = { "typescript", "typescriptreact" },
      opts = {
        keymaps = {
          hover = false,
          expand = "]",
          collapse = "[",
          close = { "q", "<Esc>" },
        },
      },
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
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
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
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.conform").setup()
        end,
    },

    -- LSP
    {
        "mason-org/mason-lspconfig.nvim",
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            {
                "neovim/nvim-lspconfig",
                lazy = true,
            },
        },
        config = function()
            require("configs.lsp")
            require("configs.mason-lspconfig")
        end,
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        opts = {
            preset = "powergate",
            transparent_bg = true,

            options = {
                show_source = {
                    enabled = false,
                },
                throttle = 0,
            },
        },
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

    -- Database
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { "tpope/vim-dadbod", lazy = true },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
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

  {
  "olimorris/codecompanion.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "franco-ruggeri/codecompanion-spinner.nvim",
  },

  opts = {
    extensions = {
      spinner = {
          opts = {
            text = "Thinking...",
          },
        },
    },
    interactions = {
      chat = {
        adapter = "poolside",
      },
      inline = {
        adapter = "poolside",
      },
    },

    adapters = {
      acp = {
        poolside = function()
          return require("codecompanion.adapters").extend("claude_code", {
            name = "poolside",
            formatted_name = "Poolside",

            commands = {
              default = {
                "pool",
                "acp",
              },
            },
          })
        end,
      },
    },

    opts = {
      log_level = "DEBUG",
    },

    display = {
      chat = {
        show_settings = true,
      },
    },
  },

  keys = {
    {
      "<leader>acc",
      "<cmd>CodeCompanionChat toggle<CR>",
      desc = "Chat",
      mode = "n",
    },

    {
      "<leader>aca",
      "<cmd>CodeCompanionChat add<CR>",
      desc = "Add to Chat",
      mode = { "n", "v" },
    },

    {
      "<leader>aci",
      "<cmd>CodeCompanionInline<CR>",
      desc = "Inline",
      mode = { "n", "v" },
    },

    {
      "<leader>aco",
      "<cmd>CodeCompanionActions<CR>",
      desc = "Actions",
      mode = "n",
    },
  },
},
}

