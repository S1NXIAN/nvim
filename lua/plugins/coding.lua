return {
  -- Autopairs
  {
    "echasnovski/mini.pairs",
    version = false,
    event = "VeryLazy",
    opts = {},
  },

  -- Surround
  {
    "echasnovski/mini.surround",
    version = false,
    event = "VeryLazy",
    opts = {},
  },

  -- Treesitter-based comments
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
}
