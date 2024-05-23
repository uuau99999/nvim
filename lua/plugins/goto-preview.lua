return {
  "rmagatti/goto-preview",
  config = function()
    require("goto-preview").setup({
      width = 120, -- Width of the floating window
      height = 25, -- Height of the floating window
    })
    vim.keymap.set("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
    vim.keymap.set("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { noremap = true })
    vim.keymap.set("n", "gpq", "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })
    vim.keymap.set("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { noremap = true })
  end,
}
