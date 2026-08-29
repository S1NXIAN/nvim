return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    -- Snappy physics: resolves in 2-3 frames, zero dragging lag
    stiffness = 0.9,
    trailing_stiffness = 0.8,
    damping = 0.95,
    distance_stop_animating = 0.8,

    -- Lag prevention: disable animation on single-line movement (holding j/k)
    smear_between_neighbor_lines = false,
    min_vertical_distance_smear = 2,
    min_horizontal_distance_smear = 3,

    -- Jump and buffer animations
    smear_between_buffers = true,
    scroll_buffer_space = true,
    smear_insert_mode = false,
    transparent_bg_fallback_color = "#171311",
  },
}
