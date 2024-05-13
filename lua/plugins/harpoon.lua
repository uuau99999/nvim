return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })
  end,
  keys = {
    {
      "<leader>m",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Mark file with harpoon",
    },
    -- {
    --   "<leader>n",
    --   function()
    --     require("harpoon"):list():next()
    --   end,
    --   desc = "Go to next harpoon mark",
    -- },
    -- {
    --   "<leader>p",
    --   function()
    --     require("harpoon"):list():prev()
    --   end,
    --   desc = "Go to previous harpoon mark",
    -- },
    {
      "<leader>a",
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      desc = "Show harpoon marks",
    },
  },
}
