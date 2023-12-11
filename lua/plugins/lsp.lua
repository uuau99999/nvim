return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "eslint-lsp",
        "vue-language-server",
      })
    end,
  },
  {
    "folke/neoconf.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function()
      local masonLsp = require("mason-lspconfig")
      masonLsp.setup({
        automatic_installation = true,
        ensure_installed = {
          "volar",
          "tsserver",
          "eslint",
          "cssls",
          "tailwindcss",
          "lua_ls",
          "html",
          "jsonls",
        },
      })
    end,
  },
}
