return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lsp = {
      progress = {
        enabled = false, -- suppress repeated `✓ pyright` notifications while typing
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
    presets = {
      bottom_search = true, -- classic bottom search for / and ?
      command_palette = true, -- floating command palette when typing :
      long_message_to_split = true, -- long messages sent to split
      inc_rename = false,
      lsp_doc_border = true, -- add border to hover docs and signature help
    },
  },
}
