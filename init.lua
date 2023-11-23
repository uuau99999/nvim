-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("luasnip.loaders.from_vscode").lazy_load()

require("lspconfig").volar.setup({
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})

local function currentPath()
  return vim.fn.expand("%")
end

require("lualine").setup({
  sections = {
    lualine_c = {
      { currentPath, max_length = 1500 },
    },
  },
})

require("luasnip").filetype_extend("vue", { "vue" })
