-- Flutter: run/reload/devices/logs desde Neovim.
-- URL: https://github.com/nvim-flutter/flutter-tools.nvim
-- Hot reload automático al guardar un .dart mientras la app corre.

return {
  {
    "nvim-flutter/flutter-tools.nvim",
    ft = "dart",
    cmd = { "FlutterRun", "FlutterDevices", "FlutterEmulators" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- Ruta fija: funciona aunque Neovim no herede el PATH del shell.
      flutter_path = vim.fn.expand("~/development/flutter/bin/flutter"),
      ui = { border = "rounded" },
      decorations = {
        statusline = { app_version = false, device = true },
      },
      widget_guides = { enabled = true },
      closing_tags = { enabled = true, prefix = "// " },
      dev_log = {
        enabled = true,
        open_cmd = "botright 15split", -- logs abajo
        focus_on_open = false,
      },
      lsp = {
        color = { enabled = true },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          updateImportsOnRename = true,
        },
      },
    },
    keys = {
      { "<leader>F", "", desc = "+flutter" },
      { "<leader>Fr", "<cmd>FlutterRun<cr>", desc = "Run" },
      { "<leader>Fd", "<cmd>FlutterDevices<cr>", desc = "Elegir dispositivo" },
      { "<leader>Fe", "<cmd>FlutterEmulators<cr>", desc = "Abrir emulador" },
      { "<leader>Fh", "<cmd>FlutterReload<cr>", desc = "Hot reload" },
      { "<leader>FR", "<cmd>FlutterRestart<cr>", desc = "Hot restart" },
      { "<leader>Fq", "<cmd>FlutterQuit<cr>", desc = "Detener app" },
      { "<leader>Fa", "<cmd>FlutterAttach<cr>", desc = "Attach a app corriendo" },
      { "<leader>Fl", "<cmd>FlutterLogToggle<cr>", desc = "Mostrar/ocultar logs" },
      { "<leader>Fc", "<cmd>FlutterLogClear<cr>", desc = "Limpiar logs" },
      { "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Outline de widgets" },
      { "<leader>Fp", "<cmd>FlutterPubGet<cr>", desc = "pub get" },
      { "<leader>Fs", "<cmd>FlutterLspRestart<cr>", desc = "Reiniciar LSP" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "dart" } },
  },
}
