return {
  {
    "Aejkatappaja/cendre",
    lazy = false,
    priority = 1000,
    config = function()
      require("cendre").setup({
        background = "hard", -- "hard" | "medium" | "soft"
        italic_virtual_text = false,
      })
      require("ui.theme").setup("cendre")
    end,
  },
  -- filetype/extension icons for snacks picker, explorer, statuscolumn
  {
    "echasnovski/mini.icons",
    version = false,
    priority = 1000,
    lazy = false,
    init = function()
      local icons = require("mini.icons")
      icons.setup()
      icons.mock_nvim_web_devicons()
    end,
  },
}
