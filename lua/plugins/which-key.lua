return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 250,
    disable = {
      ft = { "snacks_terminal", "terminal" },
      bt = { "terminal" },
    },
  },
}
