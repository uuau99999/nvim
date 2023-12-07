return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "solarized_dark",
      },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+", linehl = "GitSignsAddLn" },
          change = { text = "~", linehl = "GitSignsChangeLn" },
          delete = { text = "_", linehl = "GitSignsDeleteLn" },
          topdelete = { text = "‾", linehl = "GitSignsDeleteLn" },
          changedelete = { text = "~", linehl = "GitSignsChangeLn" },
        },
        linehl = true,
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          hijack_netrw_behavior = "disabled",
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[

██╗  ██╗ ██████╗ ██╗   ██╗██╗   ██╗██████╗ 
██║  ██║██╔═══██╗╚██╗ ██╔╝██║   ██║██╔══██╗
███████║██║   ██║ ╚████╔╝ ██║   ██║██████╔╝
██╔══██║██║   ██║  ╚██╔╝  ██║   ██║██╔═══╝ 
██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║     
╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝     
                                           

      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
