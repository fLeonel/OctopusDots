return {
  {
    -- {
    --   "xiyaowong/transparent.nvim",
    --   config = function()
    --     require("transparent").setup({
    --       extra_groups = { -- table/string: additional groups that should be cleared
    --         "Normal",
    --         "NormalNC",
    --         "Comment",
    --         "Constant",
    --         "Special",
    --         "Identifier",
    --         "Statement",
    --         "PreProc",
    --         "Type",
    --         "Underlined",
    --         "Todo",
    --         "String",
    --         "Function",
    --         "Conditional",
    --         "Repeat",
    --         "Operator",
    --         "Structure",
    --         "LineNr",
    --         "NonText",
    --         "SignColumn",
    --         "CursorLineNr",
    --         "EndOfBuffer",
    --       },
    --       exclude_groups = {}, -- table: groups you don't want to clear
    --     })
    --   end,
    -- },
    {
      -- Tema principal: Dracula (igual que tmux, zellij y Alacritty)
      -- URL: https://github.com/Mofiqul/dracula.nvim
      "Mofiqul/dracula.nvim",
      lazy = false,
      priority = 1000,
      opts = {
        transparent_bg = true, -- deja ver la opacidad + blur de Alacritty
        italic_comment = true,
        show_end_of_buffer = false,
        overrides = function(colors)
          return {
            NormalFloat = { bg = "NONE" },
            FloatBorder = { fg = colors.purple, bg = "NONE" },
            FloatTitle = { fg = colors.pink, bg = "NONE", bold = true },
            LineNr = { fg = colors.comment, bg = "NONE" },
            CursorLineNr = { fg = colors.yellow, bold = true },
            SignColumn = { bg = "NONE" },
            WinSeparator = { fg = colors.comment },
            StatusLine = { bg = "NONE" },
            StatusLineNC = { bg = "NONE" },
            -- popups de snacks/blink/which-key
            Pmenu = { bg = colors.menu },
            PmenuSel = { fg = colors.bg, bg = colors.purple },
            WhichKeyNormal = { bg = "NONE" },
            SnacksPickerBorder = { fg = colors.purple },
            SnacksDashboardHeader = { fg = colors.purple },
          }
        end,
      },
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      opts = {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true, -- disables setting the background color.
        term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      },
    },
    {
      "Gentleman-Programming/gentleman-kanagawa-blur",
      name = "gentleman-kanagawa-blur",
      priority = 1000,
    },
    {
      "Alan-TheGentleman/oldworld.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    },
    {
      "rebelot/kanagawa.nvim",
      priority = 1000,
      lazy = true,
      config = function()
        require("kanagawa").setup({
          compile = false, -- enable compiling the colorscheme
          undercurl = true, -- enable undercurls
          commentStyle = { italic = true },
          functionStyle = {},
          keywordStyle = { italic = true },
          statementStyle = { bold = true },
          typeStyle = {},
          transparent = true, -- do not set background color
          dimInactive = false, -- dim inactive window `:h hl-NormalNC`
          terminalColors = true, -- define vim.g.terminal_color_{0,17}
          colors = { -- add/modify theme and palette colors
            palette = {},
            theme = {
              wave = {},
              lotus = {},
              dragon = {},
              all = {
                ui = {
                  bg_gutter = "none", -- set bg color for normal background
                  bg_sidebar = "none", -- set bg color for sidebar like nvim-tree
                  bg_float = "none", -- set bg color for floating windows
                },
              },
            },
          },
          overrides = function(colors) -- add/modify highlights
            return {
              LineNr = { bg = "none" },
              NormalFloat = { bg = "none" },
              FloatBorder = { bg = "none" },
              FloatTitle = { bg = "none" },
              TelescopeNormal = { bg = "none" },
              TelescopeBorder = { bg = "none" },
              LspInfoBorder = { bg = "none" },
            }
          end,
          theme = "wave", -- Load "wave" theme
          background = { -- map the value of 'background' option to a theme
            dark = "wave", -- try "dragon" !
            light = "lotus",
          },
        })
      end,
    },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "dracula", -- antes: "gentleman-kanagawa-blur"
      },
    },
  },
}
