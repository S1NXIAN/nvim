return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },  -- C-y accept, C-space docs
    appearance = { nerd_font_variant = "mono" },
    completion = {
      menu = {
        border = "rounded",
        scrollbar = false,
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", gap = 1 },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
          scrollbar = false,
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,EndOfBuffer:Normal",
        },
      },
    },
    signature = {
      window = {
        border = "rounded",
        scrollbar = false,
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
    cmdline = {
      enabled = true,
      completion = {
        menu = {
          auto_show = true,
        },
      },
      sources = function()
        local type = vim.fn.getcmdtype()
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        if type == ":" or type == "@" then
          return { "cmdline", "path" }
        end
        return {}
      end,
    },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
