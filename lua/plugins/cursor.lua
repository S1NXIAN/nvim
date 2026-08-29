return {
  "danilamihailov/beacon.nvim",
  event = "VeryLazy",
  opts = {
    enabled = true,
    speed = 2,
    width = 30,
    winblend = 70,
    fps = 60,
    min_jump = 8, -- Trigger beacon pulse on jumps >= 8 lines
    cursor_events = { "CursorMoved" },
    window_events = { "WinEnter", "FocusGained" },
  },
}
