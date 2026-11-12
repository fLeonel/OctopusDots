return {
  "johnseth97/codex.nvim",
  lazy = true,
  cmd = { "Codex", "CodexToggle" },

  keys = {
    {
      "<leader>co",
      function()
        vim.cmd("CodexRight")
      end,
      desc = "Abrir Codex Chat (panel derecho)",
    },
    {
      "<leader>ci",
      function()
        require("codex").insert()
      end,
      desc = "Insertar respuesta de Codex",
    },
  },

  opts = {
    ui = {
      layout = "float",
      border = "rounded",
      width = 0.8,
      height = 0.8,
    },
    keymaps = {
      quit = nil, -- ⚠️ quit lo controlamos nosotros, no el plugin
    },
    model = "gpt-5",
    autoinstall = true,
  },

  config = function(_, opts)
    require("codex").setup(opts)

    -----------------------------------------------------------------------
    -- 1️⃣ Abrir Codex en split lateral derecho
    -----------------------------------------------------------------------
    vim.api.nvim_create_user_command("CodexRight", function()
      require("codex").toggle()
      vim.cmd("wincmd L")
      vim.cmd("vertical resize 80")
      -- si el buffer es terminal, que <Esc> solo salga al modo normal
      vim.schedule(function()
        local ft = vim.bo.filetype
        if ft == "codex" or ft == "terminal" then
          vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = true })
        end
      end)
    end, { desc = "Abrir Codex Chat lateral" })

    -----------------------------------------------------------------------
    -- 2️⃣ Enviar buffer actual como contexto
    -----------------------------------------------------------------------
    vim.api.nvim_create_user_command("CodexAsk", function()
      local buf = vim.api.nvim_get_current_buf()
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      local content = table.concat(lines, "\n")
      require("codex").send(content)
    end, { desc = "Mandar buffer actual a Codex" })

    -----------------------------------------------------------------------
    -- 3️⃣ Navegación entre ventanas (Ctrl + h/j/k/l)
    -----------------------------------------------------------------------
    local nav = { h = "h", j = "j", k = "k", l = "l" }
    for key, dir in pairs(nav) do
      vim.keymap.set({ "n", "t" }, "<C-" .. key .. ">", function()
        vim.cmd("wincmd " .. dir)
      end, { desc = "Mover ventana " .. dir })
    end

    -----------------------------------------------------------------------
    -- 4️⃣ Cerrar con <leader>wq
    -----------------------------------------------------------------------
    vim.keymap.set("n", "<leader>wq", function()
      local ft = vim.bo.filetype
      if ft == "codex" or ft == "terminal" then
        vim.cmd("bd!") -- cierra solo Codex
      else
        vim.cmd("wq")  -- comportamiento normal
      end
    end, { desc = "Cerrar Codex o guardar/salir" })
  end,
}
