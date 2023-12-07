-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("luasnip.loaders.from_vscode").lazy_load()

require("lspconfig").volar.setup({
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})

local ls = require("luasnip")
ls.filetype_extend("vue", { "vue" })

-- 创建一个通用的 snippet
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

require("telescope").load_extension("harpoon")

require("telescope").setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "bottom",
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
  },
})
