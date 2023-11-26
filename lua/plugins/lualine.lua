local function findGitDir()
  local dir = vim.fn.getcwd()
  while dir ~= "/" do
    if vim.fn.isdirectory(dir .. "/.git") == 1 then
      return vim.fn.fnamemodify(dir, ":t")
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  return ""
end

local function lastModifyTime(path)
  local stat = vim.loop.fs_stat(path)
  if stat then
    return stat.mtime.sec
  end
  return 0
end

local function lastModified()
  if vim.bo.modified == true then
    return ""
  end
  local mtime = lastModifyTime(vim.fn.expand("%"))
  return mtime == 0 and "" or " (Updated: " .. os.date("%Y-%m-%d %H:%M:%S", mtime) .. ")"
end

local function isModified()
  return vim.bo.modified and "*" or ""
end

local function customFilename()
  return vim.fn.expand("%:p:~") .. isModified() .. lastModified()
end

local function customFilenameColor()
  return { fg = vim.bo.modified and "#aa3355" or "#33aa88" }
end

local custom_gruvbox = require("lualine.themes.tokyonight")

return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = { theme = custom_gruvbox },
      sections = {
        lualine_c = {
          { findGitDir, color = { fg = "#ff9e64" }, icon = "" },
          { customFilename, color = customFilenameColor },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
      },
    })
  end,
}
