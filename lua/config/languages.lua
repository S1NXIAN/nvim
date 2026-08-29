--- Central Language Tooling Registry
--- Single source of truth for LSP servers, linters, and formatters per language/filetype.
---
--- How to add a new language:
--- 1. Add an entry under `M.languages`:
---    ```lua
---    rust = {
---      lsp = "rust_analyzer",
---      formatters = { "rustfmt" },
---    },
---    ```
--- 2. To specify fallback formatters (run first available):
---    ```lua
---    javascript = {
---      formatters = { "prettierd", "prettier", stop_after_first = true },
---    },
---    ```
--- 3. To run multiple formatters sequentially:
---    ```lua
---    python = {
---      lsp = "pyright",
---      formatters = { "ruff_format", "ruff_fix" },
---    },
---    ```
local M = {}

---@class LanguageSpec
---@field lsp? string | string[] Single LSP server name or list of servers (e.g. "pyright", "lua_ls")
---@field formatters? string[] | table List of conform formatter names or table with stop_after_first = true

--- Language and filetype tool definitions.
local prettier = { "prettierd", "prettier", stop_after_first = true }

--- Language and filetype tool definitions.
---@type table<string, LanguageSpec>
M.languages = {
  lua = {
    formatters = { "stylua" },
  },
  python = {
    lsp = "pyright",
    formatters = { "ruff_format", "ruff_fix" },
  },
  javascript = { formatters = prettier },
  typescript = { formatters = prettier },
  javascriptreact = { formatters = prettier },
  typescriptreact = { formatters = prettier },
  json = { formatters = prettier },
  yaml = { formatters = prettier },
  markdown = { formatters = prettier },
  sh = {
    formatters = { "shfmt" },
  },
}

--- Extracts a deduplicated list of all configured LSP servers for Mason and lspconfig.
---@return string[]
function M.get_lsp_servers()
  local servers = {}
  local seen = {}

  for _, spec in pairs(M.languages) do
    if spec.lsp then
      local list = type(spec.lsp) == "table" and spec.lsp or { spec.lsp }
      for _, server in ipairs(list) do
        if not seen[server] then
          seen[server] = true
          servers[#servers + 1] = server
        end
      end
    end
  end

  return servers
end

--- Extracts the filetype-to-formatter mapping for conform.nvim.
---@return table<string, any>
function M.get_formatters_by_ft()
  local formatters = {}

  for ft, spec in pairs(M.languages) do
    if spec.formatters then
      formatters[ft] = spec.formatters
    end
  end

  return formatters
end

return M
