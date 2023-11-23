-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("luasnip.loaders.from_vscode").lazy_load()

require("lspconfig").volar.setup({
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})

require("lualine").setup({
  sections = {
    lualine_c = {
      { "filename", file_status = true, path = 3 },
    },
  },
})

require("luasnip").filetype_extend("vue", { "vue" })
