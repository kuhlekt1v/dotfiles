-- nnikolovlazar config
--return {
  --{
    --"hrsh7th/nvim-cmp",
    --config = function(_, opts)
      --opts.completion.autocomplete = false
      --opts.mapping["<CR>"] = nil
      --opts.window = {
        --completion = {
          --border = {
            --{ "󱐋", "WarningMsg" },
            --{ "─", "Comment" },
            --{ "╮", "Comment" },
            --{ "│", "Comment" },
            --{ "╯", "Comment" },
            --{ "─", "Comment" },
            --{ "╰", "Comment" },
            --{ "│", "Comment" },
          --},
          --scrollbar = false,
          --winblend = 0,
        --},
        --documentation = {
          --border = {
            --{ "󰙎", "DiagnosticHint" },
            --{ "─", "Comment" },
            --{ "╮", "Comment" },
            --{ "│", "Comment" },
            --{ "╯", "Comment" },
            --{ "─", "Comment" },
            --{ "╰", "Comment" },
            --{ "│", "Comment" },
          --},
          --scrollbar = false,
          --winblend = 0,
        --},
      --}
    --end,
  --},
--}
return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
