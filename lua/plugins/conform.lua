return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },
  opts = function()
    return {
      formatters_by_ft = require("config.languages").get_formatters_by_ft(),
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback",
      },
    }
  end,
}
