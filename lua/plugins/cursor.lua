return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    stiffness = 0.85,
    trailing_stiffness = 0.65,
    stiffness_insert_mode = 0.7,
    trailing_stiffness_insert_mode = 0.7,
    damping = 0.95,
    damping_insert_mode = 0.95,
    distance_stop_animating = 0.5,
    anticipation = 0,             -- Disable backward kick frames on fast jumps
    max_kept_windows = 15,        -- Drop floating window count from 50 -> 15 (cuts CPU load)
    transparent_bg_fallback_color = "#171311",
  },
}
