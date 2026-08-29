return {
  {
    "Aejkatappaja/cendre",
    lazy = false,
    priority = 1000,
    config = function()
      require("cendre").setup({
        background = "hard",  -- "hard" | "medium" | "soft"
        italic_virtual_text = false,
      })
      vim.cmd.colorscheme("cendre")

      local function set_ui_highlights()
        local border_fg = vim.api.nvim_get_hl(0, { name = "FloatBorder" }).fg
        local norm_fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg

        -- Float borders and window backgrounds (transparent / match editor)
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = border_fg, bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalFloat", { fg = norm_fg, bg = "NONE" })

        -- Blink popup backgrounds and borders
        vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = norm_fg, bg = "NONE" })
        vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = norm_fg, bg = "NONE" })
        vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { fg = norm_fg, bg = "NONE" })
        vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = border_fg, bg = "NONE" })
        vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = border_fg, bg = "NONE" })
        vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = border_fg, bg = "NONE" })
      end

      set_ui_highlights()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_ui_highlights,
      })
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
