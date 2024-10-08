return {
  "akinsho/flutter-tools.nvim",
  ft = { "dart" }, -- Activa solo cuando se abre un archivo Dart
  dependencies = {
    "nvim-lua/plenary.nvim", -- Dependencia requerida por flutter-tools
    "stevearc/dressing.nvim", -- Opcional, mejora los diálogos de UI
    "mfussenegger/nvim-dap", -- Opcional, soporte de depuración
  },
  config = function()
    require("flutter-tools").setup({
      flutter_path = "/home/dennis/Documents/DevRoot/Apps/flutter/bin/flutter", -- Ajusta la ruta de tu SDK de Flutter
      lsp = {
        color = {
          enabled = false, -- Desactiva el soporte de color para evitar posibles errores
        },
        on_attach = function(client, bufnr)
          local map = vim.api.nvim_buf_set_keymap
          local opts = { noremap = true, silent = true }

          -- Atajos para ejecutar y controlar la aplicación Flutter
          map(bufnr, "n", "<leader>fr", ":FlutterRun<CR>", opts) -- Ejecutar la aplicación
          map(bufnr, "n", "<leader>fd", ":FlutterDevices<CR>", opts) -- Cambiar dispositivos
          map(bufnr, "n", "<leader>fq", ":FlutterQuit<CR>", opts) -- Detener la aplicación
          map(bufnr, "n", "<leader>fh", ":FlutterReload<CR>", opts) -- Recarga en caliente
          map(bufnr, "n", "<leader>fR", ":FlutterRestart<CR>", opts) -- Reiniciar la aplicación
          map(bufnr, "n", "<leader>fo", ":FlutterOutlineToggle<CR>", opts) -- Alternar Flutter Outline

          -- Navegación y documentación
          map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Ir a la definición
          map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- Mostrar documentación

          -- Acciones del código (como "envolver con widget")
          map(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

          -- Depuración
          map(bufnr, "n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts) -- Toggle breakpoint
          map(bufnr, "n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", opts) -- Continuar ejecución
          map(bufnr, "n", "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>", opts) -- Step over
          map(bufnr, "n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", opts) -- Step into
          map(bufnr, "n", "<leader>do", "<cmd>lua require'dap'.step_out()<CR>", opts) -- Step out
        end,
        settings = {
          showTodos = true,
          completeFunctionCalls = true, -- Completa las llamadas de función automáticamente
        },
      },
      dev_log = {
        enabled = true,
        open_cmd = "tabedit", -- Abre el registro de desarrollo en una nueva pestaña
      },
      widget_guides = {
        enabled = true, -- Muestra guías visuales para los widgets
      },
      debugger = {
        enabled = true, -- Habilitar soporte de depuración con nvim-dap
        run_via_dap = true, -- Ejecutar aplicaciones Flutter usando nvim-dap
        exception_breakpoints = {}, -- Configurar puntos de interrupción en excepciones
      },
    })
  end,
}
