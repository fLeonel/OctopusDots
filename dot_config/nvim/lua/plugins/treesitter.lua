return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "python",
        "javascript",
        "typescript",
        "dart",
        "html",
        "css",
        "json",
        "yaml",
      },
      highlight = {
        enable = true,
        disable = { "xml" },
      },
      indent = {
        enable = true,
        disable = { "xml" },
      },
    },
  },
}
