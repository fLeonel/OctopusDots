-- Cursor con estela animada al moverse/saltar.
-- URL: https://github.com/sphamba/smear-cursor.nvim
-- Ajustar la "sensación":
--   stiffness más alto (→1)          = el cursor llega más rápido
--   trailing_stiffness más bajo (→0) = estela más larga
--   damping más bajo                 = más "rebote"
--
-- En Ghostty se desactiva: la terminal ya dibuja su propia estela con un shader
-- (~/.config/ghostty/shaders/cursor_warp.glsl) y se verían dos estelas encimadas.

local in_ghostty = vim.env.TERM_PROGRAM == "ghostty" or vim.env.GHOSTTY_RESOURCES_DIR ~= nil

return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  cond = not in_ghostty,
  opts = {
    -- Colores Dracula: morado en normal, rosa en insert
    cursor_color = "#bd93f9",
    cursor_color_insert_mode = "#ff79c6",

    -- Estela larga
    stiffness = 0.5,
    trailing_stiffness = 0.15,
    trailing_exponent = 3,
    damping = 0.85,
    distance_stop_animating = 0.1,

    smear_between_buffers = true, -- estela al cambiar de ventana/buffer
    smear_between_neighbor_lines = true, -- también al moverte con j/k
    smear_insert_mode = true,
    scroll_buffer_space = true,
  },
}
