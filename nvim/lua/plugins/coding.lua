return {
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source
      "hrsh7th/cmp-buffer", -- Buffer source
      "hrsh7th/cmp-path", -- Path source
      "hrsh7th/cmp-emoji", -- Emoji source
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet source
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Use LuaSnip for snippets
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll up in docs
          ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll down in docs
          ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
          ["<C-e>"] = cmp.mapping.abort(), -- Close completion
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        }),
        sources = cmp.config.sources({
          { name = "nvim-lsp" }, -- LSP source
          { name = "luasnip" }, -- Snippet source
          { name = "buffer" }, -- Buffer source
          { name = "path" }, -- Path source
          { name = "emoji" }, -- Emoji source
        }),
      })
    end,
  },
}
