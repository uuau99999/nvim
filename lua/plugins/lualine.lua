local function findCodebaseDir()
  local dir = vim.fn.getcwd()
  while dir ~= "/" do
    if vim.fn.isdirectory(dir .. "/.git") == 1 then
      return vim.fn.fnamemodify(dir, ":t")
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  return ""
end

-- local function lastModifyTime(path)
--   local stat = vim.loop.fs_stat(path)
--   if stat then
--     return stat.mtime.sec
--   end
--   return 0
-- end

-- local function lastModified()
--   if vim.bo.modified == true then
--     return ""
--   end
--   local mtime = lastModifyTime(vim.fn.expand("%"))
--   local lastModifyAuthor = vim.fn.systemlist("git log -1 --pretty=format:'%an' " .. vim.fn.expand("%:p"))[1]
--     or "unknown"
--   return mtime == 0 and ""
--     or " (Last modified by: " .. lastModifyAuthor .. " at " .. os.date("%Y-%m-%d %H:%M", mtime) .. ")"
-- end

local function isModified()
  return vim.bo.modified and "*" or ""
end

local function getFileRelativePath()
  return vim.fn.expand("%:~:.") .. isModified()
end

-- local function getLastModifyInfo()
--   if vim.bo.modified == true then
--     return ""
--   end
--   local mtime = lastModifyTime(vim.fn.expand("%"))
--   local lastModifyAuthor = vim.fn.systemlist("git log -1 --pretty=format:'%an' " .. vim.fn.expand("%:p"))[1]
--     or "unknown"
--   local mtimeDiffByDays = math.floor((os.time() - mtime) / (60 * 60 * 24))
--   return mtime == 0 and ""
--     or "lm: " .. lastModifyAuthor .. (mtimeDiffByDays == 0 and "" or "," .. mtimeDiffByDays .. "d")
-- end

local colors = {
  blue = "#80a0ff",
  cyan = "#79dac8",
  black = "#080808",
  white = "#c6c6c6",
  red = "#ff5189",
  violet = "#d183e8",
  green = "#98be65",
  lightgreen = "#90EE90",
  orange = "#ff9164",
  grey = "#303030",
}

local function customFilenameColor()
  return { fg = vim.bo.modified and colors.red or colors.cyan }
end

-- local custom_gruvbox = require("lualine.themes.tokyonight")

-- local bubbles_theme = {
--   normal = {
--     a = { fg = colors.black, bg = colors.lightgreen },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.white, bg = colors.grey },
--   },
--
--   insert = { a = { fg = colors.black, bg = colors.blue } },
--   visual = { a = { fg = colors.black, bg = colors.cyan } },
--   replace = { a = { fg = colors.black, bg = colors.red } },
--
--   inactive = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.black },
--     c = { fg = colors.white },
--   },
-- }

local lualine_nightfly = require("lualine.themes.nightfly")
-- new colors for theme
local new_colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
}

-- change nightlfy theme colors
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black, -- black
  },
}

return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        -- theme = lualine_nightfly,
        theme = "ayu_mirage",
        -- component_separators = "",
        -- section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "", right = "" } } },
        lualine_b = {
          { "branch" },
          {
            findCodebaseDir,
            color = { fg = colors.black, bg = colors.orange },
            icon = "",
            separator = { left = "", right = "" },
          },
        },
        lualine_c = {
          { getFileRelativePath, color = customFilenameColor },
        },
        lualine_x = {
          { "diagnostics", separator = { right = "" } },
          "diff",
        },
        lualine_y = { "filetype" },
        lualine_z = {
          { "progress", separator = { left = "" } },
          { "%l/%L" },
        },
      },
    })
  end,
}
