-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.spelllang = "en_us"
vim.opt.spell = false
-- vim.opt.guicursor = ""
vim.opt.updatetime = 750
vim.opt.relativenumber = true
vim.opt.ignorecase = false
vim.opt.clipboard = "unnamedplus"
-- vim.opt.cmdheight = 0

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
-- vim.g.netrw_liststyle = 3

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- color scheme
vim.o.termguicolors = true
vim.g.nightflyTransparent = true
vim.g.nightflyUndercurls = false
vim.g.nightflyNormalFloat = true
vim.g.nightflyWinSeparator = 2
-- Lua initialization file
vim.opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}
