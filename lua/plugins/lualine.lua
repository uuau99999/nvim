local function findGitDir()
  local dir = vim.fn.getcwd()
  while dir ~= "/" do
    if vim.fn.isdirectory(dir .. "/.git") == 1 then
      return dir
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  return nil
end

local function lastModifyTime(path)
  local stat = vim.loop.fs_stat(path)
  if stat then
    return stat.mtime.sec
  end
  return 0
end

local function lastModified()
  local mtime = lastModifyTime(vim.fn.expand("%"))
  return mtime == 0 and "" or " (Updated: " .. os.date("%Y-%m-%d %H:%M:%S", mtime) .. ")"
end

local function customFilename()
  return vim.fn.expand("%:p:~") .. lastModified()
end

return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      sections = {
        lualine_c = {
          { findGitDir, color = { fg = "#ff9e64" } },
          { customFilename },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
      },
    })
  end,
}
