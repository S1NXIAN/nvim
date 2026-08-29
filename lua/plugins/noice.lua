return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
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
