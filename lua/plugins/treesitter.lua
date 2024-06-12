return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "css",
        "fish",
        "gitignore",
        "http",
        "rust",
        "scss",
        "sql",
        "markdown",
        "javascript",
        "lua",
        "tsx",
        "typescript",
        "vue",
        "yaml",
        "astro",
        "svelte",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      require("treesitter-context").setup({
        separator = "-",
      })

      -- MDX
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
