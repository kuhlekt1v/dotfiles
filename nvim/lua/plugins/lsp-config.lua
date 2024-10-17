return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "angularls",  -- Angular
          "bashls",     -- Bash
          "omnisharp",  -- C#
          "cssls",      -- CSS, SCSS
          "html",       -- HTML
          "jdtls",      -- Java
          "eslint",     -- JavaScript, Typescript
          "jsonls",     -- JSON
--          "ast_grep",   -- JSX, etc. (C#, CSS, HTML, JS, JSX, Lua, TSX, and more)
          "lua_ls"      -- Lua
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.angularls.setup({})
      lspconfig.bashls.setup({})
      lspconfig.cssls.setup({})
      lspconfig.html.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.eslint.setup({})
      lspconfig.jsonls.setup({})
--      lspconfig.ast_grep.setup({})
      lspconfig.lua_ls.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n','v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
