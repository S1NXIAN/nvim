return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 250,
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
      mappings = true,
    },
    win = {
      border = "rounded",
      padding = { 1, 2 },
    },
    layout = {
      width = { min = 20 },
      spacing = 3,
    },
    disable = {
      ft = { "snacks_terminal", "terminal" },
      bt = { "terminal" },
    },
    spec = {
      -- Leader groups
      { "<leader>b", group = "Buffer", icon = "󰓩 " },
      { "<leader>c", group = "Code", icon = " " },
      { "<leader>f", group = "File / Find", icon = " " },
      { "<leader>g", group = "Git / GitHub", icon = " " },
      { "<leader>gh", group = "GitHub", icon = " " },
      { "<leader>h", group = "Hunks", icon = " " },
      { "<leader>s", group = "Search / LSP", icon = " " },
      { "<leader>t", group = "Toggle", icon = " " },
      { "<leader>u", group = "UI / Options", icon = "󰔡 " },
      { "<leader>w", group = "Windows / Save", icon = " " },
      { "<leader>z", group = "Zen / Zoom", icon = "󰛐 " },

      -- Top-level leader shortcuts
      { "<leader><space>", desc = "Smart Find Files", icon = " " },
      { "<leader>,", desc = "Switch Buffer", icon = "󰓩 " },
      { "<leader>/", desc = "Grep Project", icon = " " },
      { "<leader>:", desc = "Command History", icon = " " },
      { "<leader>.", desc = "Toggle Scratch Buffer", icon = "󰠮 " },
      { "<leader>S", desc = "Select Scratch Buffer", icon = "󰠮 " },
      { "<leader>e", desc = "File Explorer", icon = "󰙅 " },
      { "<leader>n", desc = "Notification History", icon = "󰎟 " },
      { "<leader>q", desc = "Quit Neovim", icon = "󰩈 " },
      { "<leader>w", desc = "Save File", icon = "󰆓 " },

      -- Navigation & Bracket pairs
      { "[", group = "Previous..." },
      { "]", group = "Next..." },
      { "[d", desc = "Prev Diagnostic", icon = "󰒕 " },
      { "]d", desc = "Next Diagnostic", icon = "󰒕 " },
      { "[c", desc = "Prev Git Hunk", icon = " " },
      { "]c", desc = "Next Git Hunk", icon = " " },
      { "[[", desc = "Prev Reference", icon = "󰈞 " },
      { "]]", desc = "Next Reference", icon = "󰈞 " },

      -- Goto / LSP navigation
      { "g", group = "Goto / LSP / Surround" },
      { "gd", desc = "Goto Definition", icon = "󰅩 " },
      { "gD", desc = "Goto Declaration", icon = "󰅩 " },
      { "gr", desc = "Goto References", icon = "󰌹 " },
      { "gI", desc = "Goto Implementation", icon = "󰡱 " },
      { "gy", desc = "Goto Type Definition", icon = "󰆧 " },
      { "gai", desc = "Incoming Calls", icon = "󰏪 " },
      { "gao", desc = "Outgoing Calls", icon = "󰏪 " },
      { "K", desc = "Hover Documentation", icon = "󰋽 " },

      -- Surround (mini.surround)
      { "s", group = "Surround / Flash" },
      { "sa", desc = "Add Surround", mode = { "n", "v" }, icon = "󰅪 " },
      { "sd", desc = "Delete Surround", icon = "󰅪 " },
      { "sr", desc = "Replace Surround", icon = "󰅪 " },
      { "sf", desc = "Find Surround (Right)", icon = "󰅪 " },
      { "sF", desc = "Find Surround (Left)", icon = "󰅪 " },
      { "sh", desc = "Highlight Surround", icon = "󰅪 " },
    },
  },
}
