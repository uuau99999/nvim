return {
  {
    "nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind-nvim",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local no_format = {
        fields = { "abbr" },
      }
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        formatting = no_format,
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        formatting = no_format,
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      -- opts.sources = vim.list_extend(opts.sources, {
      --   { name = "nvim_lsp", priority = 1000 },
      --   { name = "path", priority = 999 },
      --   { name = "buffer", priority = 998 },
      --   -- { name = "luasnip", priority = 997 },
      -- })
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      })
      opts.sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      }
      opts.window = {
        completion = {
          border = "rounded",
          -- winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          -- winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        },
      }
      opts.formatting = {
        format = require("lspkind").cmp_format({
          preset = "codicons",
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
    enabled = true,
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = function()
      require("luasnip.loaders.from_vscode").lazy_load()

      local ls = require("luasnip")
      ls.filetype_extend("vue", { "vue" })
      ls.filetype_extend("javascript", { "jsdoc" })
      ls.filetype_extend("typescript", { "tsdoc" })

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
  {
    "nvimdev/lspsaga.nvim",
    enabled = false,
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("lspsaga").setup({})
    end,
  },
}
