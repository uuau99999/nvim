return {
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      -- vim.cmd.colorscheme("oxocarbon")
    end,
  },
  {
    "sainnhe/sonokai",
    priority = 1000,
    config = function()
      vim.g.sonokai_transparent_background = "1"
      vim.g.sonokai_enable_italic = "1"
      vim.g.sonokai_style = "maia"
      vim.cmd.colorscheme("sonokai")
    end,
  },
  {
    "bluz71/vim-nightfly-guicolors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    branch = "osaka",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    opts = function()
      require("catppuccin").setup({
        flavour = "mocha",
        custom_highlights = function(colors)
          return {
            Comment = { fg = colors.flamingo },
            TabLineSel = { bg = colors.pink },
            CmpBorder = { fg = colors.surface2 },
            Pmenu = { bg = colors.none },
          }
        end,
        highlight_overrides = {
          all = function(colors)
            return {
              NvimTreeNormal = { fg = colors.none },
              CmpBorder = { fg = "#3e4145" },
            }
          end,
          latte = function(latte)
            return {
              Normal = { fg = latte.base },
            }
          end,
          frappe = function(frappe)
            return {
              ["@comment"] = { fg = frappe.surface2, style = { "italic" } },
            }
          end,
          macchiato = function(macchiato)
            return {
              LineNr = { fg = macchiato.overlay1 },
            }
          end,
          mocha = function(mocha)
            return {
              Comment = { fg = mocha.flamingo },
            }
          end,
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },
          telescope = {
            true,
          },
        },
      })
    end,
  },
}
