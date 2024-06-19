require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map({ 'n', 'v' }, '-', '$')
map({ 'n', 'v' }, 'b', 'e')
map({ 'n', 'v' }, 'e', 'w')
map({ 'n', 'v' }, 'w', 'b')
map({ 'n', 'v' }, '.', ';')
map("n", "<leader>db", "<cmd>DBUIToggle <cr>")
map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "lsp floating diagnostics" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
