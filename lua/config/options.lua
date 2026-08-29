-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true

-- editing
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- smartindent unused: indentexpr (treesitter) overrides it when set
vim.opt.wrap = false
vim.opt.breakindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- ui (mouse OFF by default — set explicitly)
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3
vim.opt.confirm = true              -- confirm to save changes before exiting modified buffer

-- persistence / perf
vim.opt.undofile = true
vim.opt.updatetime = 250          -- 4000ms default → faster diagnostics/git signs
vim.opt.timeoutlen = 300

-- collapse empty command-line; only appears when typing (nvim >= 0.11)
vim.opt.cmdheight = 0
vim.opt.completeopt = "menu,preview"

-- diagnostics
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticError",
      [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
