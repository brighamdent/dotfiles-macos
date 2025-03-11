require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map("i", "<C-h>", "<C-w>")
map("i", "<C-BS>", "<C-w>")
map({ "n", "v" }, "+", "$")
map({ "n" }, "=", vim.diagnostic.goto_next)
map({ "n" }, "_", vim.diagnostic.goto_prev)
map({ "n" }, "-", "0")
map({ "n", "v" }, "b", "e")
map({ "n", "v" }, "e", "w")
map({ "n", "v" }, "w", "b")
map({ "n", "v" }, ".", ";")
map("n", "<leader>db", "<cmd>DBUIToggle <cr>")
map({ 'n', 'v' }, "<leader>di", "<cmd>Noice dismiss<cr>")
map("n", "<leader>pv", "<cmd>MarkdownPreviewToggle <cr>")
map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "lsp floating diagnostics" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
