local M = {}

--- Applies transparent float border highlights, Blink window styling, and GitSigns highlight links.
function M.apply_highlights()
  local border_hl = vim.api.nvim_get_hl(0, { name = "FloatBorder" })
  local norm_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
  local border_fg = border_hl.fg
  local norm_fg = norm_hl.fg

  -- Float window borders & backgrounds (transparent / match editor)
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = border_fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalFloat", { fg = norm_fg, bg = "NONE" })

  -- Blink CMP popups and borders
  vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = norm_fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = norm_fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { fg = norm_fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = border_fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = border_fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = border_fg, bg = "NONE" })

  -- Noice popups and command palette borders
  vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { fg = norm_fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = border_fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "NoiceConfirm", { fg = norm_fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { fg = border_fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "NoicePopup", { fg = norm_fg, bg = "NONE" })
  vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = border_fg, bg = "NONE" })

  -- GitSigns staged & number highlight links
  for _, name in ipairs({ "Add", "Change", "Delete", "Changedelete", "Topdelete", "Untracked" }) do
    vim.api.nvim_set_hl(0, "GitSigns" .. name .. "Nr", { link = "GitSigns" .. name, default = true })
    vim.api.nvim_set_hl(0, "GitSigns" .. name .. "Staged", { link = "GitSigns" .. name, default = true })
    vim.api.nvim_set_hl(0, "GitSigns" .. name .. "StagedNr", { link = "GitSigns" .. name, default = true })
  end
end

--- Initializes the theme and registers a persistent ColorScheme autocommand.
---@param colorscheme_name? string
function M.setup(colorscheme_name)
  if colorscheme_name then
    vim.cmd.colorscheme(colorscheme_name)
  end

  M.apply_highlights()

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("UIThemeHighlights", { clear = true }),
    callback = function()
      M.apply_highlights()
    end,
  })
end

return M
