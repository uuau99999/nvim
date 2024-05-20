return {
  {
    "folke/noice.nvim",
    enabled = true,
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
      opts.views = {
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      }
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      opts.cmdline = {
        enabled = true,
        view = "cmdline",
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    enabled = false,
    opts = {
      timeout = 5000,
      background_colour = "#000000",
      render = "compact",
      stages = "slide",
      fps = 60,
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
    opts = {
      options = {
        indicator = { style = "none" },
        show_buffer_close_icons = false,
        show_close_icon = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true, -- use a "true" to enable the default, or set your own character
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "echasnovski/mini.animate",
    enabled = false,
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
        -- linehl = true,
      })
      vim.keymap.set("n", "<leader>gd", ":Gitsigns preview_hunk<CR>", {
        desc = "Check current chunk diff",
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
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
