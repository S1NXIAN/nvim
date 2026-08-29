return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = require("config.languages").get_formatters_by_ft(),
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
