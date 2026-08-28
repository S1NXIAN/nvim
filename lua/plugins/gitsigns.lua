return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local gitsigns = require("gitsigns")
    return {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "│" },
        topdelete = { text = "│" },
        changedelete = { text = "│" },
        untracked = { text = "│" },
      },
      signs_staged = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "│" },
        topdelete = { text = "│" },
        changedelete = { text = "│" },
        untracked = { text = "│" },
      },
      signcolumn = true, -- output signs for snacks statuscolumn
      numhl = false,     -- leave line number highlighting for diagnostics
      linehl = false,
      word_diff = false,
      watch_gitdir = { follow_files = true },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false, -- toggle with <leader>tb
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
      status_formatter = function(status)
        return table.concat({
          status.added and ("+" .. status.added) or "",
          status.removed and ("-" .. status.removed) or "",
          status.changed and ("~" .. status.changed) or "",
        })
      end,
      on_attach = function(buffer)
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, "Prev Hunk")

        -- Stages
        map("n", "<leader>hs", gitsigns.stage_hunk, "Stage Hunk")
        map("n", "<leader>hr", gitsigns.reset_hunk, "Reset Hunk")
        map("v", "<leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage Hunk")
        map("v", "<leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset Hunk")
        map("n", "<leader>hS", gitsigns.stage_buffer, "Stage Buffer")
        map("n", "<leader>hR", gitsigns.reset_buffer, "Reset Buffer")
        map("n", "<leader>hU", gitsigns.undo_stage_hunk, "Unstage Hunk")

        -- Preview
        map("n", "<leader>hp", gitsigns.preview_hunk, "Preview Hunk")
        map("n", "<leader>hi", gitsigns.preview_hunk_inline, "Preview Hunk Inline")

        -- Blame
        map("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end, "Blame Line")
        map("n", "<leader>hB", gitsigns.blame, "Blame Buffer")

        -- Diff
        map("n", "<leader>hd", gitsigns.diffthis, "Diff This")
        map("n", "<leader>hD", function()
          gitsigns.diffthis("~")
        end, "Diff This (~)")

        -- Lists
        map("n", "<leader>hQ", function()
          gitsigns.setqflist("all")
        end, "Set QFList (all)")
        map("n", "<leader>hq", gitsigns.setqflist, "Set QFList")

        -- Toggles
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "Toggle Line Blame")
        map("n", "<leader>tw", gitsigns.toggle_word_diff, "Toggle Word Diff")

        -- Text object
        map({ "o", "x" }, "ih", gitsigns.select_hunk, "Select Hunk")
      end,
    }
  end,
  config = function(_, opts)
    require("gitsigns").setup(opts)
    -- cendre defines GitSignsAdd/Change/Delete but not the *Staged variants;
    -- link them so staged signs match the theme instead of gitsigns defaults.
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        for _, name in ipairs({ "Add", "Change", "Delete", "Changedelete", "Topdelete", "Untracked" }) do
          vim.cmd("hi! link GitSigns" .. name .. "Nr GitSigns" .. name)
          vim.cmd("hi! link GitSigns" .. name .. "Staged GitSigns" .. name)
          vim.cmd("hi! link GitSigns" .. name .. "StagedNr GitSigns" .. name)
        end
      end,
    })
  end,
}
