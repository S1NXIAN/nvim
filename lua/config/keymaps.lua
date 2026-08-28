local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- better escape from terminal / insert
map("i", "jk", "<Esc>", { desc = "Escape insert" })
map("t", "jk", "<C-\\><C-n>", { desc = "Terminal normal mode" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Terminal normal mode" })

-- window navigation (normal and terminal mode)
map("n", "<C-h>", "<C-w>h", { desc = "Left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Up window" })
map("n", "<C-l>", "<C-w>l", { desc = "Right window" })
map("t", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Left window" })
map("t", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Down window" })
map("t", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Up window" })
map("t", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Right window" })
-- resize
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Resize up" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Resize down" })

-- buffers
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Prev buffer" })

-- clear search
map("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- file ops
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- LSP (global); gd/gr owned by snacks picker in plugins/snacks.lua
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- diagnostics
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
