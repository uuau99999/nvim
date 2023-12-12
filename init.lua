-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("telescope").load_extension("harpoon")
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

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

vim.cmd.colorscheme("catppuccin")
