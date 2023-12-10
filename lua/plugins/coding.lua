return {
  {
    "nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "onsails/lspkind-nvim",
    },
    opts = function(_, opts)
      opts.sources = vim.list_extend(
        opts.sources,
        { { name = "emoji" }, { name = "nvim_lsp" }, { name = "path" }, { name = "buffer" } }
      )
      opts.window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        },
      }
      opts.formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol_text",
          before = function(entry, vim_item)
            vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
            return vim_item
          end,
        }),
      }
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
