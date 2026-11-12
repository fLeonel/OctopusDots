return {
  "stevearc/conform.nvim",
  opts = {
    -- Configuración por tipo de archivo
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      dart = { "dart_format" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      xml = { "prettier" },
      sh = { "shfmt" },
      bash = { "shfmt" },
    },

  },
}
