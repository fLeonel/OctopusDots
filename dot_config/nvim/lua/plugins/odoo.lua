-- Odoo 19: soporte de XML (vistas, data, security) encima del extra lang.python.
-- lemminx = LSP de XML (validación, folding, formato, cierre de tags).

return {
  {
    -- OdooLS: LSP oficial de Odoo (modelos, _inherit, env['x'], campos, XML ids).
    -- Server en ~/.local/share/odoo-ls (binario + typeshed/), release 1.6.2.
    -- Solo se activa en archivos bajo un odools.toml (~/Documents/DevRoot/Odoo/odools.toml).
    "odoo/odoo-neovim",
    ft = { "python", "xml", "csv", "javascript" },
    cmd = "OdooLs",
    opts = {
      cmd = { vim.fn.expand("~/.local/share/odoo-ls/odoo_ls_server") },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "python", "xml", "csv", "po" } },
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "lemminx" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lemminx = {
          filetypes = { "xml", "xsd", "xsl", "xslt", "svg" },
          settings = {
            xml = {
              format = {
                enabled = true,
                splitAttributes = "preserve", -- no romper el estilo de las vistas de Odoo
                maxLineWidth = 120,
              },
              validation = { noGrammar = "ignore" }, -- Odoo no usa DTD/XSD en sus vistas
            },
          },
        },
      },
    },
  },
}
