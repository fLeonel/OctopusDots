-- Cursor con estela animada al moverse/saltar.
-- URL: https://github.com/sphamba/smear-cursor.nvim
-- Ajustar la "sensación":
--   stiffness más alto (→1)          = el cursor llega más rápido
--   trailing_stiffness más bajo (→0) = estela más larga
--   damping más bajo                 = más "rebote"

return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    -- Colores Dracula: morado en normal, rosa en insert
    cursor_color = "#bd93f9",
    cursor_color_insert_mode = "#ff79c6",

    stiffness = 0.7,
    trailing_stiffness = 0.35,
    damping = 0.85,
    distance_stop_animating = 0.3,

    smear_between_buffers = true, -- estela al cambiar de ventana/buffer
    smear_between_neighbor_lines = true, -- también al moverte con j/k
    smear_insert_mode = true,
    scroll_buffer_space = true,
  },
}
