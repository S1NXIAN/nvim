return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  priority = 900,
  config = function()
    -- Minimal local reimplementation of LazyVim's root_dir / pretty_path
    -- helpers (no LazyVim framework dependency). Glyphs match LazyVim's
    -- icon table so the look is the 2026 "standard" lazy.nvim statusline.
    local icons = {
      diagnostics = { Error = " ", Warn = " ", Hint = " ", Info = " " },
      git = { added = " ", modified = " ", removed = " " },
    }

    --- Find the project root for the current buffer (git root or cwd).
    local function get_root()
      local markers = { ".git", ".hg", ".svn", "lua", "package.json", "Cargo.toml", "pyproject.toml" }
      local root = vim.fs.root(0, markers)
      return root and vim.fs.normalize(root) or vim.fs.normalize(vim.uv.cwd() or ".")
    end

    --- LazyVim.lualine.root_dir: show the project root name with an icon.
    local function root_dir()
      local icon = "󱉭 "
      local function get()
        local cwd = vim.fs.normalize(vim.uv.cwd() or ".")
        local root = get_root()
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

    --- LazyVim.lualine.pretty_path: cwd-relative path, truncated, with
    --- highlighted filename, modified and readonly markers.
    local function pretty_path()
      local opts = {
        modified_hl = "MatchParen",
        filename_hl = "Bold",
        modified_sign = "",
        readonly_icon = " 󰌾 ",
        length = 3,
      }
      return function(self)
        local path = vim.fn.expand("%:p")
        if path == "" then
          return ""
        end
        path = vim.fs.normalize(path)
        local root = get_root()
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

    require("lualine").setup({
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { pretty_path() },
        },
        lualine_x = {
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      inactive_sections = {
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "location" },
      },
    })
  end,
}
