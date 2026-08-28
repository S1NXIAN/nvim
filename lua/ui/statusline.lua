local M = {}

--- Find the project root for the current buffer (git root or cwd).
---@param buf? number
---@return string
function M.get_root(buf)
  buf = buf or 0
  local markers = { ".git", ".hg", ".svn", "lua", "package.json", "Cargo.toml", "pyproject.toml" }
  local root = vim.fs.root(buf, markers)
  return root and vim.fs.normalize(root) or vim.fs.normalize(vim.uv.cwd() or ".")
end

--- Generates a lualine component showing project root name with icon.
---@param opts? { icon?: string }
---@return table
function M.root_dir(opts)
  opts = opts or {}
  local icon = opts.icon or "󱉭 "

  local function get()
    local cwd = vim.fs.normalize(vim.uv.cwd() or ".")
    local root = M.get_root()
    if root == cwd then
      return nil
    end
    return vim.fs.basename(root)
  end

  return {
    function()
      return icon .. get()
    end,
    cond = function()
      return type(get()) == "string"
    end,
  }
end

--- Generates a lualine component for a truncated, highlight-aware file path.
---@param user_opts? table
---@return function
function M.pretty_path(user_opts)
  local opts = vim.tbl_extend("force", {
    modified_hl = "MatchParen",
    filename_hl = "Bold",
    modified_sign = "",
    readonly_icon = " 󰌾 ",
    length = 3,
  }, user_opts or {})

  return function(self)
    local path = vim.fn.expand("%:p")
    if path == "" then
      return "[No Name]"
    end

    if vim.bo.buftype == "terminal" then
      local term_id = vim.b.snacks_terminal and vim.b.snacks_terminal.id or vim.b.terminal_job_id
      return "terminal" .. (term_id and (": " .. term_id) or "")
    end

    path = vim.fs.normalize(path)
    local root = M.get_root()
    local cwd = vim.fs.normalize(vim.uv.cwd() or ".")
    if path:find(cwd, 1, true) == 1 then
      path = path:sub(#cwd + 2)
    elseif path:find(root, 1, true) == 1 then
      path = path:sub(#root + 2)
    end

    local sep = package.config:sub(1, 1)
    local parts = vim.split(path, "[\\/]")
    if #parts > opts.length then
      parts = { parts[1], "…", unpack(parts, #parts - opts.length + 2, #parts) }
    end

    local function hl(text, group)
      if not group or group == "" then
        return text
      end
      local utils = require("lualine.utils.utils")
      local gui = {}
      if utils.extract_highlight_colors(group, "bold") then
        gui[#gui + 1] = "bold"
      end
      if utils.extract_highlight_colors(group, "italic") then
        gui[#gui + 1] = "italic"
      end
      local hl_group = self:create_hl({
        fg = utils.extract_highlight_colors(group, "fg"),
        gui = #gui > 0 and table.concat(gui, ",") or nil,
      }, "LV_" .. group)
      return self:format_hl(hl_group) .. text .. self:get_default_hl()
    end

    if opts.modified_hl and vim.bo.modified then
      parts[#parts] = hl(parts[#parts] .. opts.modified_sign, opts.modified_hl)
    else
      parts[#parts] = hl(parts[#parts], opts.filename_hl)
    end

    local dir = ""
    if #parts > 1 then
      dir = hl(table.concat({ unpack(parts, 1, #parts - 1) }, sep) .. sep, "")
    end

    local readonly = ""
    if vim.bo.readonly then
      readonly = hl(opts.readonly_icon, opts.modified_hl)
    end
    return dir .. parts[#parts] .. readonly
  end
end

return M
