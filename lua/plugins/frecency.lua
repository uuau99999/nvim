return {
  "nvim-telescope/telescope-frecency.nvim",
  enabled = false,
  config = function()
    require("telescope").load_extension("frecency")
  end,
}
