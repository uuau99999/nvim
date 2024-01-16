-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local nmap = function(keys, func, desc)
  vim.keymap.set("n", keys, func, { desc = desc })
end

keymap.set("c", "W", "w")

keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)

keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "x", '"_x')
keymap.set("n", "s", '"_s')
keymap.set("n", "S", '"_S')

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "dw", "diw")
keymap.set("n", "yw", "yiw")
keymap.set("n", "vw", "viw")
keymap.set("n", "c", '"_c')
keymap.set("n", "cw", '"_ciw')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Line move
keymap.set("n", "<M-UP>", ":m-2<CR>")
keymap.set("n", "<M-DOWN>", ":m+1<CR>")

keymap.set("n", "<leader>e", "<cmd>Lex<cr>", opts)

-- -- Tab close
-- local bufferlineCommands = require("bufferline.commands")
-- local bufferlineConfig = require("bufferline.config")
-- local state = require("bufferline.state")
-- local closeF = function()
--   local index = bufferlineCommands.get_current_element_index(state)
--   for _, item in ipairs(vim.list_slice(state.components, index, index)) do
--     bufferlineConfig.options.close_command(item.id)
--   end
-- end
-- keymap.set("n", "<leader>tw", closeF, { desc = "Close current tab" })
--
keymap.set("n", "<leader>?", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })
nmap("<leader><leader>", "<Cmd>Telescope frecency workspace=CWD<CR>")
nmap("<leader>ff", require("telescope.builtin").find_files, "Find files")
nmap("<leader>/", require("telescope.builtin").live_grep, "Find Text")
nmap("<leader>fg", "<cmd>Telescope git_files<cr>", "Find Git files")
nmap("<leader>fw", function()
  require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
end, "Find Words")

nmap("<leader>fh", "<cmd>Telescope help_tags<cr>", "Find Help tags")
nmap("<leader>sr", "<cmd>Telescope lsp_references<cr>", "Search references")
nmap("<leader>fb", "<cmd>Telescope file_browser<cr>")

nmap("<leader>o", "<cmd>Lspsaga outline<cr>", "Open Outline")

-- harpoon keymap
local harpoon = require("harpoon")
nmap("<leader>1", function()
  harpoon:list():select(1)
end, "Goto harpoon file 1")
nmap("<leader>2", function()
  harpoon:list():select(2)
end, "Goto harpoon file 2")
nmap("<leader>3", function()
  harpoon:list():select(3)
end, "Goto harpoon file 3")
nmap("<leader>4", function()
  harpoon:list():select(4)
end, "Goto harpoon file 4")

--fugitive keymap
nmap("<leader>gs", function()
  vim.cmd.Git()
end, "Git status")
nmap("<leader>gc", function()
  vim.cmd.Git({ "commit" })
end, "Git commit")
nmap("<leader>ga", function()
  vim.cmd.Git({ "add --patch" })
end, "Git add")
nmap("<leader>gp", function()
  vim.cmd.Git({ "pull --rebase" })
end, "Git pull")
nmap("<leader>gP", function()
  vim.cmd.Git({ "push" })
end, "Git push")
