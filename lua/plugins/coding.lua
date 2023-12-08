return {
  {
    "nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = function()
      require("luasnip.loaders.from_vscode").lazy_load()

      require("lspconfig").volar.setup({
        settings = {
          format = { enable = true },
        },
      })

      local ls = require("luasnip")
      ls.filetype_extend("vue", { "vue" })

      local clg_snippet = ls.parser.parse_snippet("clg", "console.log($1)$0")

      ls.add_snippets("vue", {
        clg_snippet,
      })
      ls.add_snippets("typescript", {
        clg_snippet,
      })
      ls.add_snippets("javascript", {
        clg_snippet,
      })
    end,
  },
}
