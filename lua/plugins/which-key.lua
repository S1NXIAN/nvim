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
    spec = {
      { "<leader>c", group = "Code" },
      { "<leader>f", group = "Find / File" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Hunks (Git)" },
      { "<leader>s", group = "Search / LSP" },
      { "<leader>t", group = "Toggle" },
      { "<leader>u", group = "UI / Options" },
      { "<leader>w", group = "Windows / Save" },
      { "sa", desc = "Add Surround", mode = { "n", "v" } },
      { "sd", desc = "Delete Surround" },
      { "sr", desc = "Replace Surround" },
      { "sf", desc = "Find Surround (Right)" },
      { "sF", desc = "Find Surround (Left)" },
      { "sh", desc = "Highlight Surround" },
    },
  },
}
