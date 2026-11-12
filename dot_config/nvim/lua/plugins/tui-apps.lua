-- Apps TUI dentro de Neovim en ventanas flotantes.
-- yazi.nvim: https://github.com/mikavilpas/yazi.nvim
-- El resto se abre con Snacks.terminal (lazygit ya viene en <leader>gg).

---@param cmd string
---@param title string
local function float(cmd, title)
  return function()
    Snacks.terminal(cmd, {
      cwd = LazyVim.root(),
      win = { style = "lazygit", title = " " .. title .. " ", title_pos = "center", border = "rounded" },
    })
  end
end

return {
  {
    "mikavilpas/yazi.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      open_for_directories = false, -- oil sigue manejando `nvim .` y <leader>-
      floating_window_scaling_factor = 0.9,
      yazi_floating_window_border = "rounded",
      keymaps = { show_help = "<f1>" },
    },
    keys = {
      { "<leader>y", "<cmd>Yazi<cr>", mode = { "n", "v" }, desc = "Yazi (archivo actual)" },
      { "<leader>Y", "<cmd>Yazi cwd<cr>", desc = "Yazi (cwd)" },
      { "<c-up>", "<cmd>Yazi toggle<cr>", desc = "Yazi (reanudar sesión)" },
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>t", "", desc = "+tui apps" },
      { "<leader>td", float("lazydocker", "lazydocker"), desc = "Lazydocker" },
      { "<leader>ts", float("lazysql", "lazysql"), desc = "Lazysql (DBs)" },
      { "<leader>tj", float("lazyjournal", "lazyjournal"), desc = "Lazyjournal (logs)" },
      { "<leader>th", float("lazyssh", "lazyssh"), desc = "Lazyssh (servidores)" },
      { "<leader>tp", float("posting", "posting"), desc = "Posting (HTTP / API)" },
      { "<leader>tb", float("btop", "btop"), desc = "Btop (sistema)" },
    },
  },
}
