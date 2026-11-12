return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = { prefix = "●", spacing = 2, source = "if_many" },
        float = { border = "rounded", source = "always" },
        underline = true,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
      },
    },
    config = function()
      -- abre un popup automáticamente al dejar el cursor quieto
      vim.api.nvim_create_autocmd("cursorhold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
        end,
      })

      -- íconos lindos en el margen izquierdo
      local signs = { error = " ", warn = " ", hint = " ", info = " " }
      for type, icon in pairs(signs) do
        local hl = "diagnosticsign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
    end,
  },
}
