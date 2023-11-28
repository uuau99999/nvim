-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local nmap = function(keys, func, desc)
  if desc then
    desc = "LazyVim " .. desc
  end
  vim.keymap.set("n", keys, func, { desc = desc })
end

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("n", "dw", "daw")
keymap.set("n", "yw", "yaw")
keymap.set("n", "cw", "caw")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Line move
keymap.set("n", "<M-UP>", ":m-2<CR>")
keymap.set("n", "<M-DOWN>", ":m+1<CR>")

-- Tab close
local bufferlineCommands = require("bufferline.commands")
local bufferlineConfig = require("bufferline.config")
local state = require("bufferline.state")
local closeF = function()
  local index = bufferlineCommands.get_current_element_index(state)
  for _, item in ipairs(vim.list_slice(state.components, index, index)) do
    bufferlineConfig.options.close_command(item.id)
  end
end
keymap.set("n", "<leader>tw", closeF, { desc = "Close current tab" })

keymap.set("n", "<leader>?", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })

nmap("<leader>fg", "<cmd>Telescope live_grep<cr>", "Live grep")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>", "Help tags")
